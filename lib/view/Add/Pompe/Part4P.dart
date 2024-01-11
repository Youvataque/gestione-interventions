import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gestionnaire_interventions/component/connect.dart';
import 'package:gestionnaire_interventions/component/tool.dart';
import 'package:gestionnaire_interventions/main.dart';
import 'package:gestionnaire_interventions/view/Add/AddVar.dart';

class Part4P extends StatefulWidget {
  const Part4P({super.key});

  @override
  State<Part4P> createState() => _Part4PState();
}

class _Part4PState extends State<Part4P> {
  List<TextEditingController> content = [
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
  ];

  List<String> name = [
    "Défauts corrigés",
    "Traveaux à prévoir",
    "Recommandations",
    "Gains réalisables"
  ];
  String errorText = "";
  @override
  Widget build(BuildContext context) {
    return AddTemplate(
        title: "Pompe à chaleur",
        Body: Body(),
        func: Part4P,
        errorText: errorText,
        buttonTitle: "Enregistrer",
        mainIcon: CupertinoIcons.sun_haze);
  }

  void Part4P() {
    pompeData["defautsCorr"] = content[0].text;
    pompeData["aPrevoir"] = content[1].text;
    pompeData["recommandation"] = content[2].text;
    pompeData["gains"] = content[3].text;
    pompeData["userId"] = userData[getUserFromInter()].uid;
    pushInter();
    Future.delayed(Duration(seconds: 1), () {
      setState(() {
        errorText = "";
      });
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => MainApp()));
    });
  }

  void pushInter() async {
    DocumentReference docRef = db.collection("Interventions").doc();
    try {
      await docRef.set(pompeData);
      // gestion des récents
      if (lastPompe.lastCount <= 2) {
        lastPompe.lastTab[lastPompe.lastCount] = docRef.id;
        lastPompe.lastCount += 1;
        lastPompe.cardinal += 1;
      } else {
        lastPompe.lastCount = 0;
        lastPompe.lastTab[lastPompe.lastCount] = docRef.id;
        lastPompe.cardinal += 1;
      }
      updateLast("Pompe");
      updateSerialDataPompe(pompeData["serialNumber"], pompeData["date"]);
      setState(() {
        errorText = "Intervention enregistré !";
      });
    } catch (error) {
      setState(() {
        errorText = "Une erreur est survenue !";
      });
    }
  }

  Column Body() {
    return Column(
      children: [
        title("Mise en route :"),
        Container(
          decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.85),
              boxShadow: [
                BoxShadow(color: Colors.grey.withOpacity(0.7), blurRadius: 7)
              ],
              borderRadius: BorderRadius.circular(20)),
          width: MediaQuery.sizeOf(context).width - 20,
          child: Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              Column(
                children: List.generate(
                    4,
                    (index) => Column(
                          children: [
                            TextArea(content[index], name[index]),
                            const SizedBox(
                              height: 20,
                            )
                          ],
                        )),
              ),
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
