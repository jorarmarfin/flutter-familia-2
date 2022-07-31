import 'package:flutter/material.dart';
import 'package:flutter_familia/theme/mytheme.dart';
import 'package:provider/provider.dart';

import '../providers/providers.dart';

class DetalleArchivoScreen extends StatelessWidget {
  const DetalleArchivoScreen({Key? key}) : super(key: key);
  static String routerName = 'detalle_archivo';

  @override
  Widget build(BuildContext context) {
    final firebaseProvider = Provider.of<FireBaseProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Detalle del archivo'),
      ),
      body: ListView(
        children: [
          InteractiveViewer(
            child: FadeInImage(
                placeholder: const AssetImage(imgLoading),
                image: NetworkImage(firebaseProvider.archivo1)),
          ),
          const SizedBox(
            height: 10.0,
          ),
          if (firebaseProvider.archivo2.isNotEmpty)
            InteractiveViewer(
              child: FadeInImage(
                  placeholder: const AssetImage(imgLoading),
                  image: NetworkImage(firebaseProvider.archivo2)),
            ),
        ],
      ),
    );
  }
}
