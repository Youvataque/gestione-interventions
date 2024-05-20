import 'package:flutter/cupertino.dart';
import 'package:gap/gap.dart';
import 'package:gestionnaire_interventions/Components/ViewTemplates/PdfTemplates/EnterpriseSigle.dart';
import 'package:gestionnaire_interventions/Components/ViewTemplates/PdfTemplates/InfoBlock.dart';
import 'package:gestionnaire_interventions/Components/ViewTemplates/PdfTemplates/InfoDoubleLine.dart';
import 'package:gestionnaire_interventions/Components/ViewTemplates/PdfTemplates/InfoLine.dart';
import 'package:gestionnaire_interventions/oldComponent/connect.dart';
import 'package:gestionnaire_interventions/oldComponent/oldTool.dart';

///////////////////////////////////////////////////////////////
/// Composant dénérant le template de la page de prévisualisation des interventions de type climatisation
class ClimTemplates extends StatefulWidget {
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
  const ClimTemplates({
    super.key,
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
      required this.userId
  });

  @override
  State<ClimTemplates> createState() => _ClimTemplateState();
}

class _ClimTemplateState extends State<ClimTemplates> {

  List<Map<String, String>> headerData = [];
  List<List<Map<String, String>>> infoChantierData = [];
  List<List<Map<String, String>>> infoTechData = [];
  List<List<Map<String, String>>> observData = [];
  List<List<Map<String, String>>> uniteData = [];
  List<List<Map<String, String>>> groupData = [];

  @override
  Widget build(BuildContext context) {

    headerData = [
      {"title" : "Adresse : ", "content" : entrepriseData.adresse},
      {"title" : "Ville : ", "content" : entrepriseData.ville},
      {"title": "Code postale : ", "content" : entrepriseData.code},
      {"title": "Téléphone : ", "content" : entrepriseData.phone},
      {"title": "Email : ", "content" : entrepriseData.mail},
    ];
    
    infoChantierData = [
      [
        {"title" : "Nom du technicien : ", "content" : "${userData[getUserClientFromInter(widget.userId)].nom} ${userData[getUserClientFromInter(widget.userId)].prenom}"},
        {"title" : "Nom du client : ", "content" : getNameFromInter(widget.clientId)},
      ],
      [
        {"title" : "Date de visite : ", "content" : widget.date},
        {"title" : "Téléphone : ", "content" : clients[clientFromId(widget.clientId)].phone},
      ],
      [
        {"title" : "Dernier entretien : ", "content" : widget.date},
        {"title" : "Email : ", "content" : clients[clientFromId(widget.clientId)].mail},
      ],
      [
        {"title" : "Lieu de la machine : ", "content" : widget.place},
        {"title" : "Adresse : ", "content" : clients[clientFromId(widget.clientId)].adresse},
      ]
    ];

    infoTechData = [
      [
        {"title" : "Marque de l'unité : ", "content" : widget.marque},
        {"title" : "Modèle de l'unité : ", "content" : widget.modele},
      ],
      [
        {"title" : "Référence : ", "content" : widget.reference},
      ],
    ];

    observData = [
      [
        {"title" : "État : ", "content" : "${widget.etat}/10"},
        {"title" : "Passage du testeur de fuite : ", "content" : boolToString(widget.testFuite)},
      ],
      [
        {"title" : "Remarques : ", "content" : widget.observD},
      ],
    ];
    
    uniteData = [
      [
        {"title" : "Température d'arrivée : ", "content" : "${widget.cold == ""? "non testée" : widget.cold}° pour le mode froid et ${widget.hot == ""? "non testée" : widget.hot}° pour le mode chaud."},
      ],
      [
        {"title" : "Dépose du carénage : ", "content" : boolToString(widget.carenage)},
        {"title" : "Dépose des ventilos : ", "content" : boolToString(widget.ventilo)},
      ],
      [
        {"title" : "Dépose du bac à condensation : ", "content" : boolToString(widget.condensa)},
        {"title" : "Nettoyage, dégraissage, etc : ", "content" : boolToString(widget.clean)},
      ],
      [
        {"title" : "Remontage de l'ensemble : ", "content" : boolToString(widget.assemble)},
        {"title" : "Nettoyage du filtre: ", "content" : boolToString(widget.cleanFiltre)},
      ],
      [
        {"title" : "Test des condensations : ", "content" : boolToString(widget.testCondensa)},
      ],
      [
        {"title" : "Remarques : ", "content" : widget.observD2},
      ]
    ];

    groupData = [
      [
        {"title" : "Type de compresseur : ", "content" : widget.typeExt},
        {"title" : "Dépose du capot : ", "content" : boolToString(widget.capot)},
      ],
      [
        {"title" : "Aspiration et brossage : ", "content" : boolToString(widget.aspiBros)},
        {"title" : "Nettoyage et rinçage : ", "content" : boolToString(widget.cleanRin)},
      ],
      [
        {"title" : "Vérification des supports : ", "content" : boolToString(widget.verifSupp)},
        {"title" : "Vérification des ventilos : ", "content" : boolToString(widget.verifVentil)},
      ],
      [
        {"title" : "Vérification du raccord des cuivres : ", "content" : boolToString(widget.verifCuivre)},
      ],
    ];

    return body();
  }

  ///////////////////////////////////////////////////////////////
  /// corp du widget ClimTemplate
  Widget body() {

    List<String> compTitle = ["Informations de chantier", "Informations techniques", "Observations visuelles", "Unité intérieure", "Groupe extérieur"];    
    List<List<List<Map<String, String>>>> compData = [infoChantierData, infoTechData, observData, uniteData, groupData];

    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Gap(10),
          header(),
          Column(
            children: List.generate(
              compTitle.length,
              (index) => presData(compTitle[index], compData[index])
            ),
          )
        ],
      ),
    );
  }

  ///////////////////////////////////////////////////////////////
  /// haut de page avec les infos d'entreprise
  Widget header() {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.95,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const EntrepriseSigle(),
          InfoBlock(
            content: InfoLine(
              lines: headerData
            )
          )
        ],
      ),
    );
  }

  ///////////////////////////////////////////////////////////////
  /// mes en forme les données avec les bons composants
  Widget presData(String title, List<List<Map<String, String>>> data) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.95,
      child: Column(
        children: [
          const Gap(10),
          InfoBlock(
            title: title,
            content: InfoDoubleLine(
              lines: data
            )
          )
        ],
      ),
    );
  }

}