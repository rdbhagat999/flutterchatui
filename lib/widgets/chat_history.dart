import 'package:flutter/material.dart';
import 'package:flutterchatui/models/message_model.dart';

class ChatHistory extends StatefulWidget {
  final List<Message> messages;

  ChatHistory({this.messages});

  @override
  _ChatHistoryState createState() => _ChatHistoryState(messages: messages);
}

class _ChatHistoryState extends State<ChatHistory> {
  final List<Message> messages;

  _ChatHistoryState({this.messages});

  _buildChatItem(Message message, bool isMe) {
    return Container(
      margin: isMe
          ? EdgeInsets.only(top: 30, left: 100)
          : EdgeInsets.only(top: 30, right: 100),
      decoration: BoxDecoration(
        color: isMe
            ? Colors.blue[50].withOpacity(0.5)
            : Colors.green[50].withOpacity(0.5),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment:
            isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '${message.time}',
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.black45,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  '${message.text}',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.black87,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        child: ClipRRect(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(45),
            topRight: Radius.circular(45),
          ),
          child: ListView.builder(
            reverse: true,
            physics: BouncingScrollPhysics(),
            itemCount: messages.length,
            itemBuilder: (context, index) {
              Message message = messages[index];
              bool isMe = message.sender.id == currentUser.id;
              return _buildChatItem(message, isMe);
            },
          ),
        ),
      ),
    );
  }
}
