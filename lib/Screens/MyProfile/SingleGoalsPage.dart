import 'package:flutter/material.dart';
import 'package:flutter_animation_progress_bar/flutter_animation_progress_bar.dart';
import 'package:resolvers/Constants/Fonts&Themes.dart';
import 'package:resolvers/Models/GoalModel.dart';
import 'package:resolvers/Services/GetServices.dart';

class SingleGoalsPage extends StatefulWidget {
  const SingleGoalsPage({Key key}) : super(key: key);

  @override
  _SingleGoalsPageState createState() => _SingleGoalsPageState();
}

class _SingleGoalsPageState extends State<SingleGoalsPage> {
  GetServices getServices = GetServices();
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery
        .of(context)
        .size
        .height;
    var width = MediaQuery
        .of(context)
        .size
        .width;
    return Scaffold(
        extendBody: true,
        body: Padding(
          padding: EdgeInsets.only(
              left: 0.06* width, right: 0.04 * width, top: 0.06 * height),
          child: Container(
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              physics: ScrollPhysics(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Goals", style: paraText.copyWith(
                      fontWeight: FontWeight.w600,
                      fontSize: 34,
                      color: Color(0xff1c2031)),),
                  Divider(
                    endIndent: 300,
                    thickness: 4,
                    color:  Color(0xffa25deb),
                  ),
                  SizedBox(height: 0.03*height,),
                  FutureBuilder<List<Goals>>(
                    future: getServices.getMyGoals(),
                    builder: (context, snapshot) {
                      if(snapshot.hasData)
                        {
                          if(snapshot.data.length==0)
                            {
                              return Center(child: Text("You have no goals!",style: paraText.copyWith(fontWeight: FontWeight.w600,fontSize: 16,color: Color(0xff1d1b23)),textAlign: TextAlign.center,));
                            }
                          return ListView.builder(
                            itemBuilder: (context,index)
                            {
                              return Container(
                                child: Row(
                                  children: [
                                    Column(
                                      children: [
                                        Text(snapshot.data[index].goalName,style: paraText.copyWith(fontSize: 16,color: Colors.black,fontWeight: FontWeight.w600),),
                                        SizedBox(height: 0.01*height,),
                                        Container(
                                          width: 260,
                                          height: 25,
                                          child: FAProgressBar(
                                            borderRadius: BorderRadius.circular(10),
                                            currentValue: snapshot.data[index].goalProgress,
                                            displayText: "%",
                                            displayTextStyle: paraText.copyWith(fontSize: 12,color: Colors.white),
                                            backgroundColor: Color(0xfff1f1f1),
                                            progressColor:  Color(0xffa25deb),
                                          ),
                                        ),
                                        SizedBox(height: 0.03*height,)
                                      ],
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                    ),
                                    SizedBox(width: 0.03*width,),
                                    Container(
                                      width: 70,
                                      height: 50,
                                      child: Icon(Icons.verified_outlined,color: Colors.white,),
                                      decoration: BoxDecoration(
                                          color: Color(0xffe5e5e5),
                                          borderRadius: BorderRadius.circular(20)
                                      ),
                                    )
                                  ],
                                ),
                              );
                            },
                            shrinkWrap: true,
                            scrollDirection: Axis.vertical,
                            itemCount: snapshot.data.length,
                          );
                        }
                      return CircularProgressIndicator();
                    }
                  )
                ],
              ),
            ),
          ),
        ),

    );
  }
}
