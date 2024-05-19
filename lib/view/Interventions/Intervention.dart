import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:gestionnaire_interventions/Components/ButtonTemplates/MainButton.dart';
import 'package:gestionnaire_interventions/Components/FondamentalAppCompo/CloudBack.dart';
import 'package:gestionnaire_interventions/Components/ViewTemplates/InterSearchDelegate.dart';
import 'package:gestionnaire_interventions/Components/ViewTemplates/LitleComponent.dart';
import 'package:gestionnaire_interventions/Components/ViewTemplates/TitleText.dart';
import 'package:gestionnaire_interventions/oldComponent/Struct.dart';
import 'package:gestionnaire_interventions/oldComponent/connect.dart';
import 'package:gestionnaire_interventions/oldComponent/oldTool.dart';
import 'package:gestionnaire_interventions/view/Interventions/SousPart/InterType.dart';

class Intervention extends StatefulWidget {
  const Intervention({super.key});

  @override
  State<Intervention> createState() => _InterventionState();
}

class _InterventionState extends State<Intervention> {
  List<InterventionC> InterClimC = [];
  List<InterventionP> InterPompeC = [];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const TitleText(title: "Toutes vos interventions :"),
              Padding(
                padding: const EdgeInsets.only(right: 15),
                child: rightButton(),
              )
            ],
          ),
          const Gap(5),
          body(
            Column(
              children: List.generate(
                allInterClientId.length,
                (index) => Column(
                  children: [
                    MainButton(
                      title: "${1 + index} : ${getNameFromInter(allInterClientId[index])}",
                      func: () {
                        func1(index);
                      },
                    ),
                    const SizedBox(
                      height: 20,
                    )
                  ],
                )
              ),
            )
          ),
          const SizedBox(
            height: 30,
          ),
        ],
      ),
    );
  }

///////////////////////////////////////////////////////////////
/// corp du code
  Widget body(Widget content) {
    return CloudBack(
      child: Column(
        children: [
          const Gap(20),
          content,
        ],
      ),
    );
  }

///////////////////////////////////////////////////////////////
/// bouton de recherche
  Widget rightButton() {
    return Container(
      width: 40,
      height: 40,
      decoration: BoxDecoration(
        color: Theme.of(context).scaffoldBackgroundColor,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          myShadow(context)
        ]
      ),
      padding: EdgeInsets.zero,
      child: InkWell(
        child: Icon(
          CupertinoIcons.search,
          color: Theme.of(context).textTheme.bodyLarge!.color,
        ),
        onTap: () async {
          await showSearch(
            context: context,
            delegate: InterSearchDelegate(
              searchContent: allInterClientId,
              context: context,
              func1: (p0) => func1(p0),
            ),
          );
        },
      )
    );
  }

///////////////////////////////////////////////////////////////
/// Renvoie vers la page suivante
  void func1(int index) {
    interPompeClimType(allInterClientId[index]);
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => InterType(InterClimC: InterClimC, InterPompeC: InterPompeC)
      )
    );
  }

///////////////////////////////////////////////////////////////
/// remplissage des tableaux par type d'intervention
  void interPompeClimType(String clientID) {
    InterClimC = [];
    InterPompeC = [];
    for (int x = 0; x < allInterC.length; x++) {
      if (allInterC[x].clientId == clientID) {
        InterClimC.add(allInterC[x]);
      }
    }
    for (int x = 0; x < allInterP.length; x++) {
      if (allInterP[x].clientId == clientID) {
        InterPompeC.add(allInterP[x]);
      }
    }
  }
}
