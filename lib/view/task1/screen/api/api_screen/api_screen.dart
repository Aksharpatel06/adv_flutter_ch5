import 'package:adv_flutter_ch5/view/task1/screen/api/api_screen/comments/comment_screen.dart';
import 'package:adv_flutter_ch5/view/task1/screen/api/api_screen/user/user_screen.dart';
import 'package:flutter/material.dart';

class ApiScreen extends StatelessWidget {
  const ApiScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: false,
        title: const Text('API\'s'),
      ),
      body: Column(
        children: [
          // users data
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListTile(
              onTap: () {

                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const UserScreen(),
                    ));
              },
              tileColor: Theme.of(context).colorScheme.onSecondary,
              title: const Text('Users API'),
            ),
          ),

          // Comments data
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListTile(
              onTap: () {

                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const CommentScreen(),
                    ));
              },
              tileColor: Theme.of(context).colorScheme.onSecondary,
              title: const Text('Comments API'),
            ),
          ),
        ],
      ),
    );
  }
}
