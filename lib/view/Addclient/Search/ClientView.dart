
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:gestionnaire_interventions/Components/FondamentalAppCompo/CloudBack.dart';
import 'package:gestionnaire_interventions/Components/FondamentalAppCompo/TopOfView.dart';
import 'package:gestionnaire_interventions/Components/ViewTemplates/BackTemplate.dart';
import 'package:gestionnaire_interventions/Components/ViewTemplates/ClientViewTemplate.dart';
import 'package:gestionnaire_interventions/Components/ViewTemplates/TitleText.dart';
import 'package:gestionnaire_interventions/oldComponent/Struct.dart';

///////////////////////////////////////////////////////////////
/// page affichage client
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
    return BackTemplate(
      content: body(),
    );
  }

///////////////////////////////////////////////////////////////
/// corp du code
  SingleChildScrollView body() {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TopOfView(
            width: MediaQuery.sizeOf(context).width - 30,
            height: 55,
            title: "Client",
            withBack: true,
            passedContext: context,
            lead: Icon(
              CupertinoIcons.person_circle,
              size: 40,
              color: Theme.of(context).textTheme.labelLarge!.color,
            ),
          ),
          const Gap(80),
          const TitleText(title: "Informations du client :"),
          const Gap(5),
          CloudBack(child: ClientViewTemplate(client: widget.monClient))
        ],
      ),
    );
  }
}