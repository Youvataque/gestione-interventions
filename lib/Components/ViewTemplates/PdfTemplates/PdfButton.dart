import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

///////////////////////////////////////////////////////////////
/// Composant générant un bouton pour générer un PDF
class PdfButton extends StatefulWidget {
  const PdfButton({super.key});

  @override
  State<PdfButton> createState() => _PdfButtonState();
}

class _PdfButtonState extends State<PdfButton> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.95,
      height: 45,
      child: CupertinoButton(
        color: Theme.of(context).primaryColor,
        child: const Text(
          "Générer le PDF",
          style: TextStyle(
            color: CupertinoColors.white,
            fontSize: 16,
            fontWeight: FontWeight.bold
          ),
        ),
        onPressed: () {
        },
      )
    );
  }
}