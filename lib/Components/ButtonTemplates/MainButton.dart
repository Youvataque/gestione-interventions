import 'package:flutter/material.dart';
import 'package:gestionnaire_interventions/Components/ViewTemplates/ForPlacement.dart';

///////////////////////////////////////////////////////////////
/// main button
class MainButton extends StatelessWidget {
  final VoidCallback func;
  final String? title;
  final bool type;
  final IconData? icon;
  const MainButton({
    super.key,
    required this.func,
    this.title,
    this.type = false,
    this.icon
  });

  @override
  Widget build(BuildContext context) {
    return ForPlacement(
      content: SizedBox(
        height: 55,
        child: ElevatedButton(
        onPressed: () {
          func();
        },
        style: buttonStyle(context),
        child: type? 
            Icon(
              icon!,
              size: 30,
              color: Theme.of(context).colorScheme.background,
            ) 
        :
            Text(
              title!,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 17,
                color: Theme.of(context).scaffoldBackgroundColor
              ),
            ),
        ),
      )
    );
  }

///////////////////////////////////////////////////////////////
/// Style du bouton
  ButtonStyle buttonStyle(BuildContext context) {
    return ElevatedButton.styleFrom(
      backgroundColor: Theme.of(context).primaryColor,
      foregroundColor: Theme.of(context).scaffoldBackgroundColor,
      surfaceTintColor: Colors.transparent,
      padding: EdgeInsets.zero,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(17.5)
      )
    );
  }

}