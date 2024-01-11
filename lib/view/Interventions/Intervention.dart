import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gestionnaire_interventions/component/Struct.dart';
import 'package:gestionnaire_interventions/component/connect.dart';
import 'package:gestionnaire_interventions/component/tool.dart';
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
        children: [
          TopOfView(
            title: "Nos interventions",
            height: 60,
            width: MediaQuery.sizeOf(context).width - 20,
            lead: Icon(
              CupertinoIcons.wrench_fill,
              size: 40,
              color: textColor(),
            ),
          ),
          const SizedBox(
            height: 80,
          ),
          title("Toutes vos interventions :"),
          Body(Column(
            children: List.generate(
                allInterClientId.length,
                (index) => Column(
                      children: [
                        InterButton(
                          index,
                          func1,
                          "${1 + index} : ${getNameFromInter(allInterClientId[index])}",
                        ),
                        const SizedBox(
                          height: 20,
                        )
                      ],
                    )),
          )),
          const SizedBox(
            height: 120,
          ),
        ],
      ),
    );
  }

  Container Body(Widget content) {
    return Container(
      width: MediaQuery.sizeOf(context).width - 20,
      decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.85),
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(blurRadius: 7, color: Colors.grey.withOpacity(0.7))
          ]),
      child: Column(
        children: [
          const SizedBox(
            height: 20,
          ),
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
            builder: (context) =>
                InterType(InterClimC: InterClimC, InterPompeC: InterPompeC)));
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
