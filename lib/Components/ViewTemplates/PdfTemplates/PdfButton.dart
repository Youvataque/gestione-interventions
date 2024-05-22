import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/widgets.dart';
import 'package:gap/gap.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:screenshot/screenshot.dart';
import 'package:share/share.dart';

///////////////////////////////////////////////////////////////
/// Composant de capture et de conversion pdf
class PdfButton extends StatefulWidget {
  final Widget child;
  final String clientName;
  const PdfButton({
    Key? key,
    required this.child,
    required this.clientName
  });
  @override
  _PdfButtonState createState() => _PdfButtonState();
}

class _PdfButtonState extends State<PdfButton> {
  final ScreenshotController screenshotController = ScreenshotController();

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Screenshot(
                  controller: screenshotController,
                  child: widget.child
                ),
                button(),
                const Gap(40),
              ],
            ),
          ),
        ),
        Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height * 0.2,
          color: Colors.transparent,
        ),
      ],
    );
  }

  ///////////////////////////////////////////////////////////////
  /// bouton de génération du PDF
  SizedBox button() {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.95,
      height: 45,
      child: CupertinoButton(
        padding: EdgeInsets.zero,
        color: Theme.of(context).primaryColor,
        child: const Text(
          "Partager le PDF",
          style: TextStyle(
            color: CupertinoColors.white,
            fontSize: 16,
            fontWeight: FontWeight.bold
          ),
        ),
        onPressed: () async  {
           final image = await screenshotController.capture();
           await saveAndShare(image, widget.clientName);
        },
      )
    );
  }

  ///////////////////////////////////////////////////////////////
  /// sauvegarde l'image en local et propose de la partager
  Future<void> saveAndShare(Uint8List? bytes, String userName) async {
    DateTime temp = DateTime.now();
    final directory = await getApplicationDocumentsDirectory();

    // Enregistrer l'image
    final imagePath = '${directory.path}/${userName}_${temp.year}.png';
    final imageFile = File(imagePath);
    await imageFile.writeAsBytes(bytes!);

    // Créer un document PDF
    final pdf = pw.Document();
    final image = pw.MemoryImage(bytes);
    const myPageTheme = pw.PageTheme(
      pageFormat: PdfPageFormat.a4,
      margin: pw.EdgeInsets.zero,
    );

    // Ajouter l'image au PDF en conservant les proportions
    pdf.addPage(pw.Page(
      pageTheme: myPageTheme,
      build: (pw.Context context) {
        return pw.Align(
          alignment: pw.Alignment.topCenter,
          child: pw.Image(
            image,
            fit: pw.BoxFit.fitHeight,
          ),
        );
      },
    ));

    // Enregistrer le PDF
    final pdfPath = '${directory.path}/${userName}_${temp.year}.pdf';
    final pdfFile = File(pdfPath);
    await pdfFile.writeAsBytes(await pdf.save());

    // Partager le PDF
    await Share.shareFiles([pdfFile.path]);
  }
}
