import 'package:flutter/material.dart';

///////////////////////////////////////////////////////////////
/// champ de text pour les commentaires et les consignes
class BlocNote extends StatefulWidget {
  final TextEditingController controller;
  final String hintText;
  const BlocNote({
    super.key,
    required this.controller,
    required this.hintText
  });

  @override
  State<BlocNote> createState() => _BlocNoteState();
}

class _BlocNoteState extends State<BlocNote> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Container(
        height: 250,
        width: double.infinity,
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.background,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: Theme.of(context).dividerColor,
            width: 2
          )
        ),
        child: Padding(
          padding:const EdgeInsets.symmetric(horizontal: 10),
          child: TextField(
            controller: widget.controller,
            maxLines: null,
            cursorColor: Theme.of(context).primaryColor,
            style: textStyle(),
            decoration: inputStyle(),
          ),
        ),
      ),
    );
  }

///////////////////////////////////////////////////////////////
/// Style du text
  TextStyle textStyle() {
    return TextStyle(
      color: Theme.of(context).colorScheme.tertiary,
      fontWeight: FontWeight.w500,
      fontSize: 16,
    );
  }

///////////////////////////////////////////////////////////////
/// style de la zone de text
  InputDecoration inputStyle() {
    return InputDecoration(
      contentPadding: EdgeInsets.zero,
      border: InputBorder.none,
      hintText: widget.hintText,
      fillColor: Theme.of(context).colorScheme.background,
      hintStyle: TextStyle(
        color: Theme.of(context).colorScheme.tertiary,
        fontWeight: FontWeight.w500,
        fontSize: 16,
      ),
    );
  }
}