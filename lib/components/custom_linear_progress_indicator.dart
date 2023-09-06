import 'package:flutter/material.dart';
// Ce widget personnalisé, CustomLinearProgressIndicator, représente une jauge de progression avec un texte de pourcentage superposé.

class CustomLinearProgressIndicator extends StatelessWidget {
  final double
      value; // La valeur actuelle de la jauge de progression (de 0.0 à 1.0)

  const CustomLinearProgressIndicator({super.key, required this.value});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.centerRight,
      children: <Widget>[
        // Utilisation de ClipRRect pour ajouter des coins arrondis à la jauge de progression
        ClipRRect(
          borderRadius: const BorderRadius.all(Radius.circular(10)),
          child: LinearProgressIndicator(
            color: const Color(0xFFEA3799),
            value: value,
            minHeight: 20,
          ),
        ),
        // Un texte affichant le pourcentage de la progression.
        Padding(
            padding: const EdgeInsets.all(10),
            child: Text('${(value * 100).toInt()} %',
                style: const TextStyle(
                    fontSize: 15,
                    color: Colors.purple,
                    fontWeight: FontWeight.bold)))
      ],
    );
  }
}
