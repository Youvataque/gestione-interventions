import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

//Pages
import 'package:gap/gap.dart';
import 'package:gestionnaire_interventions/Components/FondamentalAppCompo/TopOfView.dart';
import 'package:gestionnaire_interventions/Components/ViewTemplates/BackTemplate.dart';
import 'package:gestionnaire_interventions/view/Accueil.dart';
import 'package:gestionnaire_interventions/view/Add/Add.dart';
import 'package:gestionnaire_interventions/view/AddClient/AddClient.dart';
import 'package:gestionnaire_interventions/view/Interventions/Intervention.dart';
import 'package:gestionnaire_interventions/view/Profil.dart';

///////////////////////////////////////////////////////////////
/// Appbar de l'application
class MyTabbar extends StatefulWidget {
  MyTabbar({
    super.key,
  });

  @override
  State<MyTabbar> createState() => _MyTabbarState();
}

///////////////////////////////////////////////////////////////
/// Code principale
class _MyTabbarState extends State<MyTabbar> {
  int selectedIndex = 2;
  List<Widget> pagesBody = [];
  List<String> pagesTitle = [
    "Nos interventions",
    "Interventions",
    "NewBat",
    "Vos clients",
    "Profil et Entreprise"
  ];
  @override
  Widget build(BuildContext context) {
    pagesBody = [
      pageHeader(const Intervention(), iconFormat(false, CupertinoIcons.wrench_fill)),
      pageHeader(const Add(), iconFormat(false, CupertinoIcons.hammer_fill)),
      pageHeader(const Accueil(), iconFormat(true, null)),
      pageHeader(const AddClient(), iconFormat(false, CupertinoIcons.person_2_square_stack_fill)),
      pageHeader(const Profil(), iconFormat(false, CupertinoIcons.person_circle_fill)),
    ]; // widget des pages
    return BackTemplate(
      content: IndexedStack(
        index: selectedIndex,
        children: pagesBody,
      ),
      bottomNav: ClipRRect(
        child: borderedTabbar(
          BottomNavigationBar(
            elevation: 0,
            type: BottomNavigationBarType.shifting,
            backgroundColor: Theme.of(context).primaryColor,
            items: <BottomNavigationBarItem> [
              item('Interventions', CupertinoIcons.list_bullet, CupertinoIcons.list_bullet_indent),
              item('Ajouter', CupertinoIcons.plus_square_fill, CupertinoIcons.plus_square),
              item('Accueil', CupertinoIcons.house_fill, CupertinoIcons.house),
              item('Clients', CupertinoIcons.plus_circle_fill, CupertinoIcons.plus_circle),
              item('Profil', CupertinoIcons.person_circle_fill, CupertinoIcons.person_circle),
            ],
            fixedColor: Theme.of(context).scaffoldBackgroundColor,
            unselectedItemColor: Theme.of(context).scaffoldBackgroundColor,
            currentIndex: selectedIndex,
            onTap: onTapped,
          ),
        )
      ),
    );
  }

///////////////////////////////////////////////////////////////
/// Donne l'effet blur à la tabbar
  Container borderedTabbar(Widget content) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.transparent,
        border: Border(
          top: BorderSide( 
            color: Theme.of(context).dividerColor, 
            width: 1.0, 
          ),
        ),
      ),
      child: content,
    );
  }

///////////////////////////////////////////////////////////////
/// Dessine un élément de tabbar
  BottomNavigationBarItem item(String title, IconData fill, IconData unFill) {
    return BottomNavigationBarItem(
      backgroundColor: Theme.of(context).primaryColor,
      icon: Icon(unFill, color: Theme.of(context).scaffoldBackgroundColor),
      activeIcon: Icon(fill, color: Theme.of(context).scaffoldBackgroundColor),
      label: title
    );
  }

///////////////////////////////////////////////////////////////
/// format du haut de page
  SingleChildScrollView pageHeader(Widget myPage, Widget leading) {
    return SingleChildScrollView(
      child: Column(
      children: [
        TopOfView(
          title: pagesTitle[selectedIndex],
          height: 55,
          width: MediaQuery.sizeOf(context).width - 30,
          lead: leading
        ),
        const Gap(60),
        myPage
      ],
    ),
    );
  }

///////////////////////////////////////////////////////////////
/// format de l'icon
  Widget iconFormat(bool img, IconData? icon) {
    if (img) {
      return SizedBox(
        height: 45,
        width: 45,
        child: Image.asset(
          "src/Logo_SEB.png",
        ),
      );
    } else {
      return Icon(
        icon!,
        size: 38,
        color: Theme.of(context).textTheme.labelLarge!.color,
      );
    }
  }

///////////////////////////////////////////////////////////////
/// change l'index en fonction de celui tapé
  void onTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
  }
}
