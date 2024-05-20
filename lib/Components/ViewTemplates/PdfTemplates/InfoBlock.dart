import 'package:flutter/cupertino.dart';
import 'package:gap/gap.dart';
import 'package:gestionnaire_interventions/oldComponent/oldTool.dart';

///////////////////////////////////////////////////////////////
/// Composant générant un block d'information avec potentiellement un titre
class InfoBlock extends StatelessWidget {
  final String? title;
  final Widget content;
  const InfoBlock({
    super.key,
    this.title,
    required this.content
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: textColor(),
        ),
        borderRadius: BorderRadius.circular(5),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const SizedBox(
            height: 3,
          ),
          Column(
            children: [
              title != null
                  ? Padding(
                    padding: const EdgeInsets.only(bottom: 5),
                    child: Text(title!, style: secStyle()),
                  )
                  : const SizedBox(),
              title != null ? const Gap(5) : const SizedBox(),
            ]
          ),
          content,
          const SizedBox(
            height: 3,
          ),
        ],
      )
    );
  }
}