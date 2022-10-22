import 'package:flutter/material.dart';
import 'package:fluttercrypto/api/crypto_api.dart';
import 'package:fluttercrypto/data/crypto_data.dart';
import 'package:fluttercrypto/utils/crypto_data_source.dart';

class CryptoProvider extends ChangeNotifier {
  CryptoDataSource? cryptoDataSource;
  List<Crypto> cryptos = [];

  CryptoProvider() {
    loadCrypto();
  }

  Future loadCrypto() async {
    final cryptos = await CryptoApi.getCryptos();

    this.cryptos = cryptos;
    cryptoDataSource = CryptoDataSource(cryptos: cryptos);
    notifyListeners();
  }
}
