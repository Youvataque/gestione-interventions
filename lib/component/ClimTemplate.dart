import 'dart:io';
import 'dart:typed_data';
import 'dart:ui';

import 'package:path_provider/path_provider.dart';
import 'package:share_plus/share_plus.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:screenshot/screenshot.dart';
import 'package:gestionnaire_interventions/component/connect.dart';
import 'package:gestionnaire_interventions/component/tool.dart';

class ClimTemplate extends StatefulWidget {
  final String identite;
  final String place;
  final String date;
  final String clientId;
  final String marque;
  final String modele;
  final String reference;
  final String etat;
  final String observD;
  final bool testFuite;
  final String cold;
  final String hot;
  final bool carenage;
  final bool condensa;
  final bool ventilo;
  final bool clean;
  final bool assemble;
  final bool cleanFiltre;
  final bool testCondensa;
  final String observD2;
  final String typeExt;
  final bool capeau;
  final bool aspiBros;
  final bool cleanRin;
  final bool verifCuivre;
  final bool verifSupp;
  final bool verifVentil;
  final String coldF;
  final String hotF;
  final String b1;
  final String b2;
  final String b3;
  final String b4;
  final String b5;
  final String userId;
  const ClimTemplate(
      {super.key,
      required this.identite,
      required this.place,
      required this.date,
      required this.clientId,
      required this.marque,
      required this.modele,
      required this.reference,
      required this.etat,
      required this.observD,
      required this.testFuite,
      required this.cold,
      required this.hot,
      required this.carenage,
      required this.condensa,
      required this.ventilo,
      required this.clean,
      required this.assemble,
      required this.cleanFiltre,
      required this.testCondensa,
      required this.observD2,
      required this.typeExt,
      required this.capeau,
      required this.aspiBros,
      required this.cleanRin,
      required this.verifCuivre,
      required this.verifSupp,
      required this.verifVentil,
      required this.coldF,
      required this.hotF,
      required this.b1,
      required this.b2,
      required this.b3,
      required this.b4,
      required this.b5,
      required this.userId});

  @override
  State<ClimTemplate> createState() => _ClimTemplateState();
}

class _ClimTemplateState extends State<ClimTemplate> {
  ScreenshotController controller = ScreenshotController();
  bool screenable = false;
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

  Widget Body() => SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: screenable ? 30 : 10,
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
            part5(),
            const SizedBox(
              height: 5,
            ),
            part6(),
            const SizedBox(
              height: 5,
            ),
            part7()
          ],
        ),
      );

  //////////////////////////
  //////////////////////////

  TextStyle argStyle() {
    return TextStyle(fontSize: 8, color: mainColor());
  }

  TextStyle titleStyle() {
    return TextStyle(
        fontSize: 9, fontWeight: FontWeight.bold, color: textColor());
  }

  TextStyle secStyle() {
    return TextStyle(
        fontSize: 13,
        fontWeight: FontWeight.bold,
        color: textColor(),
        decoration: TextDecoration.underline);
  }

  //////////////////////////
  //////////////////////////

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
                    child: textRow(Text("Adresse : ", style: titleStyle()),
                        Text(entrepriseData.adresse, style: argStyle())),
                  ),
                  Container(
                      width: 200,
                      child: textRow(
                          Text(
                            "Ville : ",
                            style: titleStyle(),
                          ),
                          Text(entrepriseData.ville, style: argStyle()))),
                  Container(
                      width: 200,
                      child: textRow(
                          Text(
                            "Code postale : ",
                            style: titleStyle(),
                          ),
                          Text(entrepriseData.code, style: argStyle()))),
                  Container(
                      width: 200,
                      child: textRow(
                          Text(
                            "Email : ",
                            style: titleStyle(),
                          ),
                          Text(entrepriseData.mail, style: argStyle()))),
                  Container(
                      width: 200,
                      child: textRow(
                          Text(
                            "Téléphone : ",
                            style: titleStyle(),
                          ),
                          Text(entrepriseData.phone, style: argStyle())))
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
                                .prenom,
                      ),
                    ),
                    Container(
                        width: 180,
                        child: textTwoWrap(
                          "Nom du client : ",
                          getNameFromInter(widget.clientId),
                        )),
                  ],
                ),
                Row(
                  children: [
                    Container(
                        width: 180,
                        child: textRow(
                            Text("Date visite : ", style: titleStyle()),
                            Text(widget.date, style: argStyle()))),
                    Container(
                      width: 180,
                      child: textRow(
                          Text("Téléphone : ", style: titleStyle()),
                          Text(
                              clients[getClientFromInter(widget.clientId)]
                                  .phone,
                              style: argStyle())),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Container(
                        width: 180,
                        child: textTwoWrap(
                          "Dernier entretien : ",
                          returnDateFromSerial(widget.reference, true),
                        )),
                    Container(
                        width: 180,
                        child: textTwoWrap(
                          "Email : ",
                          clients[getClientFromInter(widget.clientId)].mail,
                        )),
                  ],
                ),
                Row(
                  children: [
                    Container(
                        width: 180,
                        child: textRow(
                            Text("Lieu de la machine : ", style: titleStyle()),
                            Text(widget.place, style: argStyle()))),
                    Container(
                        width: 180,
                        child: textTwoWrap(
                            "Adresse : ",
                            clients[getClientFromInter(widget.clientId)]
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
          children: [
            Text("Informations techniques", style: secStyle()),
            const SizedBox(
              height: 5,
            ),
            Column(mainAxisAlignment: MainAxisAlignment.start, children: [
              Row(
                children: [
                  Container(
                    width: 180,
                    child: textRow(Text("Marque : ", style: titleStyle()),
                        Text(widget.marque, style: argStyle())),
                  ),
                  Container(
                      width: 180,
                      child: textRow(Text("Modèle : ", style: titleStyle()),
                          Text(widget.modele, style: argStyle()))),
                ],
              ),
              Container(
                width: MediaQuery.sizeOf(context).width - 20,
                child: textRow(Text("Référence : ", style: titleStyle()),
                    Text(widget.reference, style: argStyle())),
              ),
            ])
          ],
        ));
  }

  Container part4() {
    return block(
        MediaQuery.sizeOf(context).width - 20,
        Column(
          children: [
            Text("Observations visuelles", style: secStyle()),
            const SizedBox(
              height: 5,
            ),
            Column(mainAxisAlignment: MainAxisAlignment.start, children: [
              Row(
                children: [
                  Container(
                    width: 180,
                    child: textRow(Text("État : ", style: titleStyle()),
                        Text(widget.etat + " / 10", style: argStyle())),
                  ),
                  Container(
                      width: 180,
                      child: textRow(
                          Text("Passage du testeur de fuite : ",
                              style: titleStyle()),
                          Text(boolToString(widget.testFuite),
                              style: argStyle()))),
                ],
              ),
              Container(
                width: MediaQuery.sizeOf(context).width - 20,
                child: textRow(Text("Remarques : ", style: titleStyle()),
                    Text(widget.observD, style: argStyle())),
              ),
            ])
          ],
        ));
  }

  Container part5() {
    return block(
        MediaQuery.sizeOf(context).width - 20,
        Column(
          children: [
            Text("Unité intérieure", style: secStyle()),
            const SizedBox(
              height: 5,
            ),
            Column(mainAxisAlignment: MainAxisAlignment.start, children: [
              Container(
                width: MediaQuery.sizeOf(context).width - 20,
                child: textRow(
                    Text("Température d'arrivée : ", style: titleStyle()),
                    Text(
                        "${widget.cold != "" ? widget.cold : "Non testée"} pour le mode froid et ${widget.hot != "" ? widget.hot : "Non testée"} pour le mode chaud",
                        style: argStyle())),
              ),
              Container(
                width: MediaQuery.sizeOf(context).width - 20,
                child: textRow(
                    Text("Dépose du carénage : ", style: titleStyle()),
                    Text(boolToString(widget.carenage), style: argStyle())),
              ),
              Container(
                width: MediaQuery.sizeOf(context).width - 20,
                child: textRow(
                    Text("Dépose du bac à condensation : ",
                        style: titleStyle()),
                    Text(boolToString(widget.condensa), style: argStyle())),
              ),
              Container(
                width: MediaQuery.sizeOf(context).width - 20,
                child: textRow(
                    Text("Dépose des ventilos : ", style: titleStyle()),
                    Text(boolToString(widget.ventilo), style: argStyle())),
              ),
              Container(
                width: MediaQuery.sizeOf(context).width - 20,
                child: textRow(
                    Text("Nettoyage, dégraissage, etc : ", style: titleStyle()),
                    Text(boolToString(widget.clean), style: argStyle())),
              ),
              Container(
                width: MediaQuery.sizeOf(context).width - 20,
                child: textRow(
                    Text("Remontage de l'ensemble : ", style: titleStyle()),
                    Text(boolToString(widget.assemble), style: argStyle())),
              ),
              Container(
                width: MediaQuery.sizeOf(context).width - 20,
                child: textRow(
                    Text("Nettoyage du filtre : ", style: titleStyle()),
                    Text(boolToString(widget.cleanFiltre), style: argStyle())),
              ),
              Container(
                width: MediaQuery.sizeOf(context).width - 20,
                child: textRow(
                    Text("Test des condensations : ", style: titleStyle()),
                    Text(boolToString(widget.testCondensa), style: argStyle())),
              ),
              Container(
                width: MediaQuery.sizeOf(context).width - 20,
                child: textRow(Text("Remarques : ", style: titleStyle()),
                    Text(widget.observD2, style: argStyle())),
              ),
            ])
          ],
        ));
  }

  Container part6() {
    return block(
        MediaQuery.sizeOf(context).width - 20,
        Column(
          children: [
            Text("Groupe extérieur", style: secStyle()),
            const SizedBox(
              height: 5,
            ),
            Column(mainAxisAlignment: MainAxisAlignment.start, children: [
              Row(
                children: [
                  Container(
                      width: 180,
                      child: textRow(
                          Text("Type de compresseur : ", style: titleStyle()),
                          Text(widget.typeExt, style: argStyle()))),
                  Container(
                      width: 180,
                      child: textRow(
                          Text("Dépose du capot : ", style: titleStyle()),
                          Text(boolToString(widget.capeau),
                              style: argStyle()))),
                ],
              ),
              Row(
                children: [
                  Container(
                      width: 180,
                      child: textRow(
                          Text("Aspiration et brossage : ",
                              style: titleStyle()),
                          Text(boolToString(widget.aspiBros),
                              style: argStyle()))),
                  Container(
                      width: 180,
                      child: textRow(
                          Text("Nettoyage et rinçage : ", style: titleStyle()),
                          Text(boolToString(widget.cleanRin),
                              style: argStyle()))),
                ],
              ),
              Row(
                children: [
                  Container(
                      width: 180,
                      child: textRow(
                          Text("Vérification des supports : ",
                              style: titleStyle()),
                          Text(boolToString(widget.verifSupp),
                              style: argStyle()))),
                  Container(
                      width: 180,
                      child: textRow(
                          Text("Vérification des ventilos : ",
                              style: titleStyle()),
                          Text(boolToString(widget.verifVentil),
                              style: argStyle()))),
                ],
              ),
              Container(
                width: MediaQuery.sizeOf(context).width - 20,
                child: textRow(
                    Text("Vérification du raccord des cuivres : ",
                        style: titleStyle()),
                    Text(boolToString(widget.verifCuivre), style: argStyle())),
              ),
            ])
          ],
        ));
  }

  Container part7() {
    return block(
        MediaQuery.sizeOf(context).width - 20,
        Column(
          children: [
            Text("Mise en route", style: secStyle()),
            const SizedBox(
              height: 5,
            ),
            Column(mainAxisAlignment: MainAxisAlignment.start, children: [
              Container(
                width: MediaQuery.sizeOf(context).width - 20,
                child: textRow(
                    Text("Température d'arrivée : ", style: titleStyle()),
                    Text(
                        "${widget.coldF != "" ? widget.coldF : "Non testée"} pour le mode froid et ${widget.hotF != "" ? widget.hotF : "Non testée"} pour le mode chaud",
                        style: argStyle())),
              ),
              Container(
                  width: MediaQuery.sizeOf(context).width - 20,
                  child: textRow(
                      Text("Mesure du débit d'air : ", style: titleStyle()),
                      Container(
                        width: 200,
                        child: forBouche(
                            Text(widget.b1, style: argStyle()),
                            Text(widget.b2, style: argStyle()),
                            Text(widget.b3, style: argStyle()),
                            Text(widget.b4, style: argStyle()),
                            Text(widget.b5, style: argStyle())),
                      )))
            ])
          ],
        ));
  }

  Row forBouche(Widget b1, Widget b2, Widget b3, Widget b4, Widget b5) {
    return Row(
      children: [
        Text(
          " B1 -> ",
          style: titleStyle(),
        ),
        b1,
        Text(
          " B2 -> ",
          style: titleStyle(),
        ),
        b2,
        Text(
          " B3 -> ",
          style: titleStyle(),
        ),
        b3,
        Text(
          " B4 -> ",
          style: titleStyle(),
        ),
        b4,
        Text(
          " B5 -> ",
          style: titleStyle(),
        ),
        b5
      ],
    );
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
