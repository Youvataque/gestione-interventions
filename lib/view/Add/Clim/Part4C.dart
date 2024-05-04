import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:gestionnaire_interventions/Components/ButtonTemplates/MyTextField.dart';
import 'package:gestionnaire_interventions/Components/ButtonTemplates/SwitcherLikeField.dart';
import 'package:gestionnaire_interventions/Components/FondamentalAppCompo/CloudBack.dart';
import 'package:gestionnaire_interventions/Components/ViewTemplates/TitleText.dart';
import 'package:gestionnaire_interventions/oldComponent/oldTool.dart';
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
    "Dépose du capot :",
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

    Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => Part5C())
    );
  }

  Column Body() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const TitleText(title: "Infos groupe exterieur :"),
        const Gap(5),
        CloudBack(
          child: Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 15),
                child: Pointer(" Type groupe extérieur ", context),
              ),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                height: 50,
                child: MyTextField(controller: typeExt, hintText: "Mono | Bi-split | Tri | Quadro"),
              ),
              const SizedBox(
                height: 20,
              ),
              Column(
                children: List.generate(
                    6,
                    (index) => Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 15),
                              child: SizedBox(
                                height: 50,
                                child: SwitcherLikeField(
                                  title: name[index],
                                  statut: content[index][0],
                                  onChanged: ((p0) {
                                    setState(() {
                                      content[index][0] = p0;
                                    });
                                  })
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            )
                          ]
                    )
                  ),
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
