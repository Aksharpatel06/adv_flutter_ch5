import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../provider/home_provider.dart';

class ImageScreen extends StatelessWidget {
  const ImageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    HomeProvider homeProviderTrue = Provider.of<HomeProvider>(context);
    HomeProvider homeProviderFalse =
    Provider.of<HomeProvider>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        shadowColor: Colors.grey,
        automaticallyImplyLeading: false,
        title: TextField(
          controller: homeProviderTrue.textEditingController,
        ),
        actions: [
          IconButton(onPressed: () {
            homeProviderFalse.fetchData(homeProviderTrue.textEditingController.text);
          }, icon: const Icon(Icons.search))
        ],
      ),
      body: (homeProviderTrue.isLoading)
          ? const Center(
        child: CircularProgressIndicator(),
      )
          : GridView.builder(
        itemCount: homeProviderTrue.data['hits'].length,
        gridDelegate:
        const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
              child: Image.network(
                  homeProviderTrue.data['hits'][index]['largeImageURL'],fit: BoxFit.cover,),
            ),
          );
        },
      ),
    );
  }
}