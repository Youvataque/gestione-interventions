import 'package:flutter/material.dart';
import 'package:gestionnaire_interventions/component/Struct.dart';
import 'package:gestionnaire_interventions/component/tool.dart';
import 'package:gestionnaire_interventions/view/Interventions/SousPart/InterPlace.dart';

class InterDate extends StatefulWidget {
  final List<String> allInterDate;
  final List<InterventionC> InterClimC;
  final List<InterventionP> InterPompeC;
  final int select;
  const InterDate(
      {super.key,
      required this.allInterDate,
      required this.InterClimC,
      required this.InterPompeC,
      required this.select});

  @override
  State<InterDate> createState() => _InterDateState();
}

class _InterDateState extends State<InterDate> {
  List<String> allInterPiece = [];
  List<InterventionC> InterDateClimC = [];
  List<InterventionP> InterDatePompeC = [];
  @override
  Widget build(BuildContext context) {
    return InterTemplate(
        title: "Nos interventions",
        sousTitle: "Selectionnez une date :",
        Body: Column(
          children: List.generate(
              widget.allInterDate.length,
              (index) => Column(
                    children: [
                      InterButton(
                        index,
                        func3,
                        "${1 + index} : ${widget.allInterDate[index]}",
                      ),
                      const SizedBox(
                        height: 20,
                      )
                    ],
                  )),
        ));
  }

  void func3(int index) {
    if (widget.select == 0) {
      InterClimDate(widget.allInterDate[index]);
    } else {
      InterPompeDate(widget.allInterDate[index]);
    }
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => InterPlace(
                  allInterPiece: allInterPiece,
                  InterDateClimC: InterDateClimC,
                  InterDatePompeC: InterDatePompeC,
                )));
  }

  // remplissage tableau des dates
  void InterClimDate(String date) {
    InterDateClimC = [];
    InterDatePompeC = [];
    allInterPiece = [];
    for (int x = 0; x < widget.InterClimC.length; x++) {
      if (widget.InterClimC[x].date == date) {
        InterDateClimC.add(widget.InterClimC[x]);
        allInterPiece.add(widget.InterClimC[x].place);
        print(allInterPiece);
      }
    }
  }

  void InterPompeDate(String date) {
    InterDateClimC = [];
    InterDatePompeC = [];
    allInterPiece = [];
    for (int x = 0; x < widget.InterPompeC.length; x++) {
      if (widget.InterPompeC[x].date == date) {
        InterDatePompeC.add(widget.InterPompeC[x]);
        allInterPiece.add(widget.InterPompeC[x].place);
      }
    }
  }
}
