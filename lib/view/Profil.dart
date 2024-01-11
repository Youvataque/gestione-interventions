import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gestionnaire_interventions/component/connect.dart';
import 'package:gestionnaire_interventions/component/tool.dart';
import 'package:gestionnaire_interventions/main.dart';

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
    userData[getUserFromInter()].nom,
    userData[getUserFromInter()].prenom,
    userData[getUserFromInter()].mail,
    userData[getUserFromInter()].phone
  ];
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          TopOfView(
            title: "Profil et Entreprise",
            height: 60,
            width: MediaQuery.sizeOf(context).width - 20,
            lead: Icon(
              CupertinoIcons.person_circle_fill,
              size: 40,
              color: textColor(),
            ),
          ),
          const SizedBox(
            height: 60,
          ),
          title("Informations Entreprise :"),
          Body(titleListE, contentListE, contentListE.length),
          const SizedBox(
            height: 30,
          ),
          title("Informations Utilisateur :"),
          Body(titleListP, contentListP, contentListP.length),
          const SizedBox(
            height: 20,
          ),
          Container(
            height: 55,
            width: 200,
            child: ElevatedButton(
              onPressed: () {
                SignOut();
              },
              style: ElevatedButton.styleFrom(
                  backgroundColor: mainColor(),
                  foregroundColor: Colors.grey,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20))),
              child: const Text(
                "Deconnexion",
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 17),
              ),
            ),
          ),
          const SizedBox(
            height: 120,
          )
        ],
      ),
    );
  }

  Column Body(List<String> title, List<String> content, int length) {
    // constructeur du champ d'information
    return Column(
      children: [
        Container(
            width: MediaQuery.sizeOf(context).width - 20,
            decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.85),
                borderRadius: BorderRadius.circular(25),
                boxShadow: [
                  BoxShadow(color: Colors.grey.withOpacity(0.7), blurRadius: 7)
                ]),
            child: ListView.builder(
                padding: EdgeInsets.only(top: 13, bottom: 13),
                shrinkWrap: true,
                itemCount: length,
                physics: NeverScrollableScrollPhysics(),
                itemBuilder: (BuildContext context, int index) {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const SizedBox(
                        height: 7,
                      ),
                      Text(
                        title[index],
                        style: TextStyle(
                            fontSize: 19,
                            fontWeight: FontWeight.bold,
                            color: textColor()),
                      ),
                      Text(
                        content[index],
                        style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.bold,
                            color: mainColor()),
                      ),
                      const SizedBox(
                        height: 7,
                      )
                    ],
                  );
                }))
      ],
    );
  }

  Future SignOut() async {
    try {
      await FirebaseAuth.instance.signOut();
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => MainApp(),
          ));
    } catch (error) {
      print(error.toString());
    }
  }
}
