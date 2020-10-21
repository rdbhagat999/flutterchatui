import 'package:flutter/material.dart';
import 'package:flutterchatui/models/message_model.dart';

import 'package:flutterchatui/models/user_model.dart';
import 'package:flutterchatui/screens/chat_screen.dart';
import 'package:flutterchatui/widgets/profile_avataar.dart';

class FavaouriteList extends StatelessWidget {
  _buildFavouriteItem(BuildContext context, int index) {
    User user = favorites[index];
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ChatScreen(user: user),
          ),
        );
      },
      child: Container(
        margin: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ProfileAvataar(
              imageUrl: user.imageUrl,
              radius: 30,
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              '${user.name}',
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontSize: 16,
                color: Colors.black54,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Favourite Contacts',
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.black54,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1.2,
                  ),
                ),
                IconButton(
                  icon: Icon(
                    Icons.more_horiz,
                  ),
                  onPressed: () {},
                )
              ],
            ),
          ),
          Container(
            height: 110,
            child: ListView.builder(
              physics: BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              itemCount: favorites.length,
              itemBuilder: (context, index) {
                return _buildFavouriteItem(context, index);
              },
            ),
          ),
        ],
      ),
    );
  }
}
