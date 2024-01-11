import 'package:flutter/material.dart';
import 'package:gestionnaire_interventions/component/tool.dart';
import 'package:flutter/cupertino.dart';
import 'package:gestionnaire_interventions/view/Add/Clim/Part1C.dart';
import 'package:gestionnaire_interventions/view/Add/Pompe/Part1P.dart';

class Add extends StatefulWidget {
  const Add({super.key});

  @override
  State<Add> createState() => _AddState();
}

class _AddState extends State<Add> {
  List<String> name = ["Climatisation", "Pompe à chaleur"];
  List<String> srcIm = ["src/climVide.png", "src/pompeVide.png"];
  List<Widget> destination = [const Part1C(), const Part1P()];
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          TopOfView(
            title: "Interventions",
            height: 60,
            width: MediaQuery.sizeOf(context).width - 20,
            lead: Icon(
              CupertinoIcons.hammer_fill,
              size: 40,
              color: textColor(),
            ),
          ),
          const SizedBox(
            height: 100,
          ),
          Body()
        ],
      ),
    );
  }

  Container Body() {
    return Container(
      width: MediaQuery.sizeOf(context).width - 20,
      child: ListView.builder(
          itemCount: 2,
          shrinkWrap: true,
          padding: EdgeInsets.zero,
          physics: NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            return Container(
              height: 125,
              padding: EdgeInsets.only(bottom: 15),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white.withOpacity(0.95),
                    surfaceTintColor: Colors.transparent,
                    foregroundColor: mainColor(),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20))),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => destination[index]));
                },
                child: Row(
                  children: [
                    const SizedBox(
                      width: 5,
                    ),
                    Container(
                        height: 90,
                        width: 90,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(15),
                          child: Image.asset(
                            srcIm[index],
                            fit: BoxFit.cover,
                          ),
                        )),
                    const SizedBox(
                      width: 60,
                    ),
                    Text(
                      name[index],
                      style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                          color: textColor()),
                    )
                  ],
                ),
              ),
            );
          }),
    );
  }
}
