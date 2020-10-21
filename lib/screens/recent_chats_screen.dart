import 'package:flutter/material.dart';
import 'package:flutterchatui/models/message_model.dart';
import 'package:flutterchatui/widgets/profile_avataar.dart';

import 'chat_screen.dart';

class RecentChatsScreen extends StatefulWidget {
  @override
  _RecentChatsScreenState createState() => _RecentChatsScreenState();
}

class _RecentChatsScreenState extends State<RecentChatsScreen> {
  int selectedChatIndex = 0;

  buildChatListItem(Message chat) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ChatScreen(user: chat.sender),
          ),
        );
      },
      child: Container(
        margin: EdgeInsets.fromLTRB(0, 0, 0, 5),
        padding: EdgeInsets.symmetric(
          vertical: 10,
          horizontal: 5,
        ),
        decoration: BoxDecoration(
          color:
              chat.unread ? Colors.blue[50].withOpacity(0.5) : Colors.white60,
        ),
        child: ListTile(
          leading: ProfileAvataar(
            imageUrl: chat.sender.imageUrl,
            radius: 25,
          ),
          title: Text(
            chat.sender.name.toString(),
            overflow: TextOverflow.ellipsis,
          ),
          subtitle: Text(
            chat.text,
            overflow: TextOverflow.ellipsis,
          ),
          trailing: Column(
            children: [
              Text('${chat.time}'),
              SizedBox(
                height: 10,
              ),
              chat.unread
                  ? Container(
                      padding: EdgeInsets.symmetric(
                        vertical: 5,
                        horizontal: 10,
                      ),
                      decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.circular(15)),
                      child: Text(
                        'New',
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                          letterSpacing: 2,
                          backgroundColor: Colors.red,
                        ),
                      ),
                    )
                  : SizedBox.shrink(),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).accentColor,
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(45),
            topRight: Radius.circular(45),
          ),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
            ),
            child: ListView.builder(
              physics: BouncingScrollPhysics(),
              itemCount: chats.length,
              itemBuilder: (context, index) {
                Message chat = chats[index];
                return buildChatListItem(chat);
              },
            ),
          ),
        ),
      ),
    );
  }
}
