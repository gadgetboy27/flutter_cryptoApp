import 'package:flutter/material.dart';
import 'package:fluttercrypto/provider/crypto_provider.dart';
import 'package:fluttercrypto/widgets/crypto_widget.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => new _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('The Stack Crypto'),
      ),
      body: ChangeNotifierProvider<CryptoProvider>(
        create: (context) => CryptoProvider(),
        child: Consumer<CryptoProvider>(
          builder: (context, provider, child) {
            if (provider.cryptoDataSource == null) {
              provider.loadCrypto();
              return Center(child: 
                CircularProgressIndicator(
                  color: Colors.blue,
                ),
              );
            }
            return CryptoWidget();
          },
        ),
      ),
    );
  }
}
