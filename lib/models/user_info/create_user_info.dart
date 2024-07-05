import 'package:flutter/cupertino.dart';

class CreateUserInfo extends ChangeNotifier {
  final String id;
  final String user_id;
  final String name;
  final String surName;
  final String email;
  final String password;
  final int subscribeChannels;
  final int subscribeGroups;
  final int userChannels;
  final int userGroups;
  final int chats;

  CreateUserInfo({
    required this.id,
    required this.user_id,
    required this.name,
    required this.surName,
    required this.email,
    required this.password,
    required this.subscribeChannels,
    required this.subscribeGroups,
    required this.userChannels,
    required this.userGroups,
    required this.chats,
  });
}
