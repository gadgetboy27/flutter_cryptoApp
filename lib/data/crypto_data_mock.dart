import 'dart:async';

import 'package:fluttercrypto/data/crypto_data.dart';

class MockCryptoRepository implements CryptoRepository {
  @override
  Future<List<Crypto>> fetchCurrencies() {
    return new Future.value(currencies);
  }
}

var currencies = <Crypto>[
  new Crypto(name: "Bitcoin", price: "800.60", percentChange_1h: "-0.7"),
  new Crypto(name: "Ethereum", price: "650.30", percentChange_1h: "0.85"),
  new Crypto(name: "Ripple", price: "300.00", percentChange_1h: "-0.25"),
];
