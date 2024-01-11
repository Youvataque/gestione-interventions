import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gestionnaire_interventions/component/tool.dart';

class ForgetPass extends StatefulWidget {
  const ForgetPass({super.key});

  @override
  State<ForgetPass> createState() => _ForgetPassState();
}

class _ForgetPassState extends State<ForgetPass> {
  TextEditingController email = TextEditingController();
  String errorText = "";
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
                title: "Récupération",
                sousTitre: "Un oublie n'a rien de fatal !",
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
        ),
      ),
    ));
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
            controller: email,
            decoration: InputDecoration(
              hintStyle:
                  TextStyle(fontWeight: FontWeight.bold, color: mainColor()),
              hintText: "Entrez votre email",
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
          height: 40,
        ),
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
                  Passwordres();
                },
                style: ElevatedButton.styleFrom(
                    backgroundColor: mainColor(),
                    foregroundColor: Colors.grey,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20))),
                child: const Text(
                  "Envoyer",
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
            style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }

  Future<void> Passwordres() async {
    try {
      await FirebaseAuth.instance
          .sendPasswordResetEmail(email: email.text.trim());
      setState(() {
        errorText = "Un mail vous a été envoyé !";
      });
    } catch (error) {
      setState(() {
        errorText = Langconv(error.toString());
      });
    }
  }

  String Langconv(String erreur) {
    if (erreur ==
        "[firebase_auth/user-not-found] There is no user record corresponding to this identifier. The user may have been deleted.") {
      return "Aucun utilisateur n'utilise cet email !";
    } else if (erreur ==
        "[firebase_auth/missing-email] An email address must be provided.") {
      return "Il est nécéssaire de préciser un email ^^";
    } else if (erreur ==
        "[firebase_auth/invalid-email] The email address is badly formatted.") {
      return "Ceci n'est pas un email ...";
    } else {
      return "Une erreur est survenue";
    }
  }
}
