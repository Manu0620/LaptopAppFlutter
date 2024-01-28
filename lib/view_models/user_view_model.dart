import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:my_app/models/user.dart';

class UserViewModel extends ChangeNotifier{

  Future<void> registerUser(User user, context) async {
    try {

      final response = await http.post(
        Uri.parse('http://10.0.0.18:3001/signup'),
        body: jsonEncode(user.toJson()),
        headers: {'Content-Type': 'application/json'},
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        await successMessages(context, 'Usuario creado satisfactoriamente');
      } else {
        await errorMessages(context, 'Error al crear usuario');
        return;
      }
    } catch (e) {
      await errorMessages(context, 'Error interno del servidor');
      return;
    }
  }

  Future<void> login(User user, context) async {
    try {
      final response = await http.post(
        Uri.parse('http://10.0.0.18:3001/signin'),
        body: jsonEncode(user.toJson()),
        headers: {'Content-Type': 'application/json'},
      );
      
      if (response.statusCode == 200) {
        final responseData = jsonDecode(response.body);
        final userData = User.fromJson(responseData['user']);

        await successMessages(context, 'Bienvenido ${userData.name}');
        Navigator.of(context).pushReplacementNamed('/home', arguments: userData);
      } else {
        await errorMessages(context, 'Correo electrónico o contraseña incorrectos');
        return;
      }
    } catch (e) {
      await errorMessages(context, 'Error interno del servidor $e');
    }
  }

  successMessages(dynamic context, String message) {
    final snackBar = SnackBar(
      content: Text(
        message,
        style: Theme.of(context).textTheme.bodyMedium,
      ),
      backgroundColor:
          Theme.of(context).colorScheme.inversePrimary.withOpacity(0.05),
      duration: const Duration(seconds: 2),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  errorMessages(dynamic context, String message) {
    final snackBar = SnackBar(
      content: Text(
        message,
        style: TextStyle(
          color: Colors.red[400],
          fontSize: Theme.of(context).textTheme.bodyMedium!.fontSize,
        ),
      ),
      backgroundColor: const Color.fromARGB(55, 211, 47, 1).withOpacity(0.05),
      duration: const Duration(seconds: 2),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

}
