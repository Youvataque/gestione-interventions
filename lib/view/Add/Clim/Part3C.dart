import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:gestionnaire_interventions/Components/ButtonTemplates/StackedField.dart';
import 'package:gestionnaire_interventions/Components/ButtonTemplates/SwitcherLikeField.dart';
import 'package:gestionnaire_interventions/Components/FondamentalAppCompo/CloudBack.dart';
import 'package:gestionnaire_interventions/Components/Structure/DoubleTextfield.dart';
import 'package:gestionnaire_interventions/Components/ViewTemplates/TitleText.dart';
import 'package:gestionnaire_interventions/oldComponent/oldTool.dart';
import 'package:gestionnaire_interventions/view/Add/AddVar.dart';
import 'package:gestionnaire_interventions/view/Add/Clim/Part4C.dart';

class Part3C extends StatefulWidget {
  const Part3C({super.key});

  @override
  State<Part3C> createState() => _Part3CState();
}

class _Part3CState extends State<Part3C> {
  TextEditingController cold = TextEditingController();
  TextEditingController hot = TextEditingController();
  TextEditingController remarque1 = TextEditingController();
  List<List<bool>> content = [
    [false],
    [false],
    [false],
    [false],
    [false],
    [false],
    [false]
  ];
  List<String> name = [
    "Dépose de carénage :",
    "Dépose bac condensa :",
    "Dépose des ventilos :",
    "Nettoyage, dégraissage... :",
    "Remontage de l'ensemble :",
    "Netoyage des filtres :",
    "Test des condensas :"
  ];
  @override
  Widget build(BuildContext context) {
    return AddTemplate(
      title: "Climatisation",
      Body: Body(),
      func: Func3C,
    );
  }

  void Func3C() {
    climData["cold"] = cold.text;
    climData["hot"] = hot.text;
    climData["carenage"] = content[0][0];
    climData["condensa"] = content[1][0];
    climData["ventilo"] = content[2][0];
    climData["clean"] = content[3][0];
    climData["assemble"] = content[4][0];
    climData["cleanFiltre"] = content[5][0];
    climData["testCondensa"] = content[6][0];
    climData["observD2"] = remarque1.text;
    Navigator.push(context, MaterialPageRoute(builder: (context) => Part4C()));
  }

  Column Body() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const TitleText(title: "Infos unité interieur :"),
        const Gap(5),
        CloudBack(
          child: Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Pointer(" Température à l'arrivé ", context),
              ),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                height: 55,
                child: StackedField(
                  data: DoubleTextfield(
                    title1: "Mode froid",
                    title2: "Mode chaud",
                    controller1: cold,
                    controller2: hot
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Column(
                children: List.generate(
                    7,
                    (index) => Column(
                          children: [
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 15),
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
                          ],
                        )),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 15),
                child: textArea(remarque1, "Des remarques ?", context),
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
