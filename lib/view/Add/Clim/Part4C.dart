import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gestionnaire_interventions/component/Tool.dart';
import 'package:gestionnaire_interventions/view/Add/AddVar.dart';
import 'package:gestionnaire_interventions/view/Add/Clim/Part5C.dart';

class Part4C extends StatefulWidget {
  const Part4C({super.key});

  @override
  State<Part4C> createState() => _Part4CState();
}

class _Part4CState extends State<Part4C> {
  TextEditingController typeExt = TextEditingController();
  List<List<bool>> content = [
    [false],
    [false],
    [false],
    [false],
    [false],
    [false],
  ];

  List<String> name = [
    "Dépose du capeau :",
    "Aspiration et brossage :",
    "Nettoyage et rinçage :",
    "Vérif raccords cuivres :",
    "Vérification support :",
    "Vérification des ventilos :"
  ];
  @override
  Widget build(BuildContext context) {
    return AddTemplate(
      title: "Climatisation",
      Body: Body(),
      func: Func4C,
    );
  }

  void Func4C() {
    climData["typeExt"] = typeExt.text;
    climData["capeau"] = content[0][0];
    climData["aspiBros"] = content[1][0];
    climData["cleanRin"] = content[2][0];
    climData["verifCuivre"] = content[3][0];
    climData["verifSupp"] = content[4][0];
    climData["verifVentil"] = content[5][0];

    Navigator.push(context, MaterialPageRoute(builder: (context) => Part5C()));
  }

  Column Body() {
    return Column(
      children: [
        title("Infos groupe exterieur :"),
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
              Pointer(" Type groupe extérieur "),
              const SizedBox(
                height: 20,
              ),
              bigTextField(typeExt, "Mono | Bi-split | Tri | Quadro"),
              const SizedBox(
                height: 20,
              ),
              Column(
                children: List.generate(
                    6,
                    (index) => Column(
                          children: [
                            BoolField(
                                controller: content[index],
                                hintText: name[index]),
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
