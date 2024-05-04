import 'package:flutter/material.dart';
import 'package:gestionnaire_interventions/Components/ViewTemplates/ForPlacement.dart';

///////////////////////////////////////////////////////////////
/// Composant de message d'erreur qui se reset
class ErrorView extends StatefulWidget {
  final String error;
  const ErrorView({
    super.key,
    required this.error,
  });

  @override
  State<ErrorView> createState() => _ErrorViewState();
}

class _ErrorViewState extends State<ErrorView> {
  String _displayedError = '';

  @override
  void initState() {
    super.initState();
    _setError();
  }
///////////////////////////////////////////////////////////////
/// Vérifie si error a changé pour set le reset
  @override
  void didUpdateWidget(covariant ErrorView oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.error != oldWidget.error) {
      _setError();
    }
  }

///////////////////////////////////////////////////////////////
/// UI de l'erreur
  @override
  Widget build(BuildContext context) {
    return ForPlacement(
      content: Text(
        _displayedError,
        style: const TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 14,
          color: Colors.red,
        ),
      ),
    );
  }

///////////////////////////////////////////////////////////////
/// Réinitialise l'erreur après 2s
  void _setError() {
    if (widget.error.isNotEmpty) {
      setState(() {
        _displayedError = widget.error;
      });
      Future.delayed(const Duration(seconds: 3), () {
        if (mounted) {
          setState(() {
            _displayedError = '';
          });
        }
      });
    }
  }
}
