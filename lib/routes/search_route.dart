import 'package:flutter/material.dart';
import 'package:barcode_scan/barcode_scan.dart';

//class ScanPage extends StatefulWidget {
////  @override
////  _buttonArea createState() => _buttonArea();
////}


class Search extends StatelessWidget { // <- (※1)
  // <- (※1)
  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      debugShowCheckedModeBanner: false,
      home: Scaffold(
        resizeToAvoidBottomPadding: false,
        appBar: AppBar(
            backgroundColor: Colors.grey[50],
            title: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('医療機関選択',style: TextStyle(color: Colors.black.withOpacity(0.8)),),
                )
              ],
            )
        ),
        body:Column(

          children: <Widget>[

//         new TextField(
//
//            decoration: InputDecoration(
//
//                labelText: '',
//                hintText: 'Search...',
//                prefixIcon: Icon(Icons.search),
////              contentPadding: const EdgeInsets.fromLTRB(left, top, right, bottom),
//                contentPadding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
//
//                border: OutlineInputBorder(
//
//
//                  borderRadius: BorderRadius.all(Radius.circular(25),),
//                )
//            ),
//          ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextField(
                decoration: InputDecoration(

//                  labelText: '病院',
                    hintText: '病院・クリニック名でさがす',
                    prefixIcon: Icon(Icons.search),
//              contentPadding: const EdgeInsets.fromLTRB(left, top, right, bottom),
                    contentPadding: const EdgeInsets.fromLTRB(10, 10, 10, 10),


                    border: OutlineInputBorder(


                      borderRadius: BorderRadius.all(Radius.circular(25),),
                    )
                ),
//                  style: new TextStyle(
//                      fontSize: 20.0,
//                      height: 1,
//                      color: Colors.black
//                  )
              ),
            ),





            Container(
              width: 350,
              height: 100,
              margin: EdgeInsets.fromLTRB(0, 20, 0, 0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Expanded(
                    child: Column(
                      children: <Widget>[
                        Icon(Icons.location_on),
                        Container(
                          margin: const EdgeInsets.only(top: 15.0),
                          child: Text('現在地からさがす'),
                        )
                      ],
                    ),
                  ),

                  Expanded(
                    child: Column(
                      children: <Widget>[
                        Icon(Icons.center_focus_weak),
                        FlatButton(
                          child: Text('QRコードで探す'),
                          onPressed: () async{
                            //QRコード機能実装
                            String codeSander = await BarcodeScanner.scan();
//                          setState(() {
//                            qrCodeResult = codeSander;
//                          });
                          },

                        )
//                Container(
//                  margin: const EdgeInsets.only(top: 15.0),
//                  child: Text('QRコードでさがす'),
//                )
                      ],
                    ),
                  )



                ],
              ),
            ),


//          Container(
//            padding: EdgeInsets.fromLTRB(20, 18, 10, 10),
//            margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
//            color: Colors.grey,
//            width: 350,
//            height: 70,
//            child: Text(
//              '都道府県で探す',
//              style: TextStyle(
//
//                fontWeight: FontWeight.bold,
//                fontSize: 20,
//                color: Colors.black,
//
//
//              ),
//
//
//            ),
//
//
//          ),



            Container(
              width: 350,
              height: 70,
              color: Colors.white,

              margin: EdgeInsets.fromLTRB(0, 0, 0, 30),
              padding: EdgeInsets.fromLTRB(10, 18, 10, 10),



              child: Row(
                children: <Widget>[
                  Expanded(

                    child: Column(

                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[

                        Container(

                          margin: EdgeInsets.fromLTRB(5, 0, 0, 0),

                          child: Text(
                            '都道府県でさがす',
                            style: TextStyle(

//                            fontWeight: FontWeight.bold,
                              fontSize: 18,
                              color: Colors.black,

                            ),
                          ),

                        ),

                      ],
                    ),
                  ),
                  Icon(
                    Icons.arrow_forward_ios,
                  )
                ],
              ),
            ),






                       Container(

              margin: EdgeInsets.fromLTRB(0, 0, 250, 0),

              child: Text(
                '都道府県で探す',
                style: TextStyle(

//                fontWeight: FontWeight.bold,
                  fontSize: 15,
                  color: Colors.black,

                ),
              ),

            ),


            Expanded(

              child:   GridView.count(
                primary: false,
                padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
                crossAxisSpacing: 0.2, //横のpadding
                mainAxisSpacing: 0.2,  //縦のpadding
                crossAxisCount: 3,  //列数
                childAspectRatio: 1.40, //itemの高さ
                children: <Widget>[


                  Container(

                    padding: EdgeInsets.fromLTRB(10, 22, 10, 10),

                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.grey,
                        width: 0.5,
                      ),
                    ),

                    child: Column(

                      children: <Widget>[

                        Icon(Icons.location_on,color: Colors.green,),

                        Container(

                          margin: const EdgeInsets.only(top: 15.0),
                          child: Text('内科'),


                        )
                      ],
                    ),
                  ),

                  Container(
                    padding: EdgeInsets.fromLTRB(10, 22, 10, 10),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.grey,
                        width: 0.5,
                      ),
                    ),

                    child: Column(
                      children: <Widget>[
                        Icon(Icons.location_on,color: Colors.green,),

                        Container(

                          margin: const EdgeInsets.only(top: 15.0),
                          child: Text('循環器内科'),

                        )
                      ],
                    ),
                  ),

                  Container(
                    padding: EdgeInsets.fromLTRB(10, 22, 10, 10),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.grey,
                        width: 0.5,
                      ),
                    ),

                    child: Column(
                      children: <Widget>[
                        Icon(Icons.location_on,color: Colors.green,),

                        Container(

                          margin: const EdgeInsets.only(top: 15.0),
                          child: Text('心臓・血管外科'),


                        )
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(10, 22, 10, 10),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.grey,
                        width: 0.5,
                      ),
                    ),

                    child: Column(
                      children: <Widget>[
                        Icon(Icons.location_on,color: Colors.green,),

                        Container(

                          margin: const EdgeInsets.only(top: 15.0),
                          child: Text('消化器科'),


                        )
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(10, 22, 10, 10),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.grey,
                        width: 0.5,
                      ),
                    ),

                    child: Column(
                      children: <Widget>[
                        Icon(Icons.location_on,color: Colors.green,),

                        Container(

                          margin: const EdgeInsets.only(top: 15.0),
                          child: Text('小児科'),


                        )
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(10, 22, 10, 10),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.grey,
                        width: 0.5,
                      ),
                    ),

                    child: Column(
                      children: <Widget>[
                        Icon(Icons.location_on,color: Colors.green,),

                        Container(

                          margin: const EdgeInsets.only(top: 15.0),
                          child: Text('救急科'),


                        )
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(10, 22, 10, 10),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.grey,
                        width: 0.5,
                      ),
                    ),

                    child: Column(
                      children: <Widget>[
                        Icon(Icons.location_on,color: Colors.green,),

                        Container(

                          margin: const EdgeInsets.only(top: 15.0),
                          child: Text('神経内科'),


                        )
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(10, 22, 10, 10),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.grey,
                        width: 0.5,
                      ),
                    ),

                    child: Column(
                      children: <Widget>[
                        Icon(Icons.location_on,color: Colors.green,),

                        Container(

                          margin: const EdgeInsets.only(top: 15.0),
                          child: Text('脳神経外科'),


                        )
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(10, 22, 10, 10),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.grey,
                        width: 0.5,
                      ),
                    ),

                    child: Column(
                      children: <Widget>[
                        Icon(Icons.location_on,color: Colors.green,),

                        Container(

                          margin: const EdgeInsets.only(top: 15.0),
                          child: Text('整形外科'),


                        )
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(10, 22, 10, 10),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.grey,
                        width: 0.5,
                      ),
                    ),

                    child: Column(
                      children: <Widget>[
                        Icon(Icons.location_on,color: Colors.green,),

                        Container(

                          margin: const EdgeInsets.only(top: 15.0),
                          child: Text('皮膚科'),


                        )
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(10, 22, 10, 10),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.grey,
                        width: 0.5,
                      ),
                    ),

                    child: Column(
                      children: <Widget>[
                        Icon(Icons.location_on,color: Colors.green,),

                        Container(

                          margin: const EdgeInsets.only(top: 15.0),
                          child: Text('心臓・血管外科'),


                        )
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(10, 22, 10, 10),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.grey,
                        width: 0.5,
                      ),
                    ),

                    child: Column(
                      children: <Widget>[
                        Icon(Icons.location_on,color: Colors.green,),

                        Container(

                          margin: const EdgeInsets.only(top: 15.0),
                          child: Text('心臓・血管外科'),


                        )
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(10, 22, 10, 10),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.grey,
                        width: 0.5,
                      ),
                    ),

                    child: Column(
                      children: <Widget>[
                        Icon(Icons.location_on,color: Colors.green,),

                        Container(

                          margin: const EdgeInsets.only(top: 15.0),
                          child: Text('心臓・血管外科'),


                        )
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(10, 22, 10, 10),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.grey,
                        width: 0.5,
                      ),
                    ),

                    child: Column(
                      children: <Widget>[
                        Icon(Icons.location_on,color: Colors.green,),

                        Container(

                          margin: const EdgeInsets.only(top: 15.0),
                          child: Text('心臓・血管外科'),


                        )
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(10, 22, 10, 10),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.grey,
                        width: 0.5,
                      ),
                    ),

                    child: Column(
                      children: <Widget>[
                        Icon(Icons.location_on,color: Colors.green,),

                        Container(

                          margin: const EdgeInsets.only(top: 15.0),
                          child: Text('心臓・血管外科'),


                        )
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(10, 22, 10, 10),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.grey,
                        width: 0.5,
                      ),
                    ),

                    child: Column(
                      children: <Widget>[
                        Icon(Icons.location_on,color: Colors.green,),

                        Container(

                          margin: const EdgeInsets.only(top: 15.0),
                          child: Text('心臓・血管外科'),


                        )
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(10, 22, 10, 10),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.grey,
                        width: 0.5,
                      ),
                    ),

                    child: Column(
                      children: <Widget>[
                        Icon(Icons.location_on,color: Colors.green,),

                        Container(

                          margin: const EdgeInsets.only(top: 15.0),
                          child: Text('心臓・血管外科'),


                        )
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(10, 22, 10, 10),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.grey,
                        width: 0.5,
                      ),
                    ),

                    child: Column(
                      children: <Widget>[
                        Icon(Icons.location_on,color: Colors.green,),

                        Container(

                          margin: const EdgeInsets.only(top: 15.0),
                          child: Text('心臓・血管外科'),


                        )
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(10, 22, 10, 10),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.grey,
                        width: 0.5,
                      ),
                    ),

                    child: Column(
                      children: <Widget>[
                        Icon(Icons.location_on,color: Colors.green,),

                        Container(

                          margin: const EdgeInsets.only(top: 15.0),
                          child: Text('心臓・血管外科'),


                        )
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(10, 22, 10, 10),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.grey,
                        width: 0.5,
                      ),
                    ),

                    child: Column(
                      children: <Widget>[
                        Icon(Icons.location_on,color: Colors.green,),

                        Container(

                          margin: const EdgeInsets.only(top: 15.0),
                          child: Text('心臓・血管外科'),


                        )
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(10, 22, 10, 10),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.grey,
                        width: 0.5,
                      ),
                    ),

                    child: Column(
                      children: <Widget>[
                        Icon(Icons.location_on,color: Colors.green,),

                        Container(

                          margin: const EdgeInsets.only(top: 15.0),
                          child: Text('心臓・血管外科'),


                        )
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(10, 22, 10, 10),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.grey,
                        width: 0.5,
                      ),
                    ),

                    child: Column(
                      children: <Widget>[
                        Icon(Icons.location_on,color: Colors.green,),

                        Container(

                          margin: const EdgeInsets.only(top: 15.0),
                          child: Text('心臓・血管外科'),


                        )
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(10, 22, 10, 10),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.grey,
                        width: 0.5,
                      ),
                    ),

                    child: Column(
                      children: <Widget>[
                        Icon(Icons.location_on,color: Colors.green,),

                        Container(

                          margin: const EdgeInsets.only(top: 15.0),
                          child: Text('心臓・血管外科'),


                        )
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(10, 22, 10, 10),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.grey,
                        width: 0.5,
                      ),
                    ),

                    child: Column(
                      children: <Widget>[
                        Icon(Icons.location_on,color: Colors.green,),

                        Container(

                          margin: const EdgeInsets.only(top: 15.0),
                          child: Text('心臓・血管外科'),


                        )
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(10, 22, 10, 10),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.grey,
                        width: 0.5,
                      ),
                    ),

                    child: Column(
                      children: <Widget>[
                        Icon(Icons.location_on,color: Colors.green,),

                        Container(

                          margin: const EdgeInsets.only(top: 15.0),
                          child: Text('心臓・血管外科'),


                        )
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(10, 22, 10, 10),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.grey,
                        width: 0.5,
                      ),
                    ),

                    child: Column(
                      children: <Widget>[
                        Icon(Icons.location_on,color: Colors.green,),

                        Container(

                          margin: const EdgeInsets.only(top: 15.0),
                          child: Text('心臓・血管外科'),


                        )
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(10, 22, 10, 10),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.grey,
                        width: 0.5,
                      ),
                    ),

                    child: Column(
                      children: <Widget>[
                        Icon(Icons.location_on,color: Colors.green,),

                        Container(

                          margin: const EdgeInsets.only(top: 15.0),
                          child: Text('心臓・血管外科'),


                        )
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(10, 22, 10, 10),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.grey,
                        width: 0.5,
                      ),
                    ),

                    child: Column(
                      children: <Widget>[
                        Icon(Icons.location_on,color: Colors.green,),

                        Container(

                          margin: const EdgeInsets.only(top: 15.0),
                          child: Text('心臓・血管外科'),


                        )
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(10, 22, 10, 10),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.grey,
                        width: 0.5,
                      ),
                    ),

                    child: Column(
                      children: <Widget>[
                        Icon(Icons.location_on,color: Colors.green,),

                        Container(

                          margin: const EdgeInsets.only(top: 15.0),
                          child: Text('心臓・血管外科'),


                        )
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(10, 22, 10, 10),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.grey,
                        width: 0.5,
                      ),
                    ),

                    child: Column(
                      children: <Widget>[
                        Icon(Icons.location_on,color: Colors.green,),

                        Container(

                          margin: const EdgeInsets.only(top: 15.0),
                          child: Text('心臓・血管外科'),


                        )
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(10, 22, 10, 10),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.grey,
                        width: 0.5,
                      ),
                    ),

                    child: Column(
                      children: <Widget>[
                        Icon(Icons.location_on,color: Colors.green,),

                        Container(

                          margin: const EdgeInsets.only(top: 15.0),
                          child: Text('心臓・血管外科'),


                        )
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(10, 22, 10, 10),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.grey,
                        width: 0.5,
                      ),
                    ),

                    child: Column(
                      children: <Widget>[
                        Icon(Icons.location_on,color: Colors.green,),

                        Container(

                          margin: const EdgeInsets.only(top: 15.0),
                          child: Text('心臓・血管外科'),


                        )
                      ],
                    ),
                  ),








                ],
              ),
            )
          ],
        ),







      ),
    );
  }
}

