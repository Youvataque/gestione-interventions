import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:gestionnaire_interventions/Components/ButtonTemplates/SwitcherLikeField.dart';
import 'package:gestionnaire_interventions/Components/FondamentalAppCompo/CloudBack.dart';
import 'package:gestionnaire_interventions/Components/ViewTemplates/TitleText.dart';
import 'package:gestionnaire_interventions/oldComponent/oldTool.dart';
import 'package:gestionnaire_interventions/view/Add/AddVar.dart';
import 'package:gestionnaire_interventions/view/Add/Pompe/Part3P.dart';

class Part2P extends StatefulWidget {
  const Part2P({super.key});

  @override
  State<Part2P> createState() => _Part2PState();
}

class _Part2PState extends State<Part2P> {
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
    [false],
    [false],
  ];
  List<String> name = [
    "Contrôle des protections électriques :",
    "Resserage des connexions électriques :",
    "Mesure et contrôle de la tension :",
    "Mesure et contrôle des intensités :",
    "Contrôle du paramétrage de la régulation :",
    "Contrôle enclenchement de l'appoint thermique :",
    "Contrôle de l'étanchéité du circuit frigorifique :", //
    "Contrôle de l'état des calorifuges :",
    "Nettoyage de l'échangeur d'air :",
    "Contrôle fonctionnement des ventilos :",
    "Contrôle de l'évacuation des condensats :",
    "Mesure température fonctionnement (air / eau) :",
    "Contrôle du vase d'expansion :",
    "Contrôle visuel de l'eau de chauffage :"
  ];

  @override
  Widget build(BuildContext context) {
    return AddTemplate(
      title: "Pompe à chaleur",
      Body: Body(),
      func: Part2P,
      mainIcon: CupertinoIcons.sun_haze
    );
  }

  void Part2P() {
    pompeData["contrProtElec"] = content[0][0];
    pompeData["resConElec"] = content[1][0];
    pompeData["mesContrTen"] = content[2][0];
    pompeData["mesContrInt"] = content[3][0];
    pompeData["contrParReg"] = content[4][0];
    pompeData["contrEnclTher"] = content[5][0];
    pompeData["contrEtanFri"] = content[6][0];
    pompeData["contrEtatCal"] = content[7][0];
    pompeData["netEchAir"] = content[8][0];
    pompeData["contrFoncVentil"] = content[9][0];
    pompeData["contrEvacCon"] = content[10][0];
    pompeData["mesTempFonc"] = content[11][0];
    pompeData["contrVaseExp"] = content[12][0];
    pompeData["contrVisuEau"] = content[13][0];
    Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => Part3P())
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
                  14,
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
