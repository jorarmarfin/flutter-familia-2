import 'package:flutter/material.dart';
import 'package:flutter_familia/models/models.dart';
import 'package:flutter_familia/theme/mytheme.dart';

class DetalleArchivoScreen extends StatelessWidget {
  const DetalleArchivoScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //Solo por ejemplo estoy mandando el dni por parametro de ruta para poder usarlo en
    // cualquier otro proyecto

    final MiembroArchivoModels args =
        ModalRoute.of(context)?.settings.arguments as MiembroArchivoModels;
    final archivo = args.myArchivo.split('|');
    // print(archivo[0]); // [Hello, world!];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Detalle del archivo'),
      ),
      body: ListView(
        children: [
          InteractiveViewer(
            child: FadeInImage(
                placeholder: const AssetImage(imgLoading),
                image: NetworkImage(archivo[0])),
          ),
          const SizedBox(
            height: 10.0,
          ),
          InteractiveViewer(
            child: FadeInImage(
                placeholder: const AssetImage(imgLoading),
                image: NetworkImage(archivo[1])),
          ),
        ],
      ),
    );
  }
}
