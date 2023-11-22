import 'package:flutter/material.dart';
import 'package:act3_7/widgets/app_logo.dart';
import 'package:act3_7/widgets/app_button.dart';
import 'package:act3_7/widgets/app_textfield.dart';


class Register extends StatefulWidget {
  const Register({super.key});
  static const String routeName = '/Register';
  
  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
String _email = '';
String _password = '';

@override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 25.0),
        child: Column (
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          AppLogo(),
          const SizedBox(height: 48.0,),
           AppTextField(intputText: "Ingresar email", onChanged: (value){_email = value;}, obscureText: false),
          const SizedBox(height: 8.0,),
           AppTextField(intputText: "Ingresar contraseña", onChanged: (value){_password = value;}, obscureText: true),
          const SizedBox(height: 23.0,),
          AppButton(color: Colors.lightGreenAccent, 
            nombre: "Registrar", 
            onPressed: (){
                
            }),
        ],
        )
      )
      
    );
  }
}

