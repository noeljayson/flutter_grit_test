import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_grit_test/Bottom_screens/offline_data_screen.dart';
import 'package:flutter_grit_test/Bottom_screens/speech_to_screens.dart';
import 'package:flutter_grit_test/Bottom_screens/text_to_speech_screens.dart';


class MainLandingScreen extends StatefulWidget {

  const MainLandingScreen({Key? key, }) : super(key: key);

  @override
  State<MainLandingScreen> createState() => _MainLandingScreenState();
}

class _MainLandingScreenState extends State<MainLandingScreen> {
  int _selectedIndex = 0;

  final List<Widget> _widgetOptions = <Widget>[
    const Texttospeech(),
    const Speechtotext(),
    const Offlinedata()
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
          child: _widgetOptions.elementAt(_selectedIndex),
        ),
        bottomNavigationBar: BottomNavigationBar(
            backgroundColor: Colors.blue,
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(Icons.notification_important_sharp),
                label: 'TTS',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.text_fields_outlined),
                label: 'STP',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.offline_bolt),
                label: 'Offline',
              ),
            ],
            type: BottomNavigationBarType.fixed,
            currentIndex: _selectedIndex,
            selectedItemColor: Colors.black,
            iconSize: 20,
            onTap: _onItemTapped,
            elevation: 5));
  }


}
