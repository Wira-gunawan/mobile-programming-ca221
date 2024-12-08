// comment_entry_page.dart
import 'package:flutter/material.dart';

class CommentEntryPage extends StatefulWidget {
  final Function(String) onSaved;

  const CommentEntryPage({Key? key, required this.onSaved}) : super(key: key);

  @override
  _CommentEntryPageState createState() => _CommentEntryPageState();
}

class _CommentEntryPageState extends State<CommentEntryPage> {
  final TextEditingController _controller = TextEditingController();

  void _submitComment() {
    final comment = _controller.text;
    if (comment.isNotEmpty) {
      widget.onSaved(comment);
      Navigator.of(context).pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Comment'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _controller,
              decoration: const InputDecoration(labelText: 'Your Comment'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _submitComment,
              child: const Text('Submit'),
            ),
          ],
        ),
      ),
    );
  }
}