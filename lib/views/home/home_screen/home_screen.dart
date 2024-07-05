import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:uzgram/views/home/home_screen/searching/searching.dart';
import 'package:uzgram/views/home/home_screen/widgets/all_chats.dart';
import 'package:uzgram/views/home/home_screen/widgets/home_drawer.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  TabController? _tabController;
  int index = 0;
  Color? selectColor;

  List<String> tabbar_list = [
    "Barchasi",
    "Shaxsiy",
    "Guruhlar",
    "Kanallar",
    "Personal"
  ];

  @override
  void initState() {
    super.initState();
    getThemeMode();

    _tabController = TabController(length: 5, vsync: this);
    _tabController?.addListener(() {
      if (_tabController!.indexIsChanging) {
        index = _tabController!.index;
      }
    });
  }

  Future<void> getThemeMode() async {
    final themeMode = await AdaptiveTheme.getThemeMode();
    themeMode == await AdaptiveThemeMode.light
        ? selectColor = Colors.white
        : selectColor = Colors.blue;
    setState(() {});
  }

  @override
  void dispose() {
    _tabController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    print(selectColor);
    print(_tabController!.index);
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
        onPressed: () {},
        child: const Icon(Icons.edit),
      ),
      drawer: const HomeDrawer(),
      appBar: AppBar(
        centerTitle: false,
        title: const Text("Uzgram"),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (ctx) => const Searching()));
              },
              icon: const Icon(CupertinoIcons.search))
        ],
        bottom: TabBar(
            // dividerColor: Colors.blue,
            // overlayColor: Colors,
            unselectedLabelColor: Color.fromARGB(178, 255, 255, 255),
            labelColor: selectColor,
            indicatorColor: selectColor,
            controller: _tabController,
            isScrollable: true,
            tabs: [
              for (int i = 0; i < tabbar_list.length; i++)
                Consumer(builder: (child, value, context) {
                  return Text(
                    tabbar_list[i],
                    style: const TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 16,
                    ),
                  );
                })
            ]),
      ),
      body: TabBarView(controller: _tabController, children: const [
        AllChats(),
        Center(child: Text('Star Page')),
        Center(child: Text('Profile Page')),
        Center(child: Text('Profile Page')),
        Center(child: Text('Profile Page')),
      ]),
    );
  }
}
