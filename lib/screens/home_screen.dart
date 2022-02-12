import 'package:flutter/material.dart';
import 'package:flutter_familia/components/boton_principal.dart';
import 'package:flutter_familia/data/my_data.dart';
import 'package:flutter_familia/providers/providers.dart';
import 'package:flutter_familia/theme/mytheme.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);
  final myData = dataLocal;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Column(
        children: [
          const Image(image: AssetImage(imgLogoApp)),
          Expanded(child: _ListaBotones(myData: myData))
        ],
      ),
    ));
  }
}

class _ListaBotones extends StatelessWidget {
  const _ListaBotones({
    Key? key,
    required this.myData,
  }) : super(key: key);

  final List<Map<String, dynamic>> myData;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: myData.length,
      itemBuilder: (BuildContext context, int index) {
        return Column(
          children: [
            BotonPrincipal(
              foto: myData[index]['foto'],
              nombre: myData[index]['nombre'],
              dni: myData[index]['dni'],
              color1: myData[index]['color1'],
              color2: myData[index]['color2'],
              onPress: () {
                final drupalProvider =
                    Provider.of<DrupalProvider>(context, listen: false);
                drupalProvider.nid = int.parse(myData[index]['nid']);
                drupalProvider.indice = index;
                Navigator.pushNamed(
                  context,
                  'detalle_miembro',
                );
              },
            ),
          ],
        );
      },
    );
  }
}
