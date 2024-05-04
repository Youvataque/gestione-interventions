import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/widgets.dart';
import 'package:gap/gap.dart';
import 'package:path_provider/path_provider.dart';
import 'package:share_plus/share_plus.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:screenshot/screenshot.dart';
import 'package:gestionnaire_interventions/oldComponent/connect.dart';
import 'package:gestionnaire_interventions/oldComponent/oldTool.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;

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
  final bool capot;
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
      required this.capot,
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
                        : const Radius.circular(25)
                )
            ),
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
                      Future.delayed(const Duration(seconds: 2), () {
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
                            color: screenable ? Colors.transparent : mainColor(),
                            size: 35,
                          ),
                          Text(
                            "Exporter",
                            style: TextStyle(
                                color: screenable ? Colors.transparent : mainColor(),
                                fontSize: 15,
                                fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                    )
                )
            ),
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
            part7(),
            const Gap(10)
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

  Center part1() {
    return Center(
      child: SizedBox(
      width: MediaQuery.sizeOf(context).width -20,
      child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Column(
          children: [
            Image.asset(
              "src/Logo_SEB.jpg",
              scale: 20,
            ),
            Text(
              "Sols Energies Bains",
              style: TextStyle(
                  color: textColor(),
                  fontSize: 16,
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
        block(0,
          Column(
            children: [
              Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        SizedBox(
                          child: textRow(Text("Adresse : ", style: titleStyle()),
                              Text(entrepriseData.adresse, style: argStyle())),
                        ),
                        const Gap(5)
                      ],
                    ),
                    SizedBox(
                        child: textRow(
                            Text(
                              "Ville : ",
                              style: titleStyle(),
                            ),
                            Text(entrepriseData.ville, style: argStyle()))),
                    SizedBox(
                        child: textRow(
                            Text(
                              "Code postale : ",
                              style: titleStyle(),
                            ),
                            Text(entrepriseData.code, style: argStyle()))),
                    SizedBox(
                        child: textRow(
                            Text(
                              "Email : ",
                              style: titleStyle(),
                            ),
                            Text(entrepriseData.mail, style: argStyle()))),
                    SizedBox(
                        child: textRow(
                            Text(
                              "Téléphone : ",
                              style: titleStyle(),
                            ),
                            Text(entrepriseData.phone, style: argStyle())))
                  ],
                ),
            ],
          )
        ),
      ],
    ),
    ),
    );
  }

  Widget part2() {
    return SizedBox(
      width: MediaQuery.sizeOf(context).width -20,
      child: block(
        0,
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
                    Expanded(
                      child: textTwoWrap(
                          "Nom du technicien : ",
                          userData[getUserClientFromInter(widget.userId)].nom + " " + userData[getUserClientFromInter(widget.userId)].prenom,
                      ),
                    ),
                   Expanded(
                        child: textTwoWrap(
                            "Nom du client : ",
                            getNameFromInter(widget.clientId),
                        )
                    ),
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                        child: textRow(
                            Text("Date visite : ", style: titleStyle()),
                            Text(widget.date, style: argStyle()))),
                    Expanded(
                      child: textRow(
                          Text("Téléphone : ", style: titleStyle()),
                          Text(clients[clientFromId(widget.clientId)].phone,
                              style: argStyle())),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                        child: textTwoWrap(
                            "Dernier entretien : ",
                            returnDateFromSerial(widget.reference, true),
                        )
                    ),
                    Expanded(
                        child: textTwoWrap(
                            "Email : ",
                            clients[clientFromId(widget.clientId)].mail,
                        )
                    ),
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                        child: textRow(
                            Text("Lieu de la machine : ", style: titleStyle()),
                            Text(widget.place, style: argStyle()))),
                    Expanded(
                        child: textTwoWrap(
                            "Adresse : ",
                            clients[clientFromId(widget.clientId)].adresse
                        )
                    ),
                  ],
                ),
              ],
            ),
          ],
        )),
    );
  }

  Widget part3() {
    return SizedBox(
      width: MediaQuery.sizeOf(context).width -20,
      child: block(
        0,
        Column(
          children: [
            Text("Informations techniques", style: secStyle()),
            const SizedBox(
              height: 5,
            ),
            Column(mainAxisAlignment: MainAxisAlignment.start, children: [
              Row(
                children: [
                  Expanded(
                    child: textTwoWrap("marque : ", widget.marque)
                  ),
                  Expanded(
                      child: textTwoWrap("Modèle : ", widget.modele)
                  )
                ],
              ),
              SizedBox(
                width: double.infinity,
                child: textTwoWrap("Référence : ", widget.reference)
              ),
            ])
          ],
        )),
    );
  }

  Widget part4() {
    return SizedBox(
      width: MediaQuery.sizeOf(context).width -20,
      child: block(
        0,
        Column(
          children: [
            Text("Observations visuelles", style: secStyle()),
            const SizedBox(
              height: 5,
            ),
            Column(mainAxisAlignment: MainAxisAlignment.start, children: [
              Row(
                children: [
                  Expanded(
                    child: textRow(Text("État : ", style: titleStyle()),
                        Text(widget.etat + " / 10", style: argStyle())),
                  ),
                  Expanded(
                      child: textRow(
                          Text("Passage du testeur de fuite : ",
                              style: titleStyle()),
                          Text(boolToString(widget.testFuite),
                              style: argStyle()))),
                ],
              ),
              SizedBox(
                width: MediaQuery.sizeOf(context).width - 20,
                child: textRow(Text("Remarques : ", style: titleStyle()),
                    Text(widget.observD, style: argStyle())),
              ),
            ])
          ],
        )));
  }

  Widget part5() {
    return SizedBox(
      width: MediaQuery.sizeOf(context).width -20,
      child: block(
        0,
        Column(
          children: [
            Text("Unité intérieure", style: secStyle()),
            const SizedBox(
              height: 5,
            ),
            Column(mainAxisAlignment: MainAxisAlignment.start, children: [
              SizedBox(
                width: MediaQuery.sizeOf(context).width - 20,
                child: textRow(
                    Text("Température d'arrivée : ", style: titleStyle()),
                    Text(
                        "${widget.cold != ""? widget.cold : "Non testée"} pour le mode froid et ${widget.hot != ""? widget.hot : "Non testée"} pour le mode chaud",
                        style: argStyle())),
              ),
              SizedBox(
                width: MediaQuery.sizeOf(context).width - 20,
                child: textRow(
                    Text("Dépose du carénage : ", style: titleStyle()),
                    Text(boolToString(widget.carenage), style: argStyle())),
              ),
              SizedBox(
                width: MediaQuery.sizeOf(context).width - 20,
                child: textRow(
                    Text("Dépose du bac à condensation : ",
                        style: titleStyle()),
                    Text(boolToString(widget.condensa), style: argStyle())),
              ),
             SizedBox(
                width: MediaQuery.sizeOf(context).width - 20,
                child: textRow(
                    Text("Dépose des ventilos : ", style: titleStyle()),
                    Text(boolToString(widget.ventilo), style: argStyle())),
              ),
              SizedBox(
                width: MediaQuery.sizeOf(context).width - 20,
                child: textRow(
                    Text("Nettoyage, dégraissage, etc : ", style: titleStyle()),
                    Text(boolToString(widget.clean), style: argStyle())),
              ),
              SizedBox(
                width: MediaQuery.sizeOf(context).width - 20,
                child: textRow(
                    Text("Remontage de l'ensemble : ", style: titleStyle()),
                    Text(boolToString(widget.assemble), style: argStyle())),
              ),
              SizedBox(
                width: MediaQuery.sizeOf(context).width - 20,
                child: textRow(
                    Text("Nettoyage du filtre : ", style: titleStyle()),
                    Text(boolToString(widget.cleanFiltre), style: argStyle())),
              ),
             SizedBox(
                width: MediaQuery.sizeOf(context).width - 20,
                child: textRow(
                    Text("Test des condensations : ", style: titleStyle()),
                    Text(boolToString(widget.testCondensa), style: argStyle())),
              ),
              SizedBox(
                width: MediaQuery.sizeOf(context).width - 20,
                child: textRow(Text("Remarques : ", style: titleStyle()),
                    Text(widget.observD2, style: argStyle())),
              ),
            ])
          ],
        )));
  }

  Widget part6() {
    return SizedBox(
      width: MediaQuery.sizeOf(context).width -20,
      child: block(
        0,
        Column(
          children: [
            Text("Groupe extérieur", style: secStyle()),
            const SizedBox(
              height: 5,
            ),
            Column(mainAxisAlignment: MainAxisAlignment.start, children: [
              Row(
                children: [
                  Expanded(
                      child: textRow(
                          Text("Type de compresseur : ", style: titleStyle()),
                          Text(widget.typeExt, style: argStyle()))),
                  Expanded(
                      child: textRow(
                          Text("Dépose du capot : ", style: titleStyle()),
                          Text(boolToString(widget.capot),
                              style: argStyle()))),
                ],
              ),
              Row(
                children: [
                  Expanded(
                      child: textRow(
                          Text("Aspiration et brossage : ",
                              style: titleStyle()),
                          Text(boolToString(widget.aspiBros),
                              style: argStyle()))),
                  Expanded(
                      child: textRow(
                          Text("Nettoyage et rinçage : ", style: titleStyle()),
                          Text(boolToString(widget.cleanRin),
                              style: argStyle()))),
                ],
              ),
              Row(
                children: [
                  Expanded(
                      child: textRow(
                          Text("Vérification des supports : ",
                              style: titleStyle()),
                          Text(boolToString(widget.verifSupp),
                              style: argStyle()))),
                 Expanded(
                      child: textRow(
                          Text("Vérification des ventilos : ",
                              style: titleStyle()),
                          Text(boolToString(widget.verifVentil),
                              style: argStyle()))),
                ],
              ),
              SizedBox(
                width: MediaQuery.sizeOf(context).width - 20,
                child: textRow(
                    Text("Vérification du raccord des cuivres : ",
                        style: titleStyle()),
                    Text(boolToString(widget.verifCuivre), style: argStyle())),
              ),
            ])
          ],
        )));
  }

  Widget part7() {
    return SizedBox(
      width: MediaQuery.sizeOf(context).width -20,
      child: block(
        MediaQuery.sizeOf(context).width - 20,
        Column(
          children: [
            Text("Mise en route", style: secStyle()),
            const SizedBox(
              height: 5,
            ),
            Column(mainAxisAlignment: MainAxisAlignment.start, children: [
              SizedBox(
                width: MediaQuery.sizeOf(context).width - 20,
                child: textRow(
                    Text("Température d'arrivée : ", style: titleStyle()),
                    Text(
                        "${widget.coldF != ""? widget.coldF : "Non testée"} pour le mode froid et ${widget.hotF != ""? widget.hotF : "Non testée"} pour le mode chaud",
                        style: argStyle())),
              ),
              SizedBox(
                  width: MediaQuery.sizeOf(context).width - 20,
                  child: textRow(
                      Text("Mesure du débit d'air : ", style: titleStyle()),
                      SizedBox(
                        child: forBouche(
                            Text(widget.b1, style: argStyle()),
                            Text(widget.b2, style: argStyle()),
                            Text(widget.b3, style: argStyle()),
                            Text(widget.b4, style: argStyle()),
                            Text(widget.b5, style: argStyle())),
                      )))
            ])
          ],
        )));
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

    // Enregistrer l'image
    final imagePath = '${directory.path}/${userName+temp.year.toString()}.png';
    final imageFile = File(imagePath);
    await imageFile.writeAsBytes(bytes);

    // Créer un document PDF
    final pdf = pw.Document();
    final image = pw.MemoryImage(bytes);
    const myPageTheme = pw.PageTheme(
      pageFormat: PdfPageFormat.a4, // ou tout autre format de page que vous utilisez
      margin: pw.EdgeInsets.zero, // Cela définit les marges à zéro
    );
  // Ajouter l'image au PDF en conservant les proportions
    pdf.addPage(pw.Page(
      pageTheme: myPageTheme,
      build: (pw.Context contexte) {
        return pw.Align(
          alignment: pw.Alignment.topCenter,
          child: pw.Image(
            image,
            fit: pw.BoxFit.fitHeight
          )
        );
      }
      
    ));


    // Enregistrer le PDF
    final pdfPath = '${directory.path}/${userName+temp.year.toString()}.pdf';
    final pdfFile = File(pdfPath);
    await pdfFile.writeAsBytes(await pdf.save());

    // Partager le PDF
    await Share.shareFiles([pdfFile.path]);
  }
}
