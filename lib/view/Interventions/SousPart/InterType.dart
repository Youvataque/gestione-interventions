import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gestionnaire_interventions/Components/ButtonTemplates/MainButton.dart';
import 'package:gestionnaire_interventions/oldComponent/Struct.dart';
import 'package:gestionnaire_interventions/oldComponent/oldTool.dart';
import 'package:gestionnaire_interventions/view/Interventions/SousPart/InterDate.dart';

class InterType extends StatefulWidget {
  final List<InterventionC> InterClimC;
  final List<InterventionP> InterPompeC;

  const InterType({super.key, required this.InterClimC, required this.InterPompeC});

  @override
  State<InterType> createState() => _InterTypeState();
}

class _InterTypeState extends State<InterType> {
  List<String> allInterDate = [];
  int select = 0;
  List<String> name = ["Climatisation", "Pompe à chaleur"];
  @override
  Widget build(BuildContext context) {
    return InterTemplate(
      title: "Nos interventions",
      sousTitle: "Selectionnez un type :",
      body: Column(
            children: List.generate(
                2,
                (index) => Column(
                      children: [
                        MainButton(
                          title: "${1 + index} : ${name[index]}",
                          func: () {
                            func2(index);
                          },
                        ),
                        const SizedBox(
                          height: 20,
                        )
                    ],
                )
            ),
        )
    );
  }

  void func2(int index) {
    allInterDate = [];
    if (index == 0) {
      InterClimDate();
      select = 0;
    } else {
      InterPompeDate();
      select = 1;
    }
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => InterDate(
                  allInterDate: allInterDate,
                  InterClimC: widget.InterClimC,
                  InterPompeC: widget.InterPompeC,
                  select: select,
                )));
  }

  // remplissage tableau des dates

  void InterClimDate() {
    for (int x = 0; x < widget.InterClimC.length; x++) {
      if (!allInterDate.contains(widget.InterClimC[x].date)) {
        allInterDate.add(widget.InterClimC[x].date);
      }
    }
  }

  void InterPompeDate() {
    for (int x = 0; x < widget.InterPompeC.length; x++) {
      if (!allInterDate.contains(widget.InterPompeC[x].date)) {
        allInterDate.add(widget.InterPompeC[x].date);
      }
    }
  }

}
