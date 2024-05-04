
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:gestionnaire_interventions/Components/ViewTemplates/InfoText.dart';
import 'package:gestionnaire_interventions/Components/ViewTemplates/MySearchDelegate.dart';
import 'package:gestionnaire_interventions/oldComponent/Struct.dart';
import 'package:gestionnaire_interventions/oldComponent/connect.dart';
import 'package:gestionnaire_interventions/view/Addclient/Add/AddPage.dart';


Client theClient = const Client();

class AddClient extends StatefulWidget {
  const AddClient({super.key});

  @override
  State<AddClient> createState() => _AddClientState();
}

///////////////////////////////////////////////////////////////
/// page d'ajout principale
class _AddClientState extends State<AddClient> {
  List<String> name = [
    "Rechercher un client",
    "Ajouter un client",
    "Modifier un client"
  ];
  List<IconData> srcIm = [
    CupertinoIcons.search,
    CupertinoIcons.plus_square,
    CupertinoIcons.square_pencil
  ];
  List<void Function(BuildContext)> func = [
    (BuildContext context) {
      showSearch(context: context, delegate: Search(searchContent: clients, destination: true, context: context));
    },
    (BuildContext context) {
       Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => AddPage())
      );
    },
    (BuildContext context) {
       showSearch(context: context, delegate: Search(searchContent: clients, context: context));
    },
  ];
  @override
  Widget build(BuildContext context) {
    return body();
  }

///////////////////////////////////////////////////////////////
/// corp du code
  SingleChildScrollView body() {
    return SingleChildScrollView(
      child: Column(
        children: [
          buttonGen(),
          const Gap(30),
          const InfoText(
            text: "Toute manipulation du serveur est un \n risque ! Prenez donc le temps de faire les \n choses comme il faut."
          ),
          const Gap(120)
        ],
      ),
    );
  }

///////////////////////////////////////////////////////////////
/// générateur de bouton
  SizedBox buttonGen() {
    return SizedBox(
      width: MediaQuery.sizeOf(context).width - 30,
      child: Column(
        children: List.generate(
          name.length,
          (index) => element(index)
        ),
      )
    );
  }

///////////////////////////////////////////////////////////////
/// élément a générer
  Container element(int index) {
    return Container(
      height: 80,
      padding: const EdgeInsets.only(bottom: 15),
      child: ElevatedButton(
        style: buttonStyle(),
        onPressed: () => func[index](context),
        child: Row(
          children: [
            const Gap(5),
            iconFormat(index),
            const Gap(30),
            Text(
              name[index],
              style: TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.bold,
                color: Theme.of(context).textTheme.labelLarge!.color
              ),
            ),
          ],
        ),
      ),
    );
  }

///////////////////////////////////////////////////////////////
/// style du bouton
  ButtonStyle buttonStyle() {
    return ElevatedButton.styleFrom(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor.withOpacity(0.95),
      surfaceTintColor: Colors.transparent,
      foregroundColor: Theme.of(context).primaryColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20)
      )
    );
  }

///////////////////////////////////////////////////////////////
/// formate l'icon
  SizedBox iconFormat(int index) {
    return SizedBox(
      height: 70,
      width: 70,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: Icon(
          srcIm[index],
          size: 40,
        ),
      )
    );
  }
}
