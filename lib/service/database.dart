import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:iotproject/utils/utils.dart';

Future<void> saveDataToFirestore() async
{
  /*
  J'ajoute pour chaque collection les fichiers json sorties par l'url
   */
  Map<String, dynamic> dataTemp = await TempData();
  Map<String, dynamic> dataLight = await LightData2();

  await FirebaseFirestore.instance.collection('Temp').add(dataTemp);
  await FirebaseFirestore.instance.collection('Lum').add(dataLight);

  print('Données enregistrées avec succès dans Firestore !');
}

Future<List<Map<String, dynamic>>> AfficherData() async {

  /*
  Je combine les deux listes de luminosité et température pour ensuite les afficher
  avec un listView
   */

    QuerySnapshot q1 = await FirebaseFirestore.instance.collection('Temp').get();
    List<Map<String, dynamic>> dataList1 = q1.docs.map((doc) => doc.data() as Map<String, dynamic>).toList();

    QuerySnapshot q2 = await FirebaseFirestore.instance.collection('Lum').get();
    List<Map<String, dynamic>> dataList2 = q2.docs.map((doc) => doc.data() as Map<String, dynamic>).toList();

    List<Map<String, dynamic>> last_list = [...dataList1, ...dataList2];

    return last_list;

}