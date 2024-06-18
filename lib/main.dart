import 'package:adv_flutter_ch5/view/task1/provider/comment_provider.dart';
import 'package:adv_flutter_ch5/view/task1/provider/user_provider.dart';
import 'package:adv_flutter_ch5/view/task1/screen/api/api_screen/api_screen.dart';
import 'package:adv_flutter_ch5/view/task1/screen/wallpaper/wallpaper_screen.dart';
import 'package:adv_flutter_ch5/view/task2/provider/home_provider.dart';
import 'package:adv_flutter_ch5/view/task2/screen/image/image_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (context) => CommentProvider(),),
    ChangeNotifierProvider(create: (context) => UserProvider(),),
    ChangeNotifierProvider(create: (context) => HomeProvider(),),
  ],child: const MyApp()));
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/image',
      routes: {
        '/':(context)=>const WallpaperScreen(),
        '/api':(context)=>const ApiScreen(),
        '/image':(context)=>const ImageScreen(),
      },
    );
  }
}