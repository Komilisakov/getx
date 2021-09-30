import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';
import 'package:test_get/models/Post.dart';
import 'home_controller.dart';

// class itemOfPost extends StatelessWidget {
//   const itemOfPost({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Container();
//   }
// }

Widget itemOfPost(HomeController1 _controller, Post post, int index) {
  return Slidable(
    actionPane: SlidableDrawerActionPane(),
    actionExtentRatio: 0.25,
    child: Container(
      padding: EdgeInsets.only(left: 20, right: 20, top: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            post.title.toUpperCase(),
            style:
            TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 5,
          ),
          Text(post.body),
        ],
      ),
    ),
    actions: <Widget>[
      IconSlideAction(
        caption: 'Update',
        color: Colors.indigo,
        icon: Icons.edit,
        onTap: () {
          DateTime now = new DateTime.now();
          post.title = "Updated title ";
          post.body = "Updated body $now";
          _controller.apiPostEdit(post, index);
        },
      ),
    ],
    secondaryActions: <Widget>[
      IconSlideAction(
        caption: 'Delete',
        color: Colors.red,
        icon: Icons.delete,
        onTap: () {
          _controller.apiPostDelete(post, index);
        },
      ),
    ],
  );
}
