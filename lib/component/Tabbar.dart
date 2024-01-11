// composants

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gestionnaire_interventions/component/tool.dart';

// views
import 'package:gestionnaire_interventions/view/Accueil.dart';
import 'package:gestionnaire_interventions/view/Add/Add.dart';
import 'package:gestionnaire_interventions/view/AddClient/AddClient.dart';
import 'package:gestionnaire_interventions/view/Interventions/Intervention.dart';
import 'package:gestionnaire_interventions/view/Profil.dart';

class Tabbar extends StatefulWidget {
  const Tabbar({super.key});

  @override
  State<Tabbar> createState() => _TabbarState();
}

class _TabbarState extends State<Tabbar> {
  int selectedIndex = 2;
  List<Widget> bodys = [
    Intervention(),
    Add(),
    Accueil(),
    AddClient(),
    Profil()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBody: true,
        backgroundColor: Colors.transparent,
        body: IndexedStack(
          index: selectedIndex,
          children: bodys,
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: [
            BottomNavigationBarItem(
                backgroundColor: mainColor().withOpacity(0.9),
                icon: const Icon(CupertinoIcons.list_bullet_indent,
                    color: Colors.white),
                activeIcon:
                    const Icon(CupertinoIcons.list_bullet, color: Colors.white),
                label: 'Interventions'),
            BottomNavigationBarItem(
                backgroundColor: mainColor().withOpacity(0.9),
                icon:
                    const Icon(CupertinoIcons.plus_square, color: Colors.white),
                activeIcon: const Icon(CupertinoIcons.plus_square_fill,
                    color: Colors.white),
                label: 'Ajouter'),
            BottomNavigationBarItem(
                backgroundColor: mainColor().withOpacity(0.9),
                icon: const Icon(CupertinoIcons.house, color: Colors.white),
                activeIcon:
                    const Icon(CupertinoIcons.house_fill, color: Colors.white),
                label: 'Accueil'),
            BottomNavigationBarItem(
                backgroundColor: mainColor().withOpacity(0.9),
                icon:
                    const Icon(CupertinoIcons.plus_circle, color: Colors.white),
                activeIcon: const Icon(CupertinoIcons.plus_circle_fill,
                    color: Colors.white),
                label: 'Clients'),
            BottomNavigationBarItem(
                backgroundColor: mainColor().withOpacity(0.9),
                icon: const Icon(CupertinoIcons.person_circle,
                    color: Colors.white),
                activeIcon: const Icon(CupertinoIcons.person_circle_fill,
                    color: Colors.white),
                label: 'Profil'),
          ],
          currentIndex: selectedIndex,
          onTap: onTapped,
        ));
  }

  void onTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
  }
}
