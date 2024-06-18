import 'package:adv_flutter_ch5/view/task1/provider/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class UserScreen extends StatelessWidget {
  const UserScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<UserProvider>(
        builder: (context, userProvider, child) {
          if (userProvider.usersList.isEmpty) {
            return const Center(child: CircularProgressIndicator());
          }
          return ListView(
            children: List.generate(
              userProvider.usersList.length,
                  (index) => ListTile(
                // id, user id
                leading: Text(
                  'id: ${userProvider.usersList[index].id}',
                ),
                // title
                title: Text(
                  overflow: TextOverflow.ellipsis,
                  'user: ${userProvider.usersList[index].username}',
                ),
                // body, tags
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      overflow: TextOverflow.ellipsis,
                      'email: ${userProvider.usersList[index].email}',
                    ),
                    Text(
                      overflow: TextOverflow.ellipsis,
                      'phone: ${userProvider.usersList[index].phone}',
                    ),
                    Text(
                      overflow: TextOverflow.ellipsis,
                      'website: ${userProvider.usersList[index].website}',
                    ),
                    const Text(
                      overflow: TextOverflow.ellipsis,
                      'Address:',
                    ),
                    Text(
                      overflow: TextOverflow.ellipsis,
                      '\t\tstreet: ${userProvider.usersList[index].addressModal.street}',
                    ),
                    Text(
                      overflow: TextOverflow.ellipsis,
                      '\t\tsuite: ${userProvider.usersList[index].addressModal.suite}',
                    ),
                    Text(
                      overflow: TextOverflow.ellipsis,
                      '\t\tcity: ${userProvider.usersList[index].addressModal.city}',
                    ),
                    Text(
                      overflow: TextOverflow.ellipsis,
                      '\t\tzipcode: ${userProvider.usersList[index].addressModal.zipcode}',
                    ),
                    const Text(
                      overflow: TextOverflow.ellipsis,
                      '\t\tgeo:',
                    ),
                    Text(
                      overflow: TextOverflow.ellipsis,
                      '\t\t\t\t lat: ${userProvider.usersList[index].addressModal.geoModal.lat}',
                    ),
                    Text(
                      overflow: TextOverflow.ellipsis,
                      '\t\t\t\t lng: ${userProvider.usersList[index].addressModal.geoModal.lng}',
                    ),
                    const Text(
                      overflow: TextOverflow.ellipsis,
                      'Company:',
                    ),
                    Text(
                      overflow: TextOverflow.ellipsis,
                      '\t\tname: ${userProvider.usersList[index].companyModal.name}',
                    ),
                    Text(
                      overflow: TextOverflow.ellipsis,
                      '\t\tcatchPhrase: ${userProvider.usersList[index].companyModal.catchPhrase}',
                    ),
                    Text(
                      overflow: TextOverflow.ellipsis,
                      '\t\tbs: ${userProvider.usersList[index].companyModal.bs}',
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
