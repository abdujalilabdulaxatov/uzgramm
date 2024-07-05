import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AllChats extends StatefulWidget {
  const AllChats({super.key});

  @override
  State<AllChats> createState() => _AllChatsState();
}

class _AllChatsState extends State<AllChats> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(itemBuilder: (ctx, index) {
      return InkWell(
        onTap: () {},
        child: ListTile(
          leading: const CircleAvatar(
            radius: 25,
          ),
          title: const Text("Group"),
          subtitle: const Text("dsjkfnjks sjfnjsek jsnfjfjk ajkfesfesf"),
          trailing: Container(
            padding: const EdgeInsets.symmetric(horizontal: 7),
            decoration: BoxDecoration(
                color: Colors.grey, borderRadius: BorderRadius.circular(20)),
            child: const Text(
              "10000",
              style: TextStyle(color: Colors.white, fontSize: 15),
            ),
          ),
        ),
      );
    });
  }
}
