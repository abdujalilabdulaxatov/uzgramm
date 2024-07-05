import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeDrawer extends StatefulWidget {
  const HomeDrawer({super.key});

  @override
  State<HomeDrawer> createState() => _HomeDrawerState();
}

class _HomeDrawerState extends State<HomeDrawer> {
  bool darkMode = false;

  void toggleTheme() async {
    final themeMode = await AdaptiveTheme.getThemeMode();
    themeMode == AdaptiveThemeMode.light
        ? AdaptiveTheme.of(context).setDark()
        : AdaptiveTheme.of(context).setLight();
    themeMode == AdaptiveThemeMode.dark ? darkMode = true : darkMode = false;
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: 340,
      child: Column(
        children: [
          SizedBox(
              height: 220,
              width: double.infinity,
              child: AppBar(
                actions: [
                  Container(
                    margin: const EdgeInsets.only(right: 22),
                    child: IconButton(
                      onPressed: () async {
                        toggleTheme();
                      },
                      icon: Icon(
                        darkMode ? Icons.dark_mode_sharp : Icons.wb_sunny,
                        size: 30,
                        color: Colors.white,
                      ),
                    ),
                  )
                ],
                leading: const CircleAvatar(
                  radius: 30,
                ),
                leadingWidth: 85,
                bottom: PreferredSize(
                    preferredSize: Size.fromHeight(30),
                    child: ListTile(
                      title: const Text(
                        "Abdujalil",
                        style: TextStyle(
                            fontSize: 18,
                            color: Colors.white,
                            fontWeight: FontWeight.w600),
                      ),
                      subtitle: const Text(
                        "+998 901341913",
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            color: Color.fromARGB(190, 255, 255, 255)),
                      ),
                      trailing: IconButton(
                          color: Colors.white,
                          onPressed: () {},
                          icon: const Icon(
                            CupertinoIcons.chevron_down,
                          )),
                    )),
              )),
          Expanded(
              child: ListView.builder(
                  itemCount: 10,
                  itemBuilder: (ctx, index) {
                    return ListTile(
                      title: Text("aaa"),
                    );
                  }))
        ],
      ),
    );
  }
}
