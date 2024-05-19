
import 'package:flutter/material.dart';
import 'package:gestionnaire_interventions/Components/Tools/CheckTool/MailFormat.dart';
import 'package:gestionnaire_interventions/oldComponent/oldTool.dart';

///////////////////////////////////////////////////////////////
/// composant un poile doublon avec MySearchDelegate pour la recherche de client dans intervention. (trop long de néttoyer cette app)
class InterSearchDelegate extends SearchDelegate {
  final List<String> searchContent;
  final BuildContext context;
  final Function(int) func1;
  InterSearchDelegate({
    Key? key,
    required this.searchContent,
    required this.context,
    required this.func1
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
    Map<int, String> matchQuery = {};
    for (int x = 0; x < searchContent.length; x++) {
      if (toBasics(getNameFromInter(searchContent[x])).contains(query)) {
        matchQuery[x] = (searchContent[x]);
      }
    }
    return SingleChildScrollView(
      child: body(context, matchQuery, func1)
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    Map<int, String> matchQuery = {};
    for (int x = 0; x < searchContent.length; x++) {
      if (toBasics(getNameFromInter(searchContent[x])).contains(query)) {
        matchQuery[x] = (searchContent[x]);
      }
    }
    return SingleChildScrollView(
      child: body(context, matchQuery, func1),
    );
  }
}

///////////////////////////////////////////////////////////////
/// corp du code
Column body(BuildContext context, Map<int, String> matchQuery, Function(int) func1) {
  return Column(
    children: [
      const SizedBox(
        height: 15,
      ),
      Column(
        children: matchQuery.entries.map((e) => Center(
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
                  func1(e.key);
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      getNameFromInter(e.value),
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 17,
                        fontWeight: FontWeight.bold
                      ),
                    ),
                  ],
                )
              ),
            ),
          )).toList(),
      ),
      const SizedBox(
        height: 15,
      )
    ],
  );
}
