import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gestionnaire_interventions/component/Tool.dart';
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
        mainIcon: CupertinoIcons.sun_haze);
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
    Navigator.push(context, MaterialPageRoute(builder: (context) => Part4P()));
  }

  Column Body() {
    return Column(
      children: [
        title("Points de contrôle :"),
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
                    12,
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
