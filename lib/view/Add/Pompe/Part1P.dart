import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:gestionnaire_interventions/Components/ButtonTemplates/ClientPicker.dart';
import 'package:gestionnaire_interventions/Components/ButtonTemplates/MyTextField.dart';
import 'package:gestionnaire_interventions/Components/ButtonTemplates/PickerButton.dart';
import 'package:gestionnaire_interventions/Components/ButtonTemplates/StackedField.dart';
import 'package:gestionnaire_interventions/Components/FondamentalAppCompo/CloudBack.dart';
import 'package:gestionnaire_interventions/Components/Structure/DoubleTextfield.dart';
import 'package:gestionnaire_interventions/Components/Structure/PickerData.dart';
import 'package:gestionnaire_interventions/Components/Tools/FormatTool/OnetoTwoInt.dart';
import 'package:gestionnaire_interventions/Components/ViewTemplates/TitleText.dart';
import 'package:gestionnaire_interventions/oldComponent/oldTool.dart';
import 'package:gestionnaire_interventions/view/Add/AddVar.dart';
import 'package:gestionnaire_interventions/view/Add/Pompe/Part2P.dart';

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
  PickerData startDate = PickerData(
      title: "Date de début",
      dateTime: DateTime.now(),
      abortFunc: () {},
      validateFunc: () {},
      onTimeChanged: (p0) {},
      selected: false);
  PickerData routeDate = PickerData(
      title: "Date de mise en route",
      dateTime: DateTime.now(),
      abortFunc: () {},
      validateFunc: () {},
      onTimeChanged: (p0) {},
      selected: false);
  String errorText = "";
  @override
  Widget build(BuildContext context) {
    startDate.abortFunc = () {
      abort1Func();
    };
    startDate.validateFunc = () {
      validate1Func();
    };
    startDate.onTimeChanged = (p0) {
      startDate.dateTime = p0;
    };

    routeDate.abortFunc = () {
      abort2Func();
    };
    routeDate.validateFunc = () {
      validate2Func();
    };
    routeDate.onTimeChanged = (p0) {
      routeDate.dateTime = p0;
    };
    return AddTemplate(
        title: "Pompe à chaleur",
        errorText: errorText,
        Body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const TitleText(title: "Infos intervention :"),
            const Gap(5),
            CloudBack(
              child: Column(
                children: [
                  const Gap(20),
                  SizedBox(
                    height: 50,
                    child: MyTextField(
                      controller: place,
                      hintText: "Pièce de l'entretiens",
                    ),
                  ),
                  const Gap(20),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: SizedBox(
                      height: 50,
                      child: Row(
                        children: [
                          Expanded(child: PickerButton(data: startDate),),
                          const Gap(20),
                          ClientPicker(update: ((p0) {
                            theClientId = p0.uid;
                          }))
                        ],
                      ),
                    ),
                  ),
                  const Gap(20),
                  SizedBox(
                    height: 50,
                    child: MyTextField(
                      controller: type,
                      hintText: "Entrez le type de la machine",
                    ),
                  ),
                  const Gap(20),
                  StackedField(
                      data: DoubleTextfield(
                          title1: "Marque",
                          title2: "Puissance",
                          controller1: marque,
                          controller2: puissance)),
                  const Gap(20),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: SizedBox(
                      height: 50,
                      width: double.infinity,
                      child: PickerButton(data: routeDate),
                    ),
                  ),
                  const Gap(20),
                  SizedBox(
                    height: 50,
                    child: MyTextField(
                      controller: serialNumber,
                      hintText: "numéro de série",
                    ),
                  ),
                  const Gap(20),
                ],
              ),
            ),
            const Gap(20),
          ],
        ),
        func: Part1CFunc,
        mainIcon: CupertinoIcons.sun_haze);
  }

  //fonctionelle de la page
  void Part1CFunc() {
    if (startDate.title != "Date de début") {
      if (theClientId != "") {
        pompeData["identite"] = "pompe";
        pompeData["place"] = place.text;
        pompeData["date"] = startDate.title;
        pompeData["clientId"] = theClientId;
        pompeData["type"] = type.text;
        pompeData["marque"] = marque.text;
        pompeData["puissance"] = puissance.text;
        pompeData["miseRoute"] = routeDate.title;
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

///////////////////////////////////////////////////////////////
  /// logique des boutons de date de début
  void abort1Func() {
    setState(() {
      startDate.dateTime = DateTime.now();
      startDate.title =
          "${oneToTwoInt(startDate.dateTime.day)}/${oneToTwoInt(startDate.dateTime.month)}/${oneToTwoInt(startDate.dateTime.year)}";
      startDate.selected = true;
    });
  }

  void validate1Func() {
    setState(() {
      startDate.title =
          "${oneToTwoInt(startDate.dateTime.day)}/${oneToTwoInt(startDate.dateTime.month)}/${oneToTwoInt(startDate.dateTime.year)}";
      startDate.selected = true;
    });
  }

///////////////////////////////////////////////////////////////
  /// logique des boutons de date route
  void abort2Func() {
    setState(() {
      routeDate.dateTime = DateTime.now();
      routeDate.title =
          "${oneToTwoInt(routeDate.dateTime.day)}/${oneToTwoInt(routeDate.dateTime.month)}/${oneToTwoInt(routeDate.dateTime.year)}";
      routeDate.selected = true;
    });
  }

  void validate2Func() {
    setState(() {
      routeDate.title =
          "${oneToTwoInt(routeDate.dateTime.day)}/${oneToTwoInt(routeDate.dateTime.month)}/${oneToTwoInt(routeDate.dateTime.year)}";
      routeDate.selected = true;
    });
  }
}
