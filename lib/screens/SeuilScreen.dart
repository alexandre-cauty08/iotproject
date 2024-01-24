import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class SeuilScreen extends StatefulWidget {

  @override
  _SeuilScreen createState() => _SeuilScreen();
}

/*
Je diminue ou augmente le visuel du seuil et j'appelle les url qui
augmente ou diminue le seuil dans le projet arduino
 */

class _SeuilScreen extends State<SeuilScreen>{
  int seuil = 1500;

  Future<void> augmenterSeuil() async {
    setState(() {
      seuil += 100;
    });

    // Envoyer la requête HTTP pour augmenter le seuil de 100
    String url = "http://192.168.1.41/AugmenteSeuil";
    await http.get(Uri.parse(url));
  }

  Future<void> diminuerSeuil() async {
    setState(() {
      seuil -= 100;
    });

    // Envoyer la requête HTTP pour diminuer le seuil de 100
    String url2 = "http://192.168.1.41/DiminueSeuil";
    await http.get(Uri.parse(url2));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Seuil'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Seuil actuel : $seuil'),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: augmenterSeuil,
              child: const Text('Augmenter le seuil'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: diminuerSeuil,
              child: const Text('Diminuer le seuil'),
            ),
          ],
        ),
      ),
    );
  }
}