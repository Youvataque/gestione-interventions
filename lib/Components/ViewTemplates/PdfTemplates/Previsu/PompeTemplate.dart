import 'package:flutter/cupertino.dart';
import 'package:gap/gap.dart';
import 'package:gestionnaire_interventions/Components/ViewTemplates/PdfTemplates/EnterpriseSigle.dart';
import 'package:gestionnaire_interventions/Components/ViewTemplates/PdfTemplates/InfoBlock.dart';
import 'package:gestionnaire_interventions/Components/ViewTemplates/PdfTemplates/InfoDoubleLine.dart';
import 'package:gestionnaire_interventions/Components/ViewTemplates/PdfTemplates/InfoLine.dart';
import 'package:gestionnaire_interventions/Components/ViewTemplates/PdfTemplates/PdfButton.dart';
import 'package:gestionnaire_interventions/oldComponent/connect.dart';
import 'package:gestionnaire_interventions/oldComponent/oldTool.dart';

///////////////////////////////////////////////////////////////
/// Composant générant le template de la page de prévisualisation des interventions de type pompe
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

  late List<Map<String, String>> headerData;
  late List<List<Map<String, String>>> techData;
  late List<List<Map<String, String>>> infoData;
  late List<List<Map<String, String>>> checkData;
  late List<List<Map<String, String>>> comData;
  @override
  Widget build(BuildContext context) {

    // récupération des données de l'entreprise
    headerData = [
      {"title" : "Adresse : ", "content" : entrepriseData.adresse},
      {"title" : "Ville : ", "content" : entrepriseData.ville},
      {"title": "Code postale : ", "content" : entrepriseData.code},
      {"title": "Téléphone : ", "content" : entrepriseData.phone},
      {"title": "Email : ", "content" : entrepriseData.mail},
    ];

    // récupération des données de l'intervention
    infoData = [
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

    // récupération des données de technique l'intervention
    techData = [
      [
        {"title" : "Marque de l'unité : ", "content" : widget.marque},
        {"title" : "Type de l'unité : ", "content" : widget.type},
      ],
      [
        {"title" : "Date de mise en service: ", "content" : widget.miseRoute},
        {"title" : "Puissance : ", "content" : widget.puissance},
      ],
      [
        {"title" : "Numéro de série : ", "content" : widget.serialNumber},
      ],
    ];

    // récupération des données des points de contrôle
    checkData = [
      [
        {"title" : "Contrôle protections électriques : ", "content" : boolToString(widget.contrProtElec)},
        {"title" : "Contrôle du vase d'expansion : ", "content" : boolToString(widget.contrVaseExp)},
      ],
      [
        {"title" : "Resserage connexion électriques : ", "content" : boolToString(widget.resConElec)},
        {"title" : "Contrôle de l'eau de chauffage : ", "content" : boolToString(widget.contrVisuEau)},
      ],
      [
        {"title" : "Mesure et contrôle de la tension : ", "content" : boolToString(widget.mesContrTen)},
        {"title" : "Contrôle du fonctionnement du circulateur : ", "content" : boolToString(widget.contrFoncCirc)},
      ],
      [
        {"title" : "Mesure et contrôle des intensités : ", "content" : boolToString(widget.mesContrInt)},
        {"title" : "Contrôle étanchéité souspape / organe hydraulique : ", "content" : boolToString(widget.contrEtanSouHydrau)},
      ],
      [
        {"title" : "Contrôle du paramétrage régulation : ", "content" : boolToString(widget.contrParReg)},
        {"title" : "Contrôle anode de protection ballon de stockage : ", "content" : boolToString(widget.contrAnodeBall)},
      ],
      [
        {"title" : "Contrôle enclenchement thermique : ", "content" : boolToString(widget.contrEnclTher)},
        {"title" : "Contrôle du fluide caloporteur : ", "content" : boolToString(widget.contrFluideCal)},
      ],
      [
        {"title" : "Contrôle étanchéité frigorifique : ", "content" : boolToString(widget.contrEtanFri)},
        {"title" : "Contrôle du niveau d'antigel : ", "content" : boolToString(widget.contrProtAnti)},
      ],
      [
        {"title" : "Contrôle état calorifuge : ", "content" : boolToString(widget.contrEtatCal)},
        {"title" : "Contrôle visuel et auditif de l'ensemble : ", "content" : boolToString(widget.contrVisuEns)},
      ],
      [
        {"title" : "Nettoyage échangeur air : ", "content" : boolToString(widget.netEchAir)},
        {"title" : "Essai de fonctionnement : ", "content" : boolToString(widget.essaiFonc)},
      ],
      [
        {"title" : "Contrôle fonctionnement ventilateur : ", "content" : boolToString(widget.contrFoncVentil)},
        {"title" : "Purge de l'air du circuit hydraulique : ", "content" : boolToString(widget.purge)},
      ],
      [
        {"title" : "Contrôle des bacs à condensation : ", "content" : boolToString(widget.contrEvacCon)},
        {"title" : "Nettoyage et entretien des filtres : ", "content" : boolToString(widget.nettEntrFiltre)},
      ],
      [
        {"title" : "Mesure température de fonctionnement : ", "content" : boolToString(widget.mesTempFonc)},
        {"title" : "Contrôle pression vases d'expansion : ", "content" : boolToString(widget.contrPressVase)}
      ],
      [
        {"title" : "Réglage des vases si nécéssaire : ", "content" : boolToString(widget.regonVase)},
      ]
    ];

    // récupération des données des commentaires
    comData = [
      [{"title" : "Défauts corrigés : ", "content" : widget.defautsCorr}],
      [{"title" : "Travaux à prévoir : ", "content" : widget.aPrevoir}],
      [{"title" : "Recommandations : ", "content" : widget.recommandation}],
      [{"title" : "Gains réalisables : ", "content" : widget.gains}],
    ];

    return PdfButton(
      clientName: getNameFromInter(widget.clientId),
      child: body()
    );
  }

  ///////////////////////////////////////////////////////////////
  /// corp du widget PompeTemplate
  Widget body() {

    List<String> compTitle = ["Informations","Informations techniques", "Points de contrôle", "Commentaires"];    
    List<List<List<Map<String, String>>>> compData = [infoData, techData, checkData, comData];

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
          ),
          const Gap(10),
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
          ),
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