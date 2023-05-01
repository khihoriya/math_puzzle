
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:math_puzzle/abc.dart';
import 'package:math_puzzle/main.dart';
import 'package:math_puzzle/win_page.dart';


class ContinuePage extends StatefulWidget {
  int aa;
  ContinuePage(this.aa);



  @override
  State<ContinuePage> createState() => _ContinuePageState();
}

class _ContinuePageState extends State<ContinuePage> {


  List<String> anslist = ["10","25","6","14","128","7", "50", "1025", "100", "3", "212", "3011", "14", "16", "1", "2", "44", "45", "625",
        "1", "13", "47", "50", "34", "6", "41", "16", "126", "82", "14", "7", "132", "34", "48", "42", "288", "45", "4", "111", "47",
        "27", "87", "22", "253", "12", "38", "178", "1", "6", "10", "2", "20", "7", "511", "143547", "84", "11", "27", "3", "5", "39", "31",
         "10", "130", "22", "3", "14", "42", "164045", "11", "481", "86", "84", "13", "8"];


  @override
  Widget build(BuildContext context) {

    double totalheight = MediaQuery.of(context).size.height;
    double totalwidth = MediaQuery.of(context).size.width;
    double navibarheight = MediaQuery.of(context).padding.bottom;


    return WillPopScope(child: Scaffold(
      body: SafeArea(
        child: Container(
            height: totalheight / 1,
            width: totalwidth / 1,
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('image/gameplaybackground.jpg'),fit: BoxFit.fill
              ),
            ),
            child: Column(
              children: [

                Row(
                  children: [
                    Container(
                      margin: EdgeInsets.all(18),
                      height: 60,
                      width: 60,
                      decoration: BoxDecoration(
                        color: Colors.transparent,
                        image: DecorationImage(
                            image: AssetImage('image/skip.png'),fit: BoxFit.fill
                        ),
                      ),
                      child: InkWell(onTap: () async {
                        return showDialog(builder: (context) {
                          return AlertDialog(
                            title: Center(child: Text('Skip Level'),),
                            content: Text('Thish is [ Level ${widget.aa + 1} ]Skip   next Level ${widget.aa + 2} '),
                            actions: [
                              ElevatedButton(onPressed: (){

                                Gbclass.Statuslist[widget.aa] ="skip";
                                Gbclass.prefs!.setString("status${widget.aa}", "skip");
                                setState(() {
                                  widget.aa++;
                                });

                                Gbclass.prefs!.setInt("level",widget.aa);

                                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
                                  return ContinuePage(widget.aa);
                                },));

                                setState(() {
                                  Gbclass.prefs?.setInt('cnt', widget.aa);
                                });

                              }, child: Text('Skip')),
                            ],
                          );
                        },context: context,);
                      }),
                    ),

                    Container(
                      margin: EdgeInsets.fromLTRB(0, 0, 30, 0),
                      height: 60,
                      width: 170,
                      decoration: BoxDecoration(
                        color: Colors.transparent,
                        image: DecorationImage(
                            image: AssetImage('image/level_board.png'),fit: BoxFit.fill
                        ),
                      ),
                      child: ListView.builder(itemBuilder: (context, index) {
                        return Center(
                          child: Text('PUZZLE ${widget.aa + 1}',
                            textAlign: TextAlign.center,style: TextStyle(fontFamily: 'boardfont',fontSize: 28,fontWeight: FontWeight.bold,color: Colors.black),),
                        );
                      },itemCount: 1,scrollDirection: Axis.horizontal,),
                    ),

                    Container(
                      margin: EdgeInsets.all(1),
                      height: 60,
                      width: 60,
                      decoration: BoxDecoration(
                        color: Colors.transparent,
                        image: DecorationImage(
                            image: AssetImage('image/hint.png'),fit: BoxFit.fill
                        ),
                      ),
                      child: InkWell(onTap: () async {
                        return showDialog(builder: (context) {
                          return AlertDialog(
                            title: Center(child: Text('Hint'),),
                            content: Text(anslist[widget.aa]),
                            actions: [
                              TextButton(onPressed: () {
                                setState(() {
                                  Navigator.pop(context);
                                });
                              }, child: Text('ok'))
                            ],
                          );
                        },context: context,);
                      }),
                    ),
                  ],
                ),

                Container(
                  height: totalheight * 0.5,
                  width: totalwidth * 0.9,
                  color: Colors.transparent,
                  child: PageView.builder(onPageChanged: (value) {

                  },itemCount: 1,itemBuilder: (context, index) {
                    return Container(
                      height: 290,
                      width: 340,
                      decoration: BoxDecoration(
                        color: Colors.transparent,
                        image: DecorationImage(
                            image: AssetImage('image/p${widget.aa + 1}.png'),fit: BoxFit.fill
                        ),
                      ),
                    );
                  },),
                ),

                // click button
                Container(
                  padding: EdgeInsets.only(bottom: navibarheight/1),
                  margin: EdgeInsets.fromLTRB(0, 90, 0, 0),
                  width: 420,
                  height: 100,
                  color: Colors.black,
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Container(
                            margin: EdgeInsets.all(7),
                            height: 40,
                            width: 200,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10)
                            ),
                            alignment: Alignment.centerLeft,
                            child: Text(k,style: TextStyle(fontSize: 20),textAlign: TextAlign.start,),
                          ),

                          InkWell(onTap: () {
                            setState(() {
                              if (k.length > 0) {
                                k = k.substring(0, k.length - 1);
                              }
                            });
                          },
                            child: Container(
                              height: 45,
                              width: 50,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(4),
                                  color: Colors.transparent,
                                  image: DecorationImage(
                                      image: AssetImage('image/delete.png'),fit: BoxFit.cover
                                  )
                              ),
                            ),
                          ),

                          InkWell(onTap: () {
                            setState(() {
                              if(k == anslist[widget.aa])
                              {
                                String jj = Gbclass.Statuslist[widget.aa];
                                if(jj=='clear'){
                                  setState(() {
                                    widget.aa++;
                                  });
                                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
                                    return WinPage(widget.aa);
                                  },));
                                }else if(jj=='skip'){
                                  Gbclass.Statuslist[widget.aa]='clear';
                                  Gbclass.prefs!.setString('status${widget.aa}', 'clear');
                                  setState(() {
                                    widget.aa++;
                                  });
                                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
                                    return WinPage(widget.aa);
                                  },));
                                }
                                else {
                                  Gbclass.Statuslist[widget.aa]='clear';
                                  Gbclass.prefs!.setString('status${widget.aa}', 'clear');
                                  Gbclass.prefs!.setInt('cnt', widget.aa);
                                  setState(() {
                                    widget.aa++;
                                  });
                                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
                                    return WinPage(widget.aa);
                                  },));
                                }

                              }else {
                                Fluttertoast.showToast(
                                    msg: "Retry",
                                    toastLength: Toast.LENGTH_SHORT,
                                    gravity: ToastGravity.CENTER,
                                    timeInSecForIosWeb: 1,
                                    backgroundColor: Colors.red,
                                    textColor: Colors.white,
                                    fontSize: 16.0
                                );
                                k='';
                              } //toast
                            });
                          },
                            child: Container(
                              margin: EdgeInsets.fromLTRB(3, 0, 0, 0),
                              height: 45,
                              width: 90,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(4),
                                color: Colors.transparent,
                              ),
                              child: Center(
                                child: Text('SUBMIT',textAlign: TextAlign.center,
                                  style: TextStyle(fontWeight: FontWeight.bold,fontFamily: 'namepuzzle',fontSize: 25,color: Colors.white),),
                              ),
                            ),
                          )
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(height: 30,width: 30,
                            decoration: BoxDecoration(color: Colors.black45,borderRadius: BorderRadius.circular(1),
                                border: Border.all(width: 2,color: Colors.white)),
                            child: InkWell(onTap: () {
                              setState(() {
                                getvalue('1');
                              });
                            },child: Center(child: Text('1',style: TextStyle(color: Colors.white),),),),),
                          Container(height: 30,width: 30,
                            decoration: BoxDecoration(color: Colors.black45,borderRadius: BorderRadius.circular(1),
                                border: Border.all(width: 2,color: Colors.white)),
                            child: InkWell(onTap: () {
                              setState(() {
                                getvalue('2');
                              });
                            },child: Center(child: Text('2',style: TextStyle(color: Colors.white),),),),),
                          Container(height: 30,width: 30,
                            decoration: BoxDecoration(color: Colors.black45,borderRadius: BorderRadius.circular(1),
                                border: Border.all(width: 2,color: Colors.white)),
                            child: InkWell(onTap: () {
                              setState(() {
                                getvalue('3');
                              });
                            },child: Center(child: Text('3',style: TextStyle(color: Colors.white),),),),),
                          Container(height: 30,width: 30,
                            decoration: BoxDecoration(color: Colors.black45,borderRadius: BorderRadius.circular(1),
                                border: Border.all(width: 2,color: Colors.white)),
                            child: InkWell(onTap: () {
                              setState(() {
                                getvalue('4');
                              });
                            },child: Center(child: Text('4',style: TextStyle(color: Colors.white),),),),),
                          Container(height: 30,width: 30,
                            decoration: BoxDecoration(color: Colors.black45,borderRadius: BorderRadius.circular(1),
                                border: Border.all(width: 2,color: Colors.white)),
                            child: InkWell(onTap: () {
                              setState(() {
                                getvalue('5');
                              });
                            },child: Center(child: Text('5',style: TextStyle(color: Colors.white),),),),),
                          Container(height: 30,width: 30,
                            decoration: BoxDecoration(color: Colors.black45,borderRadius: BorderRadius.circular(1),
                                border: Border.all(width: 2,color: Colors.white)),
                            child: InkWell(onTap: () {
                              setState(() {
                                getvalue('6');
                              });
                            },child: Center(child: Text('6',style: TextStyle(color: Colors.white),),),),),
                          Container(height: 30,width: 30,
                            decoration: BoxDecoration(color: Colors.black45,borderRadius: BorderRadius.circular(1),
                                border: Border.all(width: 2,color: Colors.white)),
                            child: InkWell(onTap: () {
                              setState(() {
                                getvalue('7');
                              });
                            },child: Center(child: Text('7',style: TextStyle(color: Colors.white),),),),),
                          Container(height: 30,width: 30,
                            decoration: BoxDecoration(color: Colors.black45,borderRadius: BorderRadius.circular(1),
                                border: Border.all(width: 2,color: Colors.white)),
                            child: InkWell(onTap: () {
                              setState(() {
                                getvalue('8');
                              });
                            },child: Center(child: Text('8',style: TextStyle(color: Colors.white),),),),),
                          Container(height: 30,width: 30,
                            decoration: BoxDecoration(color: Colors.black45,borderRadius: BorderRadius.circular(1),
                                border: Border.all(width: 2,color: Colors.white)),
                            child: InkWell(onTap: () {
                              setState(() {
                                getvalue('9');
                              });
                            },child: Center(child: Text('9',style: TextStyle(color: Colors.white),),),),),
                          Container(height: 30,width: 30,
                            decoration: BoxDecoration(color: Colors.black45,borderRadius: BorderRadius.circular(1),
                                border: Border.all(width: 2,color: Colors.white)),
                            child: InkWell(onTap: () {
                              setState(() {
                                getvalue('0');
                              });
                            },child: Center(child: Text('0',style: TextStyle(color: Colors.white),),),),),

                        ],
                      )
                    ],
                  ),
                ),
              ],
            )
        ),
      ),
    ), onWillPop: backscreen);
  }
  String k = '';

  void getvalue(String values) {
    setState(() {
      k = k + values;
    });
  }

  Future<bool> backscreen() async {


    AwesomeDialog(
      context: context,
      dialogType: DialogType.INFO_REVERSED,
      borderSide: const BorderSide(
        color: Colors.green,
        width: 2,
      ),
      width: 300,
      buttonsBorderRadius: const BorderRadius.all(
        Radius.circular(2),
      ),
      dismissOnTouchOutside: true,
      dismissOnBackKeyPress: false,
      onDissmissCallback: (type) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Dismissed by $type'),
          ),
        );
      },
      headerAnimationLoop: false,
      animType: AnimType.BOTTOMSLIDE,
      title: 'Exit Main Page',
      desc: 'Are You Sure Mainu Page',
      showCloseIcon: true,
      btnCancelOnPress: () {

      },
      btnOkOnPress: () {
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
          return FirstPage();
          },));
      },
    ).show();





    // showDialog(builder: (context) {
    //   return AlertDialog(
    //     title: Center(child: Text('Mainu'),),
    //     content: Text('Are You Sure Mainu Page'),
    //     actions: [
    //       ElevatedButton(onPressed: () {
    //         Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
    //           return FirstPage();
    //         },));
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
