import 'package:flutter/cupertino.dart';
import 'package:gestionnaire_interventions/oldComponent/oldTool.dart';

///////////////////////////////////////////////////////////////
/// Composant générant un block d'information avec deux lignes (titre et contenu)
class InfoLine extends StatefulWidget {
  final List<Map<String, String>> lines;
  const InfoLine({
    super.key,
    required this.lines
  });

  @override
  State<InfoLine> createState() => _InfoDoubleLineState();
}

class _InfoDoubleLineState extends State<InfoLine> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.45,
      child: Column(
        children: List.generate(
          widget.lines.length,
          (index) => Padding(
            padding: const EdgeInsets.symmetric(vertical: 1),
            child: Row(
              children: [
                Expanded(
                  child: textTwoWrap(widget.lines[index]["title"]!, widget.lines[index]["content"]!),
                )
              ],
            ),
          )
        ),
      )
    );
  }
}