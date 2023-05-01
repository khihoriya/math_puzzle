
import 'dart:io';

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:math_puzzle/abc.dart';
import 'package:math_puzzle/continue_page.dart';
import 'package:math_puzzle/privacy_page.dart';
import 'package:math_puzzle/puzzlelevel.dart';
import 'package:shared_preferences/shared_preferences.dart';



void main() {
  runApp(MaterialApp(
    home: FirstPage(),
    debugShowCheckedModeBanner: false,
  ));
}

class FirstPage extends StatefulWidget {


  @override
  State<FirstPage> createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {

  int aa = 0;


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    shareprefrence();
  }
  shareprefrence() async {
    Gbclass.prefs = await SharedPreferences.getInstance();
    setState(() {
      aa = Gbclass.prefs!.getInt('level')??0;
    });
    //status0 pandding
    for(int i = 0;i < 75; i++){
      String LevelStatus = Gbclass.prefs!.getString('status$i')??'pandding';
      Gbclass.Statuslist.add(LevelStatus);
    }
  }
  @override
  Widget build(BuildContext context) {

    double totalheight = MediaQuery.of(context).size.height;
    double totalwidth = MediaQuery.of(context).size.width;



    return WillPopScope(child:  Scaffold(
      body: Container(
        height: totalheight / 1,
        width: totalwidth / 1,
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('image/background.jpg'),fit: BoxFit.cover
          ),
        ),
        child: Center(
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.fromLTRB(0, 80, 0, 0),
                height: 70,width: 300,color: Colors.transparent,
                child: Center(child: Text('M a t h  P u z z l e s',
                  style: TextStyle(color: Colors.blueAccent,fontSize: 30,fontWeight: FontWeight.bold,fontFamily: 'namepuzzle'),),),
              ),      // math puzzle name
              Container(
                height: 350,
                width: 300,
                decoration: BoxDecoration(
                  color: Colors.black,
                  image: DecorationImage(
                      image: AssetImage('image/blackboard_main_menu.png'),fit: BoxFit.fill
                  ),
                ),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        margin: EdgeInsets.all(6),height: 50,width: 160,
                        decoration: BoxDecoration(
                            color: Colors.transparent,
                            borderRadius: BorderRadius.circular(10)
                        ),
                        child: TextButton(onPressed: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) {
                            return ContinuePage(aa);
                          },));
                          setState(() {
                            Gbclass.prefs!.getInt('level');
                          });
                        },
                            child: Center(child: Text('CONTINUE',
                              style: TextStyle(fontSize: 25,fontFamily: 'boardfont',color: Colors.white),textAlign: TextAlign.center,),)),
                      ),

                      Container(
                        margin: EdgeInsets.all(6),height: 50,width: 160,
                        decoration: BoxDecoration(
                            color: Colors.transparent,
                            borderRadius: BorderRadius.circular(10)
                        ),
                        child: TextButton(onPressed: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) {
                            return PuzzleLevel(aa);
                          },));
                        },child: Center(child: Text('PUZZLES',
                          style: TextStyle(fontSize: 25,fontFamily: 'boardfont',color: Colors.white),textAlign: TextAlign.center,),)),
                      ),

                      Container(
                        margin: EdgeInsets.all(6),height: 50,width: 160,
                        decoration: BoxDecoration(
                            color: Colors.transparent,
                            borderRadius: BorderRadius.circular(10)
                        ),
                        child: TextButton(onPressed: () {},child: Center(child: Text('BUY PRO',style: TextStyle(fontSize: 25,fontFamily: 'boardfont',color: Colors.white),textAlign: TextAlign.center,),)),
                      ),
                    ],
                  ),
                ),
              ), // center image2
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Container(margin: EdgeInsets.all(15),height: 50,width: 50,
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [Colors.grey,Colors.white],
                        ),
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                            blurRadius: 3,
                            spreadRadius: 0,
                          )
                        ]
                    ),
                    child: IconButton(onPressed: () {},icon: Icon(Icons.share)),
                  ),
                  Container(margin: EdgeInsets.all(15),height: 50,width: 50,
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [Colors.grey,Colors.white],
                        ),
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                            blurRadius: 3,
                            spreadRadius: 0,
                          )
                        ]
                    ),
                    child: IconButton(onPressed: () {},icon: Icon(Icons.email_outlined)),
                  ),
                ],
              ),//share // mail
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Container(
                    margin: EdgeInsets.all(2),height: 35,width: 150,
                    decoration: BoxDecoration(
                      color: Colors.transparent,
                      border: Border.all(width: 3,color: Colors.black),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: TextButton(onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) {
                        return PrivacyPage();
                      },));
                    },
                        child: Center(child: Text('Privacy Policy',
                          style: TextStyle(fontWeight: FontWeight.bold,fontSize: 13,color: Colors.black),textAlign: TextAlign.center,),)),
                  ),
                ],
              ), //privacy

            ],
          ),
        ),
      ),
    ), onWillPop: exitScreen);
  }

  Future<bool> exitScreen() {

    AwesomeDialog(
      context: context,
      dialogType: DialogType.WARNING,
      headerAnimationLoop: false,
      animType: AnimType.TOPSLIDE,
      showCloseIcon: true,
      closeIcon: const Icon(Icons.close_fullscreen_outlined),
      title: 'Exit App',
      desc:
      'Are You Sure Exit App',
      btnCancelOnPress: () {},
      onDissmissCallback: (type) {
        debugPrint('Dialog Dissmiss from callback $type');
      },
      btnOkOnPress: () {
        exit(0);
      },
    ).show();


    // showDialog(builder: (context) {
    //   return AlertDialog(
    //     title: Center(child: Text('Exit App'),),
    //     content: Text('Are You Sure Exit App'),
    //     actions: [
    //       ElevatedButton(onPressed: () {
    //       exit(0);
    //       }, child: Text('Yes')),
    //
    //       ElevatedButton(onPressed: () {
    //         setState(() {
    //           Navigator.pop(context);
    //         });
    //       }, child: Text('No')),
    //     ],
    //   );
    // },context: context,);
    return Future.value(true);
  }
}
