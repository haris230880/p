//import 'dart:html';//เม้น

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:project/constants.dart';
import 'package:project/screen/Login/components/login_screen.dart';
import 'package:project/screen/Regis/components/regis.dart';
import 'package:project/screen/USER/SALE/Home/components/backgroundhomesale.dart';
import 'package:project/screen/Welcome/components/backgroundwelcome.dart';
import 'package:project/winged/categoryitemmanu.dart';
import 'package:project/winged/searchbox.dart';

import 'package:shared_preferences/shared_preferences.dart';
import '../../../../../main/main_user_sell.dart';
import 'home_screensale.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

Future<Null> signOutprocess()async{
  SharedPreferences preferences = await SharedPreferences.getInstance();
  preferences.clear();
  exit(0);
}
late String userid;
class BodyHomePageSall extends StatefulWidget {
  const BodyHomePageSall({Key? key}) : super(key: key);

  @override
  State<BodyHomePageSall> createState() => _BodyHomePageSallState();
}

class _BodyHomePageSallState extends State<BodyHomePageSall> {

  //------------------
  @override
  void initState() {
    super.initState();
    finduser();
  }
  Future<Null> finduser() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    setState(() {
      userid = preferences.getString('phoneNumber')!;
    });
  }
  //ฟังช้่นlogout
//------------
  @override
  Widget build(BuildContext context) {
    return BackgroundHomePageSell(
      child: SingleChildScrollView(

        child: Column(
          children: <Widget>[
            SearchBox(
              onChanged: (value) {},
            ),

            Container(
              margin: EdgeInsets.all(20),
              padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 24.0),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: kPrimaryColor),
                  borderRadius: BorderRadius.all(Radius.circular(20.0)),
                  boxShadow: [
                    BoxShadow(
                        blurRadius: 2,
                        color: Colors.black45,
                        offset: Offset(1, 1))
                  ]),
              child: Column(
                children: [
                  Text('phone: $userid'),
                  Text(
                    'รายการ',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        SizedBox(
                          width: 100,
                          height: 70,
                          child: ElevatedButton(
                            style: ButtonStyle(
                              backgroundColor: MaterialStatePropertyAll(
                                kPrimaryLightColor,
                              ),
                            ),
                            onPressed: () {},
                            child: Column(
                              children: [
                                Image.asset(
                                  'assets/icons/plasticbottle.png',
                                  scale: 10,
                                ),
                                Text('พลาสติก'),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 100,
                          height: 70,
                          child: ElevatedButton(
                              style: ButtonStyle(
                                backgroundColor: MaterialStatePropertyAll(
                                  kPrimaryLightColor,
                                ),
                              ),
                              onPressed: () {},
                              child: Column(
                                children: [
                                  Image.asset(
                                    'assets/icons/glass.png',
                                    scale: 10,
                                  ),
                                  Text('แก้ว'),
                                ],
                              )),
                        ),
                        SizedBox(
                          width: 100,
                          height: 70,
                          child: ElevatedButton(
                              style: ButtonStyle(
                                backgroundColor: MaterialStatePropertyAll(
                                  kPrimaryLightColor,
                                ),
                              ),
                              onPressed: () {},
                              child: Column(
                                children: [
                                  Image.asset(
                                    'assets/icons/Aluminium.png',
                                    scale: 10,
                                  ),
                                  Text('อลูมิเนียม'),
                                ],
                              )),
                        ),
                      ]),
                  SizedBox(height: 5),

                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        SizedBox(
                          width: 100,
                          height: 70,
                          child: ElevatedButton(
                              style: ButtonStyle(
                                backgroundColor: MaterialStatePropertyAll(
                                  kPrimaryLightColor,
                                ),
                              ),
                              onPressed: () {},
                              child: Column(
                                children: [
                                  Image.asset(
                                    'assets/icons/Electronics.png',
                                    scale: 10,
                                  ),
                                  Text('เครื่องใช้'),
                                ],
                              )),
                        ),
                        SizedBox(
                          width: 100,
                          height: 70,
                          child: ElevatedButton(
                              style: ButtonStyle(
                                backgroundColor: MaterialStatePropertyAll(
                                  kPrimaryLightColor,
                                ),
                              ),
                              onPressed: () {},
                              child: Column(
                                children: [
                                  Image.asset(
                                    'assets/icons/paper.png',
                                    scale: 10,
                                  ),
                                  Text('กระดาษ'),
                                ],
                              )),
                        ),
                        SizedBox(
                          width: 100,
                          height: 70,
                          child: ElevatedButton(
                              style: ButtonStyle(
                                backgroundColor: MaterialStatePropertyAll(
                                  kPrimaryLightColor,
                                ),
                              ),
                              onPressed: () {},
                              child: Column(
                                children: [
                                  Image.asset(
                                    'assets/icons/other.png',
                                    scale: 14,
                                  ),
                                  Text('อื่น'),
                                ],
                              )),
                        ),
                      ]),
                  SizedBox(
                    height: 10,
                  ),
                ],
              ),
            ),//กล่องรายการ

            Container(
              margin: EdgeInsets.all(20),
              padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 24.0),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: kPrimaryColor),
                  borderRadius: BorderRadius.all(Radius.circular(20.0)),
                  boxShadow: [
                    BoxShadow(
                        blurRadius: 2,
                        color: Colors.black45,
                        offset: Offset(1, 1))
                  ]),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  CategoryItemManu(
                    titie: "รายการ",
                    isActive: true,
                    press: () {},
                  ),
                  CategoryItemManu(
                    titie: "รายการ",
                    press: () {},
                  ),
                  CategoryItemManu(
                    titie: "รายการ",
                    press: () {},
                  ),
                ],
              ),
            ),//รายการยาว






            Container(
              padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 24.0),
              height: MediaQuery.of(context).size.height * 0.25,
              child: Card(
                color: Colors.black,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.0),
                ),
                elevation: 8,
                child: Container(
                  child: Center(),
                ),
              ),
            ),


            //  Container(
            //   padding: EdgeInsets.symmetric(horizontal: 15, vertical: 70.0),
            //   height: MediaQuery.of(context).size.height ,
            //   child: ListView.builder(
            //     itemCount: 10,
            //     itemBuilder: (context, index) {
            //       return Container(
            //         height: MediaQuery.of(context).size.width * 0.5,
            //         child: Card(
            //           color: Colors.deepPurpleAccent,
            //           shape: RoundedRectangleBorder(
            //             borderRadius: BorderRadius.circular(12.0),
            //           ),
            //           elevation: 8,
            //           child: Container(
            //             child: Center(),
            //           ),
            //         ),
            //       );
            //     },
            //
            //   ),
            // ),

            // Row(
            //   mainAxisAlignment: MainAxisAlignment.spaceAround,
            //   children: [
            //     Container(
            //       padding: EdgeInsets.fromLTRB(40, 100, 40, 20),
            //       margin: EdgeInsets.all(10),
            //       color: Colors.amber[600],
            //       child: Image.asset(
            //         'assets/icons/icon.png',
            //         scale: 10,
            //       ),
            //     ),
            //     Container(
            //       padding: EdgeInsets.fromLTRB(40, 100, 40, 20),
            //       margin: EdgeInsets.all(10),
            //       color: Colors.amber[600],
            //       child: Image.asset(
            //         'assets/icons/icon.png',
            //         scale: 10,
            //       ),
            //     ),
            //   ],
            // ),
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.spaceAround,
            //   children: [
            //     Container(
            //       padding: EdgeInsets.fromLTRB(40, 100, 40, 20),
            //       margin: EdgeInsets.all(10),
            //       color: Colors.amber[600],
            //       child: Image.asset(
            //         'assets/icons/icon.png',
            //         scale: 10,
            //       ),
            //     ),
            //     Container(
            //       padding: EdgeInsets.fromLTRB(40, 100, 40, 20),
            //       margin: EdgeInsets.all(10),
            //       color: Colors.amber[600],
            //       child: Image.asset(
            //         'assets/icons/icon.png',
            //         scale: 10,
            //       ),
            //     ),
            //   ],
            // ),
          ],
        ),
      ),
    );
  }
}