import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gestionnaire_interventions/component/connect.dart';

// Convertit des couleurs HEX pour le primaryswatch. A utiliser pour définir la couleur du thème !
MaterialColor buildMaterialcolor(Color color) {
  List strengths = <double>[.05];
  Color color1 = color.withOpacity(1);
  Map<int, Color> swatch = {};
  final int r = color1.red, g = color1.green, b = color1.blue;

  for (int i = 1; i < 10; i++) {
    strengths.add(0.1 * i);
  }
  strengths.forEach((strength) {
    final double ds = 0.5 - strength;
    swatch[(strength * 1000).round()] = Color.fromRGBO(
      r + ((ds < 0 ? r : (255 - r)) * ds).round(),
      g + ((ds < 0 ? g : (255 - g)) * ds).round(),
      b + ((ds < 0 ? b : (255 - b)) * ds).round(),
      1,
    );
  });
  return MaterialColor(color1.value, swatch);
}

////////////////////////////////////////
////////////////////////////////////////

// couleur des texts
Color textColor() {
  return const Color(0x0D1630).withOpacity(1);
}

// couleur de l'app
Color mainColor() {
  return const Color(0x133177).withOpacity(1);
}

////////////////////////////////////////
////////////////////////////////////////

// Widget créant des hauts de page customisable
class TopOfView extends StatefulWidget {
  final Widget? lead;
  final double? width;
  final double? height;
  final String title;
  final double titleSize;
  final String? sousTitre;

  const TopOfView(
      {Key? key,
      this.lead,
      this.width,
      this.height,
      this.title = "",
      this.titleSize = 30,
      this.sousTitre});

  @override
  _TopOfViewState createState() => _TopOfViewState();
}

class _TopOfViewState extends State<TopOfView> {
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      const SizedBox(
        height: 50,
      ),
      Align(
          alignment: Alignment.bottomCenter,
          child: Container(
              width: widget.width!,
              height: widget.height!,
              decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.85),
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.grey.withOpacity(0.9), blurRadius: 6)
                  ]),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        if (widget.lead != null)
                          Padding(
                            padding: EdgeInsets.only(right: 5),
                            child: widget.lead!,
                          ),
                        Text(
                          widget.title,
                          style: TextStyle(
                            fontSize: widget.titleSize,
                            fontWeight: FontWeight.bold,
                            color: textColor(),
                          ),
                        ),
                      ],
                    ),
                  ),
                  if (widget.sousTitre != null)
                    Text(
                      widget.sousTitre!,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: textColor(),
                      ),
                    )
                ],
              ))),
    ]);
  }
}

////////////////////////////////////////
////////////////////////////////////////

// le nom est explicite ;)
String retirerAccents(String texteAvecAccents) {
  final Map<String, String> accents = {
    'à': 'a',
    'á': 'a',
    'â': 'a',
    'ã': 'a',
    'ä': 'a',
    'å': 'a',
    'ç': 'c',
    'è': 'e',
    'é': 'e',
    'ê': 'e',
    'ë': 'e',
    'ì': 'i',
    'í': 'i',
    'î': 'i',
    'ï': 'i',
    'ñ': 'n',
    'ò': 'o',
    'ó': 'o',
    'ô': 'o',
    'õ': 'o',
    'ö': 'o',
    'ù': 'u',
    'ú': 'u',
    'û': 'u',
    'ü': 'u',
    'ý': 'y',
    'ÿ': 'y'
  };

  String texteSansAccents = '';
  for (int i = 0; i < texteAvecAccents.length; i++) {
    final char = texteAvecAccents[i];
    texteSansAccents += accents[char] ?? char;
  }
  return texteSansAccents;
}

////////////////////////////////////////
////////////////////////////////////////

//widget titre
Padding title(String titre) {
  // constructeur du titre
  return Padding(
    padding: EdgeInsets.only(left: 10, bottom: 8),
    child: Align(
      alignment: Alignment.centerLeft,
      child: Container(
          width: 250,
          height: 45,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(17.5),
              color: Colors.white.withOpacity(0.85),
              boxShadow: [
                BoxShadow(color: Colors.grey.withOpacity(0.7), blurRadius: 7)
              ]),
          child: Center(
            child: Text(
              titre,
              style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
            ),
          )),
    ),
  );
}

////////////////////////////////////////
////////////////////////////////////////

// big TextField
Container bigTextField(TextEditingController controller, String hintText) {
  return Container(
    width: 320,
    height: 55,
    child: TextFormField(
      controller: controller,
      textAlign: TextAlign.center,
      decoration: InputDecoration(
          hintStyle: TextStyle(
              fontWeight: FontWeight.bold, color: textColor(), fontSize: 16),
          contentPadding: const EdgeInsets.only(top: 15, bottom: 15),
          hintText: hintText,
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: const BorderSide(color: Colors.grey)),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
          )),
    ),
  );
}

////////////////////////////////////////
////////////////////////////////////////

//litle TextField
Container litleTextField(
    TextEditingController controller, String hintText, bool keyboardType) {
  return Container(
    width: 150,
    height: 55,
    child: TextFormField(
      controller: controller,
      textAlign: TextAlign.center,
      keyboardType: keyboardType ? TextInputType.number : null,
      decoration: InputDecoration(
          hintStyle: TextStyle(
              fontWeight: FontWeight.bold, color: textColor(), fontSize: 16),
          contentPadding: const EdgeInsets.only(top: 15, bottom: 15),
          hintText: hintText,
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: const BorderSide(color: Colors.grey)),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
          )),
    ),
  );
}

////////////////////////////////////////
////////////////////////////////////////

Container miniTextFieldLikeBig(
    TextEditingController controller, String hintText) {
  return Container(
    height: 55,
    width: 320,
    decoration: BoxDecoration(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: Colors.grey,
        )),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          hintText,
          style: TextStyle(
              fontWeight: FontWeight.bold, color: textColor(), fontSize: 16),
        ),
        const SizedBox(
          width: 10,
        ),
        Container(
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
                    borderSide: const BorderSide(color: Colors.grey)),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                )),
          ),
        ),
      ],
    ),
  );
}

////////////////////////////////////////
////////////////////////////////////////

Container TextArea(TextEditingController controller, String hintText) {
  return Container(
    width: 320,
    height: 120,
    child: TextFormField(
      controller: controller,
      textAlign: TextAlign.center,
      maxLines: null,
      expands: true,
      decoration: InputDecoration(
          hintStyle: TextStyle(
              fontWeight: FontWeight.bold, color: textColor(), fontSize: 16),
          hintText: hintText,
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: const BorderSide(color: Colors.grey)),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
          )),
    ),
  );
}

////////////////////////////////////////
////////////////////////////////////////

Container Pointer(String title) {
  return Container(
    decoration: BoxDecoration(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.grey)),
    width: 320,
    height: 55,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          CupertinoIcons.arrow_down_circle,
          size: 30,
          color: textColor(),
        ),
        const SizedBox(
          width: 20,
        ),
        Text(
          title,
          style: TextStyle(
              fontWeight: FontWeight.bold, color: textColor(), fontSize: 16),
        ),
        const SizedBox(
          width: 20,
        ),
        Icon(
          CupertinoIcons.arrow_down_circle,
          size: 30,
          color: textColor(),
        )
      ],
    ),
  );
}

////////////////////////////////////////
////////////////////////////////////////

class BoolField extends StatefulWidget {
  final List<bool> controller;
  final String hintText;
  BoolField({Key? key, required this.controller, required this.hintText});

  @override
  State<BoolField> createState() => _BoolFieldState();
}

class _BoolFieldState extends State<BoolField> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 55,
      width: 320,
      decoration: BoxDecoration(
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: Colors.grey,
          )),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
              width: 230,
              child: Center(
                child: Text(
                  widget.hintText,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: textColor(),
                      fontSize: 16),
                ),
              )),
          const SizedBox(
            width: 10,
          ),
          CupertinoSwitch(
              activeColor: mainColor(),
              value: widget.controller[0],
              onChanged: (bool value) {
                setState(() {
                  widget.controller[0] = value;
                });
              })
        ],
      ),
    );
  }
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
    return MaterialApp(
        home: Container(
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("src/BackgroundAppWhite.jpg"),
                    fit: BoxFit.cover)),
            child: GestureDetector(
              onTap: () => FocusScope.of(context).unfocus(),
              child: PopScope(
                child: Scaffold(
                    backgroundColor: Colors.transparent,
                    body: SingleChildScrollView(
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            TopOfView(
                              width: MediaQuery.sizeOf(context).width - 20,
                              height: 60,
                              title: widget.title,
                              lead: Icon(
                                widget.mainIcon,
                                size: 40,
                                color: textColor(),
                              ),
                            ),
                            const SizedBox(
                              height: 80,
                            ),
                            widget.Body!,
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  height: 55,
                                  width:
                                      MediaQuery.sizeOf(context).width / 2 - 45,
                                  child: ElevatedButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    style: ElevatedButton.styleFrom(
                                        backgroundColor: Colors.grey.shade400,
                                        foregroundColor: mainColor(),
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(20))),
                                    child: Text(
                                      "Retour",
                                      style: TextStyle(
                                          color: textColor(),
                                          fontWeight: FontWeight.bold,
                                          fontSize: 17),
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  width: 30,
                                ),
                                widget.buttonTitle != ""
                                    ? Container(
                                        height: 55,
                                        width:
                                            MediaQuery.sizeOf(context).width /
                                                    2 -
                                                45,
                                        child: ElevatedButton(
                                          onPressed: () {
                                            widget.func!();
                                          },
                                          style: ElevatedButton.styleFrom(
                                              backgroundColor: mainColor(),
                                              foregroundColor: Colors.grey,
                                              shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          20))),
                                          child: Text(
                                            widget.buttonTitle,
                                            style: const TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 17),
                                          ),
                                        ),
                                      )
                                    : Container(),
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 10),
                              child: Text(
                                widget.errorText,
                                style: const TextStyle(
                                    color: Colors.red,
                                    fontWeight: FontWeight.bold),
                                textAlign: TextAlign.center,
                              ),
                            ),
                            SizedBox(
                              height: 120,
                            )
                          ],
                        ),
                      ),
                    )),
              ),
            )));
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

Container InterButton(int index, void Function(int) func, String title) {
  return Container(
    height: 60,
    width: 320,
    child: ElevatedButton(
        onPressed: () {
          func(index);
        },
        style: ElevatedButton.styleFrom(
            backgroundColor: mainColor(),
            surfaceTintColor: Colors.transparent,
            foregroundColor: Colors.grey,
            shadowColor: Colors.transparent,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
                side: const BorderSide(color: Colors.grey))),
        child: Text(title,
            textAlign: TextAlign.center,
            style: const TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.white,
                fontSize: 16))),
  );
}

////////////////////////////////////////
////////////////////////////////////////

class InterTemplate extends StatefulWidget {
  final Widget? Body;
  final VoidCallback? func;
  final String errorText;
  final IconData mainIcon;
  final String title;
  final String sousTitle;
  const InterTemplate({
    super.key,
    this.Body,
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
    return MaterialApp(
        home: Container(
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("src/BackgroundAppWhite.jpg"),
                    fit: BoxFit.cover)),
            child: GestureDetector(
              onTap: () => FocusScope.of(context).unfocus(),
              child: PopScope(
                child: Scaffold(
                    backgroundColor: Colors.transparent,
                    body: SingleChildScrollView(
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            TopOfView(
                              width: MediaQuery.sizeOf(context).width - 20,
                              height: 60,
                              title: widget.title,
                              lead: Icon(
                                widget.mainIcon,
                                size: 40,
                                color: textColor(),
                              ),
                            ),
                            const SizedBox(
                              height: 80,
                            ),
                            title(widget.sousTitle),
                            Container(
                              width: MediaQuery.sizeOf(context).width - 20,
                              decoration: BoxDecoration(
                                  color: Colors.white.withOpacity(0.85),
                                  borderRadius: BorderRadius.circular(20),
                                  boxShadow: [
                                    BoxShadow(
                                        blurRadius: 7,
                                        color: Colors.grey.withOpacity(0.7))
                                  ]),
                              child: Column(
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
                                          )),
                                    ),
                                  ),
                                  widget.Body!,
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 10),
                              child: Text(
                                widget.errorText,
                                style: const TextStyle(
                                    color: Colors.red,
                                    fontWeight: FontWeight.bold),
                                textAlign: TextAlign.center,
                              ),
                            ),
                            const SizedBox(
                              height: 120,
                            )
                          ],
                        ),
                      ),
                    )),
              ),
            )));
  }
}

////////////////////////////////////////
////////////////////////////////////////

Container block(double width, Widget content) {
  return Container(
      width: width,
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
          content,
          const SizedBox(
            height: 3,
          ),
        ],
      ));
}

////////////////////////////////////////
////////////////////////////////////////

Padding textRow(Widget part1, Widget part2) {
  return Padding(
      padding: const EdgeInsets.only(left: 5),
      child: Wrap(
        children: [part1, part2],
      ));
}

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

TextStyle argStyle() {
  return TextStyle(
      fontSize: 8, color: mainColor(), fontWeight: FontWeight.normal);
}

TextStyle titleStyle() {
  return TextStyle(
      fontSize: 9, fontWeight: FontWeight.bold, color: textColor());
}

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

int getClientFromInter(String ref) {
  int result = 0;
  for (int x = 0; x < clients.length; x++) {
    if (ref == clients[x].uid) {
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

