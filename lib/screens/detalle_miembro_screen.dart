import 'package:flutter/material.dart';
import 'package:flutter_familia/data/my_data.dart';
import 'package:flutter_familia/models/models.dart';
import 'package:flutter_familia/providers/providers.dart';
import 'package:flutter_familia/theme/mytheme.dart';

import 'package:provider/provider.dart';

const myData = dataLocal;
late int myNid;
late int myIndice;

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
    // final drupalProvider = Provider.of<DrupalProvider>(context);
    // myNid = drupalProvider.nid;
    // myIndice = drupalProvider.indice;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: firebaseProvider.currentColor2,
        centerTitle: true,
        elevation: 0,
      ),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(8.0),
            margin: EdgeInsets.all(8.0),
            decoration: BoxDecoration(
              color: firebaseProvider.currentColor2,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                CircleAvatar(
                  maxRadius: 50,
                  backgroundImage: NetworkImage(
                      firebaseProvider.integranteSeleccionado.foto),
                ),
                Text(firebaseProvider.integranteSeleccionado.nombres)
              ],
            ),
          ),
          const SizedBox(
            height: 50,
          ),
        ],
      ),
    );
  }
}

class _DetalleMiembro extends StatelessWidget {
  final MaterialColor myColor;
  final String myFondo;
  final String myFoto;
  final String myNombre;
  final String myDocumento;
  final String myFechaNacimiento;
  final String myArchivoDocumento;
  final String myArchivoCovid;

  const _DetalleMiembro({
    Key? key,
    required this.myColor,
    required this.myFondo,
    required this.myFoto,
    required this.myNombre,
    required this.myDocumento,
    required this.myFechaNacimiento,
    required this.myArchivoDocumento,
    required this.myArchivoCovid,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        _FondoScreen(myFondo: myFondo),
        _TrianguloHeader(myColor: myColor),
        _Contenido(
          myNombre: myNombre,
          myDocumento: myDocumento,
          myFoto: myFoto,
          myFechaNacimiento: myFechaNacimiento,
          myArchivoDocumento: myArchivoDocumento,
          myArchivoCovid: myArchivoCovid,
        ),
      ],
    );
  }
}

class _Contenido extends StatelessWidget {
  const _Contenido({
    Key? key,
    required this.myNombre,
    required this.myDocumento,
    required this.myFoto,
    required this.myFechaNacimiento,
    required this.myArchivoDocumento,
    required this.myArchivoCovid,
  }) : super(key: key);

  final String myNombre;
  final String myDocumento;
  final String myFoto;
  final String myFechaNacimiento;
  final String myArchivoDocumento;
  final String myArchivoCovid;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Row(
            children: [
              Expanded(
                  child: Text(
                myNombre,
                style: MyTheme.base.textTheme.headline3,
              )),
              Hero(
                tag: 'dni-$myDocumento',
                child: CircleAvatar(
                  maxRadius: 70,
                  backgroundImage: AssetImage(myFoto),
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: ListView(
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, 'detalle_archivo',
                      arguments: MiembroArchivoModels(myArchivoDocumento));
                },
                child: _RecuadroBlanco(
                  informacionData: myDocumento,
                ),
              ),
              _RecuadroBlanco(
                informacionData: myFechaNacimiento,
              ),
              const _RecuadroBlanco(
                informacionData: 'Datos de nacimiento',
              ),
              const _RecuadroBlanco(
                informacionData: 'Tipo de sangre',
              ),
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, 'detalle_archivo',
                      arguments: MiembroArchivoModels(myArchivoCovid));
                },
                child: const _RecuadroBlanco(
                  informacionData: 'Carne de vacunacion',
                ),
              ),
              const _RecuadroBlanco(
                informacionData: 'Numero de cuenta',
              ),
            ],
          ),
        )
      ],
    );
  }
}

class _TrianguloHeader extends StatelessWidget {
  const _TrianguloHeader({
    Key? key,
    required this.myColor,
  }) : super(key: key);

  final MaterialColor myColor;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: double.infinity,
      width: double.infinity,
      child: CustomPaint(
        painter: _HeaderPainter(myColor),
      ),
    );
  }
}

class _FondoScreen extends StatelessWidget {
  const _FondoScreen({
    Key? key,
    required this.myFondo,
  }) : super(key: key);

  final String myFondo;

  @override
  Widget build(BuildContext context) {
    return Image(
      image: AssetImage(myFondo),
      fit: BoxFit.cover,
      width: double.infinity,
    );
  }
}

class _RecuadroBlanco extends StatelessWidget {
  const _RecuadroBlanco({
    Key? key,
    required this.informacionData,
  }) : super(key: key);

  final String informacionData;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(15),
      margin: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
      child: Text(
        informacionData,
        textAlign: TextAlign.center,
      ),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(20)),
    );
  }
}

class _HeaderPainter extends CustomPainter {
  // ignore: prefer_typing_uninitialized_variables
  final _color;

  _HeaderPainter(this._color);

  @override
  void paint(Canvas canvas, Size size) {
    final pencil = Paint();
    pencil.color = _color;
    pencil.style = PaintingStyle.fill;
    pencil.strokeWidth = 5;

    final path = Path();
    path.lineTo(0, size.height * 0.20);
    path.lineTo(size.width * 0.7, size.height * 0.35);
    path.lineTo(size.width, size.height * 0.20);
    path.lineTo(size.width, 0);
    canvas.drawPath(path, pencil);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
