import 'package:flutter/material.dart';
import 'package:my_app/models/user.dart';
import 'package:my_app/presentation/widgets/shared/button_widget.dart';
import 'package:my_app/presentation/widgets/shared/lateral_menu_widget.dart';
import 'package:my_app/presentation/widgets/shared/text_field_widget.dart';
import 'package:my_app/view_models/user_view_model.dart';
import 'package:provider/provider.dart';

class RegisterScreen extends StatefulWidget {
  final User? user;
  const RegisterScreen({
    Key? key,
    this.user
  }) : super(key: key);

  @override 
  State<RegisterScreen> createState() => _RegisterScreenState();  
}

class _RegisterScreenState extends State<RegisterScreen> {

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();


  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        endDrawer: const LateralMenuDrawer(),
        body: SafeArea(
        child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 5),
              child: Text(
                'Create account',
                style: Theme.of(context).textTheme.titleLarge,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 15),
              child: Text(
                'Por favor, ingresa tus datos para crear una cuenta',
                style: Theme.of(context).textTheme.bodySmall,
              ),
            ),
            TextFieldWidget(
              controller: _nameController,
              labelText: 'Nombre',
              hintText: 'Escribe tu nombre',
              obscureText: false,
            ),
            TextFieldWidget(
              controller: _emailController,
              labelText: 'Email',
              hintText: 'Escribe tu correo electrónico',
              keyboardType: TextInputType.emailAddress,
              obscureText: false,
            ),
            TextFieldWidget(
              controller: _passwordController,
              labelText: 'Password',
              hintText: 'Escribe tu contraseña',
              obscureText: true,
            ),
            TextFieldWidget(
              controller: _confirmPasswordController,
              labelText: 'Cofirm Password',
              hintText: 'Confirma tu contraseña',
              obscureText: true,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 25, right: 25, bottom: 10, top: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ButtonWidget(
                    buttonText: 'Enviar',
                    buttonHeight: 60,
                    buttonWM: 0.89,
                    onPressed: () {
                      userRegistration();
                    }

                  ),
                ],
              ),
            )
          ],
        ),
      ),
    ));
  }

  void userRegistration() {
    final userViewModel = Provider.of<UserViewModel>(context, listen: false);
    if(_nameController.text.isEmpty || _emailController.text.isEmpty || _passwordController.text.isEmpty || _confirmPasswordController.text.isEmpty) {
      userViewModel.errorMessages(context, 'Por favor, ingresa todos los datos');
      return;
    }

    final String name = _nameController.text;
    final String email = _emailController.text;
    final String password = _passwordController.text;
    final String confirmPassword = _confirmPasswordController.text;

    if(password != confirmPassword) {
      userViewModel.errorMessages(context, 'Las contraseñas no coinciden');
      return;
    }

    userViewModel.registerUser(
      User(name: name, password: password, email: email),
      context
    );

    clearControllers();
  } 

  clearControllers(){
    _nameController.text = '';
    _emailController.text = '';
    _passwordController.text = '';
    _confirmPasswordController.text = '';
  }
}
