import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

///////////////////////////////////////////////////////////////
/// Widget de bool switcher à l'apparance d'un myTextfield
class SwitcherLikeField extends StatefulWidget {
  final String title;
  final bool statut;
  final Function(bool) onChanged;
  const SwitcherLikeField({
    super.key,
    required this.title,
    required this.statut,
    required this.onChanged
  });

  @override
  State<SwitcherLikeField> createState() => _SwitcherLikeFieldState();
}

///////////////////////////////////////////////////////////////
/// code principale
class _SwitcherLikeFieldState extends State<SwitcherLikeField> {
  late bool newStatut;

  @override
  void initState() {
    super.initState();
    newStatut = widget.statut; 
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
           color: Theme.of(context).scaffoldBackgroundColor,
           borderRadius: BorderRadius.circular(20),
            border: Border.all(
              color: Theme.of(context).dividerColor,
              width: 2
            )
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: title(),
            ),
            theSwitch(),
          ],
        ),
    );
  }

///////////////////////////////////////////////////////////////
/// text du bouton
  Padding title() {
    return Padding(
      padding: const EdgeInsets.only(left: 10),
      child: Text(
        widget.title,
        softWrap: true,
        maxLines: 2,
        style: TextStyle(
          fontWeight: FontWeight.w500,
          fontSize: 16,
          color: Theme.of(context).colorScheme.tertiary
        ),
      ),
    );
  }

///////////////////////////////////////////////////////////////
/// switcher
  Padding theSwitch() {
    return Padding(
      padding: const EdgeInsets.only(right: 10),
      child: CupertinoSwitch(
        value: widget.statut,
        onChanged: (bool value) {
          setState(() {
            newStatut = value;
          });
          widget.onChanged(value);
        },
        activeColor: Theme.of(context).primaryColor,
      ),
    );
  }
}