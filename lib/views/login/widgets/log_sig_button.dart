import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:uzgram/utils/styles.dart';

class LogSigButton extends StatelessWidget {
  final String title;
  const LogSigButton({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    final styles = Provider.of<Styles>(context);

    return Container(
      width: 330,
      height: 55,
      decoration: BoxDecoration(
          color: styles.primaryColor, borderRadius: BorderRadius.circular(5)),
      child: Center(
        child: Text(
          title,
          style: const TextStyle(
              fontWeight: FontWeight.bold, fontSize: 18, color: Colors.white),
        ),
      ),
    );
  }
}
