import 'dart:convert';

import 'package:taskf/model/details.dart';

import '../model/searchCharacters.dart';
import 'config.dart';
import 'package:http/http.dart' as http;

class Api {
  Future<SearchCharacters?> search(int page) async {
    Map<String, dynamic> map = {
      'page': page.toString(),
    };
    var url = Uri.https(baseUrl, pathUrl, map);

    var response = await http.get(url);
    if (response.statusCode == 200) {
      return SearchCharacters.fromJson(jsonDecode(response.body));
    } else {
      return null;
    }
  }

  Future<DetailsApi?> details(int id) async {
    print(id);
    var url = Uri.https(
      baseUrl,
      pathUrl + '/$id',
    );

    print(baseUrl);
    print(pathUrl);
    print(url);

    var response = await http.get(url);
    if (response.statusCode == 200) {
      return DetailsApi.fromJson(jsonDecode(response.body));
    } else {
      return null;
    }
  }
}
