
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:gestionnaire_interventions/Components/ButtonTemplates/MainButton.dart';
import 'package:gestionnaire_interventions/Components/FondamentalAppCompo/CloudBack.dart';
import 'package:gestionnaire_interventions/Components/ViewTemplates/InfoDoubleText.dart';
import 'package:gestionnaire_interventions/Components/ViewTemplates/TitleText.dart';
import 'package:gestionnaire_interventions/oldComponent/connect.dart';
import 'package:gestionnaire_interventions/oldComponent/oldTool.dart';
import 'package:gestionnaire_interventions/view/Logins/SignIn.dart';

///////////////////////////////////////////////////////////////
/// Page profil
class Profil extends StatefulWidget {
  const Profil({super.key});

  @override
  State<Profil> createState() => _ProfilState();
}

class _ProfilState extends State<Profil> {

  List<String> titleListE = [
    "Nom de l'entreprise :",
    "Contact Téléphone :",
    "Contact Mail :",
    "Numéro de siret :",
    "Attestation de Capacité :",
    "Code Postal :",
    "Ville de l'entreprise :",
    "Adresse de l'entreprise :"
  ];
  List<String> contentListE = [
    entrepriseData.nom,
    entrepriseData.phone,
    entrepriseData.mail,
    entrepriseData.siret,
    entrepriseData.capacite,
    entrepriseData.code,
    entrepriseData.ville,
    entrepriseData.adresse
  ];
  List<String> titleListP = [
      "Nom de l'utilisateur :",
      "Prenom de l'utilisateur :",
      "Contact Mail :",
      "Contact téléphone :"
  ];
  List<String> contentListP = [
      userData[getUserClientFromInter(FirebaseAuth.instance.currentUser!.uid)].nom,
      userData[getUserClientFromInter(FirebaseAuth.instance.currentUser!.uid)].prenom,
      userData[getUserClientFromInter(FirebaseAuth.instance.currentUser!.uid)].mail,
      userData[getUserClientFromInter(FirebaseAuth.instance.currentUser!.uid)].phone
  ];
  @override
  Widget build(BuildContext context) {
    return body();
  }

///////////////////////////////////////////////////////////////
/// corp du code
Column body() {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      const TitleText(title: "Informations Entreprise :"),
      const Gap(5),
      infoGen(titleListE, contentListE, contentListE.length),
      const Gap(30),
      const TitleText(title: "Informations Utilisateur :"),
      const Gap(5),
      infoGen(titleListP, contentListP, contentListP.length),
      const Gap(30),
      MainButton(
        func: () => SignOut(),
        title: "Déconnexion",
      ),
      const Gap(30)
    ],
  );
}

///////////////////////////////////////////////////////////////
/// génère les informations d'entreprise
  Column infoGen(List<String> title, List<String> content, int length) { // constructeur du champ d'information
    return Column(
      children: [
        CloudBack(
          child: Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Column(
              children: List.generate(
                content.length,
                (index) => Column(
                  children: [
                    InfoDoubleText(title: title[index], content: content[index]),
                    const Gap(15)
                  ],
                )
              ),
            ),
          )
        )
      ],
    );
  }

///////////////////////////////////////////////////////////////
/// Logique de déconnexion
  Future SignOut() async {
    try {
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => const SignIn()),
        (Route<dynamic> route) => false, 
      );
      Future.delayed(
        Duration(seconds: 2),
        () {
          FirebaseAuth.instance.signOut();
        }
      );
    } catch (error) {
      print(error.toString());
    }
  }
}
