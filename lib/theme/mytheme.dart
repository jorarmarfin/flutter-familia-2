import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

//Colores
const mPrimaryColor = Colors.purple;
const mSecondaryColor = Color(0xff0c9869);
const mTextColor = Colors.black;
const mBackgroundColor = Color(0xfff9f8fd);
const mColorTest = Colors.blue;
const mColorBlanco = Colors.white;
const mColorNegro = Colors.black;
const mColorFondo = Color(0xffd6d6d6);
final mColorSombra = Colors.black.withOpacity(0.2);

const mColorLuis1 = Color(0xffbbdefb);
const mColorLuis2 = Colors.blue;
const mColorLucy1 = Color(0xffba68c8);
const mColorLucy2 = Colors.purple;
const mColorFran1 = Color(0xffffa726);
const mColorFran2 = Colors.orange;

//Imagenes
const imgLoading = 'assets/images/loading.gif';
const imgLogoApp = 'assets/images/LogoAppFamilia.png';
const fotoLucy = 'assets/images/lucy.png';
const fotoLuis = 'assets/images/luis.png';
const fotoFrancisco = 'assets/images/francisco.png';
const fondoLucy = 'assets/images/f-lucy.png';
const fondoLuis = 'assets/images/f-luis.png';
const fondoFrancisco = 'assets/images/f-francisco.png';

class MyTheme {
  static ThemeData base = ThemeData.light().copyWith(
      primaryColor: mPrimaryColor,
      //Esquema de colores para el appBar
      appBarTheme: const AppBarTheme(
        backgroundColor: mPrimaryColor,
        foregroundColor: Colors.white, //here you can give the text color
        // elevation: 0 // si hay o no sombra
      ),
      textTheme: TextTheme(
          headline1: GoogleFonts.getFont('Dancing Script',
              fontSize: 20, fontWeight: FontWeight.normal),
          headline2:
              GoogleFonts.nunito(fontWeight: FontWeight.bold, fontSize: 20),
          headline3: GoogleFonts.nunito(fontSize: 20, color: mColorBlanco),
          bodyText1:
              const TextStyle(color: Colors.black), //para enfatizar texto
          bodyText2: const TextStyle(
              color: mTextColor, fontSize: 20) //para texto del body
          ));
}

BoxDecoration estiloBoton(color1, color2) {
  return BoxDecoration(
      gradient: LinearGradient(colors: [color1, color2]),
      borderRadius: BorderRadius.circular(20),
      boxShadow: [
        BoxShadow(
            color: mColorSombra, offset: const Offset(4, 6), blurRadius: 10)
      ]);
}

BoxDecoration contenedorEstiloCircular() {
  return BoxDecoration(
      shape: BoxShape.circle, color: Colors.white.withOpacity(0.2));
}
