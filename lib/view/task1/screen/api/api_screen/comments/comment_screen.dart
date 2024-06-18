import 'package:adv_flutter_ch5/view/task1/provider/comment_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CommentScreen extends StatelessWidget {
  const CommentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<CommentProvider>(
        builder: (context, commentClass, child) {
          if (commentClass.commentsList.isEmpty) {
            return Center(child: CircularProgressIndicator());
          }
          return ListView(
            children: List.generate(
              commentClass.commentsList.length,
                  (index) => ListTile(
                // id, post id
                leading: Column(
                  children: [
                    Text(
                      '${commentClass.commentsList[index].id}',
                    ),
                    Text(
                      '${commentClass.commentsList[index].postId}',
                    ),
                  ],
                ),
                // title
                title: Text(
                  overflow: TextOverflow.ellipsis,
                  commentClass.commentsList[index].name!,
                ),
                // body, email
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      overflow: TextOverflow.ellipsis,
                      commentClass.commentsList[index].body!,
                    ),
                    Text(
                      overflow: TextOverflow.ellipsis,
                      commentClass.commentsList[index].email!,
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
