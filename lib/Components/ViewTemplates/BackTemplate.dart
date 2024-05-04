import 'package:flutter/material.dart';

///////////////////////////////////////////////////////////////
/// Composant gérant la structure de base de chaques pages
class BackTemplate extends StatelessWidget {
  final Widget content;
  final bool resizable;
  final Widget? bottomNav;
  const BackTemplate({
    super.key,
    required this.content,
    this.resizable = true,
    this.bottomNav
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage("src/BackLight.jpg"),
          fit: BoxFit.cover
        )
      ),
      child: Scaffold(
        resizeToAvoidBottomInset: resizable,
        backgroundColor: Colors.transparent,
        bottomNavigationBar: bottomNav,
        body: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          behavior: HitTestBehavior.opaque,
          child: content
        )
      ),
    );
  }
}