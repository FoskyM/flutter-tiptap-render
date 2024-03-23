import 'package:example/tiptap_data.dart';
import 'package:flutter/material.dart';
import 'package:tiptap_flutter/tiptap_flutter.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tiptap Parser Demo',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Tiptap Parser Demo'),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Expanded(
                child: Scrollbar(
              radius: const Radius.circular(8.0),
              child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Tiptap(TiptapData.jsonData)),
            )),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Divider(height: 4),
            ),
            const Text('JSON Data:'),
            const Expanded(
              child: SingleChildScrollView(
                child: Text(TiptapData.stringData),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
