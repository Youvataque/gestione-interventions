import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

///////////////////////////////////////////////////////////////
/// double boutton secondaire
class BackNextButton extends StatefulWidget {
  final VoidCallback func;
  final String title;
  const BackNextButton({
    super.key,
    required this.func,
    required this.title
  });

  @override
  State<BackNextButton> createState() => _BackNextButtonState();
}

///////////////////////////////////////////////////////////////
/// code principale
class _BackNextButtonState extends State<BackNextButton> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: SizedBox(
        width: double.infinity,
        height: 55,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            button(false),
            const Gap(20),
            button(true),
          ],
        ),
      ),
    );
  }

///////////////////////////////////////////////////////////////
/// création du bouton
  Widget button(bool main) {
    return Expanded(
      child: ElevatedButton(
        onPressed: () {
          main? widget.func() : Navigator.pop(context);
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: main? Theme.of(context).primaryColor : Theme.of(context).colorScheme.tertiary,
          foregroundColor: Theme.of(context).scaffoldBackgroundColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(17)
          )
        ),
        child: SizedBox(
          height: 50,
          child:  Center(
            child: Text(
              main? widget.title : "Retour",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 17,
                color: Theme.of(context).scaffoldBackgroundColor
              ),
            ),
          )
        )
      ),
    );
  }
}