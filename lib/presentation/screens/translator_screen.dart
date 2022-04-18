
import 'package:flutter/material.dart';
import 'package:translator/translator.dart';

class TranslatorScreen extends StatefulWidget {
  const TranslatorScreen({Key? key}) : super(key: key);

  @override
  State<TranslatorScreen> createState() => _TranslatorScreenState();
}

class _TranslatorScreenState extends State<TranslatorScreen> {
  String translated = 'Translation';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(Icons.translate),
        title: const Text(
          'The Translator',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 24,
          ),
        ),
        centerTitle: true,
      ),
      body: Card(
        margin: const EdgeInsets.all(12),
        child: ListView(
          padding: const EdgeInsets.all(20),
          // ignore: prefer_const_literals_to_create_immutables
          children: [
            const Text('Arabic (EG)'),
            const SizedBox(height: 8),
            TextField(
              style: const TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.bold,
              ),
              decoration: const InputDecoration(
                hintText: 'Enter Text',
              ),
              onChanged: (text) async {
                final translation =
                    await text.translate(from: 'auto', to: "en");
                setState(() {
                  translated = translation.text;
                });
              },
            ),
            const Divider(height: 32),
            const Text('English (US)'),
            const SizedBox(height: 8),
            Text(
              translated,
              style: const TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.bold,
                color: Colors.red,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
