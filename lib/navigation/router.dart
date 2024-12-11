import 'package:http/http.dart' as http;
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

void main() async {
  FlutterSecureStorage storage = FlutterSecureStorage();
  http.Response response =
      await http.get(Uri.http("127.0.0.1", "/api/v1/token"), headers: {
    'Access-Control-Allow-Origin': '*',
    'Access-Control-Allow-Methods': 'GET, POST, PATCH, PUT, DELETE, OPTIONS'
  });
  await storage.write(key: "jwt", value: response.body);
  print(await storage.read(key: "jwt"));
}
