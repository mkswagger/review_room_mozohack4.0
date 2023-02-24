const express = require('express');
const axios = require('axios');
const cheerio = require('cheerio');
const createCsvWriter = require('csv-writer').createObjectCsvWriter;

const app = express();
const HEADERS = {
  'User-Agent':
    'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.212 Safari/537.36',
  'Accept-Language': 'en-US, en;q=0.5'
};

const getHtmlData = async url => {
  const response = await axios.get(url, { headers: HEADERS });
  return response.data;
};

const parseHtml = htmlData => cheerio.load(htmlData);

const getReviews = soup => {
  const reviews = [];
  soup('div.a-expander-content.reviewText.review-text-content.a-expander-partial-collapse-content')
    .each((i, el) => {
      const review = cheerio.load(el).text().trim();
      if (review) reviews.push(review);
    });
  return reviews;
};
app.use(express.json());

app.get('/', (req, res) => {
  res.send('Hello');
});

app.post('/amazon_reviews', async (req, res) => {
  const { url } = req.body;
  const htmlData = await getHtmlData(url);
  const soup = parseHtml(htmlData);
  const reviews = getReviews(soup);

  const csvWriter = createCsvWriter({
    path: 'reviews.csv',
    header: [{ id: 'review', title: 'Review' }]
  });

  const records = reviews.map(review => ({ review }));
  await csvWriter.writeRecords(records);

  res.json({ message: 'Reviews saved to CSV file.' });
});

const PORT = 3000;

app.listen(PORT, () => {
  console.log(`Server running on port ${PORT}`);
});
