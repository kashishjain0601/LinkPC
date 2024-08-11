import 'package:flutter/material.dart';
import 'package:mobile/utils/google_auth.dart';
import 'package:provider/provider.dart';

import 'package:mobile/ui/power_widget.dart';
import 'package:mobile/ui/profile_widget.dart';
import 'package:mobile/ui/tasks_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Widget> widgetList = [
    const ProfileWidget(),
    const TasksWidget(),
    const PowerWidget()
  ];

  int _page = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff24293e),
      appBar: AppBar(
        foregroundColor: const Color(0xfff4f5fc),
        backgroundColor: const Color(0xff24293e),
        title: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/images/logo.png',
                height: 35,
              ),
              const Text(
                'LinkPC',
              ),
            ],
          ),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: SingleChildScrollView(child: widgetList[_page]),
      ),
      bottomNavigationBar: BottomAppBar(
        height: 65,
        color: const Color(0xff8ebbff),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            IconButton(
                onPressed: () {
                  setState(() {
                    _page = 0;
                  });
                },
                icon: const Icon(
                  Icons.account_circle_outlined,
                  size: 40,
                  color: Color(0xff24293e),
                )),
            IconButton(
                onPressed: () {
                  setState(() {
                    _page = 1;
                  });
                },
                icon: const Icon(
                  Icons.list_alt_outlined,
                  size: 40,
                  color: Color(0xff24293e),
                )),
            IconButton(
                onPressed: () {
                  setState(() {
                    _page = 2;
                  });
                },
                icon: const Icon(
                  Icons.settings_power_outlined,
                  size: 40,
                  color: Color(0xff24293e),
                )),
            IconButton(
                onPressed: () async {
                  final provider =
                      Provider.of<GoogleSignInProvider>(context, listen: false);
                  await provider.googleLogout();

                  Navigator.pushReplacementNamed(context, '/');
                },
                icon: const Icon(
                  Icons.logout_outlined,
                  size: 40,
                )),
          ],
        ),
      ),
    );
  }
}
