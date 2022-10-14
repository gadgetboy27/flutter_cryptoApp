import 'dart:async';

class Crypto {
  String name;
  String price;
  String percentChange_1h;
  String symbol;

  Crypto({this.name, this.price, this.percentChange_1h,this.symbol});

  Crypto.fromMap(Map<String, dynamic> map)
      : name = map['name'],
        price = map['price_usd'],
        percentChange_1h = map['percent_change_1h'],
        symbol = map['symbol'];
}

abstract class CryptoRepository {
  Future<List<Crypto>> fetchCurrencies();
}

class FetchDataException implements Exception {
  final _message;

  FetchDataException([this._message]);

  String toString() {
    if (_message == null) return "Exception";
    return "Exception: $_message";
  }
}
