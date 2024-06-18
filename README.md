Using the `async_wallpaper` package in Flutter allows you to set wallpapers asynchronously. This package provides an easy way to interact with wallpapers on both Android and iOS. Below is a step-by-step guide on how to use this package in your Flutter project.

### Step 1: Add the dependency

First, add the `async_wallpaper` dependency to your `pubspec.yaml` file:

```yaml
dependencies:
  flutter:
    sdk: flutter
  async_wallpaper: ^1.0.6 # Check for the latest version on pub.dev
```

Then, run `flutter pub get` to install the new dependency.

### Step 2: Import the package

In your Dart file, import the `async_wallpaper` package:

```dart
import 'package:async_wallpaper/async_wallpaper.dart';
```

### Step 3: Set up the function to change the wallpaper

Create a function that sets the wallpaper using the `async_wallpaper` package. Here’s an example function that sets a wallpaper from a URL:

```dart
Future<void> setWallpaper(String url) async {
  try {
    // Set wallpaper
    String result = await AsyncWallpaper.setWallpaper(
      url: url, 
      wallpaperLocation: AsyncWallpaper.HOME_SCREEN, // You can also use AsyncWallpaper.LOCK_SCREEN or AsyncWallpaper.BOTH_SCREENS
      goToHome: true // If true, it will take the user to the home screen after setting the wallpaper
    );

    print(result); // This will print 'Wallpaper set' on success
  } catch (e) {
    print(e);
  }
}
```

### Step 4: Call the function

You can call this function from a button or any other event within your Flutter app. Here’s an example using a button:

```dart
import 'package:flutter/material.dart';
import 'package:async_wallpaper/async_wallpaper.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: WallpaperScreen(),
    );
  }
}

class WallpaperScreen extends StatelessWidget {
  final String wallpaperUrl = 'https://example.com/wallpaper.jpg';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Set Wallpaper Example'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () => setWallpaper(wallpaperUrl),
          child: Text('Set Wallpaper'),
        ),
      ),
    );
  }

  Future<void> setWallpaper(String url) async {
    try {
      String result = await AsyncWallpaper.setWallpaper(
        url: url,
        wallpaperLocation: AsyncWallpaper.HOME_SCREEN,
        goToHome: true,
      );

      print(result);
    } catch (e) {
      print(e);
    }
  }
}
```

### Additional Options

The `AsyncWallpaper.setWallpaper` function can take several parameters:

- `url`: The URL of the image you want to set as wallpaper.
- `wallpaperLocation`: The location where you want to set the wallpaper (e.g., home screen, lock screen, or both).
- `goToHome`: Whether to navigate to the home screen after setting the wallpaper.
- `crop`: Whether to crop the image before setting it (only available on Android).

Make sure to check the package documentation for any updates or additional features: [async_wallpaper on pub.dev](https://pub.dev/packages/async_wallpaper).

By following these steps, you should be able to set a wallpaper in your Flutter app using the `async_wallpaper` package.


### ScreenShorts
<p>
  <img src='https://github.com/Aksharpatel06/adv_flutter_ch5/assets/143181114/ab3b6c8b-130f-4b98-9d08-92b91092883f' width=240>
  <img src='https://github.com/Aksharpatel06/adv_flutter_ch5/assets/143181114/d2cdea28-a597-45f3-8a80-85b3dc0e8d40' width=240>
  <img src='https://github.com/Aksharpatel06/adv_flutter_ch5/assets/143181114/c87b4473-dd80-40cd-8077-d053f1361ac8' width=240>
</p>

### Video

https://github.com/Aksharpatel06/adv_flutter_ch5/assets/143181114/4e9705b5-5fa5-4b68-8a40-cfe545cd59b7

In Flutter, working with network APIs is a common task for fetching data from the internet, sending data to a server, and handling various network-related tasks. The `http` package is widely used for making HTTP requests. Here's a step-by-step guide on how to use it:

### 1. Add the `http` package to your project

First, you need to add the `http` package to your `pubspec.yaml` file:

```yaml
dependencies:
  flutter:
    sdk: flutter
  http: ^0.14.0
```

Run `flutter pub get` to install the package.

### 2. Import the `http` package

In your Dart file, import the `http` package:

```dart
import 'package:http/http.dart' as http;
import 'dart:convert'; // For JSON encoding and decoding
```

### 3. Make a GET request

Here’s an example of making a GET request to fetch data from an API:

```dart
Future<void> fetchData() async {
  final response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));

  if (response.statusCode == 200) {
    // If the server returns an OK response, parse the JSON.
    List<dynamic> data = jsonDecode(response.body);
    print(data);
  } else {
    // If the server did not return a 200 OK response,
    // throw an exception.
    throw Exception('Failed to load data');
  }
}
```

### 4. Make a POST request

Here’s an example of making a POST request to send data to an API:

```dart
Future<void> sendData() async {
  final response = await http.post(
    Uri.parse('https://jsonplaceholder.typicode.com/posts'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, String>{
      'title': 'foo',
      'body': 'bar',
      'userId': '1',
    }),
  );

  if (response.statusCode == 201) {
    // If the server returns a CREATED response, parse the JSON.
    var data = jsonDecode(response.body);
    print(data);
  } else {
    // If the server did not return a 201 CREATED response,
    // throw an exception.
    throw Exception('Failed to send data');
  }
}
```

### 5. Handling exceptions

Always wrap your HTTP requests in try-catch blocks to handle exceptions:

```dart
Future<void> fetchData() async {
  try {
    final response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));

    if (response.statusCode == 200) {
      List<dynamic> data = jsonDecode(response.body);
      print(data);
    } else {
      throw Exception('Failed to load data');
    }
  } catch (e) {
    print('Error: $e');
  }
}
```

### 6. Example usage in a Flutter app

Here’s how you might integrate fetching data into a simple Flutter app:

```dart
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('Network API Example')),
        body: Center(child: DataWidget()),
      ),
    );
  }
}

class DataWidget extends StatefulWidget {
  @override
  _DataWidgetState createState() => _DataWidgetState();
}

class _DataWidgetState extends State<DataWidget> {
  List<dynamic> _data = [];

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {
    try {
      final response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));

      if (response.statusCode == 200) {
        setState(() {
          _data = jsonDecode(response.body);
        });
      } else {
        throw Exception('Failed to load data');
      }
    } catch (e) {
      print('Error: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: _data.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(_data[index]['title']),
          subtitle: Text(_data[index]['body']),
        );
      },
    );
  }
}
```
### ScreenShorts

<p>
  <img src='https://github.com/Aksharpatel06/adv_flutter_ch5/assets/143181114/4d5e0498-1f74-459f-8601-0d88cfac71cf' width=240>
  <img src='https://github.com/Aksharpatel06/adv_flutter_ch5/assets/143181114/bb1e8fbb-98b4-47a0-9594-9a2b7af3eac7' width=240>
  <img src='https://github.com/Aksharpatel06/adv_flutter_ch5/assets/143181114/0e64367f-eaa1-4dbc-9d4f-e688f588437d' width=240>
</p>

### Video

https://github.com/Aksharpatel06/adv_flutter_ch5/assets/143181114/306eb688-92e0-4d97-aa2b-37d4a518599e


## Pxabay API Calling 

### 1. Set Up Your Flutter Project
If you haven't already set up a Flutter project, you can do so by running:
```bash
flutter create my_website
cd my_website
```

### 2. Add Dependencies
In your `pubspec.yaml` file, add the `http` package to handle HTTP requests:
```yaml
dependencies:
  flutter:
    sdk: flutter
  http: ^0.14.0  # Check for the latest version on pub.dev
```
Then run `flutter pub get` to install the package.

### 3. Create a Service for API Calls
Create a new file `api_service.dart` in the `lib` directory to manage your API calls.

```dart
import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  final String baseUrl;

  ApiService(this.baseUrl);

  Future<Map<String, dynamic>> getData(String endpoint) async {
    final response = await http.get(Uri.parse('$baseUrl$endpoint'));

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to load data');
    }
  }

  Future<Map<String, dynamic>> postData(String endpoint, Map<String, dynamic> data) async {
    final response = await http.post(
      Uri.parse('$baseUrl$endpoint'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(data),
    );

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to post data');
    }
  }
}
```

### 4. Integrate the Service into Your Flutter Widgets
You can now use this service in your Flutter widgets. Here's an example of a simple widget that fetches data from an API and displays it:

```dart
import 'package:flutter/material.dart';
import 'api_service.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter API Calling',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final ApiService apiService = ApiService('https://api.example.com/');
  Future<Map<String, dynamic>>? _futureData;

  @override
  void initState() {
    super.initState();
    _futureData = apiService.getData('/data');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('API Data Fetch'),
      ),
      body: Center(
        child: FutureBuilder<Map<String, dynamic>>(
          future: _futureData,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return CircularProgressIndicator();
            } else if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            } else if (!snapshot.hasData) {
              return Text('No data found');
            } else {
              final data = snapshot.data!;
              return Text('Data: ${data.toString()}');
            }
          },
        ),
      ),
    );
  }
}
```

### 5. Run Your Flutter App
You can now run your Flutter app using:
```bash
flutter run
```

This basic example sets up a Flutter project, adds the necessary dependencies, creates a service for making API calls, and integrates the service into a simple widget that fetches and displays data from an API. For a more advanced implementation, you can add error handling, loading indicators, and more complex data structures.

### ScreenShorts


<p>
  <img src='https://github.com/Aksharpatel06/adv_flutter_ch5/assets/143181114/1022ba2d-441d-4fbf-9d7e-5ce99cb79fec' width=240>
  <img src='https://github.com/Aksharpatel06/adv_flutter_ch5/assets/143181114/f53ecca3-179c-4020-9fad-89f8a6301fcb' width=240>
  
</p>

### Video
