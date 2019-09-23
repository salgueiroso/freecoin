import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:free_coin/models/base_model.dart';

class RestApi {
  static final baseUrl =
      "https://f9b2df43-aab7-428b-bbb2-60b0146e86b2.mock.pstmn.io";
  static final headers = {
    "x-api-key":
        "PMAK-5d87da14fc34340030b3e25f-82d5bc2e64e0707d21c2b683a66321d987"
  };

  Future<TResp> get<TResp extends BaseModel<TResp>>(
      String path, TResp model) async {
    final response = await http.get("$baseUrl/$path", headers: headers);
    return parseResponse(response, model);
  }

  Future<TResp> post<TResp extends BaseModel<TResp>>(
      String path, dynamic body, TResp model) async {
    final response =
        await http.post("$baseUrl/$path", headers: headers, body: body);
    return parseResponse(response, model);
  }

  TResp parseResponse<TResp extends BaseModel<TResp>>(
      http.Response response, TResp model) {
    if (response.statusCode == 200) {
      return model.fromJson(jsonDecode(response.body));
    } else {
      throw Exception("Ocorreu um erro na requsição. Tente novamente\n" +
          jsonEncode(response));
    }
  }
}
