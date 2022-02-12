import 'package:flutter/material.dart';
import 'package:flutter_familia/theme/mytheme.dart';

class BotonPrincipal extends StatelessWidget {
  final String foto;
  final String nombre;
  final String dni;
  final Color color1;
  final Color color2;
  final Function() onPress;

  const BotonPrincipal(
      {Key? key,
      required this.foto,
      required this.nombre,
      required this.dni,
      required this.color1,
      required this.color2,
      required this.onPress})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        margin: const EdgeInsets.all(15.0),
        height: 140.0,
        width: double.infinity,
        decoration: estiloBoton(color1, color2),
        child: Stack(
          children: [
            Positioned(
              right: -100,
              child: Container(
                width: 250,
                height: 250,
                decoration: contenedorEstiloCircular(),
              ),
            ),
            Row(
              children: [
                Hero(tag: 'dni-'+ dni,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: CircleAvatar(
                      maxRadius: 50,
                      backgroundImage: AssetImage(foto),
                    ),
                  ),
                ),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        nombre,
                        style: MyTheme.base.textTheme.headline3,
                      ),
                      Text(dni, style: MyTheme.base.textTheme.headline3)
                    ],
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
