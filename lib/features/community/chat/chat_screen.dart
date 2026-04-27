import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final _msgController = TextEditingController();

  Future<void> _send() async {
    final user = FirebaseAuth.instance.currentUser;
    if (user != null && _msgController.text.trim().isNotEmpty) {
      await FirebaseFirestore.instance.collection('chat').add({
        'text': _msgController.text.trim(),
        'email': user.email,
        'timestamp': FieldValue.serverTimestamp(),
      });
      _msgController.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Emergency Chat'), backgroundColor: Colors.red),
      body: Column(
        children: [
          Expanded(
            child: StreamBuilder<QuerySnapshot>(
              stream: FirebaseFirestore.instance.collection('chat').orderBy('timestamp', descending: true).snapshots(),
              builder: (ctx, snap) {
                if (snap.hasError) return const Text('Error');
                if (snap.connectionState == ConnectionState.waiting) return const Center(child: CircularProgressIndicator());
                final docs = snap.data!.docs;
                return ListView.builder(
                  reverse: true,
                  itemCount: docs.length,
                  itemBuilder: (_, i) {
                    final data = docs[i].data() as Map<String, dynamic>;
                    final isMe = data['email'] == FirebaseAuth.instance.currentUser?.email;
                    return Align(
                      alignment: isMe ? Alignment.centerRight : Alignment.centerLeft,
                      child: Container(
                        margin: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: isMe ? Colors.red.shade100 : Colors.grey.shade200,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Text(data['text'] ?? ''),
                      ),
                    );
                  },
                );
              },
            ),
          ),
          Row(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(controller: _msgController, decoration: const InputDecoration(hintText: 'Message...')),
                ),
              ),
              IconButton(onPressed: _send, icon: const Icon(Icons.send, color: Colors.red)),
            ],
          ),
        ],
      ),
    );
  }
}