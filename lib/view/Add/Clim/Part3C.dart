import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gestionnaire_interventions/component/Tool.dart';
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
      children: [
        title("Infos unité interieur :"),
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
              Pointer(" Température à l'arrivé "),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  litleTextField(cold, "Mode froid", true),
                  const SizedBox(
                    width: 20,
                  ),
                  litleTextField(hot, "Mode chaud", true)
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Column(
                children: List.generate(
                    7,
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
              TextArea(remarque1, "Des remarques ?"),
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
