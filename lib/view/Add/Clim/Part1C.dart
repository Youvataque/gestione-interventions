import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gestionnaire_interventions/component/Tool.dart';
import 'package:gestionnaire_interventions/component/Search.dart';
import 'package:gestionnaire_interventions/component/connect.dart';
import 'package:gestionnaire_interventions/view/Add/AddVar.dart';
import 'package:gestionnaire_interventions/view/Add/Clim/Part2C.dart';

class Part1C extends StatefulWidget {
  const Part1C({super.key});

  @override
  State<Part1C> createState() => _Part1CState();
}

class _Part1CState extends State<Part1C> {
  // variables à push
  TextEditingController place = TextEditingController();
  TextEditingController marque = TextEditingController();
  TextEditingController modele = TextEditingController();
  TextEditingController reference = TextEditingController();
  String theClientId = "";
  String date = "";
  //variables fonctionelles
  List<bool> changedC = [false];
  bool changedD = false;
  DateTime dateTime = DateTime.now();
  String errorText = "";
  @override
  Widget build(BuildContext context) {
    return AddTemplate(
      title: "Climatisation",
      errorText: errorText,
      Body: Column(
        children: [
          title("Infos intervention :"),
          Container(
            width: MediaQuery.sizeOf(context).width - 20,
            decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.85),
                borderRadius: BorderRadius.circular(25),
                boxShadow: [
                  BoxShadow(blurRadius: 7, color: Colors.grey.withOpacity(0.7))
                ]),
            child: Column(
              children: [
                const SizedBox(
                  height: 20,
                ),
                bigTextField(place, "Pièce de l'entretiens"),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: 55,
                      width: 150,
                      child: ElevatedButton(
                        onPressed: () {
                          dateAlgo();
                        },
                        style: ElevatedButton.styleFrom(
                            backgroundColor:
                                changedD ? mainColor() : Colors.transparent,
                            surfaceTintColor: Colors.transparent,
                            foregroundColor: mainColor(),
                            shadowColor: Colors.transparent,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                                side: const BorderSide(color: Colors.grey))),
                        child: Text(changedD ? date : "Date",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: changedD ? Colors.white : textColor(),
                                fontSize: 16)),
                      ),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    Container(
                      height: 55,
                      width: 150,
                      child: ElevatedButton(
                        onPressed: () {
                          clientAlgo();
                        },
                        style: ElevatedButton.styleFrom(
                            backgroundColor:
                                changedC[0] ? mainColor() : Colors.transparent,
                            surfaceTintColor: Colors.transparent,
                            foregroundColor: mainColor(),
                            shadowColor: Colors.transparent,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                                side: const BorderSide(color: Colors.grey))),
                        child: Text(
                            changedC[0]
                                ? theClient.nom + " " + theClient.prenom
                                : "Client",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: changedC[0] ? Colors.white : textColor(),
                                fontSize: 16)),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                bigTextField(marque, "Entrez la marque de la machine"),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    litleTextField(modele, "Modèle", false),
                    const SizedBox(
                      width: 20,
                    ),
                    litleTextField(reference, "Référence", false)
                  ],
                ),
                const SizedBox(
                  height: 20,
                )
              ],
            ),
          ),
          const SizedBox(
            height: 20,
          ),
        ],
      ),
      func: Part1CFunc,
    );
  }

  //fonctionelle de la page
  void Part1CFunc() {
    if (date != "") {
      if (theClientId != "") {
        climData["identite"] = "clim";
        climData["place"] = place.text;
        climData["date"] = date;
        climData["clientId"] = theClientId;
        climData["marque"] = marque.text;
        climData["modele"] = modele.text;
        climData["reference"] = reference.text;
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => Part2C()));
      } else {
        setState(() {
          errorText = "Le client est obligatoire";
        });
      }
    } else {
      setState(() {
        errorText = "La date est obligatoire !";
      });
    }
  }

  // fonctionelle bouton Client
  void clientAlgo() async {
    await showSearch(
        context: context,
        delegate:
            Search(SearchContent: clients, Dest3: false, update: changedC));
    setState(() {
      theClientId = theClient.uid;
    });
  }

  // fonctionelle bouton date
  void dateAlgo() {
    showCupertinoModalPopup(
        context: context,
        builder: (BuildContext context) => Center(
            child: Container(
                height: 430,
                width: 350,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20)),
                child: Column(
                  children: [
                    Container(
                      height: 350,
                      width: 350,
                      child: CupertinoDatePicker(
                        initialDateTime: dateTime,
                        onDateTimeChanged: (DateTime newTime) {
                          setState(() {
                            dateTime = newTime;
                          });
                        },
                        use24hFormat: true,
                        mode: CupertinoDatePickerMode.date,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          height: 45,
                          width: MediaQuery.sizeOf(context).width / 2 - 65,
                          child: ElevatedButton(
                            onPressed: () {
                              setState(() {
                                dateTime = DateTime.now();
                                date =
                                    "${dateTime.day}/${dateTime.month}/${dateTime.year}";
                                changedD = true;
                              });
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
                          width: 15,
                        ),
                        Container(
                          height: 45,
                          width: MediaQuery.sizeOf(context).width / 2 - 65,
                          child: ElevatedButton(
                            onPressed: () {
                              setState(() {
                                date =
                                    "${dateTime.day}/${dateTime.month}/${dateTime.year}";
                                changedD = true;
                              });
                              Navigator.pop(context);
                            },
                            style: ElevatedButton.styleFrom(
                                backgroundColor: mainColor(),
                                foregroundColor: Colors.grey,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20))),
                            child: const Text(
                              "Valider",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 17),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ))));
  }
}
