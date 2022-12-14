import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:project/configs/services/api.dart';
import 'package:project/model/usermodel.dart';
import 'package:project/screen/USER/BAY/ProFile/editprofile.dart';
import 'package:project/screen/USER/BAY/backgroundbay.dart';
import 'package:project/screen/USER/SALE/Home/components/backgroundhomesale.dart';
import 'package:project/screen/USER/SALE/ProFile/editprofile.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../../constants.dart';
import '../../../../future_All.dart';
import '../../../../my_style.dart';

class BodyProFileSale extends StatefulWidget {
  const BodyProFileSale({Key? key}) : super(key: key);

  @override
  State<BodyProFileSale> createState() => _BodyProFileSaleState();
}

class _BodyProFileSaleState extends State<BodyProFileSale> {
  UserModel? userModel;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    readDatausersale();
  }

  Future<Null> readDatausersale() async {
    String url = API.BASE_URL + '/kongkao/showuser.php?isAdd=true&id=$userid';
    await Dio().get(url).then(
      (value) {
        var result = json.decode(value.data);
        print('result>>>>>>>>>>>>>>>>$result');
        for (var map in result) {
          setState(() {
            userModel = UserModel.fromJson(map);
          });
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return BackgroundHomePageSell(
      child: SingleChildScrollView(
        child: userModel == null
            ? MyStyle().showProgress()
            : Padding(
                padding: const EdgeInsets.only(top: 50,left: kDefaultPaddin,right:  kDefaultPaddin),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                        child: Column(
                          children: [
                            CircleAvatar(
                                backgroundColor: kPrimaryColor,
                                maxRadius: 50,
                                child: userModel!.photo == null
                                    ? Image.asset('assets/icons/usersale.png')
                                    : CircleAvatar(
                                        maxRadius: 50,
                                        backgroundImage: NetworkImage(
                                            API.BASE_URL +
                                                '${userModel!.photo}'))),
                            TextButton(
                              onPressed: () {
                                Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              EditProfilesale(),
                                        ))
                                    .then((value) =>
                                        readDatausersale()); //??????????????????????????????????????????????????????
                              },
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    '????????????????????????????????????  ',
                                    style: TextStyle(
                                        fontSize: 16, color: Colors.blue),
                                  ),
                                  Icon(Icons.edit, size: 15),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Text(
                        '?????????????????????????????????',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w800),
                      ),
                      TextButton(
                          onPressed: () {},
                          child: MyStyle()
                              .ManuProflie('????????????: ${userModel!.name}')),
                      TextButton(
                          onPressed: () {},
                          child: MyStyle()
                              .ManuProflie('?????????????????????: ${userModel!.lastname}')),
                      TextButton(
                          onPressed: () {},
                          child: MyStyle().ManuProflie(
                              '???????????????????????????????????????: ${userModel!.phone}')),
                      TextButton(
                          onPressed: () {},
                          child: MyStyle()
                              .ManuProflie('???????????????: ${userModel!.email}')),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        '?????????????????????',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w800),
                      ),
                      TextButton(
                          onPressed: () {},
                          child: MyStyle()
                              .ManuProflie('??????????????????????????????: ${userModel!.housenum}')),
                      TextButton(
                          onPressed: () {},
                          child: MyStyle()
                              .ManuProflie('????????????: ${userModel!.district}')),
                      TextButton(
                          onPressed: () {},
                          child: MyStyle()
                              .ManuProflie('???????????????: ${userModel!.prefecture}')),
                      TextButton(
                          onPressed: () {},
                          child: MyStyle()
                              .ManuProflie('?????????????????????: ${userModel!.city}')),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        '??????????????????????????????',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w800),
                      ),
                      MyStyle().SingoutButtonProfile(context),
                    ]),
              ),
      ),
    );
  }
}
