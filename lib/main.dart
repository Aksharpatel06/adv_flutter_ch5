
import 'package:adv_flutter_ch5/view/task1/provider/comment_class.dart';
import 'package:adv_flutter_ch5/view/task1/provider/user_provider.dart';
import 'package:adv_flutter_ch5/view/task1/screen/api/api_screen/api_screen.dart';
import 'package:adv_flutter_ch5/view/task1/screen/wallpaper/wallpaper_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (context) => CommentClass(),),
    ChangeNotifierProvider(create: (context) => UserProvider(),)
  ],child: const MyApp()));
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/api',
      routes: {
        '/':(context)=>const WallpaperScreen(),
        '/api':(context)=>const ApiScreen(),
      },
    );
  }
}

