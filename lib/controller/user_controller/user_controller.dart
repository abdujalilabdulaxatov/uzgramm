import 'package:flutter/cupertino.dart';
import 'package:uzgram/models/user_info/create_user_info.dart';
import 'package:uzgram/services/login/login.dart';

class UserController extends ChangeNotifier {
  List<String> user_list = [];
  final authHtppServices = AuthHtppServices();
  Future<Map<String, dynamic>> createUser(
      String email, String password, String name, String surName) async {
    final user = CreateUserInfo(
        id: "id",
        user_id: "",
        name: name,
        surName: surName,
        email: email,
        password: password,
        subscribeChannels: 0,
        subscribeGroups: 0,
        userChannels: 0,
        userGroups: 0,
        chats: 0);
    var data = await authHtppServices.createUser(user);
    user_list.add(data["id"]);
    print("$user_list lst");
    notifyListeners();
    return data;
  }

  Future<Map<String, dynamic>> getUsersId(String email, String password) async {
    var data = await authHtppServices.getUsersId();
    if (data.isEmpty) {
      return {"check": false, "error": "Bunday email mavjud emas !"};
    }
    var userAuth =
        await authHtppServices.login("signInWithPassword", email, password);
    if (userAuth["check"]) {
      return {"check": true};
    }

    return {"check": false, "error": "${userAuth["error"]}"};
  }
}
