import 'package:flutter/material.dart';

// Ce widget, Loader, représente un indicateur de chargement circulaire personnalisable.
class Loader extends StatelessWidget {
  const Loader({this.color, this.size, this.strokeWidth, Key? key})
      : super(key: key);

  final Color? color; // La couleur de l'indicateur de chargement
  final double? size; // La taille de l'indicateur de chargement
  final double?
      strokeWidth; // L'épaisseur de la ligne de l'indicateur de chargement

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size ?? 24,
      height: size ?? 24,
      padding: const EdgeInsets.all(2.0),
      child: CircularProgressIndicator(
        color: color ?? Theme.of(context).primaryColor,
        strokeWidth: strokeWidth ?? 2,
      ),
    );
  }
}
