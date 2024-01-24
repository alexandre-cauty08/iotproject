// Fonction pour naviguer vers la nouvelle interface
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../screens/SeuilScreen.dart';
import '../screens/Statistiques.dart';

/*
Fonctions pour naviguer entre les pages
 */
void navigateToStatistiques(BuildContext context) {
  Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => StatistiquesPage()),
  );
}

void navigateToSeuil(BuildContext context) {
  Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => SeuilScreen()),
  );
}