
import 'package:flutter/cupertino.dart';
import 'package:gap/gap.dart';
import 'package:gestionnaire_interventions/Components/ButtonTemplates/MyTextField.dart';
import 'package:gestionnaire_interventions/Components/Structure/DoubleTextfield.dart';

///////////////////////////////////////////////////////////////
/// Deux textFields
class StackedField extends StatelessWidget {
  final DoubleTextfield data;
  const StackedField({
    super.key,
    required this.data
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Row(
        children: [
          Expanded(
            child: MyTextField(
              controller: data.controller1,
              hintText: data.title1,
              noPadding: true,
              padding: 10,
            ),
          ),
          const Gap(20),
          Expanded(
            child: MyTextField(
              controller: data.controller2,
              hintText: data.title2,
              noPadding: true,
              padding: 10,
            ),
          ),
        ],
      ),
    );
  }
}