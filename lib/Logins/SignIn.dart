import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gestionnaire_interventions/Logins/ForgetPass.dart';
import 'package:gestionnaire_interventions/component/tool.dart';
import 'package:gestionnaire_interventions/main.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  TextEditingController login = TextEditingController();
  TextEditingController password = TextEditingController();
  String errorText = "";
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          TopOfView(
            title: "Connexion",
            sousTitre: "Votre outil numérique !",
            width: MediaQuery.sizeOf(context).width - 20,
            height: 90,
            titleSize: 35,
            lead: Icon(
              Icons.cable_outlined,
              size: 40,
              color: textColor(),
            ),
          ),
          Body()
        ],
      ),
    );
  }

  Column Body() {
    return Column(
      children: [
        const SizedBox(
          height: 80,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 30, right: 30, top: 0),
          child: TextField(
            textAlign: TextAlign.center,
            controller: login,
            decoration: InputDecoration(
              hintStyle:
                  TextStyle(fontWeight: FontWeight.bold, color: mainColor()),
              hintText: "Votre Identifiant",
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25),
                  borderSide: BorderSide(color: Colors.grey.withOpacity(0.2))),
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25),
                  borderSide: BorderSide(
                    color: textColor(),
                  )),
              fillColor: Colors.white,
              filled: true,
            ),
          ),
        ),
        const SizedBox(
          height: 30,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 30, right: 30, top: 0),
          child: TextField(
            textAlign: TextAlign.center,
            controller: password,
            obscureText: true,
            decoration: InputDecoration(
              hintText: "Ainsi que le mot de passe",
              hintStyle:
                  TextStyle(fontWeight: FontWeight.bold, color: textColor()),
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25),
                  borderSide: BorderSide(color: Colors.grey.withOpacity(0.2))),
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(50),
                  borderSide: BorderSide(
                    color: mainColor(),
                  )),
              fillColor: Colors.white,
              filled: true,
            ),
          ),
        ),
        Align(
          alignment: Alignment.centerRight,
          child: Padding(
            padding: EdgeInsets.only(right: 45),
            child: TextButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => ForgetPass()));
              },
              child: Text(
                "Mot de passe oublié ?",
                style: TextStyle(
                  fontSize: 14,
                  color: mainColor(),
                ),
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 50,
        ),
        Container(
          height: 55,
          width: 200,
          child: ElevatedButton(
            onPressed: () {
              GetUserLogins();
            },
            style: ElevatedButton.styleFrom(
                backgroundColor: mainColor(),
                foregroundColor: Colors.grey,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20))),
            child: const Text(
              "Connexion",
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 17),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 10),
          child: Text(
            errorText,
            style:
                const TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }

  Future GetUserLogins() async {
    try {
      // get user zipped
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: login.text.trim(), password: password.text.trim());
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: ((context) => MainApp()),
          ));
    } catch (error) {
      // Gestion des erreurs
      setState(() {
        errorText = ConverLang(error.toString());
      });
      print(error.toString());
    }
  }

  String ConverLang(String lerreur) {
    if (lerreur ==
        "[firebase_auth/wrong-password] The password is invalid or the user does not have a password.") {
      return "Erreur le mot de passe est incorrect ! ";
    } else if (lerreur ==
        "[firebase_auth/invalid-email] The email address is badly formatted.") {
      return "Veullez entrer une adresse email valide !";
    } else if (lerreur ==
        "[firebase_auth/user-not-found] There is no user record corresponding to this identifier. The user may have been deleted.") {
      return "Le compte recherché est introuvable !";
    } else if (lerreur ==
        "[firebase_auth/user-disabled] The user account has been disabled by an administrator.") {
      return "Vôtre compte a été désactivé pour non respect des règles !";
    } else {
      return "Une erreur est survenue !";
    }
  }
}
