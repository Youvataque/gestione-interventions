import 'package:flutter/material.dart';
import 'package:gestionnaire_interventions/component/Struct.dart';
import 'package:gestionnaire_interventions/view/Addclient/Add/AddPage.dart';

class EditPage extends StatefulWidget {
  final Client monClient;
  const EditPage({
    super.key,
    required this.monClient,
  });

  @override
  State<EditPage> createState() => _EditPageState();
}

class _EditPageState extends State<EditPage> {
  String errorText = "";
  @override
  Widget build(BuildContext context) {
    return AddPage(
      myClient: widget.monClient,
      add: false,
    );
  }
}
