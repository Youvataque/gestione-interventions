import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:screenshot/screenshot.dart';
import 'package:share_plus/share_plus.dart';
import 'package:gestionnaire_interventions/component/connect.dart';
import 'package:gestionnaire_interventions/component/tool.dart';

class PompeTemplate extends StatefulWidget {
  final String identite;
  final String place;
  final String date;
  final String clientId;
  final String type;
  final String marque;
  final String puissance;
  final String miseRoute;
  final String serialNumber;
  final bool contrProtElec;
  final bool resConElec;
  final bool mesContrTen;
  final bool mesContrInt;
  final bool contrParReg;
  final bool contrEnclTher;
  final bool contrEtanFri;
  final bool contrEtatCal;
  final bool netEchAir;
  final bool contrFoncVentil;
  final bool contrEvacCon;
  final bool mesTempFonc;
  final bool contrVaseExp;
  final bool contrVisuEau;
  final bool contrFoncCirc;
  final bool contrEtanSouHydrau;
  final bool contrAnodeBall;
  final bool contrFluideCal;
  final bool contrProtAnti;
  final bool contrVisuEns;
  final bool essaiFonc;
  final bool aideClient;
  final bool purge;
  final bool nettEntrFiltre;
  final bool contrPressVase;
  final bool regonVase;
  final String defautsCorr;
  final String aPrevoir;
  final String recommandation;
  final String gains;
  final String userId;
  const PompeTemplate({
    super.key,
    required this.identite,
    required this.place,
    required this.date,
    required this.clientId,
    required this.type,
    required this.marque,
    required this.puissance,
    required this.miseRoute,
    required this.serialNumber,
    required this.contrProtElec,
    required this.resConElec,
    required this.mesContrTen,
    required this.mesContrInt,
    required this.contrParReg,
    required this.contrEnclTher,
    required this.contrEtanFri,
    required this.contrEtatCal,
    required this.netEchAir,
    required this.contrFoncVentil,
    required this.contrEvacCon,
    required this.mesTempFonc,
    required this.contrVaseExp,
    required this.contrVisuEau,
    required this.contrFoncCirc,
    required this.contrEtanSouHydrau,
    required this.contrAnodeBall,
    required this.contrFluideCal,
    required this.contrProtAnti,
    required this.contrVisuEns,
    required this.essaiFonc,
    required this.aideClient,
    required this.purge,
    required this.nettEntrFiltre,
    required this.contrPressVase,
    required this.regonVase,
    required this.defautsCorr,
    required this.aPrevoir,
    required this.recommandation,
    required this.gains,
    required this.userId,
  });

  @override
  State<PompeTemplate> createState() => _PompeTemplateState();
}

class _PompeTemplateState extends State<PompeTemplate> {
  bool screenable = false;
  ScreenshotController controller = ScreenshotController();
  @override
  Widget build(BuildContext context) {
    return Screenshot(
      controller: controller,
      child: Stack(
        children: [
          Container(
            height: MediaQuery.sizeOf(context).height,
            width: MediaQuery.sizeOf(context).width,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: screenable
                        ? const Radius.circular(0)
                        : const Radius.circular(25),
                    topRight: screenable
                        ? const Radius.circular(0)
                        : const Radius.circular(25))),
          ),
          Body(),
          Padding(
            padding: const EdgeInsets.only(right: 5, bottom: 45),
            child: Align(
                alignment: Alignment.bottomRight,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.transparent,
                        surfaceTintColor: Colors.transparent,
                        foregroundColor: mainColor(),
                        shadowColor: Colors.transparent),
                    onPressed: () async {
                      setState(() {
                        screenable = true;
                      });
                      final image = await controller.capture();
                      SaveAndShare(image!, getNameFromInter(widget.clientId));
                      Future.delayed(const Duration(seconds: 1), () {
                        setState(() {
                          screenable = false;
                        });
                      });
                    },
                    child: Container(
                      height: 60,
                      width: 70,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Icon(
                            CupertinoIcons.share_up,
                            color:
                                screenable ? Colors.transparent : mainColor(),
                            size: 35,
                          ),
                          Text(
                            "Exporter",
                            style: TextStyle(
                                color: screenable
                                    ? Colors.transparent
                                    : mainColor(),
                                fontSize: 15,
                                fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                    ))),
          ),
        ],
      ),
    );
  }

  SingleChildScrollView Body() {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(
            height: 10,
          ),
          part1(),
          const SizedBox(
            height: 5,
          ),
          part2(),
          const SizedBox(
            height: 5,
          ),
          part3(),
          const SizedBox(
            height: 5,
          ),
          part4(),
          const SizedBox(
            height: 5,
          ),
          part5()
        ],
      ),
    );
  }

  Row part1() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Column(
          children: [
            Image.asset(
              "src/logoVide.png",
              scale: 28,
            ),
            Text(
              "Mon gestionnaire",
              style: TextStyle(
                  color: textColor(),
                  fontSize: 17,
                  fontWeight: FontWeight.bold),
            ),
            Text("Attestation de capacité : ", style: titleStyle()),
            Text(entrepriseData.capacite, style: argStyle()),
            Row(
              children: [
                Text("Siret : ", style: titleStyle()),
                Text(entrepriseData.siret, style: argStyle())
              ],
            )
          ],
        ),
        const SizedBox(
          width: 10,
        ),
        Column(
          children: [
            const SizedBox(
              height: 25,
            ),
            block(
              200,
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    width: 200,
                    child: textTwoWrap("Adresse : ", entrepriseData.adresse),
                  ),
                  Container(
                      width: 200,
                      child: textTwoWrap("Ville : ", entrepriseData.ville)),
                  Container(
                      width: 200,
                      child:
                          textTwoWrap("Code postale : ", entrepriseData.code)),
                  Container(
                      width: 200,
                      child: textTwoWrap("Email : ", entrepriseData.mail)),
                  Container(
                      width: 200,
                      child: textTwoWrap("Téléphone : ", entrepriseData.phone))
                ],
              ),
            )
          ],
        )
      ],
    );
  }

  Container part2() {
    return block(
        MediaQuery.sizeOf(context).width - 20,
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              "Informations",
              style: secStyle(),
            ),
            const SizedBox(
              height: 5,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Container(
                      width: 180,
                      child: textTwoWrap(
                          "Nom du technicien : ",
                          userData[getUserClientFromInter(widget.userId)].nom +
                              " " +
                              userData[getUserClientFromInter(widget.userId)]
                                  .prenom),
                    ),
                    Container(
                        width: 180,
                        child: textTwoWrap("Nom du client : ",
                            getNameFromInter(widget.clientId))),
                  ],
                ),
                Row(
                  children: [
                    Container(
                        width: 180,
                        child: textTwoWrap("Date visite : ", widget.date)),
                    Container(
                      width: 180,
                      child: textTwoWrap("Téléphone : ",
                          clients[getClientFromInter(widget.userId)].phone),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Container(
                        width: 180,
                        child: textTwoWrap("Dernier entretien : ",
                            returnDateFromSerial(widget.serialNumber, false))),
                    Container(
                        width: 180,
                        child: textTwoWrap("Email : ",
                            clients[getClientFromInter(widget.userId)].mail)),
                  ],
                ),
                Row(
                  children: [
                    Container(
                        width: 180,
                        child:
                            textTwoWrap("Lieu de la machine : ", widget.place)),
                    Container(
                        width: 180,
                        child: textTwoWrap(
                            "Adresse : ",
                            clients[getClientFromInter(widget.userId)]
                                .adresse)),
                  ],
                ),
              ],
            ),
          ],
        ));
  }

  Container part3() {
    return block(
        MediaQuery.sizeOf(context).width - 20,
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              "Informations techniques",
              style: secStyle(),
            ),
            const SizedBox(
              height: 5,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Container(
                      width: 180,
                      child: textTwoWrap("Marque : ", widget.marque),
                    ),
                    Container(
                        width: 180,
                        child:
                            textTwoWrap("Type de la machine : ", widget.type)),
                  ],
                ),
                Row(
                  children: [
                    Container(
                        width: 180,
                        child: textTwoWrap(
                            "Date de mise en service : ", widget.miseRoute)),
                    Container(
                      width: 180,
                      child: textTwoWrap("Puissance : ", widget.puissance),
                    ),
                  ],
                ),
              ],
            ),
            Container(
              width: MediaQuery.sizeOf(context).width - 20,
              child: textTwoWrap("Numéro de série : ", widget.serialNumber),
            ),
          ],
        ));
  }

  Container part4() {
    return block(
        MediaQuery.sizeOf(context).width - 20,
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              "Points de contrôle",
              style: secStyle(),
            ),
            const SizedBox(
              height: 5,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Container(
                      width: 180,
                      child: textTwoWrap("Contrôle protections électriques : ",
                          boolToString(widget.contrProtElec)),
                    ),
                    Container(
                        width: 180,
                        child: textTwoWrap("Contrôle du vase d'expansion : ",
                            boolToString(widget.contrVaseExp))),
                  ],
                ),
                Row(
                  children: [
                    Container(
                        width: 180,
                        child: textTwoWrap(
                            "Resserage connexions électriques : ",
                            boolToString(widget.resConElec))),
                    Container(
                      width: 180,
                      child: textTwoWrap("Contrôle de l'eau de chauffage : ",
                          boolToString(widget.contrVisuEau)),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Container(
                        width: 180,
                        child: textTwoWrap(
                            "Mesure et contrôle de la tension : ",
                            boolToString(widget.mesContrTen))),
                    Container(
                      width: 180,
                      child: textTwoWrap(
                          "Contrôle du fonctionnement du circulateur : ",
                          boolToString(widget.contrFoncCirc)),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Container(
                      width: 180,
                      child: textTwoWrap("Mesure et contrôle des intensités : ",
                          boolToString(widget.mesContrInt)),
                    ),
                    Container(
                      width: 180,
                      child: textTwoWrap(
                          "Contrôle étanchéité souspape / organe hydraulique : ",
                          boolToString(widget.contrEtanSouHydrau)),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Container(
                      width: 180,
                      child: textTwoWrap(
                          "Contrôle du paramétrage de la régulation : ",
                          boolToString(widget.contrParReg)),
                    ),
                    Container(
                        width: 180,
                        child: textTwoWrap(
                            "Contrôle anode de protection du ballon de stockage : ",
                            boolToString(widget.contrAnodeBall))),
                  ],
                ),
                Row(
                  children: [
                    Container(
                      width: 180,
                      child: textTwoWrap(
                          "Contrôle de l'enclenchement de l'appoint thermique : ",
                          boolToString(widget.contrEnclTher)),
                    ),
                    Container(
                        width: 180,
                        child: textTwoWrap("Contrôle du fluide caloporteur : ",
                            boolToString(widget.contrFluideCal))),
                  ],
                ),
                Row(
                  children: [
                    Container(
                      width: 180,
                      child: textTwoWrap(
                          "Contrôle de l'étanchéité du circuit frigorifique : ",
                          boolToString(widget.contrEtanFri)),
                    ),
                    Container(
                        width: 180,
                        child: textTwoWrap("Contrôle du niveau d'anti-gel : ",
                            boolToString(widget.contrProtAnti))),
                  ],
                ),
                Row(
                  children: [
                    Container(
                      width: 180,
                      child: textTwoWrap(
                          "Contrôle de l'état des calorifuges : ",
                          boolToString(widget.contrEtatCal)),
                    ),
                    Container(
                        width: 180,
                        child: textTwoWrap(
                            "Contrôle visuel et auditif de l'ensemble : ",
                            boolToString(widget.contrVisuEns))),
                  ],
                ),
                Row(
                  children: [
                    Container(
                      width: 180,
                      child: textTwoWrap("Nettoyage de l'échangeur d'air : ",
                          boolToString(widget.netEchAir)),
                    ),
                    Container(
                        width: 180,
                        child: textTwoWrap(
                            "Vérification du fonctionnement de l'ensemble : ",
                            boolToString(widget.essaiFonc))),
                  ],
                ),
                Row(
                  children: [
                    Container(
                      width: 180,
                      child: textTwoWrap(
                          "Contrôle du fonctionnement des ventilos : ",
                          boolToString(widget.contrFoncVentil)),
                    ),
                    Container(
                        width: 180,
                        child: textTwoWrap(
                            "Purge de l'air du circuit hydraulique : ",
                            boolToString(widget.purge))),
                  ],
                ),
                Row(
                  children: [
                    Container(
                      width: 180,
                      child: textTwoWrap("Contrôle des bacs à condensation : ",
                          boolToString(widget.contrEvacCon)),
                    ),
                    Container(
                        width: 180,
                        child: textTwoWrap(
                            "Nettoyage et entretien des filtres :",
                            boolToString(widget.nettEntrFiltre))),
                  ],
                ),
                Row(
                  children: [
                    Container(
                      width: 180,
                      child: textTwoWrap(
                          "Mesure température en fonctionnement (air/eau) : ",
                          boolToString(widget.mesTempFonc)),
                    ),
                    Container(
                        width: 180,
                        child: textTwoWrap(
                            "Contrôle de la pression des vases d'expansion : ",
                            boolToString(widget.contrPressVase))),
                  ],
                ),
                Container(
                    width: MediaQuery.sizeOf(context).width - 20,
                    child: textTwoWrap("Réglage des vases si nécessaire :",
                        boolToString(widget.regonVase))),
              ],
            ),
          ],
        ));
  }

  Container part5() {
    return block(
        MediaQuery.sizeOf(context).width - 20,
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              "Commentaires",
              style: secStyle(),
            ),
            const SizedBox(
              height: 5,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                    width: MediaQuery.sizeOf(context).width - 20,
                    child: textTwoWrap(
                        "Défauts corrigés suite aux opérations :",
                        widget.defautsCorr)),
                Container(
                    width: MediaQuery.sizeOf(context).width - 20,
                    child:
                        textTwoWrap("Travaux à prévoir : ", widget.aPrevoir)),
                Container(
                    width: MediaQuery.sizeOf(context).width - 20,
                    child: textTwoWrap(
                        "Recommandations : ", widget.recommandation)),
                Container(
                    width: MediaQuery.sizeOf(context).width - 20,
                    child: textTwoWrap("Gains réalisables : ", widget.gains)),
              ],
            ),
          ],
        ));
  }

  Future SaveAndShare(Uint8List bytes, String userName) async {
    DateTime temp = DateTime.now();
    final directory = await getApplicationDocumentsDirectory();
    final image = File(
        '${directory.path}/${userName + temp.year.toString() + widget.place}.pdf');
    image.writeAsBytesSync(bytes);
    await Share.shareFiles([image.path]);
  }
}
