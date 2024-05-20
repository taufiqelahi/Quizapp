import 'package:flutter/material.dart';

import 'package:quiz/views/add_questions.dart';
import 'package:quiz/views/choicePage.dart';
import 'package:quiz/views/dashboard/leaderboard_screen.dart';
import 'package:quiz/views/dashboard/profile_screen.dart';
import 'package:quiz/views/home_screen.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(

        body: Center(
          child: IndexedStack(
            index: currentIndex,
            children:  [
              HomePage(),
              LeaderboardPage(),
              ProfileScreen()
            ],
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Color(0xFF5170FD),
          unselectedItemColor: Colors.white,
          selectedItemColor: Colors.black,
          type: BottomNavigationBarType.fixed,
          currentIndex: currentIndex,
          selectedFontSize: 10,
          unselectedFontSize: 10,
          onTap: (index) {
            setState(() {
              currentIndex = index;
            });
          },
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'home',
            ),

            BottomNavigationBarItem(
                icon: Icon(Icons.leaderboard,) ,label: 'leaderboard'),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'profile',
            ),

          ],
        ));
  }
}
