import 'package:flutter/material.dart';

class PrivacyPage extends StatefulWidget {
  const PrivacyPage({Key? key}) : super(key: key);

  @override
  State<PrivacyPage> createState() => _PrivacyPageState();
}

class _PrivacyPageState extends State<PrivacyPage> {
  @override
  Widget build(BuildContext context) {
    double totalheight = MediaQuery.of(context).size.height;
    double totalwidth = MediaQuery.of(context).size.width;

    return Scaffold(
        body: Container(
        height: totalheight/1,
        width: totalwidth/1,
        decoration: BoxDecoration(
        image: DecorationImage(
        image: AssetImage('image/background.jpg'),fit: BoxFit.cover
    ),
    ),
          child: Center(child: Text('page not found'),),
        ),
    );
  }
}
