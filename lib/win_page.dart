import 'package:flutter/material.dart';
import 'package:math_puzzle/abc.dart';
import 'package:math_puzzle/continue_page.dart';
import 'package:math_puzzle/main.dart';

class WinPage extends StatefulWidget {
  int aa;
  WinPage(this.aa);


  @override
  State<WinPage> createState() => _WinPageState();
}

class _WinPageState extends State<WinPage> {

  @override
  Widget build(BuildContext context) {

    double totalheight = MediaQuery.of(context).size.height;
    double totalwidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: SafeArea(
        child: Container(
          height: totalheight/1,
          width: totalwidth/1,
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('image/background.jpg'),fit: BoxFit.cover
            ),
          ),
          child: Center(
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.fromLTRB(0, 40, 0, 0),
                  height: 70,width: 300,color: Colors.transparent,
                  child: Center(child: Text('P u z z l e ${widget.aa} C o m p l e t e d',
                    style: TextStyle(color: Colors.blueAccent,fontSize: 30,fontWeight: FontWeight.bold,fontFamily: 'namepuzzle'),),),
                ),

                Container(
                  height: totalheight*0.3,
                  width: totalwidth*0.5,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('image/trophy.png'),fit: BoxFit.contain
                    ),
                  ),
                ),

                Container(
                  margin: EdgeInsets.all(7),
                  height: 180,
                  width: 170,
                  color: Colors.transparent,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      InkWell(onTap: () {
                        setState(() {
                          Gbclass.prefs!.setInt('level',widget.aa);
                        });
                        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
                          return ContinuePage(widget.aa);
                        },));
                      },
                          child: Container(
                            height: 40,
                            width: 150,
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                colors: [Colors.blueGrey,Colors.white,Colors.grey],
                              ),
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: [
                                BoxShadow(
                                  spreadRadius: 0,
                                  blurRadius: 3,
                                )
                              ]
                            ),
                            child: Center(child: Text('CONTINUE',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,),),),
                          ),
                      ),
                      InkWell(onTap: () {
                        setState(() {
                          Gbclass.prefs!.setInt('level',widget.aa);
                        });
                        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
                          return FirstPage();
                        },));
                      },
                        child: Container(
                          height: 40,
                          width: 150,
                          decoration: BoxDecoration(
                              gradient: LinearGradient(
                                colors: [Colors.blueGrey,Colors.white,Colors.grey],
                              ),
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: [
                                BoxShadow(
                                  spreadRadius: 0,
                                  blurRadius: 3,
                                )
                              ]
                          ),
                          child: Center(child: Text('MAIN MENU',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,),),),
                        ),
                      ),
                      InkWell(onTap: () {},
                        child: Container(
                          height: 40,
                          width: 150,
                          decoration: BoxDecoration(
                              gradient: LinearGradient(
                                colors: [Colors.blueGrey,Colors.white,Colors.grey],
                              ),
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: [
                                BoxShadow(
                                  spreadRadius: 0,
                                  blurRadius: 3,
                                )
                              ]
                          ),
                          child: Center(child: Text('BUY PRO',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,),),),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(0, 7, 0, 0),
                  height: 30,width: 300,color: Colors.transparent,
                  child: Center(child: Text('SHARE THIS PUZZLE',
                    style: TextStyle(color: Colors.blueAccent,fontSize: 20,fontWeight: FontWeight.bold,fontFamily: 'namepuzzle'),),),
                ),
                Container(
                  height: 50,width: 50,
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
