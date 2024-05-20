import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:path_provider/path_provider.dart';
import 'package:screenshot/screenshot.dart';
import 'package:share_plus/share_plus.dart';
import 'package:gestionnaire_interventions/oldComponent/connect.dart';
import 'package:gestionnaire_interventions/oldComponent/oldTool.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;

class PompeTemplates extends StatefulWidget {
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
  const PompeTemplates({
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
  State<PompeTemplates> createState() => _PompeTemplateState();
}

class _PompeTemplateState extends State<PompeTemplates> {
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
          part5(),
          const Gap(10)
        ],
      ),
    );
  }

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
              "NewBat",
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
      width: MediaQuery.sizeOf(context).width - 20,
      child: block(
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
                    Expanded(
                      child: textTwoWrap(
                          "Nom technicien : ",
                          userData[getUserClientFromInter(widget.userId)].nom +
                              " " +
                              userData[getUserClientFromInter(widget.userId)]
                                  .prenom),
                    ),
                    Expanded(
                        child: textTwoWrap("Nom client : ",
                            getNameFromInter(widget.clientId))),
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                        child: textTwoWrap("Date visite : ", widget.date)),
                    Expanded(
                      child: textTwoWrap(
                        "Téléphone : ",
                        clients[clientFromId(widget.clientId)].phone
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                        child: textTwoWrap("Dernier entretien : ",
                            returnDateFromSerial(widget.serialNumber, false))),
                    Expanded(
                        child: textTwoWrap("Email : ",
                            clients[clientFromId(widget.clientId)].mail)),
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                        child:
                            textTwoWrap("Lieu de la machine : ", widget.place)),
                    Expanded(
                        child: textTwoWrap(
                            "Adresse : ",
                            clients[clientFromId(widget.clientId)]
                                .adresse)),
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
      width: MediaQuery.sizeOf(context).width - 20,
      child: block(
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
                    Expanded(
                      child: textTwoWrap("Marque : ", widget.marque),
                    ),
                    Expanded(
                        child:
                            textTwoWrap("Type de la machine : ", widget.type)),
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                        child: textTwoWrap(
                            "Date de mise en service : ", widget.miseRoute)),
                    Expanded(
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
        )));
  }

  Widget part4() {
    return SizedBox(
      width: MediaQuery.sizeOf(context).width - 20,
      child: block(
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
                    Expanded(
                      child: textTwoWrap("Contrôle protections électriques : ",
                          boolToString(widget.contrProtElec)),
                    ),
                    Expanded(
                        child: textTwoWrap("Contrôle du vase d'expansion : ",
                            boolToString(widget.contrVaseExp))),
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                        child: textTwoWrap(
                            "Resserage connexions électriques : ",
                            boolToString(widget.resConElec))),
                    Expanded(
                      child: textTwoWrap("Contrôle de l'eau de chauffage : ",
                          boolToString(widget.contrVisuEau)),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                        child: textTwoWrap(
                            "Mesure et contrôle de la tension : ",
                            boolToString(widget.mesContrTen))),
                    Expanded(
                      child: textTwoWrap(
                          "Contrôle du fonctionnement du circulateur : ",
                          boolToString(widget.contrFoncCirc)),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                      child: textTwoWrap("Mesure et contrôle des intensités : ",
                          boolToString(widget.mesContrInt)),
                    ),
                    Expanded(
                      child: textTwoWrap(
                          "Contrôle étanchéité souspape / organe hydraulique : ",
                          boolToString(widget.contrEtanSouHydrau)),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                      child: textTwoWrap(
                          "Contrôle du paramétrage de la régulation : ",
                          boolToString(widget.contrParReg)),
                    ),
                    Expanded(
                        child: textTwoWrap(
                            "Contrôle anode de protection du ballon de stockage : ",
                            boolToString(widget.contrAnodeBall))),
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                      child: textTwoWrap(
                          "Contrôle de l'enclenchement de l'appoint thermique : ",
                          boolToString(widget.contrEnclTher)),
                    ),
                    Expanded(
                        child: textTwoWrap("Contrôle du fluide caloporteur : ",
                            boolToString(widget.contrFluideCal))),
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                      child: textTwoWrap(
                          "Contrôle de l'étanchéité du circuit frigorifique : ",
                          boolToString(widget.contrEtanFri)),
                    ),
                    Expanded(
                        child: textTwoWrap("Contrôle du niveau d'anti-gel : ",
                            boolToString(widget.contrProtAnti))),
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                      child: textTwoWrap(
                          "Contrôle de l'état des calorifuges : ",
                          boolToString(widget.contrEtatCal)),
                    ),
                    Expanded(
                        child: textTwoWrap(
                            "Contrôle visuel et auditif de l'ensemble : ",
                            boolToString(widget.contrVisuEns))),
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                      child: textTwoWrap("Nettoyage de l'échangeur d'air : ",
                          boolToString(widget.netEchAir)),
                    ),
                    Expanded(
                        child: textTwoWrap(
                            "Vérification du fonctionnement de l'ensemble : ",
                            boolToString(widget.essaiFonc))),
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                      child: textTwoWrap(
                          "Contrôle du fonctionnement des ventilos : ",
                          boolToString(widget.contrFoncVentil)),
                    ),
                    Expanded(
                        child: textTwoWrap(
                            "Purge de l'air du circuit hydraulique : ",
                            boolToString(widget.purge))),
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                      child: textTwoWrap("Contrôle des bacs à condensation : ",
                          boolToString(widget.contrEvacCon)),
                    ),
                    Expanded(
                        child: textTwoWrap(
                            "Nettoyage et entretien des filtres :",
                            boolToString(widget.nettEntrFiltre))),
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                      child: textTwoWrap(
                          "Mesure température en fonctionnement (air/eau) : ",
                          boolToString(widget.mesTempFonc)),
                    ),
                    Expanded(
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
        )));
  }

  Widget part5() {
    return SizedBox(
      width: MediaQuery.sizeOf(context).width - 20,
      child: block(
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
        )));
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
