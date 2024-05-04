import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:gestionnaire_interventions/Components/ButtonTemplates/MainButton.dart';
import 'package:gestionnaire_interventions/Components/FondamentalAppCompo/CloudBack.dart';
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
          const TitleText(title: "Toutes vos interventions :"),
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

  void func1(int index) {
    InterPompeClimType(allInterClientId[index]);
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => InterType(InterClimC: InterClimC, InterPompeC: InterPompeC)
      )
    );
  }
  // Remplissage des tableaux par type

  void InterPompeClimType(String clientID) {
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
