import 'package:http/http.dart' as http;
import 'package:http/http.dart';

class ApiSarvice {
  Future<String?> apiCalling(String category) async {
    String api =
        "https://pixabay.com/api/?key=44441479-99ee357192dfe47b79380e867&q=$category&image_type=photo&per_page=50";
    Uri uri = Uri.parse(api);
    Response response = await http.get(uri);
    if (response.statusCode == 200) {
      print('Api called');
      return response.body;
    }
    return null;
  }
}
