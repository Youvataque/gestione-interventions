import 'package:flutter/material.dart';
import 'package:gestionnaire_interventions/Components/ViewTemplates/MySearchDelegate.dart';
import 'package:gestionnaire_interventions/oldComponent/connect.dart';
import 'package:gestionnaire_interventions/oldComponent/Struct.dart';
import 'package:gestionnaire_interventions/oldComponent/oldTool.dart';
import 'package:gestionnaire_interventions/view/AddClient/AddClient.dart';

///////////////////////////////////////////////////////////////
/// Sélectionne un client depuis la db
class ClientPicker extends StatefulWidget {
  final Function(Client) update;
  const ClientPicker({
    super.key,
    required this.update
  });

  @override
  State<ClientPicker> createState() => _ClientPickerState();
}

class _ClientPickerState extends State<ClientPicker> {
  bool selected = false;
  String hintText = "Votre client";
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ElevatedButton(
        onPressed: () {
          clientAlgo();
        },
        style: buttonStyle(),
        child: Padding(
          padding: const EdgeInsets.only(left: 15),
          child: Align(
            alignment: Alignment.centerLeft,
            child: theText(),
          ),
        )
      ),
    );
  }

///////////////////////////////////////////////////////////////
/// text du bouton
Text theText() {
  return Text(
    hintText,
    style: TextStyle(
      fontWeight: FontWeight.w500,
      fontSize: 16,
      color: selected? Theme.of(context).colorScheme.background : Theme.of(context).colorScheme.tertiary
    ),
  );
}

///////////////////////////////////////////////////////////////
/// Style du bouton
  ButtonStyle buttonStyle() {
    return ElevatedButton.styleFrom(
      backgroundColor: selected? Theme.of(context).primaryColor : Theme.of(context).colorScheme.background,
      foregroundColor: selected? Theme.of(context).scaffoldBackgroundColor : Theme.of(context).primaryColor,
      surfaceTintColor: Colors.transparent,
      shadowColor: Colors.transparent,
      padding: const EdgeInsets.symmetric(vertical: 12),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
        side: BorderSide(
          color: selected? Theme.of(context).primaryColor : Theme.of(context).dividerColor,
          width: 2
        )
      )
    );
  }

   void clientAlgo() async {
    await showSearch(
      context: context,
      delegate: Search(searchContent: clients, dest3: false, update: [selected], context: context)
    );
    setState(() {
      Client tempClient = clients[clientFromId(theClient.uid)];
      hintText = "${tempClient.nom} ${tempClient.prenom}";
      widget.update(tempClient);
      selected = true;
    });
  }
}