import 'package:gap/gap.dart';
import 'package:gestionnaire_interventions/Components/ButtonTemplates/SwitcherLikeField.dart';
import 'package:gestionnaire_interventions/Components/FondamentalAppCompo/CloudBack.dart';
import 'package:gestionnaire_interventions/Components/ViewTemplates/TitleText.dart';
import 'package:gestionnaire_interventions/oldComponent/oldTool.dart';
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
    Navigator.push(
        context, MaterialPageRoute(
            builder: (context) => Part3C()
        )
    );
  }

  Column Body() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const TitleText(title: "Observations de base :"),
        const Gap(5),
        CloudBack(
          child: Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              miniTextFieldLikeBig(etat, "État de la machine(de 1 à 10)", context),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: SizedBox(
                  height: 50,
                  child: SwitcherLikeField(
                    title: "Passage du testeur de fuite",
                    statut: testFuite[0],
                    onChanged: ((p0) {
                      setState(() {
                        testFuite[0] = p0;
                      });
                    })
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: textArea(observD, "Observations diverses :", context),
              ),
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
