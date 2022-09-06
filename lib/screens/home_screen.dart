import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        title: TextField(
          controller: controller,
        ),
        actions: [
          IconButton(
              onPressed: () {
                final name = controller.text;
                createUser(name: name);
              },
              icon: Icon(Icons.add))
        ],
      ),
    );
    ;
  }

  Future createUser({required String name}) async {
    final docUser =
        FirebaseFirestore.instance.collection('users').doc('my-id2');
    final json = {'name': name, 'age': 21, 'birthday': DateTime(2003, 4, 5)};
    await docUser.set(json);
  }
}
