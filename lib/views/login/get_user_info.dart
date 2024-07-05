import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:uzgram/controller/user_controller/user_controller.dart';
import 'package:uzgram/utils/styles.dart';
import 'package:uzgram/views/home/home_screen/home_screen.dart';
import 'package:uzgram/views/login/widgets/log_sig_button.dart';

class GetUserInfo extends StatefulWidget {
  final String email;
  final String password;
  const GetUserInfo({super.key, required this.email, required this.password});

  @override
  State<GetUserInfo> createState() => _GetUserInfoState();
}

class _GetUserInfoState extends State<GetUserInfo> {
  final _nameController = TextEditingController();
  final _surnameController = TextEditingController();
  final _globalKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final createUserController = Provider.of<UserController>(context);

    final styles = Provider.of<Styles>(context);
    return Scaffold(
      body: SafeArea(
          child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                padding: const EdgeInsets.only(right: 20),
                child: const CircularProgressIndicator(),
              )
            ],
          ),
          const SizedBox(
            height: 200,
          ),
          SizedBox(
            width: 340,
            child: Column(
              children: [
                Text(
                  "Ism va familyangizni kiriting",
                  style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 20,
                      color: styles.primaryColor),
                  textAlign: TextAlign.center,
                ),
                const Text(
                  "Familyani kiritish majburiy emas",
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 40,
          ),
          Container(
            height: 200,
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Form(
              key: _globalKey,
              child: Column(
                children: [
                  TextFormField(
                    controller: _nameController,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Iltimos ismingizni kiriting !";
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      errorStyle: TextStyle(
                          color: Colors.red.shade300,
                          fontWeight: FontWeight.w600),
                      labelText: "Ism",
                      labelStyle:
                          TextStyle(color: styles.primaryColor, fontSize: 20),
                      focusedBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: styles.primaryColor, width: 2)),
                      enabledBorder: OutlineInputBorder(
                          borderSide:
                              const BorderSide(width: 1, color: Colors.grey),
                          borderRadius: BorderRadius.circular(5)),
                      errorBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(width: 1, color: Colors.red.shade300),
                          borderRadius: BorderRadius.circular(5)),
                      focusedErrorBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(width: 1, color: Colors.red.shade300),
                          borderRadius: BorderRadius.circular(5)),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    controller: _surnameController,
                    decoration: InputDecoration(
                      errorStyle: TextStyle(
                          color: Colors.red.shade300,
                          fontWeight: FontWeight.w600),
                      labelText: "Familya",
                      labelStyle:
                          TextStyle(color: styles.primaryColor, fontSize: 20),
                      focusedBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: styles.primaryColor, width: 2)),
                      enabledBorder: OutlineInputBorder(
                          borderSide:
                              const BorderSide(width: 1, color: Colors.grey),
                          borderRadius: BorderRadius.circular(5)),
                      errorBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(width: 1, color: Colors.red.shade300),
                          borderRadius: BorderRadius.circular(5)),
                      focusedErrorBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(width: 1, color: Colors.red.shade300),
                          borderRadius: BorderRadius.circular(5)),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 150,
          ),
          InkWell(
            onTap: () async {
              if (_globalKey.currentState!.validate()) {
                print(_surnameController.text);
                print(_nameController.text);
                var data = await createUserController.createUser(
                    widget.email,
                    widget.password,
                    _nameController.text,
                    _surnameController.text);
                if (data["check"]) {
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (ctx) => const HomeScreen()));
                }
              }
            },
            child: const LogSigButton(title: "Saqlash"),
          )
        ],
      )),
    );
  }
}
