import 'package:flutter/material.dart';
import 'package:my_app/models/user.dart';
import 'package:my_app/presentation/views/auth/register_screen.dart';
import 'package:my_app/presentation/widgets/shared/button_widget.dart';
import 'package:my_app/presentation/widgets/shared/text_field_widget.dart';
import 'package:my_app/view_models/user_view_model.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({ 
    super.key 
  });

  final TextEditingController _emailController = TextEditingController(text: 'maderamanuel25@gmail.com');
  final TextEditingController _passwordController = TextEditingController(text: '123456');
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 5),
                child: Text(
                  'Iniciar sesión',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 15),
                child: Text(
                  'Ingrea tus datos para iniciar sesión',
                  style: Theme.of(context).textTheme.bodySmall,
                ),
              ),
              TextFieldWidget(
                controller: _emailController,
                labelText: 'Correo electrónico',
                hintText: 'Escribe tu correo electrónico',
                obscureText: false,
              ),
              TextFieldWidget(
                controller: _passwordController,
                labelText: 'Contraseña',
                hintText: 'Escribe tu contraseña',
                obscureText: true,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 25, right: 25, bottom: 10, top: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ButtonWidget(
                      buttonText: 'Iniciar sesión',
                      buttonHeight: 60,
                      buttonWM: 0.43,
                      onPressed: () {
                        login(context);
                      }
                    ),
                    ButtonWidget(
                      buttonText: 'Registrarme',
                      buttonHeight: 60,
                      buttonWM: 0.43,
                      onPressed: () { // Add this line for debugging
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const RegisterScreen(),
                          ),
                        )
                      ;}
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      )
    );
  }

  void login(context){
    final userViewModel = Provider.of<UserViewModel>(context, listen: false);
    
    if(_emailController.text.isEmpty || _passwordController.text.isEmpty){
      userViewModel.errorMessages(context, 'Por favor, ingresa tus credenciales');
      return;
    }
    
    final String email = _emailController.text;
    final String password = _passwordController.text;


    userViewModel.login(
        User(name: '', email: email, password: password), context);
  }
}



