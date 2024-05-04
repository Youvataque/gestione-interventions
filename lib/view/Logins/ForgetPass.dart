import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:gestionnaire_interventions/Components/ButtonTemplates/MainButton.dart';
import 'package:gestionnaire_interventions/Components/ButtonTemplates/MyTextField.dart';
import 'package:gestionnaire_interventions/Components/FondamentalAppCompo/TopOfView.dart';
import 'package:gestionnaire_interventions/Components/Tools/ErrorTools/LoginsError.dart';
import 'package:gestionnaire_interventions/Components/ViewTemplates/BackTemplate.dart';
import 'package:gestionnaire_interventions/Components/ViewTemplates/ErrorView.dart';


class ForgetPass extends StatefulWidget {
  const ForgetPass({super.key});

  @override
  State<ForgetPass> createState() => _ForgetPassState();
}

class _ForgetPassState extends State<ForgetPass> {
  TextEditingController email = TextEditingController();
  String theError = "";
  @override
  Widget build(BuildContext context) {
    return BackTemplate(
      content: Column(
        children: [
          TopOfView(
            title: "Récupération",
            sousTitre: "Un oublie n'a rien de fatal !",
            width: MediaQuery.sizeOf(context).width - 30,
            height: 90,
            withBack: true,
            titleSize: 35,
            lead: Icon(
              Icons.cable_outlined,
              size: 40,
              color: Theme.of(context).textTheme.labelLarge!.color,
            ),
          ),
          const Gap(65),
          ErrorView(
            key: UniqueKey(),
            error: theError
          ),
          const Gap(5),
          loginComponent()
        ],
      ),
    );
  }

///////////////////////////////////////////////////////////////
/// textfields et boutons lié à la connexion
  Column loginComponent() {
    return Column(
      children: [
        MyTextField(
          controller: email,
          hintText: "Votre email"
        ),
        const Gap(30),
        MainButton(
          func: () => resetPass(),
          title: "Réinitialiser"
        ),
      ],
    );
  }

///////////////////////////////////////////////////////////////
/// logique de récupération
 void resetPass() async {
  String selectedEmail = email.text.trim();
  try {
    if (selectedEmail == "") {
      setState(() {
        theError = "Il est nécéssaire de renseigner un email !";
      });
    } else {
      await FirebaseAuth.instance.sendPasswordResetEmail(email: selectedEmail);
      setState(() {
        theError = "Si un compte est reconnu vous recevrez un email prochainement.";
      });
    }
  } catch(error) {
    setState(() {
      theError = loginsError(error.toString());
    });
  }
 }
}