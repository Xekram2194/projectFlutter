import 'package:finalproject/services/firebase_service.dart';
import 'package:flutter/material.dart';

class AddNameScreen extends StatefulWidget {
  const AddNameScreen({Key? key}) : super(key: key);

  @override
  State<AddNameScreen> createState() => _AddNameScreenState();
}

class _AddNameScreenState extends State<AddNameScreen> {
  TextEditingController nameController = TextEditingController(text: '');
  TextEditingController lastnameController = TextEditingController(text: '');
  TextEditingController dniController = TextEditingController(text: '');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Registrar'),
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
                  await addUser(nameController.text, lastnameController.text,
                          dniController.text)
                      .then((_) {
                    Navigator.pop(context);
                  });
                },
                child: const Text('Guardar'),
              )
            ],
          ),
        ));
  }
}
