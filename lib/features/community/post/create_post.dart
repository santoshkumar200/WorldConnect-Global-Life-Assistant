import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class CreatePost extends StatefulWidget {
  const CreatePost({super.key});

  @override
  State<CreatePost> createState() => _CreatePostState();
}

class _CreatePostState extends State<CreatePost> {
  final _textController = TextEditingController();

  Future<void> _submit() async {
    final user = FirebaseAuth.instance.currentUser;
    if (user != null && _textController.text.trim().isNotEmpty) {
      await FirebaseFirestore.instance.collection('posts').add({
        'text': _textController.text.trim(),
        'author': user.email ?? 'Anonymous',
        'timestamp': FieldValue.serverTimestamp(),
      });
      if (!mounted) return;
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Create Post'), backgroundColor: Colors.purple),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            TextField(
              controller: _textController,
              maxLines: 4,
              decoration: const InputDecoration(labelText: 'What\'s happening?', border: OutlineInputBorder()),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _submit,
              child: const Text('Post'),
            ),
          ],
        ),
      ),
    );
  }
}