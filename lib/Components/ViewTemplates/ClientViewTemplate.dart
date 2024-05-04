
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:gestionnaire_interventions/Components/ViewTemplates/InfoDoubleText.dart';
import 'package:gestionnaire_interventions/oldComponent/Struct.dart';

class ClientViewTemplate extends StatelessWidget {
  final Client client;
  const ClientViewTemplate({
    super.key,
    required this.client
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Gap(20),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            InfoDoubleText(title: "Nom : ", content: client.nom),
            const SizedBox(
                width: 40,
            ),
            InfoDoubleText(title: "Prenom : ", content: client.prenom)
          ],
        ),
        const Gap(10),
        InfoDoubleText(title: "Téléphone : ", content: client.phone),
        const Gap(10),
        InfoDoubleText(title: "Email : ", content: client.mail),
        const Gap(10),
        InfoDoubleText(title: "Adresse : ", content: client.adresse),
        const Gap(20)
      ],
    );
  }
}