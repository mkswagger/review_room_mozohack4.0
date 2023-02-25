import 'package:flutter/cupertino.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class Search extends StatefulWidget {
  const Search({super.key});

  @override
  State<Search> createState() => _SavedState();
}

class _SavedState extends State<Search> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text("search"),
    );
  }
}
