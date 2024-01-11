import 'package:flutter/material.dart';
import 'package:gestionnaire_interventions/component/Struct.dart';
import 'package:gestionnaire_interventions/component/Tool.dart';
import 'package:gestionnaire_interventions/view/Add/AddVar.dart';
import 'package:gestionnaire_interventions/view/Addclient/Edit/EditPage.dart';
import 'package:gestionnaire_interventions/view/Addclient/Search/ClientView.dart';

class Search extends SearchDelegate {
  List<Client> SearchContent = [];
  final bool Destination;
  final bool Dest3;
  final List<bool>? update;
  Search(
      {Key? key,
      required this.SearchContent,
      this.Destination = false,
      this.Dest3 = true,
      this.update});
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
          onPressed: () {
            query = '';
          },
          icon: Icon(
            Icons.clear,
            color: mainColor(),
          ))
    ];
  }

  @override
  String get searchFieldLabel => '         Nom du client';

  @override
  TextStyle get searchFieldStyle => TextStyle(color: mainColor(), fontSize: 22);

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
        onPressed: () {
          close(context, null);
        },
        icon: Icon(
          Icons.navigate_before,
          color: mainColor(),
        ));
  }

  @override
  Widget buildResults(BuildContext context) {
    List<Client> matchQuery = [];
    for (var element in SearchContent) {
      if (retirerAccents("${element.nom} ${element.prenom}".toLowerCase())
              .contains(query.toLowerCase()) ||
          "${element.nom} ${element.prenom}"
              .toLowerCase()
              .contains(query.toLowerCase())) {
        matchQuery.add(element);
      }
    }
    return SingleChildScrollView(
        child: Body(context, matchQuery, Destination, Dest3, update));
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    List<Client> matchQuery = [];
    for (var element in SearchContent) {
      if (retirerAccents("${element.nom} ${element.prenom}".toLowerCase())
              .contains(query.toLowerCase()) ||
          "${element.nom} ${element.prenom}"
              .toLowerCase()
              .contains(query.toLowerCase())) {
        matchQuery.add(element);
      }
    }
    return SingleChildScrollView(
      child: Body(context, matchQuery, Destination, Dest3, update),
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
                      height: 60,
                      margin: const EdgeInsets.only(bottom: 10),
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              foregroundColor: Colors.grey,
                              surfaceTintColor: Colors.transparent,
                              backgroundColor: mainColor(),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20))),
                          onPressed: () {
                            if (Dest3) {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Destination
                                          ? ClientView(
                                              monClient: matchQuery[index])
                                          : EditPage(
                                              monClient: matchQuery[index])));
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
                                    fontWeight: FontWeight.bold),
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              Text(
                                matchQuery[index].prenom,
                                style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 17,
                                    fontWeight: FontWeight.bold),
                              )
                            ],
                          )),
                    ),
                  ))),
      const SizedBox(
        height: 15,
      )
    ],
  );
}
