import 'package:finalproject/services/firebase_service.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({
    Key? key,
  }) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Material App Bar'),
      ),
      body: FutureBuilder(
        future: getUser(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data?.length,
              itemBuilder: (context, index) {
                return Dismissible(
                  onDismissed: (direction) async {
                    await deleteUser(snapshot.data?[index]['uid']);
                    snapshot.data?.removeAt(index);
                  },
                  confirmDismiss: (direction) async {
                    bool result = false;
                    result = await showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: Text(
                              'Estas Eliminando a ${snapshot.data?[index]['name']}'),
                          actions: [
                            TextButton(
                                onPressed: () {
                                  return Navigator.pop(
                                    context,
                                    false,
                                  );
                                },
                                child: const Text(
                                  'Cancelar',
                                  style: TextStyle(
                                    color: Colors.red,
                                  ),
                                )),
                            TextButton(
                                onPressed: () {
                                  return Navigator.pop(
                                    context,
                                    true,
                                  );
                                },
                                child: const Text('Si'))
                          ],
                        );
                      },
                    );
                    return result;
                  },
                  background: Container(
                    color: Colors.red.withOpacity(0.8),
                    child: const Icon(
                      Icons.delete_forever_rounded,
                      size: 40,
                      color: Colors.white,
                    ),
                  ),
                  direction: DismissDirection.endToStart,
                  key: Key(snapshot.data?[index]['uid']),
                  child: ListTile(
                    title: (Text(
                        '${snapshot.data?[index]['name']} ${snapshot.data?[index]['lastname']}')),
                    onTap: () async {
                      await Navigator.pushNamed(context, '/edit', arguments: {
                        'name': snapshot.data?[index]['name'],
                        'lastname': snapshot.data?[index]['lastname'],
                        'dni': snapshot.data?[index]['dni'],
                        'uid': snapshot.data?[index]['uid'],
                      });
                      setState(() {});
                    },
                    trailing: const Icon(Icons.system_update),
                  ),
                );
              },
            );
          } else {
            return const Center(
              child: CircularProgressIndicator.adaptive(),
            );
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await Navigator.pushNamed(context, '/add');
          setState(() {});
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}

/*class dataTableOk extends StatelessWidget {
  const dataTableOk({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text(
          'Data de Firebase',
          style: TextStyle(fontSize: 40),
        ),
        DataTable(
          dividerThickness: 10,
          dataRowHeight: 50,
          headingRowHeight: 50,
          columnSpacing: 50,
          columns: const [
            DataColumn(
              label: Text('DNI'),
              numeric: true,
            ),
            DataColumn(
              label: Text('Apellido'),
              numeric: true,
            ),
            DataColumn(
              label: Text('Nombre'),
              numeric: true,
            ),
          ],
          rows: [
            DataRow(cells: [
              DataCell(Text(snapshot.data?[index]['dni'])),
              DataCell(Text(snapshot.data?[index]['lastname'])),
              DataCell(Text(snapshot.data?[index]['name'])),
            ])
          ],
        )
      ],
    );
  }
}*/
