import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gestionnaire_interventions/component/Struct.dart';
import 'package:gestionnaire_interventions/component/Tool.dart';
import 'package:gestionnaire_interventions/component/connect.dart';
import 'package:gestionnaire_interventions/main.dart';

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
  TextEditingController phone = TextEditingController();
  TextEditingController mail = TextEditingController();
  TextEditingController adresse = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Container(
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("src/BackgroundAppWhite.jpg"),
                  fit: BoxFit.cover)),
          child: Scaffold(
            backgroundColor: Colors.transparent,
            body: SingleChildScrollView(
              child: Column(
                children: [
                  TopOfView(
                    width: MediaQuery.sizeOf(context).width - 20,
                    height: 60,
                    title: widget.add
                        ? "Ajoutons un client"
                        : "Modifions un client",
                    lead: Icon(
                      CupertinoIcons.person_circle,
                      size: 40,
                      color: textColor(),
                    ),
                  ),
                  Body(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height: 55,
                        width: MediaQuery.sizeOf(context).width / 2 - 45,
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.grey.shade400,
                              foregroundColor: mainColor(),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20))),
                          child: Text(
                            "Retour",
                            style: TextStyle(
                                color: textColor(),
                                fontWeight: FontWeight.bold,
                                fontSize: 17),
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 30,
                      ),
                      Container(
                        height: 55,
                        width: MediaQuery.sizeOf(context).width / 2 - 45,
                        child: ElevatedButton(
                          onPressed: () {
                            widget.add ? addClient() : EditClient();
                          },
                          style: ElevatedButton.styleFrom(
                              backgroundColor: mainColor(),
                              foregroundColor: Colors.grey,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20))),
                          child: Text(
                            widget.add ? "Envoyer" : "Modifier",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 17),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: Text(
                      errorText,
                      style: const TextStyle(
                          color: Colors.red, fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            ),
          )),
    );
  }

  Column Body() {
    return Column(
      children: [
        const SizedBox(
          height: 80,
        ),
        title(widget.add ? "Entrez ses coordonées" : "Modifiez ses coordonées"),
        Container(
          width: MediaQuery.sizeOf(context).width - 20,
          decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.85),
              borderRadius: BorderRadius.circular(25),
              boxShadow: const [BoxShadow(blurRadius: 7, color: Colors.grey)]),
          child: Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  litleTextField(
                      nom,
                      widget.add ? "Entrez le nom" : widget.myClient!.nom,
                      false),
                  const SizedBox(
                    width: 20,
                  ),
                  litleTextField(
                      prenom,
                      widget.add ? "Entrez le prenom" : widget.myClient!.prenom,
                      false)
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              bigTextField(
                  mail,
                  widget.add
                      ? "Entrez l'adresse email"
                      : widget.myClient!.mail),
              const SizedBox(
                height: 20,
              ),
              bigTextField(
                  phone,
                  widget.add
                      ? "Entrez le numéro de téléphone"
                      : widget.myClient!.phone),
              const SizedBox(
                height: 20,
              ),
              bigTextField(
                  adresse,
                  widget.add
                      ? "Entrez l'adresse du client"
                      : widget.myClient!.adresse),
              const SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 20,
        ),
      ],
    );
  }

  void addClient() async {
    DocumentReference docRef = db.collection("Clients").doc();
    if (nom.text != "") {
      if (prenom.text != "") {
        if (mail.text != "") {
          if (phone.text != "") {
            if (adresse.text != "") {
              try {
                docRef.set({
                  if (nom.text != "") "nom": nom.text,
                  if (prenom.text != "") "prenom": prenom.text,
                  if (mail.text != "") "mail": mail.text,
                  if (phone.text != "") "phone": phone.text,
                  if (adresse.text != "") "adresse": adresse.text,
                });
                setState(() {
                  errorText = "L'utilisateur a été ajouté !";
                });
                clients = await getClients();
                setState(() {});
                Future.delayed(Duration(seconds: 1), () {
                  setState(() {
                    errorText = "";
                  });
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) => MainApp()));
                });
              } catch (error) {
                setState(() {
                  errorText = error.toString();
                });
              }
            } else {
              setState(() {
                errorText = "Veuillez entrer une adresse !";
              });
            }
          } else {
            setState(() {
              errorText = "Veuillez entrer un numéro de téléphone !";
            });
          }
        } else {
          setState(() {
            errorText = "Veuillez entrer un email !";
          });
        }
      } else {
        setState(() {
          errorText = "Veuillez entrer un prenom !";
        });
      }
    } else {
      setState(() {
        errorText = "Veuillez entrer un nom !";
      });
    }
    clients = await getClients();
    setState(() {});
  }

  void EditClient() async {
    DocumentReference docRef =
        db.collection("Clients").doc(widget.myClient!.uid);
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
      Future.delayed(Duration(seconds: 1), () {
        setState(() {
          errorText = "";
        });
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => MainApp()));
      });
    } catch (error) {
      setState(() {
        errorText = error.toString();
      });
    }
  }
}
