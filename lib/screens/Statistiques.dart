import 'package:flutter/material.dart';
import 'package:iotproject/service/database.dart';

class StatistiquesPage extends StatelessWidget {
  const StatistiquesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Statistiques'),
      ),
      body: FutureBuilder<List<Map<String, dynamic>>>(
        future: AfficherData(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const CircularProgressIndicator();
          } else if (snapshot.hasError) {
            return Center(
              child: Text('Erreur : ${snapshot.error}'),
            );
          } else {
            // Affichez les données sur la page
            List<Map<String, dynamic>> dataList = snapshot.data ?? [];
            return ListView.builder(
              itemCount: dataList.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text('Donnée ${index + 1}'),
                  subtitle: Text(dataList[index].toString()),
                );
              },
            );
          }
        },
      ),
    );
  }
}
