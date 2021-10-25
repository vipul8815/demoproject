import 'package:demo_app/constants.dart';
import 'package:http/http.dart' show Client;
import 'dart:convert';

class Api {
  Client client = Client();
  getDataList() async {
    final result = await client.get(Uri.parse(Constants.apiUrl + "/v2/list"));
    return json.decode(result.body);
  }
}
