import 'package:http/http.dart' as http;
import 'dart:convert';

class NetworkHelper {
  NetworkHelper(this.url, this.apiKey);

  final String url;
  final String apiKey;

  Future getData() async {
    Uri uri = Uri.parse(url);
    http.Response response = await http.get(
      uri,
      headers: {
        'Authorization': 'Bearer $apiKey',
      },
    );

    if (response.statusCode == 200) {
      String data = response.body;
      return jsonDecode(data);
    } else {
      print(response.statusCode);
    }
  }
}