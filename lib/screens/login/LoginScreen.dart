import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:home_water_service_rider/utils/route_constant.dart';
import 'package:http/http.dart' as http;
import '../../global_widgets/CustomButton.dart';
import '../../global_widgets/CustomPasswordTextFormField.dart';
import '../../global_widgets/CustomTextFormField.dart';
import '../../main.dart';
import '../../model/LoginResponse.dart';
import '../../utils/Commons.dart';
import '../../utils/global_functions.dart';
import '../../utils/shared_preference/SharePreferece.dart';
import '../../utils/urls.dart';
import '../dashboard/Dashboard.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    setState(() {
      isLoading = false;
    });

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Stack(alignment: Alignment.center, children: [
            Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                child: containerView(context)),
            Positioned(
                top: MediaQuery.of(context).size.height / 3.5,
                child: logoImage())
          ])),
    );
  }

  Widget logoImage() => Container(
        width: 150,
        height: 150,
        decoration: BoxDecoration(
            color: Colors.white,
            image: const DecorationImage(image: AssetImage("images/logo.png")),
            border: Border.all(color: Colors.blue, width: 2),
            borderRadius: const BorderRadius.all(Radius.circular(100.0))),
      );

  Widget containerView(BuildContext context) => Stack(
        alignment: AlignmentDirectional.topStart,
        children: [
          Container(
            height: MediaQuery.of(context).size.height / 2.2,
            width: MediaQuery.of(context).size.width,
            color: Colors.blue,
          ),
          Positioned(
            top: MediaQuery.of(context).size.height / 2.5,
            child: Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(30)),
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                child: loginForm()),
          ),
        ],
      );

  Widget loginForm() => Padding(
        padding: const EdgeInsets.only(top: 60, left: 20, right: 20),
        child: Form(
          child: Builder(builder: (context) {
            return SizedBox(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                child: SingleChildScrollView(
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CustomTextFormField(
                          validator: (value) {
                            if (value.isEmpty) {
                              return "Please Enter your Email";
                            } else if (!value.contains("@") ||
                                !value.contains(".com")) {
                              return "Invalid Email";
                            }
                            return null;
                          },
                          inputType: TextInputType.emailAddress,
                          hintText: "Email",
                          iconPath: "",
                          controller: emailController,
                          icon: Icons.email,
                          onChange: (String value) {},
                        ),
                        SizedBox(height: 20),
                        CustomPasswordTextFormField(
                          controller: passwordController,
                          validator: (value) {
                            if (value.isEmpty) {
                              return "Please Enter your  Password";
                            } else if (value.length < 6) {
                              return "Password enter at-least 6 character";
                            }
                            return null;
                          },
                          hintText: "Password",
                          onChange: (String value) {},
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              "By creating an account, you agree to our \nTerms of Service and Privacy Policy",
                              style: TextStyle(color: Colors.black),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        isLoading
                            ? const CircularProgressIndicator()
                            : CustomButton(
                                title: "Login",
                                onPress: () {
                                  onButtonPress(context);
                                },
                              )
                      ]),
                ));
          }),
        ),
      );

  Future<void> onButtonPress(BuildContext context) async {
    var isValidate = Form.of(context).validate();
    if (isValidate) {
      var loginResponse = await  getLogin(
          emailController.text.toString(),
          passwordController.text.toString()
      );
      SharedPreferencesManager.saveUser(loginResponse!.user!);
      SharedPreferencesManager.setToken(loginResponse.token!);
      user = await SharedPreferencesManager.getUser();
      token = await SharedPreferencesManager.geToken();
      pushName(context,  Dashboard());
      hideKeyboard(context);
    }
  }


  Future<LoginResponse?> getLogin( String email, String password) async{
    try {
      var loginMap = json.encode(
          {"email": email, "password": password});

      var headers = {'Content-Type': 'application/json'};
      setState(() {
        isLoading = true;
      });
      var request =
      http.post(Uri.parse(Url.login), body: loginMap, headers: headers);
      print("Umar"+Url.login);
      print("Umar"+loginMap);
      print("Umar"+loginMap);
      var response = await request;
      print("Umar"+response.statusCode.toString());
      if (response.statusCode == 200) {
        setState(() {
          isLoading = false;
        });

        var product = LoginResponse.fromJson(jsonDecode(response.body));

        return product;
      } else {
        setState(() {
          isLoading = false;
        });
        showToast('Error: ${response.statusCode}');
        return null;
      }
    }catch (e) {
      setState(() {
        isLoading = false;
      });
      showToast('Error: $e');
      return null;
    }
  }

  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
  }
}
