import 'package:fluttercrypto/utils/crypto_data_source.dart';

class Crypto {
  final int rank;
  final String id;
  final String name;
  final String image;
  final double price;
  final String symbol;
  final int marketCap;
  final double percentChange_1h;

  const Crypto({
    required this.id,
    required this.name,
    required this.rank,
    required this.image,
    required this.price,
    required this.symbol,
    required this.marketCap,
    required this.percentChange_1h,
  });

  Crypto.fromJson(Map<String, dynamic> json)
      : this.id = json['id'],
        this.name = json['name'],
        this.image = json['image'],
        this.symbol = json['symbol'],
        this.rank = json['market_cap_rank'],
        this.price = json['current_price'],
        this.marketCap = json['market_cap'],
        this.percentChange_1h = json['price_change_percentage_1h_in_currency'];
}

class FetchDataException implements Exception {
  final _message;

  FetchDataException([this._message]);

  String toString() {
    if (_message == null) return "Exception";
    return "Exception: $_message";
  }
}

class CryptoComparable {
  final CryptoColumn column;
  final Crypto crypto;

  CryptoComparable(this.column, this.crypto);

  compareTo(CryptoComparable otherComparable) {
    final self = crypto;
    final other = otherComparable.crypto;

    switch (column) {
      case CryptoColumn.id:
        return self.id.compareTo(other.id);
      case CryptoColumn.rank:
        return self.rank.compareTo(other.rank);
      case CryptoColumn.name:
        return self.name.compareTo(other.name);
      case CryptoColumn.price:
        return self.price.compareTo(other.price);
      case CryptoColumn.marketCap:
        return self.marketCap.compareTo(other.marketCap);
      case CryptoColumn.percentChange_1h:
        return self.percentChange_1h.compareTo(other.percentChange_1h);
    }
  }
}
