import 'package:flutter/cupertino.dart';
import 'package:gestionnaire_interventions/oldComponent/connect.dart';
import '../../../oldComponent/oldTool.dart';

class EntrepriseSigle extends StatefulWidget {
  const EntrepriseSigle({super.key});

  @override
  State<EntrepriseSigle> createState() => _EntrepriseSigleState();
}

///////////////////////////////////////////////////////////////
/// information entreprise pdf
class _EntrepriseSigleState extends State<EntrepriseSigle> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(
          "src/Logo_SEB.jpg",
          scale: 20,
        ),
        Text(
          entrepriseData.nom,
          style: TextStyle(
              color: textColor().withOpacity(1),
              fontSize: 16,
              fontWeight: FontWeight.bold),
        ),
        Text("Attestation de capacité : ", style: titleStyle()),
        Text(entrepriseData.capacite, style: argStyle()),
        Row(
          children: [
            Text("Siret : ", style: titleStyle()),
            Text(entrepriseData.siret, style: argStyle())
          ],
        )
      ],
    );
  }
}