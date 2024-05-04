
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:gestionnaire_interventions/Components/ButtonTemplates/MainButton.dart';
import 'package:gestionnaire_interventions/Components/ButtonTemplates/MyTextField.dart';
import 'package:gestionnaire_interventions/Components/ViewTemplates/InfoText.dart';
import 'package:gestionnaire_interventions/Components/ViewTemplates/PopUpTemplate.dart';


///////////////////////////////////////////////////////////////
/// Widget complet de gestion de l'ajout, update ou suppression d'infos
class StepInfosView extends StatefulWidget {
  final List<String> content;
  final Function(List<String>) updateContent;
  const StepInfosView({
    super.key,
    required this.content,
    required this.updateContent,
  });

  @override
  State<StepInfosView> createState() => _StepInfosViewState();
}

class _StepInfosViewState extends State<StepInfosView> {
  late List<String> newContent;
  TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    newContent = widget.content;
    return Column(
      children: [
        body(),
        const Gap(20),
        MainButton(
          func: (){
            controller.text = "";
            showCupertinoModalPopup(
              context: context,
              builder: (context) => elementView(true, 0, context)
            );
          },
          icon: CupertinoIcons.add,
          type: true,
        )
      ],
    );
  }

///////////////////////////////////////////////////////////////
/// corp du code
  Column body() {
    return Column(
      children: List.generate(
        widget.content.length,
        (index) => Column(
          children: [
            element(
              () {
                controller.text = widget.content[index];
                showCupertinoModalPopup(
                  context: context,
                  builder: (context) => elementView(false, index, context)
                );
              },
              widget.content[index]
            ),
            const Gap(10)
          ],
        )
      ),
    );
  }
  
///////////////////////////////////////////////////////////////
/// template d'un élément de la page
  Padding element(VoidCallback func, String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: SizedBox(
      width: double.infinity,
      height: 50,
      child: ElevatedButton(
          onPressed: () {
            func();
          },
          style: buttonStyle(context),
          child: Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                title,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 17,
                  color: Theme.of(context).primaryColor
                ),
              ),
            ),
          )
        )
    ),
    );
  }

///////////////////////////////////////////////////////////////
/// Style du bouton
  ButtonStyle buttonStyle(BuildContext context) {
    return ElevatedButton.styleFrom(
      backgroundColor: Theme.of(context).colorScheme.background,
      foregroundColor: Theme.of(context).primaryColor,
      shadowColor: Colors.transparent,
      surfaceTintColor: Colors.transparent,
      padding: EdgeInsets.zero,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20)
      ),
      side: BorderSide(
        color: Theme.of(context).dividerColor,
        width: 2
      )
    );
  }

///////////////////////////////////////////////////////////////
/// Page d'ajout d'un élément
  Widget elementView(bool type, int index, BuildContext context) {
    return PopUpTemplate(
      padding: MediaQuery.sizeOf(context).height * 18 / 100,
      heigth: 260,
      child: Column(
        children: [
          elementContent(type),
          type? elementBottom1(context) : elementBottom2(index, context)
        ],
      ),
    );
  }

///////////////////////////////////////////////////////////////
/// bottom de l'élément
  Widget elementBottom1(BuildContext panelContext) {
    return MainButton(
      func: (){
        newContent.add(controller.text.trim());
        widget.updateContent(newContent);
        Navigator.pop(panelContext);
      },
      title: "Ajouter",
    );
  }

///////////////////////////////////////////////////////////////
/// bottom de l'élément
  Widget elementBottom2(int index, BuildContext panelContext) {
    return MainButton(
      func: (){
        setState(() {
          widget.content[index] = controller.text.trim();
          Navigator.pop(panelContext);
        });
      },
      title: "Modifier",
    );
  }

///////////////////////////////////////////////////////////////
/// contenu de l'élement
  Column elementContent(bool type) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Gap(20),
        InfoText(
          text: type? "Ajoutons une tache !" : "Modifions une tache !",
        ),
        const Gap(10),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              const Gap(40),
              MyTextField(
                maxLength: 48,
                autoFocus: true,
                controller: controller,
                hintText: "Votre information",
                noPadding: true,
              )
            ],
          )
        ),
        const Gap(10),
      ],
    );
  }
}