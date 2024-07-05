import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:uzgram/utils/styles.dart';
import 'package:uzgram/utils/theme.dart';
import 'package:uzgram/views/home/home_screen/home_screen.dart';
import 'package:uzgram/views/login/sign_in.dart';
import 'package:uzgram/views/login/widgets/log_sig_button.dart';
import 'package:uzgram/views/onboarding/widgets/onboarding_page_item_images.dart';
import 'package:uzgram/views/onboarding/widgets/onboarding_page_items.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({super.key});

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  final PageController _controller = PageController(initialPage: 0);
  int _currentPage = 0;
  bool darkMode = false;

  @override
  void initState() {
    super.initState();
    _controller.addListener(_handlePageChange);
  }

  void _handlePageChange() {
    if (_controller.page!.round() != _currentPage) {
      setState(() {
        _currentPage = _controller.page!.round();
      });
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void toggleTheme() async {
    final themeMode = await AdaptiveTheme.getThemeMode();
    themeMode == AdaptiveThemeMode.light
        ? AdaptiveTheme.of(context).setDark()
        : AdaptiveTheme.of(context).setLight();
    themeMode == AdaptiveThemeMode.dark ? darkMode = true : darkMode = false;
  }

  @override
  Widget build(BuildContext context) {
    final onboardingPageItems = Provider.of<OnboardingPageItemImages>(context);
    final styles = Provider.of<Styles>(context);
    return Scaffold(
      body: SafeArea(
          child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Consumer<AppTheme>(builder: (
                context,
                value,
                child,
              ) {
                return IconButton(
                  onPressed: () async {
                    toggleTheme();
                  },
                  icon: Icon(
                    darkMode ? Icons.dark_mode_sharp : Icons.wb_sunny,
                    size: 30,
                    color: styles.primaryColor,
                  ),
                );
              })
            ],
          ),
          const SizedBox(
            height: 60,
          ),
          AnimatedCrossFade(
              firstChild: onboardingPageItems.lst[0],
              secondChild: onboardingPageItems.lst[_currentPage],
              crossFadeState: CrossFadeState.showSecond,
              duration: const Duration(milliseconds: 500)),
          const SizedBox(
            height: 20,
          ),
          SizedBox(
            width: double.infinity,
            height: 150,
            child: PageView(
              controller: _controller,
              children: [
                for (int i = 0; i < 6; i++)
                  OnboardingPageItems(
                    index: i,
                  )
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              for (int i = 0; i < 6; i++)
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 2.5),
                  width: 10,
                  height: 10,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: _currentPage == i
                          ? styles.primaryColor
                          : Colors.grey),
                )
            ],
          ),
          const SizedBox(
            height: 230,
          ),
          Material(
            child: Hero(
              tag: "Hero container",
              child: GestureDetector(
                onTap: () {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (ctx) => const HomeScreen(),
                      ));
                },
                child: const LogSigButton(
                  title: "Suhbatni boshlash",
                ),
              ),
            ),
          )
        ],
      )),
    );
  }
}
