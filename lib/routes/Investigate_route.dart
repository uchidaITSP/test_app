//import 'package:flutter/material.dart';
//
//class Investigate extends StatelessWidget { // <- (※1)
//  @override
//  Widget build(BuildContext context) {
//    return Scaffold(
//      appBar: AppBar(
//        title: Text("調べる"), // <- (※2)
//      ),
//      body: Center(child: Text("調べる") // <- (※3)
//      ),
//    );
//  }
//}

import 'package:test_app/dbhelper.dart';
import 'package:test_app/models/course.dart';
import 'package:test_app/pages/newcourse.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:test_app/pages/courseupdate.dart';

import '../dbhelper.dart';
import 'package:test_app/pages/coursedetails.dart';


class Investigate extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Investigate> {
  DbHelper helper;
  List allCourses = List();
  List items = List();
  TextEditingController teSearch = TextEditingController();

  @override
  void initState() {
    super.initState();
    helper = DbHelper();
    helper.allCourses().then((courses){
      setState(() {
        allCourses = courses;
        items = allCourses;
      });
    });
  }

  void filterSearch(String query) async{
    var dummySearchList = allCourses;
    if(query.isNotEmpty){
      var dummyListData = List();
      dummySearchList.forEach((item){
        var course = Course.fromMap(item);
        if(course.name.toLowerCase().contains(query.toLowerCase())){
          dummyListData.add(item);
        }
      });
      setState(() {
        items = [];
        items.addAll(dummyListData);
      });
      return;
    }else{
      setState(() {
        items = [];
        items = allCourses;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
//          backgroundColor: Colors.grey[50],
          title: Text('検索'),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.add),
              onPressed: () => Navigator.of(context).push(MaterialPageRoute(builder: (context)=>NewCourse())),
            )
          ],
        ),
        body: Column(
          children: <Widget>[

            TextField(
              onChanged: (value){

                setState(() {
                  filterSearch(value);
                });
              },

              controller: teSearch,
              decoration: InputDecoration(
                  labelText: '',
                  hintText: 'Search...',
                  prefixIcon: Icon(Icons.search),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(25),),
                  )
              ),

            ),
            Expanded(
              child: ListView.builder(
                  itemCount: items.length,
                  itemBuilder: (context, i){
                    Course course = Course.fromMap(items[i]);
                    return Card(
                      margin: EdgeInsets.all(8),
                      child: ListTile(

//                      title: Text('${course.name} - ${course.hours} hours - ${course.level}'),
//                      subtitle: Text(course.content.substring(0,0)),

                        title: Text('${course.name} '),
//                        subtitle: Text(course.content),


                        trailing:Column(
                          children: <Widget>[
                            Expanded(
                              child: IconButton(icon: Icon(Icons.delete, color: Colors.red,),onPressed: (){
                                setState(() {
                                  helper.delete(course.id);
                                });
                              },),
                            ),
//                          Expanded(
//                            child: IconButton(icon: Icon(Icons.edit, color: Colors.green,),onPressed: (){
//                              Navigator.of(context).push(MaterialPageRoute(builder: (context)=>CourseUpdate(course)));
//                            },),
//
//                          ),
                          ],
                        ),
                        onTap: (){
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context)=>CourseDetails(course)));
                        },
                      ),
                    );
                  }
              ),
            ),

          ],

        )
    );
  }
}


