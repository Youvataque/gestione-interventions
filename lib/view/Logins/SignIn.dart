
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:gestionnaire_interventions/Components/ButtonTemplates/MainButton.dart';
import 'package:gestionnaire_interventions/Components/ButtonTemplates/MyTextButton.dart';
import 'package:gestionnaire_interventions/Components/ButtonTemplates/MyTextField.dart';
import 'package:gestionnaire_interventions/Components/FondamentalAppCompo/TopOfView.dart';
import 'package:gestionnaire_interventions/Components/Tools/ErrorTools/LoginsError.dart';
import 'package:gestionnaire_interventions/Components/ViewTemplates/BackTemplate.dart';
import 'package:gestionnaire_interventions/Components/ViewTemplates/ErrorView.dart';
import 'package:gestionnaire_interventions/Components/ViewTemplates/ForPlacement.dart';
import 'package:gestionnaire_interventions/main.dart';
import 'package:gestionnaire_interventions/view/Logins/ForgetPass.dart';


///////////////////////////////////////////////////////////////
/// Page de connexion
class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

///////////////////////////////////////////////////////////////
/// Code principale
class _SignInState extends State<SignIn> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  String theError = "";
  @override
  Widget build(BuildContext context) {
    return BackTemplate(
      content: Column(
        children: [
          TopOfView(
            title: "Connexion",
            sousTitre: "Suite SolsEnergiesBains : Chantier",
            width: MediaQuery.sizeOf(context).width - 30,
            height: 90,
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
          hintText: "Votre email",
          autofillHints: const [AutofillHints.email],
          
        ),
        const Gap(20),
        MyTextField(
          controller: password,
          hintText: "Votre mot de passe",
          hintType: true,
          autofillHints: const[AutofillHints.password],
        ),
        const Gap(5),
        toPassButton(),
        const Gap(30),
        MainButton(
          func: () => login(),
          title: "Se connecter"
        ),
      ],
    );
  }

///////////////////////////////////////////////////////////////
/// bouton vers reset pass
  Widget toPassButton() {
    return ForPlacement(
      content: Padding(
        padding: const EdgeInsets.only(right: 5),
        child: Align(
          alignment: Alignment.centerRight,
          child: MyTextButton(
            func: () => toPass(),
            title: "Un oublie ?"
          ),
        ),
      )
    );
  }

///////////////////////////////////////////////////////////////
/// logique vers signUp
  void toPass() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const ForgetPass()
      )
    );
  }

///////////////////////////////////////////////////////////////
/// logique de connexion
  void login() async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email.text.trim(),
        password: password.text.trim()
      );
      if (mounted) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const MainApp())
        );
      }
    } catch (error) {
      print(error);
      setState(() {
        theError = loginsError(error.toString());
      });
    }
  }
}