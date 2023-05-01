import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Share extends StatefulWidget {
  const Share({Key? key}) : super(key: key);

  @override
  State<Share> createState() => _ShareState();
}

class _ShareState extends State<Share> {

  String a = '';
  String b = '';
  SharedPreferences? prefs;
  

  TextEditingController firstdata = TextEditingController();



  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    shareprefrence();
  }
  shareprefrence() async {
     prefs = await SharedPreferences.getInstance();
     setState(() {
       a = prefs!.getString('level')??'0';
       b = prefs!.getString('level')??'0';
     });
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Container(
          color: Colors.white,
          height: 400,
          width: 400,
          child: Column(
            children: [
              Center(
                child: Container(
                  margin: EdgeInsets.all(10),
                  height: 50,
                  width: 200,
                  color: Colors.white30,
                  child: TextField(
                    controller:firstdata,
                    keyboardType: TextInputType.number,
                  )
                ),
              ),

              Center(
                child: ElevatedButton(onPressed: () {
                  setState(() {
                    a=firstdata.text;
                    prefs!.setString('level', a);
                  });
                },child: Text('set'),),
              ), //button get


              Center(
                child: Container(
                  margin: EdgeInsets.all(10),
                  height: 50,
                  width: 200,
                  color: Colors.black,
                  child: Center(
                    child: Text('$b',style: TextStyle(color: Colors.white),),
                  ),
                ),
              ),

              Center(
                child: ElevatedButton(onPressed: () {
                  setState(() {
                     b = prefs!.getString('level')??'';
                    firstdata.text=b;
                  });
                },child: Text('get'),),
              ),  // button set
            ],
          ),
        ),
      ),
    );
  }
}
