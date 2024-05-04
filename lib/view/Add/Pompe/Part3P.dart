import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:gestionnaire_interventions/Components/ButtonTemplates/SwitcherLikeField.dart';
import 'package:gestionnaire_interventions/Components/FondamentalAppCompo/CloudBack.dart';
import 'package:gestionnaire_interventions/Components/ViewTemplates/TitleText.dart';
import 'package:gestionnaire_interventions/oldComponent/oldTool.dart';
import 'package:gestionnaire_interventions/view/Add/AddVar.dart';
import 'package:gestionnaire_interventions/view/Add/Pompe/Part4P.dart';

class Part3P extends StatefulWidget {
  const Part3P({super.key});

  @override
  State<Part3P> createState() => _Part3PState();
}

class _Part3PState extends State<Part3P> {
  List<List<bool>> content = [
    [false],
    [false],
    [false],
    [false],
    [false],
    [false],
    [false],
    [false],
    [false],
    [false],
    [false],
    [false],
  ];
  List<String> name = [
    "Contrôle fonctionnement du circulateur :",
    "Contrôle étanchéité souspape / organe hydrau :",
    "Contrôle anode de protection ballon stock :",
    "Contrôle du fluide caloporteur :",
    "Contrôle niveau de protection antigel :",
    "Contrôle visuel et auditif de l'ensemble :",
    "Essaie fonctionnement de l'ensemble :", //
    "Explications et conseils du client :",
    "Purge d'air du circuit hydraulique :",
    "Nettoyage et entretien des filtres :",
    "Contrôle de la pression des vases d'expansion :",
    "Regonflage des vases si nécéssaire :",
  ];

  @override
  Widget build(BuildContext context) {
    return AddTemplate(
      title: "Pompe à chaleur",
      Body: Body(),
      func: Part3P,
      mainIcon: CupertinoIcons.sun_haze
    );
  }

  void Part3P() {
    pompeData["contrFoncCirc"] = content[0][0];
    pompeData["contrEtanSouHydrau"] = content[1][0];
    pompeData["contrAnodeBall"] = content[2][0];
    pompeData["contrFluideCal"] = content[3][0];
    pompeData["contrProtAnti"] = content[4][0];
    pompeData["contrVisuEns"] = content[5][0];
    pompeData["essaiFonc"] = content[6][0];
    pompeData["aideClient"] = content[7][0];
    pompeData["purge"] = content[8][0];
    pompeData["nettEntrFiltre"] = content[9][0];
    pompeData["contrPressVase"] = content[10][0];
    pompeData["regonVases"] = content[11][0];
    Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => Part4P())
    );
  }

  Column Body() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const TitleText(title: "Points de contrôle :"),
        const Gap(5),
        CloudBack(
          child: Column(
            children: [
              const Gap(20),
              Column(
                children: List.generate(
                    12,
                    (index) => Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15),
                          child: SwitcherLikeField(
                            statut: content[index][0],
                            title: name[index],
                            onChanged: (p0) {
                              setState(() {
                                content[index][0] = p0;
                              });
                            },
                          ),
                        ),
                        const Gap(20),
                      ],
                    )
                  ),
              ),
            ],
          ),
        ),
        const Gap(20),
      ],
    );
  }
}
