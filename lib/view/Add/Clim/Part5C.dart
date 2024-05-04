import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:gestionnaire_interventions/Components/ButtonTemplates/MyTextField.dart';
import 'package:gestionnaire_interventions/Components/ButtonTemplates/StackedField.dart';
import 'package:gestionnaire_interventions/Components/FondamentalAppCompo/CloudBack.dart';
import 'package:gestionnaire_interventions/Components/Structure/DoubleTextfield.dart';
import 'package:gestionnaire_interventions/Components/ViewTemplates/TitleText.dart';
import 'package:gestionnaire_interventions/oldComponent/oldTool.dart';
import 'package:gestionnaire_interventions/main.dart';
import 'package:gestionnaire_interventions/view/Add/AddVar.dart';

import '../../../oldComponent/connect.dart';

class Part5C extends StatefulWidget {
  const Part5C({super.key});

  @override
  State<Part5C> createState() => _Part5CState();
}

class _Part5CState extends State<Part5C> {
  TextEditingController coldF = TextEditingController();
  TextEditingController hotF = TextEditingController();

  // air
  TextEditingController b1 = TextEditingController();
  TextEditingController b2 = TextEditingController();
  TextEditingController b3 = TextEditingController();
  TextEditingController b4 = TextEditingController();
  TextEditingController b5 = TextEditingController();
  String errorText = "";

  @override
  Widget build(BuildContext context) {
    return AddTemplate(
      title: "Climatisation",
      Body: Body(),
      func: func5C,
      buttonTitle: "Enregistrer",
      errorText: errorText,
    );
  }

  void func5C() {
    climData["coldF"] = coldF.text;
    climData["hotF"] = hotF.text;
    climData["b1"] = b1.text;
    climData["b2"] = b2.text;
    climData["b3"] = b3.text;
    climData["b4"] = b4.text;
    climData["b5"] = b5.text;
    climData["userId"] = userData[getUserFromInter()].uid;
    pushInter();
    Future.delayed(const Duration(seconds: 1), () {
      setState(() {
        errorText = "";
      });
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => const MainApp()));
    });
  }

  void pushInter() async {
    DocumentReference docRef = db.collection("Interventions").doc();
    try {
      await docRef.set(climData);
      // gestion des récents
      if (lastClim.lastCount <= 2) {
        lastClim.lastTab[lastClim.lastCount] = docRef.id;
        lastClim.lastCount += 1;
        lastClim.cardinal += 1;
      } else {
        lastClim.lastCount = 0;
        lastClim.lastTab[lastClim.lastCount] = docRef.id;
        lastClim.cardinal += 1;
      }
      updateLast("Clim");
      updateSerialDataClim(climData["reference"], climData["date"]);
      setState(() {
        errorText = "Intervention enregistré !";
      });
    } catch (error) {
      setState(() {
        errorText = "Une erreur est survenue !";
      });
    }
  }

  Column Body() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const TitleText(title: "Infos groupe exterieur :"),
        const Gap(5),
        CloudBack(
          child: Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Pointer(" Température à la fin ", context),
              ),
              const SizedBox(
                height: 20,
              ),
              StackedField(
                data: DoubleTextfield(
                  title1: "Mode froid",
                  title2: "Mode chaud",
                  controller1: coldF,
                  controller2: hotF
                )
              ),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Pointer(" Mesure du débit d'air ", context),
              ),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SquareTextField(b1, "B1"),
                    const SizedBox(
                      width: 15,
                    ),
                    SquareTextField(b2, "B2"),
                    const SizedBox(
                      width: 15,
                    ),
                    SquareTextField(b3, "B3"),
                    const SizedBox(
                      width: 15,
                    ),
                    SquareTextField(b4, "B4"),
                    const SizedBox(
                      width: 15,
                    ),
                    SquareTextField(b5, "B5"),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 20,
        )
      ],
    );
  }

  Container SquareTextField(TextEditingController controller, String hintText) {
    return Container(
      height: 45,
      width: 45,
      child: MyTextField(
        fontSize: 15,
        padding: 12,
        noPadding: true,
        controller: controller,
        hintText: hintText,
      )
    );
  }
}
