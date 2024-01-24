import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../routes/navigation.dart';
import '../screens/SeuilScreen.dart';
import '../screens/Statistiques.dart';

class BottomBar extends StatelessWidget {
  const BottomBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              ElevatedButton
                (
                onPressed: () => navigateToSeuil(context),
                child: const Text('Seuil'),
              ),
              ElevatedButton(
                onPressed: () => navigateToStatistiques(context),
                child: const Text('Statistiques'),
              ),
            ],
          ),
        ),
      );
  }
}
