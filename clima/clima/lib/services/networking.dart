import 'package:http/http.dart' as http;
import 'dart:convert';

class NetworkHelper {
  NetworkHelper({this.url});

  final String url;

  http.Response resp;

  Future getData() async {
    resp = await http.get(Uri.parse(url));
    if (resp.statusCode == 200) {
      String data = resp.body;

      var decodedData = jsonDecode(data);
      return decodedData;
    } else {
      print(resp.statusCode);
    }
  }
}
