import 'package:flutter/material.dart';
import 'package:flutter_familia/components/boton_principal.dart';
import 'package:flutter_familia/data/my_data.dart';
import 'package:flutter_familia/models/integrante_model.dart';
import 'package:flutter_familia/providers/providers.dart';
import 'package:flutter_familia/theme/mytheme.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);
  static String routerName = 'home';
  final myData = dataLocal;
  @override
  Widget build(BuildContext context) {
    final firebaseProvider = Provider.of<FireBaseProvider>(context);
    return Scaffold(
        body: SafeArea(
      child: FutureBuilder(
        future: firebaseProvider.getIntegrantes(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else {
            List<IntegranteModel> integrantes = firebaseProvider.integrantes;
            return Column(
              children: [
                const Image(image: AssetImage(imgLogoApp)),
                Expanded(
                  child: ListView.builder(
                    itemCount: integrantes.length,
                    itemBuilder: (BuildContext context, int index) {
                      switch (index) {
                        case 0:
                          return BotonPrincipal(
                              foto: integrantes[index].foto,
                              nombre: integrantes[index].nombre,
                              dni: integrantes[index].dni.toString(),
                              color1: mColorLuis1,
                              color2: mColorLuis2,
                              onPress: () {
                                firebaseProvider.integranteSeleccionado =
                                    integrantes[index];
                                firebaseProvider.fondo = fondoLuis;
                                firebaseProvider.currentColor2 = mColorLuis2;
                                Navigator.pushNamed(context, 'detalle_miembro');
                              });
                        case 1:
                          return BotonPrincipal(
                              foto: integrantes[index].foto,
                              nombre: integrantes[index].nombre,
                              dni: integrantes[index].dni.toString(),
                              color1: mColorLucy1,
                              color2: mColorLucy2,
                              onPress: () {
                                firebaseProvider.integranteSeleccionado =
                                    integrantes[index];
                                firebaseProvider.fondo = fondoLucy;
                                firebaseProvider.currentColor2 = mColorLuis2;
                                Navigator.pushNamed(context, 'detalle_miembro');
                              });
                        case 2:
                          return BotonPrincipal(
                              foto: integrantes[index].foto,
                              nombre: integrantes[index].nombre,
                              dni: integrantes[index].dni.toString(),
                              color1: mColorFran1,
                              color2: mColorFran2,
                              onPress: () {
                                firebaseProvider.integranteSeleccionado =
                                    integrantes[index];
                                firebaseProvider.fondo = fondoFrancisco;
                                Navigator.pushNamed(context, 'detalle_miembro');
                              });
                        default:
                          return BotonPrincipal(
                              foto: integrantes[index].foto,
                              nombre: integrantes[index].nombre,
                              dni: integrantes[index].dni.toString(),
                              color1: mColorLuis1,
                              color2: mColorLuis2,
                              onPress: () {
                                firebaseProvider.integranteSeleccionado =
                                    integrantes[index];
                                firebaseProvider.fondo = fondoLuis;
                                Navigator.pushNamed(context, 'detalle_miembro');
                              });
                      }
                    },
                  ),
                ),
              ],
            );
          }
        },
      ),
    ));
  }
}