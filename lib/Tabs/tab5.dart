import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Tab5 extends StatelessWidget {
  const Tab5({super.key});

  Future<void> _makeHttpRequest(BuildContext context) async {
    var url = Uri.parse('https://catfact.ninja/fact');

    try {
      var response = await http.get(url);

      print('Response status: ${response.statusCode}');
      if (response.statusCode == 200) {
        Map<String, dynamic> responseBody = json.decode(response.body);
        String fact = responseBody['fact'];

        _showBottomSheet(context, fact);

        print('Cat Fact: $fact');
      } else {
        print('Error response body: ${response.body}');
      }
    } catch (error) {
      print('Error: $error');
    }
  }

  void _showBottomSheet(BuildContext context, String catFact) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          padding: const EdgeInsets.all(16.0),
          child: Text(
            catFact,
            style: const TextStyle(fontSize: 18.0),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Third Route'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 16.0), // Use named argument 'height'
            ElevatedButton(
              onPressed: () {
                _makeHttpRequest(context);
              },
              child: const Text('Dato Gatuno'),
            ),
            ElevatedButton(
              onPressed: () {
                // Call the function or perform the action when the button is pressed.
                _makeHttpRequest(context); // Pass any needed parameters
              },
              child: const Text('Volver!'),
            ),
          ],
        ),
      ),
    );
  }
}
