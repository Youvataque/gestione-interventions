import 'package:flutter/material.dart';
import 'package:gestionnaire_interventions/Components/ViewTemplates/LitleComponent.dart';

///////////////////////////////////////////////////////////////
/// composant titre de l'app
class TitleText extends StatelessWidget {
  final String title;
  final bool center;
  const TitleText({
    super.key,
    required this.title,
    this.center = false
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 15),
      child: Container(
        height: 40,
        width: 250,
        decoration: BoxDecoration(
          color: Theme.of(context).scaffoldBackgroundColor.withOpacity(0.90),
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            myShadow(context)
          ]
        ),
        child: Padding(
          padding: const EdgeInsets.only(left: 10),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Text(
              title,
              style: textStyle(context),
              textAlign: center? TextAlign.center : TextAlign.start,
            ),
          ),
        )
      ),
    );
  }

///////////////////////////////////////////////////////////////
/// Style du text
  TextStyle textStyle(BuildContext context) {
    return TextStyle(
      color: Theme.of(context).textTheme.labelLarge!.color,
      fontSize: 17,
      fontWeight: FontWeight.bold
    );
  }
}