import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:my_app/models/laptop.dart';

class LaptopViewModel extends ChangeNotifier {
  
  Future<void> addLaptop(Laptop laptop, context) async {
    try {
      final response = await http.post(
        Uri.parse('http://10.0.0.18:3001/laptop'),
        body: jsonEncode(laptop.toJson()),
        headers: {'Content-Type': 'application/json'},
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        successMessages(context, 'Laptop creada satisfactoriamente'); 
      } else {
        errorMessages(context, 'Error al crear laptop');
      }
    } catch (e) {
      errorMessages(context, 'Error interno del servidor');
    }
  }

  Future <List<Laptop>> getLaptops(context) async {
    try {
      final response = await http.get(
        Uri.parse('http://10.0.0.18:3001/laptops')
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        final List<dynamic> responseData = jsonDecode(response.body);
        final List<Laptop> laptops = 
          responseData.map((data) => Laptop.fromJson(data)).toList();
        
        return laptops;
      } else {
        errorMessages(context, 'Error al cargar laptops');
        throw Exception('Failed to load laptops');
      }
    } catch (e) {
      throw Exception('Error: $e'); 
    }
  }



  Future <void> deleteLaptop(String id, context) async {
    try {
      final response = await http.delete(
        Uri.parse('http://10.0.0.18:3001/laptop/$id')
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        successMessages(context, 'Laptop eliminada satisfactoriamente');
        Navigator.of(context).pushReplacementNamed('/home');
      } else {
        throw Exception('Failed to load laptops');
      }
    } catch (e) {
      throw Exception('Error: $e'); 
    }
  }

  Future<void> updateLaptop(String id, Laptop laptop, context) async {
    try {
      final response = await http.put(
        Uri.parse('http://10.0.0.18:3001/laptop/$id'),
        body: jsonEncode(laptop.toJson()),
        headers: {'Content-Type': 'application/json'},
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        successMessages(context, 'Laptop actualizada satisfactoriamente'); 
      } else {
        errorMessages(context, 'Error al actualizar laptop');
      }
    } catch (e) {
      print('Error: $e');
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
