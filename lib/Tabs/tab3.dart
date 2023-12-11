import 'package:flutter/material.dart';

class Tab3 extends StatelessWidget {
  const Tab3({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Third Route'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            // Navigate back to the first route when tapped.
            Navigator.pop(context);
          },
          child: const Text('Volver!'),
        ),
      ),
    );
  }
}

