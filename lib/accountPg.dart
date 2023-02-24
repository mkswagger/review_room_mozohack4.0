import 'package:flutter/cupertino.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class Account extends StatefulWidget {
  const Account({super.key});

  @override
  State<Account> createState() => _ProfileState();
}

class _ProfileState extends State<Account> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text("Account"),
    );
  }
}
