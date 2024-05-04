
import 'package:flutter/material.dart';
import 'package:gestionnaire_interventions/Components/ViewTemplates/ForPlacement.dart';
import 'package:gestionnaire_interventions/Components/ViewTemplates/LitleComponent.dart';

///////////////////////////////////////////////////////////////
/// fond des élément (en nuage)
class CloudBack extends StatefulWidget {
  final Widget child;
  const CloudBack({
    super.key,
    required this.child
  });

  @override
  State<CloudBack> createState() => _CloudBackState();
}

class _CloudBackState extends State<CloudBack> {
  @override
  Widget build(BuildContext context) {
    return ForPlacement(
      content: Container(
          decoration: BoxDecoration(
            color: Theme.of(context).scaffoldBackgroundColor.withOpacity(0.90),
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              myShadow(context)
            ]
          ),
          child: widget.child,
      ),
    );
  }
}