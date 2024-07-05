import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:uzgram/models/user_info/create_user_info.dart';

class AuthHtppServices extends ChangeNotifier {
  Future<dynamic> getUsersId() async {
    Uri url = Uri.parse(
        "https://uzgram-1d7b0-default-rtdb.firebaseio.com/users.json");
    var response = await http.get(url);
    var data = jsonDecode(response.body);

    return data;
    // print("${data["name"]} users");
  }

  Future<Map<String, dynamic>> login(
      String query, String email, String password) async {
    Uri url = Uri.parse(
        "https://identitytoolkit.googleapis.com/v1/accounts:$query?key=AIzaSyBiiI3UCCT4KByTscY-n8wXL_dYiONJQ2A");
    var response = await http.post(
      url,
      body: jsonEncode(
        {
          "email": email,
          "password": password,
          "returnSecureToken": true,
        },
      ),
    );
    var data = jsonDecode(response.body);
    if (response.statusCode != 200) {
      return {"error": data["error"]["message"], "check": false};
    }

    notifyListeners();

    return {
      "error": "",
      "check": true,
    };
  }

  Future<Map<String, dynamic>> createUser(CreateUserInfo user) async {
    Uri url_user_auth = Uri.parse(
        "https://identitytoolkit.googleapis.com/v1/accounts:signInWithPassword?key=AIzaSyBiiI3UCCT4KByTscY-n8wXL_dYiONJQ2A");
    Uri url_data = Uri.parse(
        "https://uzgram-1d7b0-default-rtdb.firebaseio.com/users.json");
    var response_user_auth = await http.post(
      url_user_auth,
      body: jsonEncode(
        {
          "email": user.email,
          "password": user.password,
          "returnSecureToken": true,
        },
      ),
    );
    // print(jsonDecode(response_user_auth.body));
    var user_data_auth = jsonDecode(response_user_auth.body);
    var response_user = await http.post(
      url_data,
      body: jsonEncode(
        {
          "user": {
            "user_id": user_data_auth["localId"],
            "name": user.name,
            "surName": user.surName,
            "email": user.email,
            "password": user.password,
            "subscribeChannels": user.subscribeChannels,
            "subscribeGroups": user.subscribeGroups,
            "userChannels": user.userChannels,
            "userGroups": user.userGroups,
            "chats": user.chats
          }
        },
      ),
    );
    var data = jsonDecode(response_user.body);
    return {"check": true, "id": data["name"]};
  }
}
