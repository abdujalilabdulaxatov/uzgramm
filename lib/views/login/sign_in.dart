import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:uzgram/controller/user_controller/user_controller.dart';
import 'package:uzgram/services/login/login.dart';
import 'package:uzgram/utils/styles.dart';
import 'package:uzgram/views/login/sign_up.dart';
import 'package:uzgram/views/login/widgets/log_sig_button.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  bool obscureIsDone = true;
  final _passwordController = TextEditingController();
  final _emailController = TextEditingController();
  final _globalKey = GlobalKey<FormState>();
  bool checkEmail = false;
  bool checkPassword = false;
  String? errorEmailText = null;
  String? errorPasswordText = null;

  void closeDiolog() async {
    await Future.delayed(const Duration(seconds: 3));
  }

  @override
  Widget build(BuildContext context) {
    final styles = Provider.of<Styles>(context);
    final authHtppServices = Provider.of<AuthHtppServices>(context);
    final userController = Provider.of<UserController>(context);
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: ListView(children: [
          Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                      // width: 50,
                      // height: 50,
                      padding: const EdgeInsets.only(right: 30),
                      child:
                          const CircularProgressIndicator() // SvgPicture.asset("assets/svg_images/shield_white.svg"),
                      ),
                ],
              ),
              const SizedBox(
                height: 90,
              ),
              Text(
                "Kirish",
                style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 40,
                    color: styles.primaryColor),
              ),
              const SizedBox(
                width: 200,
                height: 50,
                child: Center(
                  child: Text(
                    "Emailingiz va parolingizni kiriting. Ro'yhatdan o'ting",
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Form(
                    key: _globalKey,
                    child: Column(
                      children: [
                        SizedBox(
                          height: 220,
                          child: Column(
                            children: [
                              TextFormField(
                                controller: _emailController,
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return "Iltimos emailingizni kiriting !";
                                  } else if (value.length < 6 ||
                                      !value.contains("@") ||
                                      !value.contains(".")) {
                                    return "Iltimos emailingizni to'g'ri kiriting !";
                                  }
                                  return null;
                                },
                                decoration: InputDecoration(
                                  errorText: checkEmail ? errorEmailText : null,
                                  errorStyle: TextStyle(
                                      color: Colors.red.shade300,
                                      fontWeight: FontWeight.w600),
                                  labelText: "Email",
                                  labelStyle: TextStyle(
                                      color: styles.primaryColor, fontSize: 20),
                                  focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: styles.primaryColor,
                                          width: 2)),
                                  enabledBorder: OutlineInputBorder(
                                      borderSide: const BorderSide(
                                          width: 1, color: Colors.grey),
                                      borderRadius: BorderRadius.circular(5)),
                                  errorBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          width: 1, color: Colors.red.shade300),
                                      borderRadius: BorderRadius.circular(5)),
                                  focusedErrorBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          width: 1, color: Colors.red.shade300),
                                      borderRadius: BorderRadius.circular(5)),
                                ),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              TextFormField(
                                controller: _passwordController,
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return "Iltimos parolni kiriting !";
                                  } else if (value.length < 8) {
                                    return "Parolni uzunligi 7 tadan uzun bolishi kerak";
                                  }
                                  return null;
                                },
                                obscuringCharacter: "*",
                                obscureText: obscureIsDone,
                                decoration: InputDecoration(
                                  errorText:
                                      checkPassword ? errorPasswordText : null,
                                  errorStyle: TextStyle(
                                      color: Colors.red.shade300,
                                      fontWeight: FontWeight.w600),
                                  suffixIconColor: Colors.grey,
                                  suffixIcon: IconButton(
                                      onPressed: () {
                                        obscureIsDone = !obscureIsDone;
                                        setState(() {});
                                      },
                                      icon: Icon(obscureIsDone
                                          ? CupertinoIcons.eye
                                          : CupertinoIcons.eye_slash)),
                                  labelText: "Parol",
                                  labelStyle: TextStyle(
                                      color: styles.primaryColor, fontSize: 20),
                                  focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: styles.primaryColor,
                                          width: 2)),
                                  enabledBorder: OutlineInputBorder(
                                      borderSide: const BorderSide(
                                          width: 1, color: Colors.grey),
                                      borderRadius: BorderRadius.circular(5)),
                                  errorBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          width: 1, color: Colors.red.shade300),
                                      borderRadius: BorderRadius.circular(5)),
                                  focusedErrorBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          width: 1, color: Colors.red.shade300),
                                      borderRadius: BorderRadius.circular(5)),
                                ),
                              ),
                              const SizedBox(
                                height: 40,
                              ),
                            ],
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text("yoki"),
                            TextButton(
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (ctx) => const SignUp()));
                                },
                                child: Text(
                                  "Ro'yhatdan o'tish",
                                  style: TextStyle(color: styles.primaryColor),
                                ))
                          ],
                        ),
                        const SizedBox(
                          height: 215,
                        ),
                        GestureDetector(
                          onTap: () async {
                            if (_globalKey.currentState!.validate()) {
                              var data = await userController.getUsersId(
                                  _emailController.text,
                                  _passwordController.text);

                              if (data["check"]) {
                                checkEmail = false;
                                checkPassword = false;
                                print(data);
                                setState(() {});
                              } else {
                                print(data);
                                // showDialog(
                                //     context: context,
                                //     builder: (ctx) => AlertDialog(
                                //           title: data["error"],
                                //         ));
                              }
                            }
                          },
                          child: const LogSigButton(
                            title: "Kirish",
                          ),
                        ),
                      ],
                    )),
              )
            ],
          ),
        ]));
  }
}
