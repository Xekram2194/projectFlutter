import 'package:finalproject/services/firebase_service.dart';
import 'package:flutter/material.dart';

class EditPageScreen extends StatefulWidget {
  const EditPageScreen({Key? key}) : super(key: key);

  @override
  State<EditPageScreen> createState() => _EditPageScreenState();
}

class _EditPageScreenState extends State<EditPageScreen> {
  TextEditingController nameController = TextEditingController(text: '');
  TextEditingController lastnameController = TextEditingController(text: '');
  TextEditingController dniController = TextEditingController(text: '');
  @override
  Widget build(BuildContext context) {
    final Map arguments = ModalRoute.of(context)!.settings.arguments as Map;
    nameController.text = arguments['name'];
    lastnameController.text = arguments['lastname'];
    dniController.text = arguments['dni'];
    return Scaffold(
      appBar: AppBar(
        title: const Text('Actualizar data'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          children: [
            TextFormField(
              controller: nameController,
              validator: (value) {
                if (value == null) return 'Este Campo es requerido';
                return value.length < 3 ? 'Minimo 3 caracteres' : null;
              },
              autovalidateMode: AutovalidateMode.onUserInteraction,
              decoration: const InputDecoration(
                hintText: 'Nombre de Usuario',
                labelText: 'Nombre',
                icon: Icon(Icons.add_photo_alternate),
                // border: OutlineInputBorder(
                //     borderRadius: BorderRadius.only(
                //         bottomLeft: Radius.circular(10),
                //         topRight: Radius.circular(10))),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            TextFormField(
              controller: lastnameController,
              validator: (value) {
                if (value == null) return 'Este Campo es requerido';
                return value.length < 3 ? 'Minimo 3 caracteres' : null;
              },
              autovalidateMode: AutovalidateMode.onUserInteraction,
              decoration: const InputDecoration(
                hintText: 'Apellido de Usuario',
                labelText: 'Apellido',
                icon: Icon(Icons.add_circle_outline),
                // border: OutlineInputBorder(
                //     borderRadius: BorderRadius.only(
                //         bottomLeft: Radius.circular(10),
                //         topRight: Radius.circular(10))),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            TextFormField(
              controller: dniController,
              validator: (value) {
                if (value == null) return 'Este Campo es requerido';
                return value.length < 3 ? 'Minimo 3 caracteres' : null;
              },
              autovalidateMode: AutovalidateMode.onUserInteraction,
              decoration: const InputDecoration(
                hintText: 'DNI de Usuario',
                labelText: 'DNI',
                icon: Icon(Icons.card_membership),
                // border: OutlineInputBorder(
                //     borderRadius: BorderRadius.only(
                //         bottomLeft: Radius.circular(10),
                //         topRight: Radius.circular(10))),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            ElevatedButton(
              onPressed: () async {
                await updateUser(arguments['uid'], nameController.text,
                        lastnameController.text, dniController.text)
                    .then((value) {
                  Navigator.pop(context);
                });
              },
              child: const Text('Actualizar'),
            ),
          ],
        ),
      ),
    );
  }
}
