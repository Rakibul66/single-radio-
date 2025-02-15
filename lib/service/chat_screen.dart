import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class ChatScreen extends StatefulWidget {
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final DatabaseReference _database = FirebaseDatabase.instance.ref('chat');
  final TextEditingController _messageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Live Chat'),
      ),
      body: Column(
        children: [
          Expanded(
            child: StreamBuilder(
              stream: _database.onValue,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  final messages = Map<String, dynamic>.from(
                      (snapshot.data! as DatabaseEvent).snapshot.value as Map);
                  return ListView(
                    children: messages.entries.map((entry) {
                      return ListTile(
                        title: Text(entry.value['message']),
                        subtitle: Text(entry.value['sender']),
                      );
                    }).toList(),
                  );
                }
                return Center(child: CircularProgressIndicator());
              },
            ),
          ),
          TextField(
            controller: _messageController,
            decoration: InputDecoration(labelText: 'Message'),
          ),
          ElevatedButton(
            onPressed: () {
              _database.push().set({
                'message': _messageController.text,
                'sender': 'User',
              });
              _messageController.clear();
            },
            child: Text('Send'),
          ),
        ],
      ),
    );
  }
}