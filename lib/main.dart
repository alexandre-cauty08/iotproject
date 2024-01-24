import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:iotproject/routes/navigation.dart';
import 'package:iotproject/screens/SeuilScreen.dart';
import 'package:iotproject/screens/Statistiques.dart';
import 'components/bottomBar.dart';
import 'utils/utils.dart';
import 'service/database.dart';
import 'DefaultFirebaseOptions.dart';

class MyPage extends StatefulWidget {
  @override
  _MyPageState createState() => _MyPageState();
}

class _MyPageState extends State<MyPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Récupération de données IOT'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          FutureBuilder(
            future: LightData2(),
            builder: (context, snapshot) {
              // Chargement
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
                //Si il y a une erreur
              } else if (snapshot.hasError) {
                return Center(
                  child: Text('Erreur : ${snapshot.error}'),
                );
              } else {
                Map<String, dynamic>? jsonData = snapshot.data;
                dynamic value = jsonData?["value"];

                return Container(
                  padding: const EdgeInsets.all(20.0),
                  margin: const EdgeInsets.all(20.0),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.blueAccent),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Column(
                    children: [
                      const Text('Type : Luminosité'),
                      Text('Valeur : $value'),
                    ],
                  ),
                );
              }
            },
          ),
          FutureBuilder(
            future: TempData(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else if (snapshot.hasError) {
                return Center(
                  child: Text('Erreur : ${snapshot.error}'),
                );
              } else {
                Map<String, dynamic>? jsonData = snapshot.data;
                dynamic value = jsonData?["value"];

                return Container(
                  padding: const EdgeInsets.all(16.0),
                  margin: const EdgeInsets.all(8.0),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.blueAccent),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Column(
                    children: [
                      const Text('Type : Température'),
                      Text('Valeur : $value °C'),
                    ],
                  ),
                );
              }
            },
          ),
          Column(
            children: [
              const SizedBox(height: 20),  
              ElevatedButton(
                onPressed: () {
                  Allume();
                },
                child: const Text('Led allumée'),
              ),
            ],
          ),
          Column(
            children: [
              const SizedBox(height: 20),  
              ElevatedButton(
                onPressed: () {
                  Eteindre();
                },
                child: const Text('Led éteinte'),
              ),
            ],
          ),
          Center(
            child: ElevatedButton(
              onPressed: () {
                saveDataToFirestore();
              },
              child: const Text('Enregistrer dans Firestore'),
            ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: refreshData,
        child: const Icon(Icons.refresh),
      ),
        bottomNavigationBar: const BottomBar(),
    );
  }
  
  // Fonction pour actualiser les données
  void refreshData() {
    setState(() {
      TempData();
      LightData2();
    });
  }
}

Future<void> main() async {
    WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
    runApp(MaterialApp(
      home: MyPage(),
    ));
  }

