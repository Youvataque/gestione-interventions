import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gestionnaire_interventions/component/Struct.dart';
import 'package:gestionnaire_interventions/component/Tool.dart';

class ClientView extends StatefulWidget {
  final Client monClient;
  const ClientView({
    super.key,
    required this.monClient,
  });

  @override
  State<ClientView> createState() => _ClientViewState();
}

class _ClientViewState extends State<ClientView> {
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
                    width: MediaQuery.sizeOf(context).width - 20,
                    height: 60,
                    title: "Client",
                    lead: Icon(
                      CupertinoIcons.person_circle,
                      size: 40,
                      color: textColor(),
                    ),
                  ),
                  const SizedBox(
                    height: 80,
                  ),
                  title("Informations du client :"),
                  const SizedBox(),
                  Body(),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    height: 55,
                    width: 200,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      style: ElevatedButton.styleFrom(
                          backgroundColor: mainColor(),
                          foregroundColor: Colors.grey,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20))),
                      child: const Text(
                        "Retour",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 17),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )),
    );
  }

  Container Body() {
    return Container(
      width: MediaQuery.sizeOf(context).width - 20,
      decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.85),
          borderRadius: BorderRadius.circular(25),
          boxShadow: [
            BoxShadow(color: Colors.grey.withOpacity(0.7), blurRadius: 7)
          ]),
      child: Column(
        children: [
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                children: [
                  Text(
                    "Nom : ",
                    style: TextStyle(
                        fontSize: 19,
                        fontWeight: FontWeight.bold,
                        color: textColor()),
                  ),
                  Text(
                    widget.monClient.nom,
                    style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                        color: mainColor()),
                  )
                ],
              ),
              const SizedBox(
                width: 40,
              ),
              Column(
                children: [
                  Text(
                    "Prenom : ",
                    style: TextStyle(
                        fontSize: 19,
                        fontWeight: FontWeight.bold,
                        color: textColor()),
                  ),
                  Text(
                    widget.monClient.prenom,
                    style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                        color: mainColor()),
                  )
                ],
              )
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Column(
            children: [
              Text(
                "Téléphone : ",
                style: TextStyle(
                    fontSize: 19,
                    fontWeight: FontWeight.bold,
                    color: textColor()),
              ),
              Text(
                widget.monClient.phone,
                style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                    color: mainColor()),
              )
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Column(
            children: [
              Text(
                "Email : ",
                style: TextStyle(
                    fontSize: 19,
                    fontWeight: FontWeight.bold,
                    color: textColor()),
              ),
              Text(
                textAlign: TextAlign.center,
                widget.monClient.mail,
                style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                    color: mainColor()),
              )
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Column(
            children: [
              Text(
                "Adresse : ",
                style: TextStyle(
                    fontSize: 19,
                    fontWeight: FontWeight.bold,
                    color: textColor()),
              ),
              Text(
                widget.monClient.adresse,
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                    color: mainColor()),
              )
            ],
          ),
          const SizedBox(
            height: 20,
          )
        ],
      ),
    );
  }
}
