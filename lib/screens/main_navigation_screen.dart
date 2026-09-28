import 'package:flutter/material.dart';
import 'package:law_junction/screens/calender/calender_screen.dart';
import 'homes/home_screen.dart';
import 'cases/cases_screen.dart';
import './add_case/add_case_screen';
//import 'calendar/calendar_screen.dart';
import 'profile/profile_screen.dart';
//import './add_case/add_case_screen';

class MainNavigationScreen extends StatefulWidget {
  const MainNavigationScreen({super.key});

  @override
  State<MainNavigationScreen> createState() =>
      _MainNavigationScreenState();
}

class _MainNavigationScreenState
    extends State<MainNavigationScreen> {
  int _currentIndex = 0;

  static const Color primary = Color(0xFF0F4C4C);
  static const Color accent = Color(0xFFD4AF37);

  final List<Widget> _screens = const [
    HomeScreen(),
    CasesScreen(),
    AddCaseScreen(),
    CalendarScreen(),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _currentIndex,
        children: _screens,
      ),

      bottomNavigationBar: NavigationBar(
        selectedIndex: _currentIndex,

        onDestinationSelected: (index) {
          setState(() {
            _currentIndex = index;
          });
        },

        backgroundColor: Colors.white,

        indicatorColor: primary.withValues(alpha: 0.10),

        elevation: 8,

        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.home_outlined),
            selectedIcon: Icon(
              Icons.home_rounded,
              color: primary,
            ),
            label: 'Home',
          ),

          NavigationDestination(
            icon: Icon(Icons.folder_outlined),
            selectedIcon: Icon(
              Icons.folder_rounded,
              color: primary,
            ),
            label: 'Cases',
          ),

          NavigationDestination(
            icon: Icon(
              Icons.add_circle_outline_rounded,
              color: accent,
              size: 30,
            ),
            selectedIcon: Icon(
              Icons.add_circle_rounded,
              color: accent,
              size: 30,
            ),
            label: 'Add',
          ),

          NavigationDestination(
            icon: Icon(Icons.calendar_month_outlined),
            selectedIcon: Icon(
              Icons.calendar_month_rounded,
              color: primary,
            ),
            label: 'Calendar',
          ),

          NavigationDestination(
            icon: Icon(Icons.person_outline_rounded),
            selectedIcon: Icon(
              Icons.person_rounded,
              color: primary,
            ),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}