import 'package:cloud_firestore/cloud_firestore.dart';

FirebaseFirestore db = FirebaseFirestore.instance;

Future<List> getUser() async {
  List user = [];
  CollectionReference collectionReferenceUser = db.collection('users');

  QuerySnapshot queryUser = await collectionReferenceUser.get();

  for (var doc in queryUser.docs) {
    final Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
    final person = {
      'name': data['name'],
      'lastname': data['lastname'],
      'dni': data['dni'],
      'uid': doc.id
    };

    user.add(person);
  }

  //await Future.delayed(const Duration(seconds: 3));
  return user;
}

Future<void> addUser(String name, String lastname, String dni) async {
  await db
      .collection('users')
      .add({'name': name, 'lastname': lastname, 'dni': dni});
}

//actualizar
Future<void> updateUser(
    String uid, String name, String lastname, String dni) async {
  await db
      .collection('users')
      .doc(uid)
      .set({'name': name, 'lastname': lastname, 'dni': dni});
}

//borrar
Future<void> deleteUser(String uid) async {
  await db.collection('users').doc(uid).delete();
}
