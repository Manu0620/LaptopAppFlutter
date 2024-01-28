import 'package:flutter/material.dart';
import 'package:my_app/styles/text_styles.dart';


ThemeData appTheme() {

  return ThemeData(
    useMaterial3: true,
    /// Esquema de colores
    scaffoldBackgroundColor: const Color.fromRGBO(12, 12, 12, 1),
    colorScheme: ColorScheme.fromSeed(seedColor: const Color.fromRGBO(74, 214, 109, 1)),

    ///Estilo a Textos
    textTheme: textStyles(),

    appBarTheme: const AppBarTheme(
      backgroundColor: Color.fromRGBO(12, 12, 12, 1),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          bottom: Radius.circular(15),
        ),
      ),
      titleTextStyle: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.bold,
        fontFamily: 'ProductSans',
        color: Color.fromRGBO(74, 214, 109, 1),
      ),
      iconTheme: IconThemeData(
        color: Color.fromRGBO(74, 214, 109, 1),
      ),
    ),

    ///Etilos a la barra de navegación
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: Color.fromRGBO(74, 214, 109, 1),
      selectedItemColor: Color.fromRGBO(40, 40, 40, 1),
      unselectedItemColor: Color.fromRGBO(12, 12, 12, 1),
      selectedLabelStyle: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.bold,
        fontFamily: 'ProductSans',
      ),
      unselectedLabelStyle: TextStyle(
        fontSize: 14,
        fontFamily: 'ProductSans',
      ),
    ),

    ///Estilos de menu
    drawerTheme: const DrawerThemeData(
      backgroundColor: Color.fromRGBO(12, 12, 12, 1),
      scrimColor: Color.fromRGBO(74, 214, 109, 0.2),
    ),

    expansionTileTheme: ExpansionTileThemeData(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(25),
      ),
      childrenPadding: const EdgeInsets.only(left: 15),
      iconColor: const Color.fromRGBO(74, 214, 109, 1),
      backgroundColor: const Color.fromRGBO(74, 214, 109, 0.2),
      collapsedBackgroundColor: Colors.transparent,
      collapsedIconColor: const Color.fromRGBO(74, 214, 109, 0.5),
    ),

    listTileTheme: const ListTileThemeData(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(15),
        ),
      ),
    ),
  );
}