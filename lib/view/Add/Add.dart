import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:gestionnaire_interventions/oldComponent/oldTool.dart';
import 'package:gestionnaire_interventions/view/Add/Clim/Part1C.dart';
import 'package:gestionnaire_interventions/view/Add/Pompe/Part1P.dart';

class Add extends StatefulWidget {
  const Add({super.key});

  @override
  State<Add> createState() => _AddState();
}

class _AddState extends State<Add> {
  List<String> name = ["Climatisation", "Pompe à chaleur"];
  List<String> srcIm = ["src/clim.png", "src/pompe.png"];
  List<Widget> destination = [const Part1C(), const Part1P()];
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Body()
    );
  }

  Container Body() {
    return Container(
      width: MediaQuery.sizeOf(context).width - 30,
      child: Column(
        children: List.generate(
          name.length,
          (index) => Container(
            height: 125,
            padding: const EdgeInsets.only(bottom: 15),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.only(left: 5),
                backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                surfaceTintColor: Colors.transparent,
                foregroundColor: mainColor(),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)
                )
              ),
              onPressed: () {
                Navigator.push(context,
                  MaterialPageRoute(builder: (context) => destination[index])
                );
              },
              child: Row(
                children: [
                  const Gap(5),
                  SizedBox(
                    height: 90,
                    width: 90,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(15),
                      child: Image.asset(
                        srcIm[index],
                        fit: BoxFit.cover,
                      ),
                    )
                  ),
                  const Gap(60),
                  Text(
                    name[index],
                    style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                      color: textColor()
                    ),
                  )
                ],
              ),
            ),
          )
        ),
      )
    );
  }
}
