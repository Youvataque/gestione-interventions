import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:gestionnaire_interventions/Components/ButtonTemplates/BackNextButton.dart';
import 'package:gestionnaire_interventions/Components/FondamentalAppCompo/CloudBack.dart';
import 'package:gestionnaire_interventions/Components/ViewTemplates/BackTemplate.dart';
import 'package:gestionnaire_interventions/Components/ViewTemplates/ErrorView.dart';
import 'package:gestionnaire_interventions/Components/ViewTemplates/TitleText.dart';
import 'package:gestionnaire_interventions/oldComponent/connect.dart';
import 'package:gestionnaire_interventions/Components/FondamentalAppCompo/TopOfView.dart';

////////////////////////////////////////
////////////////////////////////////////

// couleur des texts
Color textColor() {
  return const Color(0x0D1630).withOpacity(1);
}

// couleur de l'app
Color mainColor() {
  return const Color.fromARGB(255, 31, 110, 185);
}

////////////////////////////////////////
////////////////////////////////////////

Padding miniTextFieldLikeBig(TextEditingController controller, String hintText, BuildContext context) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 15),
    child: Container(
      height: 50,
      width: double.infinity,
      decoration: BoxDecoration(
          color: Theme.of(context).scaffoldBackgroundColor,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: Theme.of(context).dividerColor,
            width: 2
          )),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            hintText,
            style: TextStyle(
              fontWeight: FontWeight.w500,
              color: Theme.of(context).colorScheme.tertiary,
              fontSize: 16
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          SizedBox(
            width: 35,
            height: 35,
            child: TextFormField(
              controller: controller,
              textAlign: TextAlign.center,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.only(top: 0, bottom: 0),
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12.5),
                    borderSide: BorderSide(color: Theme.of(context).textTheme.labelLarge!.color!)),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: BorderSide(color: Theme.of(context).colorScheme.tertiary)),
                ),
            ),
          ),
        ],
      ),
    ),
  );
}

////////////////////////////////////////
////////////////////////////////////////

Container textArea(TextEditingController controller, String hintText, BuildContext context) {
  return Container(
    width: double.infinity,
    height: 120,
    decoration: BoxDecoration(
      color: Theme.of(context).scaffoldBackgroundColor,
      borderRadius: BorderRadius.circular(20)
    ),
    child: TextField(
      controller: controller,
      textAlign: TextAlign.center,
      maxLines: null,
      expands: true,
      decoration: InputDecoration(
        hintStyle: TextStyle(
            fontWeight: FontWeight.bold, color: Theme.of(context).colorScheme.tertiary, fontSize: 16),
        hintText: hintText,
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: BorderSide(color: Theme.of(context).dividerColor, width: 2),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: BorderSide(color: Theme.of(context).colorScheme.tertiary, width: 2)
        )
      ),
    ),
  );
}

////////////////////////////////////////
////////////////////////////////////////

Container Pointer(String title, BuildContext context) {
  return Container(
    decoration: BoxDecoration(
      color: Colors.transparent,
      borderRadius: BorderRadius.circular(20),
      border: Border.all(
        color: Theme.of(context).dividerColor,
        width: 2
      )
    ),
    width: double.infinity,
    height: 50,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          CupertinoIcons.arrow_down_circle,
          size: 30,
          color: Theme.of(context).primaryColor,
        ),
        const SizedBox(
          width: 20,
        ),
        Text(
          title,
          style: TextStyle(
              fontWeight: FontWeight.w500, color: Theme.of(context).colorScheme.tertiary, fontSize: 16),
        ),
        const SizedBox(
          width: 20,
        ),
        Icon(
          CupertinoIcons.arrow_down_circle,
          size: 30,
          color: Theme.of(context).primaryColor,
        )
      ],
    ),
  );
}

////////////////////////////////////////
////////////////////////////////////////

// Template pour toutes les sous pages des entretiens
class AddTemplate extends StatefulWidget {
  final Widget? Body;
  final VoidCallback? func;
  final String buttonTitle;
  final String errorText;
  final IconData mainIcon;
  final String title;
  const AddTemplate({
    super.key,
    this.Body,
    this.func,
    this.buttonTitle = "Suivant",
    this.errorText = "",
    this.mainIcon = CupertinoIcons.snow,
    required this.title,
  });

  @override
  State<AddTemplate> createState() => _AddTemplateState();
}

class _AddTemplateState extends State<AddTemplate> {
  @override
  Widget build(BuildContext context) {
    return BackTemplate(
      content: SingleChildScrollView(
        child: Column(
          children: [
            TopOfView(
              width: MediaQuery.sizeOf(context).width - 30,
              height: 60,
              title: widget.title,
              lead: Icon(
                widget.mainIcon,
                size: 40,
                color: textColor(),
              ),
            ),
            const Gap(60),
            widget.Body!,
            BackNextButton(
              func: () => widget.func!(),
              title: widget.buttonTitle
            ),
            const Gap(10),
            ErrorView(
              key: UniqueKey(),
              error: widget.errorText,
            ),
            const Gap(120)
          ],
        ),
      ),
    );
  }
}

////////////////////////////////////////
////////////////////////////////////////

List<String> convert(List<dynamic> temp) {
  List<String> temped = [];
  for (dynamic x in temp) {
    temped.add(x ?? "");
  }
  return temped;
}

////////////////////////////////////////
////////////////////////////////////////

String getNameFromInter(String userId) {
  for (int x = 0; x < clients.length; x++) {
    if (userId == clients[x].uid) {
      return clients[x].nom + " " + clients[x].prenom;
    }
  }
  return "";
}

////////////////////////////////////////
////////////////////////////////////////

class InterTemplate extends StatefulWidget {
  final Widget? body;
  final VoidCallback? func;
  final String errorText;
  final IconData mainIcon;
  final String title;
  final String sousTitle;
  const InterTemplate({
    super.key,
    this.body,
    this.func,
    this.errorText = "",
    this.mainIcon = CupertinoIcons.snow,
    this.sousTitle = "",
    required this.title,
  });

  @override
  State<InterTemplate> createState() => _InterTemplateState();
}

class _InterTemplateState extends State<InterTemplate> {
  @override
  Widget build(BuildContext context) {
    return BackTemplate(
      content: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TopOfView(
              width: MediaQuery.sizeOf(context).width - 30,
              height: 60,
              title: widget.title,
              lead: Icon(
                widget.mainIcon,
                size: 40,
                color: textColor(),
              ),
            ),
            const Gap(60),
            TitleText(title: widget.sousTitle),
            const Gap(20),
            CloudBack(
              child: Column(
                children: [
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 3),
                        child: Align(
                          alignment: Alignment.topLeft,
                          child: IconButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            icon: Icon(
                              Icons.navigate_before,
                              color: mainColor(),
                              size: 30,
                            )
                          ),
                        ),
                      ),
                      widget.body!,
                    ],
                  ),
                ],
              ),
            ),
            ErrorView(
              key: UniqueKey(),
              error: widget.errorText,
            ),
            const Gap(120)
          ],
        ),
      ),
    );
  }
}

////////////////////////////////////////
////////////////////////////////////////

Padding textTwoWrap(String part1, String part2) {
  return Padding(
    padding: const EdgeInsets.only(left: 5),
    child: Text.rich(
      TextSpan(
          style: titleStyle(),
          text: part1,
          children: [TextSpan(style: argStyle(), text: part2)]),
      softWrap: true,
    ),
  );
}

////////////////////////////////////////
////////////////////////////////////////

TextStyle argStyle() {
  return TextStyle(fontSize: 8, color: mainColor(), fontWeight: FontWeight.normal);
}

////////////////////////////////////////
////////////////////////////////////////

TextStyle titleStyle() {
  return TextStyle(
      fontSize: 9, fontWeight: FontWeight.bold, color: textColor());
}

////////////////////////////////////////
////////////////////////////////////////

TextStyle secStyle() {
  return TextStyle(
      fontSize: 13,
      fontWeight: FontWeight.bold,
      color: textColor(),
      decoration: TextDecoration.underline);
}

////////////////////////////////////////
////////////////////////////////////////

int getUserFromInter() {
  int result = 0;
  String userId = FirebaseAuth.instance.currentUser!.uid;
  for (int x = 0; x < userData.length; x++) {
    if (userId == userData[x].uid) {
      result = x;
    }
  }
  return result;
}

////////////////////////////////////////
////////////////////////////////////////

int getUserClientFromInter(String ref) {
  int result = 0;
  for (int x = 0; x < userData.length; x++) {
    if (ref == userData[x].uid) {
      result = x;
    }
  }
  return result;
}

////////////////////////////////////////
////////////////////////////////////////

String boolToString(bool myBool) {
  if (myBool) {
    return "Fait";
  } else {
    return "Pas fait";
  }
}

////////////////////////////////////////
////////////////////////////////////////

String twoDigits(int n) {
  if (n >= 10) return "$n";
  return "0$n";
}

////////////////////////////////////////
////////////////////////////////////////

String returnDateFromSerial(String serialNumber, bool clim) {
  return clim
      ? serialDataClim[serialNumber] ?? ""
      : serialDataPompe[serialNumber] ?? "";
}

////////////////////////////////////////
////////////////////////////////////////

int clientFromId(String ref) {
  int result = 0;
  for (int x = 0; x < clients.length; x++) {
    if (ref == clients[x].uid) {
      result = x;
    }
  }
  return result;
}