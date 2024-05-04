
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gestionnaire_interventions/Components/ViewTemplates/LitleComponent.dart';

///////////////////////////////////////////////////////////////
/// Header de l'app
class TopOfView extends StatefulWidget {
  final Widget? lead;
  final double? width;
  final double? height;
  final String title;
  final double titleSize;
  final String? sousTitre;
  final bool withBack;
  final BuildContext? passedContext;
  const TopOfView({
    Key? key,
    this.lead,
    this.width,
    this.height,
    this.title = "",
    this.titleSize = 26,
    this.sousTitre,
    this.withBack = false,
    this.passedContext
  });

  @override
  _TopOfViewState createState() => _TopOfViewState();
}

class _TopOfViewState extends State<TopOfView> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 50,
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            width: widget.width!,
            height: widget.height!,
            decoration: BoxDecoration(
              color: Theme.of(context).scaffoldBackgroundColor.withOpacity(0.90),
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                myShadow(context)
              ]
            ),
            child: Stack(
              children: [
                if (widget.withBack) backButton(),
                body()
              ],
            )
          )
        ),
      ]
    );
  }

///////////////////////////////////////////////////////////////
/// corp du code
  Column body() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (widget.lead != null) logoPad(),
              title()
            ],
          ),
        ),
        if (widget.sousTitre != null) secondTitle()
      ],
    );
  }

///////////////////////////////////////////////////////////////
/// titre
  Text title() {
    return Text(
      widget.title,
      style: TextStyle(
        fontSize: widget.titleSize,
        fontWeight: FontWeight.bold,
        color: Theme.of(context).textTheme.labelLarge!.color,
      ),
    );
  }

///////////////////////////////////////////////////////////////
/// sous titre
  Text secondTitle() {
    return Text(
      widget.sousTitre!,
      style: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.bold,
        color: Theme.of(context).textTheme.labelLarge!.color,
      ),
    );
  }

///////////////////////////////////////////////////////////////
/// padding du sousTitre
  Padding logoPad() {
    return Padding(
      padding: const EdgeInsets.only(right: 5),
      child: widget.lead!,
    );
  }

///////////////////////////////////////////////////////////////
/// padding du sousTitre
  Padding backButton() {
    return Padding(
      padding: const EdgeInsets.only(left: 2),
      child: Align(
        alignment: Alignment.centerLeft,
        child: SizedBox(
          height: 40,
          width: 40,
          child: IconButton(
            padding: EdgeInsets.zero,
            onPressed: () {
              Navigator.pop(widget.passedContext != null? widget.passedContext! : context);
            },
            iconSize: 40,
            icon: Icon(
              CupertinoIcons.chevron_back,
              size: 35,
              color: Theme.of(context).textTheme.labelLarge!.color,
            ),
          ),
        ),
      ),
    );
  }

}