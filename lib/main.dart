import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:uzgram/controller/user_controller/user_controller.dart';
import 'package:uzgram/services/login/login.dart';
import 'package:uzgram/utils/styles.dart';
import 'package:uzgram/utils/theme.dart';
import 'package:uzgram/utils/functions.dart';
import 'package:uzgram/views/home/home_screen/home_screen.dart';
import 'package:uzgram/views/login/sign_in.dart';
import 'package:uzgram/views/onboarding/onboarding_page.dart';
import 'package:uzgram/views/onboarding/widgets/onboarding_page_item_images.dart';

void main(List<String> args) {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (ctx) {
            return AppTheme();
          },
        ),
        ChangeNotifierProvider(
          create: (ctx) {
            return Styles();
          },
        ),
        ChangeNotifierProvider(
          create: (ctx) {
            return FunctionsUzgram();
          },
        ),
        ChangeNotifierProvider(create: (ctx) => AuthHtppServices()),
        ChangeNotifierProvider(create: (ctx) => UserController()),
      ],
      child: const Uzgram(),
    ),
  );
}

class Uzgram extends StatelessWidget {
  const Uzgram({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(providers: [
      ChangeNotifierProvider(
        create: (ctx) {
          return OnboardingPageItemImages();
        },
        builder: (context, child) {
          return AdaptiveTheme(
            light: ThemeData.light(useMaterial3: true).copyWith(
              appBarTheme: AppBarTheme(
                iconTheme: const IconThemeData(color: Colors.white, size: 30),
                titleTextStyle: const TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.w500),
                color: Colors.blue.shade300,
              ),
            ),
            dark: ThemeData.dark(useMaterial3: true).copyWith(
                scaffoldBackgroundColor: Color.fromARGB(255, 13, 19, 23),
                appBarTheme: const AppBarTheme(
                    color: Color.fromARGB(255, 24, 35, 40),
                    titleTextStyle: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.w500),
                    iconTheme: IconThemeData(color: Colors.white, size: 30))),
            initial: AdaptiveThemeMode.light,
            builder: (theme, darkTheme) => MaterialApp(
              debugShowCheckedModeBanner: false,
              title: 'Adaptive Theme Demo',
              theme: theme,
              darkTheme: darkTheme,
              home: const SignIn(),
            ),
          );
        },
      )
    ]);
  }
}


// 