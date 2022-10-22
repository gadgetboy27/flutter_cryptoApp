import 'package:flutter/foundation.dart';
// import 'package:fluttercrypto/dependency_injection.dart';
import 'package:flutter/material.dart';
import 'package:fluttercrypto/pages/home_page.dart';
import 'package:fluttercrypto/provider/crypto_provider.dart';
import 'package:provider/provider.dart';

void main() async {
  runApp(new MyApp());
}

class MyApp extends StatelessWidget {
  static final String title = 'Crypto App';

  @override
  Widget build(BuildContext context) => ChangeNotifierProvider(
        create: (context) => CryptoProvider(),
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: new ThemeData(
              primarySwatch: Colors.pink,
              primaryColor: defaultTargetPlatform == TargetPlatform.iOS
                  ? Colors.grey[100]
                  : null),
          home: HomePage(),
        ),
      );
}
