import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:uzgram/services/login/login.dart';
import 'package:uzgram/utils/styles.dart';
import 'package:uzgram/views/home/home_screen/home_screen.dart';
import 'package:uzgram/views/login/get_user_info.dart';
import 'package:uzgram/views/login/sign_in.dart';
import 'package:uzgram/views/login/widgets/log_sig_button.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  bool obscureIsDone = true;
  final _passwordController = TextEditingController();
  final _passwordConfirmController = TextEditingController();
  final _emailController = TextEditingController();
  final _globalKey = GlobalKey<FormState>();
  bool checkEmail = false;
  String? errorEmailText = null;

  @override
  Widget build(BuildContext context) {
    final styles = Provider.of<Styles>(context);
    final authHtppServices = Provider.of<AuthHtppServices>(context);

    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: SafeArea(
            child: ListView(
          children: [
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                        margin: const EdgeInsets.only(right: 20),
                        child: const CircularProgressIndicator())
                  ],
                ),
                const SizedBox(
                  height: 60,
                ),
                Text(
                  "Ro'yhatdan o'tish",
                  style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 30,
                      color: styles.primaryColor),
                ),
                const SizedBox(
                  width: 250,
                  height: 70,
                  child: Center(
                    child: Text(
                      "Iltimos Emailingizni kiriting. Yangi parol o'ylab toping. Parolni qaytadan kiriting",
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 50,
                ),
                Container(
                  height: 300,
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: Form(
                      key: _globalKey,
                      child: Column(
                        children: [
                          Container(),
                          TextFormField(
                            controller: _emailController,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "Iltimos emailingizni kiriting !";
                              } else if (value.length < 6 ||
                                  !value.contains("@") ||
                                  !value.contains(".")) {
                                return "Iltimos emailingizni to'g'ri kiriiting !";
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
                                      color: styles.primaryColor, width: 2)),
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
                                      color: styles.primaryColor, width: 2)),
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
                            controller: _passwordConfirmController,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "Iltimos parolni kiriting !";
                              } else if (_passwordConfirmController.text !=
                                  _passwordController.text) {
                                return "Parollar bir xil emas !";
                              }
                              return null;
                            },
                            obscuringCharacter: "*",
                            obscureText: obscureIsDone,
                            decoration: InputDecoration(
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
                              labelText: "Parolni qaytadan kiriting",
                              labelStyle: TextStyle(
                                  color: styles.primaryColor, fontSize: 20),
                              focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: styles.primaryColor, width: 2)),
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
                        ],
                      )),
                ),
                const SizedBox(
                  height: 50,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("sizni"),
                    TextButton(
                        onPressed: () {
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (ctx) => const SignIn()));
                        },
                        child: Text(
                          "Akkauntingiz bormi ?",
                          style: TextStyle(color: styles.primaryColor),
                        ))
                  ],
                ),
                const SizedBox(
                  height: 100,
                ),
                InkWell(
                  onTap: () async {
                    if (_globalKey.currentState!.validate()) {
                      var data = await authHtppServices.login("signUp",
                          _emailController.text, _passwordController.text);
                      if (data["check"]) {
                        checkEmail = false;
                        Navigator.of(context).pushAndRemoveUntil(
                          CupertinoPageRoute(
                            builder: (context) => HomeScreen(),
                          ),
                          (route) {
                            return false;
                          },
                        );
                      } else {
                        errorEmailText = data["error"];
                        checkEmail = true;
                        setState(() {});
                      }
                    }
                  },
                  child: const LogSigButton(
                    title: "Ro'yhatdan o'tish",
                  ),
                )
              ],
            ),
          ],
        )));
  }
}
