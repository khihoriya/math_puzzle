import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:math_puzzle/abc.dart';
import 'package:math_puzzle/continue_page.dart';

class PuzzleLevel extends StatefulWidget {
  int aa;
  PuzzleLevel(this.aa);



  @override
  State<PuzzleLevel> createState() => _PuzzleLevelState();
}

class _PuzzleLevelState extends State<PuzzleLevel> {


  @override
  Widget build(BuildContext context) {

    double totalheight = MediaQuery.of(context).size.height;
    double totalwidth = MediaQuery.of(context).size.width;


    return Scaffold(
        body: SafeArea(
          child: Container(
              height: totalheight / 1,
              width: totalwidth / 1,
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('image/background.jpg'),fit: BoxFit.cover,
                ),
              ),
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.fromLTRB(0, 50, 0, 0),
                    height: 50,width: 300,color: Colors.transparent,
                    child: Center(child: Text('S e l e c t  P u z z l e s',
                      style: TextStyle(color: Colors.blueAccent,fontSize: 30,fontWeight: FontWeight.bold,fontFamily: 'namepuzzle'),),),
                  ), //select name


                  Container(
                      color: Colors.transparent,
                      height: totalheight * 0.6,
                      width: totalwidth * 0.9,
                      child: GridView.builder(scrollDirection: Axis.horizontal,itemCount: 75,
                          itemBuilder: (context, index) {
                            String kk = Gbclass.Statuslist[index];
                            int ll = Gbclass.prefs!.getInt('level')??0;
                            if(kk=='clear'){
                              return InkWell(onTap: () {
                                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
                                  return ContinuePage(index);
                                },));
                              },
                                child: Container(
                                  margin: EdgeInsets.all(10),
                                  height: 40,
                                  child: Center(child: Text('${index + 1}',style: TextStyle(fontSize: 30),),),
                                  decoration: BoxDecoration(
                                      border: Border.all(width: 2,color: Colors.black),
                                      borderRadius: BorderRadius.circular(15),
                                      image: DecorationImage(
                                          image: AssetImage('image/tick.png'),fit: BoxFit.contain
                                      )
                                  ),
                                ),
                              );
                            }else if(kk=='skip'){
                              return InkWell(onTap: () {
                                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
                                  return ContinuePage(index);
                                },));
                              },
                                child: Container(
                                  margin: EdgeInsets.all(10),
                                  height: 40,
                                  child: Center(child: Text('${index + 1}',style: TextStyle(fontSize: 30),),),
                                  decoration: BoxDecoration(
                                    border: Border.all(width: 2,color: Colors.black),
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                ),
                              );
                            }else {
                              if(ll==index){
                                return InkWell(onTap: () {
                                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
                                    return ContinuePage(index);
                                  },));
                                },
                                child: Container(
                                  margin: EdgeInsets.all(10),
                                  height: 40,
                                  child: Center(child: Text('${index + 1}',style: TextStyle(fontSize: 30),),),
                                  decoration: BoxDecoration(
                                    border: Border.all(width: 2,color: Colors.black),
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                ),
                                );
                              }else{
                                return Container(
                                  margin: EdgeInsets.all(10),
                                  height: 40,
                                  decoration: BoxDecoration(
                                      image: DecorationImage(
                                          image: AssetImage('image/lock.png'),fit: BoxFit.contain
                                      )
                                  ),
                                );
                              }
                            }
                          },gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 4)),
                  ), // main list
                ],
              )
          ),
        ),
    );
  }

}




