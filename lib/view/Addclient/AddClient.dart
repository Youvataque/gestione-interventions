import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gestionnaire_interventions/component/Tool.dart';
import 'package:gestionnaire_interventions/component/connect.dart';
import 'package:gestionnaire_interventions/component/Search.dart';
import 'package:gestionnaire_interventions/view/Addclient/Add/AddPage.dart';

class AddClient extends StatefulWidget {
  const AddClient({super.key});

  @override
  State<AddClient> createState() => _AddClientState();
}

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
      showSearch(
          context: context,
          delegate: Search(SearchContent: clients, Destination: true));
    },
    (BuildContext context) {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => AddPage()));
    },
    (BuildContext context) {
      showSearch(context: context, delegate: Search(SearchContent: clients));
    },
  ];
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          TopOfView(
            title: "Vos clients",
            height: 60,
            width: MediaQuery.sizeOf(context).width - 20,
            lead: Icon(
              CupertinoIcons.person_2_square_stack_fill,
              size: 40,
              color: textColor(),
            ),
          ),
          const SizedBox(
            height: 100,
          ),
          Body(),
          const SizedBox(
            height: 30,
          ),
          Center(
            child: Text(
              "Toute manipulation du serveur est un \n risque ! Prenez donc le temps de faire les \n choses comme il faut.",
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: textColor(),
                  fontSize: 17,
                  fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(
            height: 120,
          )
        ],
      ),
    );
  }

  Container Body() {
    return Container(
      width: MediaQuery.sizeOf(context).width - 20,
      child: ListView.builder(
          itemCount: 3,
          shrinkWrap: true,
          padding: EdgeInsets.zero,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            return Container(
              height: 95,
              padding: const EdgeInsets.only(bottom: 15),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white.withOpacity(0.95),
                    surfaceTintColor: Colors.transparent,
                    foregroundColor: mainColor(),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20))),
                onPressed: () {
                  func[index](context);
                },
                child: Row(
                  children: [
                    const SizedBox(
                      width: 5,
                    ),
                    Container(
                        height: 90,
                        width: 90,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(15),
                          child: Icon(
                            srcIm[index],
                            size: 45,
                          ),
                        )),
                    const SizedBox(
                      width: 30,
                    ),
                    Text(
                      name[index],
                      style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                          color: textColor()),
                    ),
                  ],
                ),
              ),
            );
          }),
    );
  }

  Container ClientBody() {
    return Container(
        decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.85),
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(color: Colors.grey.withOpacity(0.7), blurRadius: 7)
            ]),
        width: MediaQuery.sizeOf(context).width - 20,
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            Column(
                children: List.generate(
                    clients.length,
                    (index) => Container(
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
                              onPressed: () {},
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    clients[index].nom,
                                    style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 17,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  const SizedBox(
                                    width: 5,
                                  ),
                                  Text(
                                    clients[index].prenom,
                                    style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 17,
                                        fontWeight: FontWeight.bold),
                                  )
                                ],
                              )),
                        ))),
            const SizedBox(
              height: 20,
            )
          ],
        ));
  }
}
