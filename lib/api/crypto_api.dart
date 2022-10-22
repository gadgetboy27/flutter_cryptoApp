import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:fluttercrypto/data/crypto_data.dart';

class CryptoApi {
  static Future<List<Crypto>> getCryptos() async {
    final String cryptoUrl = 'https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd&order=market_cap_desc&per_page=100&page=1&sparkline=false&price_change_percentage=1h';
    final http.Response response = await http.get(Uri.parse(cryptoUrl));
    final responseBody = json.decode(response.body) as List;
    final statusCode = response.statusCode;
    if (statusCode != 200 || responseBody == []) {
      throw new FetchDataException(
          "An error ocurred : [Status Code : $statusCode]");
    }

    return responseBody.map((c) => Crypto.fromJson(c)).toList();
  }
}
