import 'package:flutter/cupertino.dart';
import 'package:gestionnaire_interventions/component/Tool.dart';
import 'package:flutter/material.dart';
import 'package:gestionnaire_interventions/view/Add/AddVar.dart';
import 'package:gestionnaire_interventions/view/Add/Clim/Part3C.dart';

class Part2C extends StatefulWidget {
  const Part2C({super.key});

  @override
  State<Part2C> createState() => _Part2CState();
}

class _Part2CState extends State<Part2C> {
  TextEditingController etat = TextEditingController();
  TextEditingController observD = TextEditingController();
  List<bool> testFuite = [false];
  @override
  Widget build(BuildContext context) {
    return AddTemplate(
      title: "Climatisation",
      Body: Body(),
      func: Part2CFunc,
    );
  }

  void Part2CFunc() {
    climData["etat"] = etat.text;
    climData["observD"] = observD.text;
    climData["testFuite"] = testFuite[0];
    Navigator.push(context, MaterialPageRoute(builder: (context) => Part3C()));
  }

  Column Body() {
    return Column(
      children: [
        title("Observations de base :"),
        Container(
          decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.85),
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(color: Colors.grey.withOpacity(0.7), blurRadius: 7)
              ]),
          width: MediaQuery.sizeOf(context).width - 20,
          child: Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              miniTextFieldLikeBig(etat, "État de la machine(de 1 à 10)"),
              const SizedBox(
                height: 20,
              ),
              BoolField(
                  controller: testFuite,
                  hintText: "Passage du testeur de fuite"),
              const SizedBox(
                height: 20,
              ),
              TextArea(observD, "Observations divers :"),
              const SizedBox(
                height: 20,
              )
            ],
          ),
        ),
        const SizedBox(
          height: 20,
        )
      ],
    );
  }
}
