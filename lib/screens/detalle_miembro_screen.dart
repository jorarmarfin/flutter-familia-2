import 'package:flutter/material.dart';
import 'package:flutter_familia/providers/providers.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:provider/provider.dart';

class DetalleMiembroScreen extends StatefulWidget {
  const DetalleMiembroScreen({Key? key}) : super(key: key);
  static String routerName = 'detalle_miembro';

  @override
  State<DetalleMiembroScreen> createState() => _DetalleMiembroScreenState();
}

class _DetalleMiembroScreenState extends State<DetalleMiembroScreen> {
  @override
  Widget build(BuildContext context) {
    final firebaseProvider = Provider.of<FireBaseProvider>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: firebaseProvider.currentColor2,
        centerTitle: true,
        elevation: 0,
      ),
      body: Column(
        children: [
          _HeaderProfile(firebaseProvider: firebaseProvider),
          const SizedBox(
            height: 10,
          ),
          const Divider(),
          ListTile(
              leading: const Icon(FontAwesomeIcons.addressCard),
              title: Text(
                firebaseProvider.integranteSeleccionado.dni.toString(),
                style: const TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 20.0),
              ),
              onTap: (() {
                firebaseProvider.archivo1 =
                    firebaseProvider.integranteSeleccionado.fotoDni1.toString();
                firebaseProvider.archivo2 =
                    firebaseProvider.integranteSeleccionado.fotoDni2.toString();
                Navigator.pushNamed(context, 'detalle_archivo');
              })),
          const Divider(),
          if (firebaseProvider.integranteSeleccionado.carneVacunacion != null)
            ListTile(
                leading: const Icon(FontAwesomeIcons.addressCard),
                title: const Text(
                  'Carne de Vacunación',
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 20.0),
                ),
                onTap: (() {
                  firebaseProvider.archivo1 = firebaseProvider
                      .integranteSeleccionado.carneVacunacion
                      .toString();
                  firebaseProvider.archivo2 = '';
                  Navigator.pushNamed(context, 'detalle_archivo');
                })),
        ],
      ),
    );
  }
}

class _HeaderProfile extends StatelessWidget {
  const _HeaderProfile({
    Key? key,
    required this.firebaseProvider,
  }) : super(key: key);

  final FireBaseProvider firebaseProvider;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      margin: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        color: firebaseProvider.currentColor2,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          CircleAvatar(
            maxRadius: 50,
            backgroundImage:
                NetworkImage(firebaseProvider.integranteSeleccionado.foto),
          ),
          Text(firebaseProvider.integranteSeleccionado.nombres)
        ],
      ),
    );
  }
}
