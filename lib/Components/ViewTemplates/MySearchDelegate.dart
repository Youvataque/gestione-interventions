
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:gestionnaire_interventions/Components/Tools/CheckTool/MailFormat.dart';
import 'package:gestionnaire_interventions/oldComponent/Struct.dart';
import 'package:gestionnaire_interventions/view/AddClient/AddClient.dart';
import 'package:gestionnaire_interventions/view/Addclient/Edit/EditPage.dart';
import 'package:gestionnaire_interventions/view/Addclient/Search/ClientView.dart';

class Search extends SearchDelegate {
  List<Client> searchContent = [];
  final bool destination;
  final bool dest3;
  final List<bool>? update;
  final BuildContext context;
  Search({
    Key? key,
    required this.searchContent,
    this.destination = false,
    this.dest3 = true,
    this.update,
    required this.context
  });
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () {
          query = '';
        },
        icon: Icon(
          Icons.clear,
          color: Theme.of(context).primaryColor
        ),
      )
    ];
  }

  @override
  String get searchFieldLabel => '         Nom du client';

  @override
  TextStyle get searchFieldStyle => TextStyle(color: Theme.of(context).primaryColor, fontSize: 22);

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () {
        close(context, null);
      },
      icon: Icon(
        Icons.navigate_before,
        color: Theme.of(context).primaryColor,
      ));
  }

  @override
  Widget buildResults(BuildContext context) {
    List<Client> matchQuery = [];
    for (var element in searchContent) {
      if (toBasics("${element.nom} ${element.prenom}").contains(query.toLowerCase()) || "${element.nom} ${element.prenom}".toLowerCase().contains(query.toLowerCase())) {
        matchQuery.add(element);
      }
    }
    return SingleChildScrollView(
        child: Body(context, matchQuery, destination, dest3, update));
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    List<Client> matchQuery = [];
    for (var element in searchContent) {
      if (toBasics("${element.nom} ${element.prenom}".toLowerCase()).contains(query.toLowerCase()) || "${element.nom} ${element.prenom}".toLowerCase().contains(query.toLowerCase())) {
        matchQuery.add(element);
      }
    }
    return SingleChildScrollView(
      child: Body(context, matchQuery, destination, dest3, update),
    );
  }
}

Column Body(BuildContext context, List<Client> matchQuery, bool Destination,
  bool Dest3, List<bool>? update) {
  return Column(
    children: [
      const SizedBox(
        height: 15,
      ),
      Column(
        children: List.generate(
          matchQuery.length,
          (index) => Center(
            child: Container(
              width: 300,
              height: 55,
              margin: const EdgeInsets.only(bottom: 10),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  foregroundColor: Theme.of(context).scaffoldBackgroundColor,
                  surfaceTintColor: Colors.transparent,
                  backgroundColor: Theme.of(context).primaryColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)
                  )
                ),
                onPressed: () {
                  if (Dest3) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Destination? 
                            ClientView(monClient: matchQuery[index])
                            :
                            EditPage(monClient: matchQuery[index])
                      )
                    );
                  } else {
                    theClient = matchQuery[index];
                    update![0] = true;
                    Navigator.pop(context);
                  }
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      matchQuery[index].nom,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 17,
                        fontWeight: FontWeight.bold
                      ),
                    ),
                    const Gap(5),
                    Text(
                      matchQuery[index].prenom,
                      style: TextStyle(
                        color: Theme.of(context).scaffoldBackgroundColor,
                        fontSize: 17,
                        fontWeight: FontWeight.bold
                      ),
                    )
                  ],
                )
              ),
            ),
          )
        )
      ),
      const SizedBox(
        height: 15,
      )
    ],
  );
}
