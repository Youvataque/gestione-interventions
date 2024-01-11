import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gestionnaire_interventions/component/tool.dart';
import 'package:gestionnaire_interventions/component/connect.dart';
import 'package:gestionnaire_interventions/view/Add/AddVar.dart';
import 'package:gestionnaire_interventions/view/Add/Pompe/Part2P.dart';

import '../../../component/Search.dart';

class Part1P extends StatefulWidget {
  const Part1P({super.key});

  @override
  State<Part1P> createState() => _Part1PState();
}

class _Part1PState extends State<Part1P> {
  // variables à push
  TextEditingController place = TextEditingController();
  TextEditingController type = TextEditingController();
  TextEditingController marque = TextEditingController();
  TextEditingController puissance = TextEditingController();
  TextEditingController serialNumber = TextEditingController();
  String theClientId = "";
  String date = "";
  String miseRoute = "";
  //variables fonctionelles
  List<bool> changedC = [false];

  bool changedD = false;
  DateTime dateD = DateTime.now();

  bool changedR = false;
  DateTime dateR = DateTime.now();

  String errorText = "";
  @override
  Widget build(BuildContext context) {
    return AddTemplate(
        title: "Pompe à chaleur",
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
                    BoxShadow(
                        color: Colors.grey.withOpacity(0.7), blurRadius: 7)
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
                            dateAlgo2();
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
                              backgroundColor: changedC[0]
                                  ? mainColor()
                                  : Colors.transparent,
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
                                  color:
                                      changedC[0] ? Colors.white : textColor(),
                                  fontSize: 16)),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  bigTextField(type, "Entrez le type de la machine"),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      litleTextField(marque, "Marque", false),
                      const SizedBox(
                        width: 20,
                      ),
                      litleTextField(puissance, "Puissance", false)
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    height: 55,
                    width: 300,
                    child: ElevatedButton(
                      onPressed: () {
                        dateAlgo1();
                      },
                      style: ElevatedButton.styleFrom(
                          backgroundColor:
                              changedR ? mainColor() : Colors.transparent,
                          surfaceTintColor: Colors.transparent,
                          foregroundColor: mainColor(),
                          shadowColor: Colors.transparent,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                              side: const BorderSide(color: Colors.grey))),
                      child: Text(
                          changedR ? miseRoute : "Date de mise en route",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: changedR ? Colors.white : textColor(),
                              fontSize: 16)),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  bigTextField(serialNumber, "numéro de série"),
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
        ),
        func: Part1CFunc,
        mainIcon: CupertinoIcons.sun_haze);
  }

  //fonctionelle de la page
  void Part1CFunc() {
    if (date != "") {
      if (theClientId != "") {
        pompeData["identite"] = "pompe";
        pompeData["place"] = place.text;
        pompeData["date"] = date;
        pompeData["clientId"] = theClientId;
        pompeData["type"] = type.text;
        pompeData["marque"] = marque.text;
        pompeData["puissance"] = puissance.text;
        pompeData["miseRoute"] = miseRoute;
        pompeData["serialNumber"] = serialNumber.text;
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => Part2P()));
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
  void dateAlgo1() {
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
                        initialDateTime: dateR,
                        onDateTimeChanged: (DateTime newTime) {
                          setState(() {
                            dateR = newTime;
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
                                dateR = DateTime.now();
                                miseRoute =
                                    "${twoDigits(dateR.day)}/${twoDigits(dateR.month)}/${dateR.year}";
                                changedR = true;
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
                                miseRoute =
                                    "${twoDigits(dateR.day)}/${twoDigits(dateR.month)}/${dateR.year}";
                                changedR = true;
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

  // fonctionelle bouton date
  void dateAlgo2() {
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
                        initialDateTime: dateD,
                        onDateTimeChanged: (DateTime newTime) {
                          setState(() {
                            dateD = newTime;
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
                                dateD = DateTime.now();
                                date =
                                    "${twoDigits(dateD.day)}/${twoDigits(dateD.month)}/${dateD.year}";
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
                                    "${twoDigits(dateD.day)}/${twoDigits(dateD.month)}/${dateD.year}";
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
