import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gestionnaire_interventions/component/tool.dart';
import 'package:gestionnaire_interventions/main.dart';
import 'package:gestionnaire_interventions/view/Add/AddVar.dart';

import '../../../component/connect.dart';

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
      children: [
        title("Infos groupe exterieur :"),
        Container(
          decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.85),
              boxShadow: [
                BoxShadow(color: Colors.grey.withOpacity(0.7), blurRadius: 7)
              ],
              borderRadius: BorderRadius.circular(20)),
          width: MediaQuery.sizeOf(context).width - 20,
          child: Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              Pointer(" Température à la fin "),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  litleTextField(coldF, "Mode froid", true),
                  const SizedBox(
                    width: 20,
                  ),
                  litleTextField(hotF, "Mode chaud", true)
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Pointer(" Mesure du débit d'air "),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
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
      width: 52,
      height: 55,
      child: TextFormField(
        controller: controller,
        textAlign: TextAlign.center,
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
            hintStyle: TextStyle(
                fontWeight: FontWeight.bold, color: textColor(), fontSize: 16),
            contentPadding: const EdgeInsets.only(top: 15, bottom: 15),
            hintText: hintText,
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
                borderSide: const BorderSide(color: Colors.grey)),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
            )),
      ),
    );
  }
}
