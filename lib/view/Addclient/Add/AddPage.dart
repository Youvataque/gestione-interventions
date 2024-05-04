
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:gestionnaire_interventions/Components/ButtonTemplates/MainButton.dart';
import 'package:gestionnaire_interventions/Components/ButtonTemplates/MyTextField.dart';
import 'package:gestionnaire_interventions/Components/ButtonTemplates/StackedField.dart';
import 'package:gestionnaire_interventions/Components/FondamentalAppCompo/CloudBack.dart';
import 'package:gestionnaire_interventions/Components/FondamentalAppCompo/TopOfView.dart';
import 'package:gestionnaire_interventions/Components/Structure/DoubleTextfield.dart';
import 'package:gestionnaire_interventions/Components/Tools/ErrorTools/LoginsError.dart';
import 'package:gestionnaire_interventions/Components/ViewTemplates/BackTemplate.dart';
import 'package:gestionnaire_interventions/Components/ViewTemplates/ErrorView.dart';
import 'package:gestionnaire_interventions/Components/ViewTemplates/TitleText.dart';
import 'package:gestionnaire_interventions/oldComponent/Struct.dart';
import 'package:gestionnaire_interventions/oldComponent/connect.dart';
import 'package:gestionnaire_interventions/main.dart';

///////////////////////////////////////////////////////////////
/// page d'ajout (peut être appelé en tant que page d'edit)
class AddPage extends StatefulWidget {
  final Client? myClient;
  final bool add;
  final UserCredential? uid;
  const AddPage({
    super.key,
    this.myClient,
    this.add = true,
    this.uid,
  });

  @override
  State<AddPage> createState() => _AddPageState();
}

class _AddPageState extends State<AddPage> {
  String errorText = "";
  TextEditingController nom = TextEditingController();
  TextEditingController prenom = TextEditingController();
  List<TextEditingController> controller = [
    TextEditingController(),
    TextEditingController(),
    TextEditingController()
  ];
  List<TextInputType> typeInput = [
    TextInputType.emailAddress,
    TextInputType.phone,
    TextInputType.streetAddress
  ];
  List<String> hintText = [];
  @override
  Widget build(BuildContext context) {
    hintText = [
      widget.add ? "Entrez l'adresse email" : widget.myClient!.mail,
      widget.add ? "Entrez le numéro de téléphone" : widget.myClient!.phone,
      widget.add ? "Entrez l'adresse du client" : widget.myClient!.adresse,
    ];
    return BackTemplate(
      content: body(),
    );
  }

///////////////////////////////////////////////////////////////
/// corp du code
  SingleChildScrollView body() {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TopOfView(
            width: MediaQuery.sizeOf(context).width - 30,
            height: 55,
            withBack: true,
            passedContext: context,
            title: widget.add
                ? "Ajoutons un client"
                : "Éditons un client",
            lead: Icon(
              CupertinoIcons.person_circle,
              size: 40,
              color: Theme.of(context).textTheme.labelLarge!.color,
            ),
          ),
          pageGen(),
          Align(
            alignment: Alignment.center,
            child: ErrorView(
              key: UniqueKey(),
              error: errorText
            ),
          ),
          MainButton(func: () => widget.add ? addClient() : EditClient(), title: widget.add? "Ajouter" : "Modifier"),
          
        ],
      ),
    );
  }

///////////////////////////////////////////////////////////////
/// générateur de page
  Column pageGen() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: 80,
        ),
        TitleText(title: widget.add ? "Entrez ses coordonées :" : "Modifiez ses coordonées :"),
        const Gap(5),
        CloudBack(
          child:  Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              StackedField(
                data: DoubleTextfield(
                  title1: widget.add ? "Le nom" : widget.myClient!.nom,
                  title2: widget.add ? "Le prénom" : widget.myClient!.prenom,
                  controller1: nom,
                  controller2: prenom
                )
              ),
              const Gap(20),
              Column(
                children: List.generate(
                  controller.length,
                  (index) => Column(
                    children: [
                      MyTextField(
                        keyboardType: typeInput[index],
                        controller: controller[index],
                        hintText: hintText[index]
                      ),
                      const Gap(20)
                    ],
                  )
                ),
              )
            ],
          ),
        ),
        const Gap(20)
      ],
    );
  }

///////////////////////////////////////////////////////////////
/// Logique d'ajout d'un client
  void addClient() async {
    TextEditingController mail = controller[0];
    TextEditingController phone = controller[1];
    TextEditingController adresse = controller[2];
    DocumentReference docRef = db.collection("Clients").doc();
    if (nom.text == "") {
      setState(() {
        errorText = "Vous devez saisir le nom.";
      });
      return;
    }
    if (prenom.text == "") {
      setState(() {
        errorText = "Vous devez saisir le prenom.";
      });
      return;
    }
    if (phone.text == "") {
      setState(() {
        errorText = "Vous devez saisir le numéro de téléphone";
      });
      return;
    }
    if (mail.text == "") {
      setState(() {
        errorText = "Vous devez saisir l'email.";
      });
      return;
    }
    if (adresse.text == "") {
      setState(() {
        errorText = "Vous devez saisir l'adresse.";
      });
      return;
    }
    try {
      docRef.set({
      "nom": nom.text,
      "prenom": prenom.text,
      "mail": mail.text,
      "phone": phone.text,
      "adresse": adresse.text,
    });
    setState(() {
      errorText = "Client enregistré !";
    });
    Future.delayed(const Duration(seconds: 2), () {
      Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => const MainApp()));
    });
    clients = await getClients();
    setState(() {});
    } catch (error) {
      errorText = loginsError(error.toString());
    }
  }

///////////////////////////////////////////////////////////////
/// Logique d'édit d'un client
  void EditClient() async {
    TextEditingController mail = controller[0];
    TextEditingController phone = controller[1];
    TextEditingController adresse = controller[2];
    DocumentReference docRef = db.collection("Clients").doc(widget.myClient!.uid);
      try {
        docRef.set({
          if (nom.text != "") "nom": nom.text,
          if (prenom.text != "") "prenom": prenom.text,
          if (mail.text != "") "mail": mail.text,
          if (phone.text != "") "phone": phone.text,
          if (adresse.text != "") "adresse": adresse.text,
        }, SetOptions(merge: true));
        setState(() {
          errorText = "L'utilisateur a été modifié !";
        });
        clients = await getClients();
        setState(() {});
        Future.delayed(const Duration(seconds: 2), () {
          Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => const MainApp()));
        });
      } catch (error) {
        setState(() {
          errorText = error.toString();
        });
      }
  }
}

