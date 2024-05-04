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
import 'package:gestionnaire_interventions/oldComponent/Struct.dart';
import 'package:gestionnaire_interventions/oldComponent/oldTool.dart';
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
  Client tempClient = const Client();
  PickerData startDate = PickerData(
    title: "Date de début",
    dateTime: DateTime.now(),
    abortFunc: () {},
    validateFunc: () {},
    onTimeChanged:(p0) {
    },
    selected: false
  );
  String errorText = "";
  @override
  Widget build(BuildContext context) {
      startDate.abortFunc =() {
      abort1Func();
    };
    startDate.validateFunc =() {
      validate1Func();
    };
    startDate.onTimeChanged = (p0) {
    startDate.dateTime = p0;
    };
    return AddTemplate(
      title: "Climatisation",
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
                  child: MyTextField(controller: place, hintText: "Pièce de l'entretiens"),
                ),                  
                const Gap(20),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: SizedBox(
                    height: 50,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(child: PickerButton(data: startDate)),
                        const Gap(20),
                        ClientPicker(
                          update: ((p0) => setState(() {
                            tempClient = p0;
                          }))
                        ,)
                      ],
                    ),
                  )
                ),
                const Gap(20),
                SizedBox(
                  height: 50,
                  child: MyTextField(
                    controller: marque,
                    hintText: "Entrez la marque de la machine",
                  ),
                ),
                const Gap(20),
                StackedField(
                  data: DoubleTextfield(
                    title1: "Modèle",
                    title2: "Référence",
                    controller1: modele,
                    controller2: reference
                  )
                ),
                const Gap(20)
              ],
            ),
          ),
          const Gap(20)
        ],
      ),
      func: Part1CFunc,
    );
  }

  //fonctionelle de la page
  void Part1CFunc() {
    if (startDate.title != "Date de début") {
      if (tempClient.uid != "") {
        climData["identite"] = "clim";
        climData["place"] = place.text;
        climData["date"] = startDate.title;
        climData["clientId"] = tempClient.uid;
        climData["marque"] = marque.text;
        climData["modele"] = modele.text;
        climData["reference"] = reference.text;
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => const Part2C()));
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
      startDate.title = "${oneToTwoInt(startDate.dateTime.day)}/${oneToTwoInt(startDate.dateTime.month)}/${oneToTwoInt(startDate.dateTime.year)}";
      startDate.selected = true;
    });
  }

  void validate1Func() {
    setState(() {
      startDate.title = "${oneToTwoInt(startDate.dateTime.day)}/${oneToTwoInt(startDate.dateTime.month)}/${oneToTwoInt(startDate.dateTime.year)}";
      startDate.selected = true;
    });
  }
}
