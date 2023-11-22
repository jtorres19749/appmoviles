import 'package:flutter/material.dart';

class AppLogo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return
      Row (
        children: <Widget> [
          Image.asset('images/icons8-pelicula-64.png'),
          const Text('    UDG Act. 3.7', 
            style: TextStyle( 
              color: Colors.blueGrey,
              fontSize: 25.0, 
              fontWeight: 
              FontWeight.w700
            ))
      ]);
  }
}


