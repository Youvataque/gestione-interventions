import 'package:flutter/cupertino.dart';
import 'package:gestionnaire_interventions/oldComponent/oldTool.dart';

///////////////////////////////////////////////////////////////
/// Composant générant un block d'information avec deux lignes (titre et contenu)
class InfoDoubleLine extends StatefulWidget {
  final List<List<Map<String, String>>> lines;
  const InfoDoubleLine({
    super.key,
    required this.lines
  });

  @override
  State<InfoDoubleLine> createState() => _InfoDoubleLineState();
}

class _InfoDoubleLineState extends State<InfoDoubleLine> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.95,
      child: Column(
        children: List.generate(
          widget.lines.length,
          (index) => Padding(
            padding: const EdgeInsets.symmetric(vertical: 1.5),
            child: Row(
              children: [
                Expanded(
                  child: textTwoWrap(widget.lines[index][0]["title"]!, widget.lines[index][0]["content"]!)
                ),
                if (widget.lines[index].length > 1)
                Expanded(
                    child: textTwoWrap(widget.lines[index][1]["title"]!, widget.lines[index][1]["content"]!)
                )
              ],
            ),
          )
        ),
      )
    );
  }
}