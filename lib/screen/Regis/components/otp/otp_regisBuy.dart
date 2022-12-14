// import 'package:email_auth/email_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:project/configs/services/datauserbay.dart';
// import 'package:project/screen/Login/components/login_screen.dart';
// import 'package:project/screen/Regis/components/background_regis.dart';
// import 'package:project/screen/Regis/components/regis.dart';
//
// import '../../../constants.dart';
//
//
//
//
// class Otp_Regis extends StatefulWidget {
//   const Otp_Regis({Key? key}) : super(key: key);
//
//   @override
//   State<Otp_Regis> createState() => _Otp_RegisState();
// }
//
// class _Otp_RegisState extends State<Otp_Regis> {
//   @override
//   Widget build(BuildContext context) {
//     Size size = MediaQuery.of(context).size;
//     return BackgroundRegis(
//       child: SingleChildScrollView(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             Text(
//               "Kongkao",
//               style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
//             ),
//             SizedBox(
//               height: 10,
//             ),
//             Image.asset(
//               'assets/images/logo.jpg',
//               scale: 10,
//             ),
//             SizedBox(
//               height: 20,
//             ),
//             Container(
//               margin: EdgeInsets.all(20),
//               padding:
//               EdgeInsets.only(left: 50, right: 50, top: 10, bottom: 20),
//               alignment: Alignment.center,
//               decoration: BoxDecoration(
//                   color: Colors.white,
//                   border: Border.all(color: kPrimaryColor),
//                   borderRadius: BorderRadius.all(Radius.circular(20.0)),
//                   boxShadow: [
//                     BoxShadow(
//                         blurRadius: 2,
//                         color: kPrimaryColor,
//                         offset: Offset(1, 1))
//                   ]),
//               child: Column(
//                 children: <Widget>[
//                   Text('OTP'),
//                   SizedBox(
//                     height: 10,
//                   ),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                     textFildotp(first: true, last: false),
//                     textFildotp(first: false, last: false),
//                     textFildotp(first: false, last: false),
//                     textFildotp(first: false, last: true),
//                   ],),
//
//
//                   SizedBox(
//                     height: 10,
//                   ),
//                   Text('??????????????????????????????????????? OTP'),
//                 ],
//               ),
//             ),
//             TextButton(
//               onPressed: () {},
//               child: Text('?????????????????????????????????????????????'),
//             ),
//             Text('???????????????????????????????????????????????????????????????????????? 2:33 ????????????'),
//             SizedBox(
//               height: 10,
//             ),
//             ElevatedButton(
//               style: ElevatedButton.styleFrom(
//                   shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(20),
//                   ),
//                   elevation: 5,
//                   // Foreground color
//                   onPrimary: Colors.white,
//                   // Background color
//                   primary: kPrimaryColor,
//                   minimumSize: Size(30, 50))
//                   .copyWith(elevation: ButtonStyleButton.allOrNull(5.0)),
//               onPressed: () {
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(
//                     builder: (context) {
//                       return LoginScreen();
//                     },
//                   ),
//                 );
//               },
//               child: const Text('?????????????????? otp'),
//             ),
//             TextButton(
//               onPressed: () {
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(
//                     builder: (context) {
//                       return RegisScreen();
//                     },
//                   ),
//                 );
//               },
//               child: const Text(
//                 '??????????????????',
//                 style: TextStyle(color: kPrimaryLightColor),
//               ),
//             )
//           ],
//         ),
//       ),
//     );
//   }
//   textFildotp({required bool first, last}) {
//     return Container(
//         height: 85,
//         child: AspectRatio(
//           aspectRatio: 0.7,
//           child: TextField(
//             autofocus: true,
//             onChanged: (value) {
//               if(value.length==1&&last==false){
//                 FocusScope.of(context).nextFocus();
//               }  if(value.length==0&&first==false){
//                 FocusScope.of(context).previousFocus();
//               }
//
//             },
//             showCursor: false,
//             readOnly: false,
//             textAlign: TextAlign.center,
//             style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
//             keyboardType: TextInputType.number,
//             maxLength: 1,
//             decoration: InputDecoration(
//               counter: Offstage(),
//               enabledBorder: OutlineInputBorder(
//                 borderRadius: BorderRadius.circular(12),
//                 borderSide: BorderSide(width: 2, color: Colors.black26),
//               ),
//               focusedBorder: OutlineInputBorder(
//                 borderRadius: BorderRadius.circular(12),
//                 borderSide: BorderSide(width: 2, color: kPrimaryColor),
//               ),
//             ),
//           ),
//         ));
//   }
//   }
//


import 'dart:math';

import 'package:dio/dio.dart';
import 'package:email_auth/email_auth.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:project/configs/services/datauserbay.dart';
import 'package:project/screen/Login/components/login_screen.dart';
import 'package:project/screen/Regis/components/background_regis.dart';
import 'package:project/screen/Regis/components/regis.dart';

import '../../../../configs/services/api.dart';
import '../../../../configs/services/datausersale.dart';
import '../../../../constants.dart';
import '../../../../future_All.dart';
import '../bodyregister/body_register_bay.dart';
import '../bodyregister/body_register_sell.dart';

class Otp_RegisBuy extends StatefulWidget {
  const Otp_RegisBuy({Key? key}) : super(key: key);

  @override
  State<Otp_RegisBuy> createState() => _Otp_RegisBuyState();
}

class _Otp_RegisBuyState extends State<Otp_RegisBuy> {
  /// The boolean to handle the dynamic operations
  bool submitValid = false;

  /// Text editing controllers to get the value from text fields
  final TextEditingController _emailcontroller = TextEditingController();
  final TextEditingController _otpcontroller = TextEditingController();

  // Declare the object
  late EmailAuth emailAuth;

  @override
  void initState() {
    super.initState();
    // Initialize the package
    emailAuth = new EmailAuth(
      sessionName: "Sample session",
    );

    /// Configuring the remote server
    // emailAuth.config(remoteServerConfiguration);
  }

  /// a void function to verify if the Data provided is true
  /// Convert it into a boolean function to match your needs.
  void verify() {

    var res = emailAuth.validateOtp(recipientMail: _emailcontroller.text, userOtp: _otpcontroller.text);

    if(res){
      print('OTP Verify');
      uplodeimageusersaveuserbuy();
    }else{
      normaDiolog(context, "OTP ??????????????????????????????");
      print('Invalid OTP ');
    }


    print(emailAuth.validateOtp(
        recipientMail: _emailcontroller.value.text,
        userOtp: _otpcontroller.value.text));

  }

  /// a void funtion to send the OTP to the user
  /// Can also be converted into a Boolean function and render accordingly for providers
  void sendOtp() async {
    bool result = await emailAuth.sendOtp(
        recipientMail: _emailcontroller.value.text, otpLength:5);
    if (result) {
      setState(() {
        submitValid = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return BackgroundRegis(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "Kongkao",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
            ),
            SizedBox(
              height: 10,
            ),
            Image.asset(
              'assets/images/logo.jpg',
              scale: 10,
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              margin: EdgeInsets.all(20),
              padding:
              EdgeInsets.only(left: 30, right: 30, top: 10, bottom: 20),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: kPrimaryColor),
                  borderRadius: BorderRadius.all(Radius.circular(20.0)),
                  boxShadow: [
                    BoxShadow(
                        blurRadius: 2,
                        color: kPrimaryColor,
                        offset: Offset(1, 1))
                  ]),
              child: Column(
                children: <Widget>[
                  Text('OTP'),
                  SizedBox(
                    height: 10,
                  ),


                  Container(
                    height: 50,
                    width: 350,
                    child: TextFormField(
                      controller: _emailcontroller,
                      validator: (buyuser_email) => EmailValidator.validate(buyuser_email!)
                          ? null
                          : "??????????????????????????? ??????????????????????????????@gmail.com",
                      onChanged: (value) => buyuser_email = value.trim(),
                      cursorColor: kPrimaryColor,
                      keyboardType: TextInputType.emailAddress,
                      textAlignVertical: TextAlignVertical.center,
                      decoration: InputDecoration(
                          filled: true,
                          border: OutlineInputBorder(
                              borderSide: BorderSide.none,
                              borderRadius:
                              BorderRadius.all(Radius.circular(20))),
                          contentPadding: EdgeInsets.all(10),
                          label: Text(
                            '???????????????',
                            style: TextStyle(color: kPrimaryblckColor),
                          ),
                          prefixIcon: Icon(
                            Icons.email,
                            size: 25,
                            color: kPrimaryColor,
                          )),
                    ),
                  ),
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
                        minimumSize: Size(30, 50))
                        .copyWith(
                        elevation: ButtonStyleButton.allOrNull(5.0)),
                    onPressed: () {},
                    child:GestureDetector(
                      onTap: sendOtp,
                      child: Center(
                        child: Text(
                          " ????????????????????? OTP ",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontSize: 20,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),

                  (submitValid)
                      ? Container(
                    height: 50,
                    width: 340,
                    child: TextFormField(
                      validator: (value) {
                        if (value != null && value.isEmpty) {
                          return "???????????? OTP";
                        }
                        return null;
                      },
                      // onChanged: (value) =>  = value.trim(),
                      controller: _otpcontroller,
                      keyboardType: TextInputType.text,
                      cursorColor: kPrimaryColor,
                      textAlignVertical: TextAlignVertical.center,
                      decoration: InputDecoration(
                        filled: true,
                        border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.all(
                            Radius.circular(20),
                          ),
                        ),
                        contentPadding: EdgeInsets.all(10),
                        label: Text(
                          'OTP',
                          style: TextStyle(color: kPrimaryblckColor),
                        ),
                      ),
                    ),
                  )
                      : Container(height: 1),

                  (submitValid)
                      ? ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        elevation: 5,
                        // Foreground color
                        onPrimary: Colors.white,
                        // Background color
                        primary: kPrimaryColor,
                        minimumSize: Size(30, 50))
                        .copyWith(
                        elevation: ButtonStyleButton.allOrNull(5.0)),
                    onPressed: () {



                    },
                    child: GestureDetector(
                      onTap: verify,
                      child: Center(
                        child: Text("??????????????????",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontSize: 20,
                          ),
                        ),
                      ),
                    ),
                  )
                      : SizedBox(height: 1)


                ],
              ),
            ),




          ],
        ),
      ),
    );
  }

  textFildotp({required bool first, last}) {
    return Container(
        height: 85,
        child: AspectRatio(
          aspectRatio: 0.7,
          child: TextField(
            autofocus: true,
            onChanged: (value) {
              if (value.length == 1 && last == false) {
                FocusScope.of(context).nextFocus();
              }
              if (value.length == 0 && first == false) {
                FocusScope.of(context).previousFocus();
              }
            },
            showCursor: false,
            readOnly: false,
            textAlign: TextAlign.center,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
            keyboardType: TextInputType.number,
            maxLength: 1,
            decoration: InputDecoration(
              counter: Offstage(),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(width: 2, color: Colors.black26),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(width: 2, color: kPrimaryColor),
              ),
            ),
          ),
        ));
  }




  void uplodeimageusersaveuserbuy() async {
    Random random = Random();
    int i = random.nextInt(100000);
    String nameimage = 'user$i.jpg';
    String url = API.BASE_URL + '/kongkao/saveimage.php';
    try {
      Map<String, dynamic> map = Map();
      map['file'] =
      await MultipartFile.fromFile(fileuserbuy!.path, filename: nameimage);
      FormData formData = FormData.fromMap(map);
      await Dio().post(url, data: formData).then((value) {
        print('value=====$value');
        buyuser_photo = '/kongkao/Image/$nameimage';
        print('nameimage ======= $buyuser_photo');
        print('user_photo>>>>>$buyuser_photo');
        getHttpBuyuser();
  Navigator.push(context, MaterialPageRoute(builder: (context) => LoginScreen(),));


      });
    } catch (e) {}
  } //???????????????????????????????????????????????????????????????????????????

  void getHttpBuyuser() async {
    try {
      var response = await Dio().get(API.BASE_URL +
          '/kongkao/insertuser.php?id=3&name=$buyuser_name&lastname=$buyuser_sname&phone=$buyuser_phone&email=$buyuser_email&photo=$buyuser_photo&typeuser=buy&password=$buyuser_password&housenum=$buyuser_housenum&district=$buyuser_district&prefecture=$buyuser_prefecture&city=$buyuser_city&postid=$buyuser_postid&latitude=$lat&longitude=$lng&charge=$buyuser_charge&shop=$buyuser_shop&time=$buyuser_time');
      print(response);
    } catch (e) {
      print(e);
    }
  } //api?????????????????????????????????????????????????????????


  Future<Null> chackUser() async {
    String url = API.BASE_URL +
        '/kongkao/insertuserphone.php?isAdd=true&phone=$buyuser_phone';
    try {
      Response response = await Dio().get(url);
      print(response);
      if (response.toString() == 'null') {
        uplodeimageusersaveuserbuy();
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              return OtpScreenSale();
            },
          ),
        );
      } else {
        normaDiolog(context, '??????????????????????????????????????????');
      }
    } catch (e) {}
  }
}
