import 'package:flutter/material.dart';

class Tab4 extends StatefulWidget {
  const Tab4({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _Tab4 createState() => _Tab4();

}

class _Tab4 extends State<Tab4> {
  final TextEditingController _textController = TextEditingController();
  String buttonText = 'Press Me';
@override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Flutter App'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _textController,
              decoration: const InputDecoration(
                labelText: 'Enter your text',
              ),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  buttonText = _textController.text;
                });
              },
              child: Text(buttonText),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }
}