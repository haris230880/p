



import 'dart:math';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:location/location.dart';
import 'package:project/my_style.dart';
import 'package:project/screen/Login/components/login_screen.dart';
import 'package:project/screen/Regis/components/bodyregister/body_register_bay.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'configs/datauserbay.dart';
import 'configs/services/api.dart';
import 'constants.dart';

Future<Null> signOutprocess(BuildContext context) async {
  SharedPreferences preferences = await SharedPreferences.getInstance();
  preferences.clear();
  // exit(0);
  MaterialPageRoute route = MaterialPageRoute(
    builder: (context) => LoginScreen(),);
  Navigator.pushAndRemoveUntil(context, route, (route) => false);
}

Future<LocationData?> findlocationData() async {
  Location location = Location();
  try {
    return location.getLocation();
  } catch (e) {
    return null;
  }
}




Future<void> normaDiolog(BuildContext context, String message) async {
  showDialog(
    context: context,
    builder: (context) => SimpleDialog(
      title: Text(message,style: TextStyle(fontSize: 16),),
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      elevation: 5,
                      // Foreground color
                      onPrimary: Colors.white,
                      // Background color
                      primary: kPrimaryColor,
                      minimumSize: Size(10, 30))
                  .copyWith(elevation: ButtonStyleButton.allOrNull(5.0)),
              onPressed: () => Navigator.pop(context),
              child: const Text(
                'ตกลง',
                style: TextStyle(fontSize: 14),
              ),
            ),
          ],
        ),
        // ElevatedButton(
        //   onPressed: () => Navigator.pop(context),
        //   child: Center(
        //       child: Text('ตกลง')),
        // ),
      ],
    ),
  );
}

//>>>>>>>>>>>>>>>>>>>
double? lat;
double? lng;



// Future<Null> checkPhoneNumber() async {
//   String url = API.BASE_URL +
//       '/flutterApiProjeck/getUserWhereUserbay.php?isAdd=true&buyuser_phone=$buyuser_phone';
//   try {
//     Response response = await Dio().get(url);
//     if (response.toString() == "null") {
//
//       getHttpBuyuser();
//       uplodeimageusersaveuserbuy();
//       // getHttpTabelLoginBay();
//       Navigator.push(
//         context,
//         MaterialPageRoute(
//           builder: (context) {
//             return OtpScreen();
//           },
//         ),
//       );
//     } else {
//       normaDiolog(
//           context, 'เบอร์โทรศัพท์ซ้ำ $buyuser_phone กรุณาเปลี่ยนใหม่');
//       print('$response');
//     }
//   } catch (e) {
//     print(e);
//   }
// }