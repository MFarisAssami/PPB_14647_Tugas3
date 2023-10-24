import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Catatan Pagi'),
        ),
        body: MyForm(),
      ),
    );
  }
}

class MyForm extends StatefulWidget {
  @override
  _MyFormState createState() => _MyFormState();
}

class _MyFormState extends State<MyForm> {
  TextEditingController titleController = TextEditingController();
  TextEditingController textController = TextEditingController();

  String titleErrorText = '';
  String textErrorText = '';
  String submissionResult = '';

  void validateAndSubmit() {
    setState(() {
      if (titleController.text.isEmpty) {
        titleErrorText = 'Title is required';
      } else {
        titleErrorText = '';
      }

      if (textController.text.isEmpty) {
        textErrorText = 'Input text is required';
      } else {
        textErrorText = '';
      }

      if (titleErrorText.isEmpty && textErrorText.isEmpty) {
        String title = titleController.text;
        String text = textController.text;

        submissionResult = 'Title: $title\nText: $text';

        titleController.clear();
        textController.clear();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        TextField(
          controller: titleController,
          decoration: InputDecoration(
            labelText: 'Title',
            errorText: titleErrorText,
          ),
        ),
        TextField(
          controller: textController,
          decoration: InputDecoration(
            labelText: 'Input Text',
            errorText: textErrorText,
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            ElevatedButton(
              onPressed: validateAndSubmit,
              child: Text('Submit'),
            ),
            ElevatedButton(
              onPressed: () {
                titleController.clear();
                textController.clear();
              },
              child: Text('Clear'),
            )
          ],
        ),
        Padding(
          padding: EdgeInsets.all(10.0),
          child: Text(
            submissionResult,
            style: TextStyle(fontSize: 16),
          ),
        )
      ],
    );
  }
}
