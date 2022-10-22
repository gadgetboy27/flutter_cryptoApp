import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';
import '../data/crypto_data.dart';

enum CryptoColumn {
  id,
  rank,
  name,
  // symbol,
  price,
  marketCap,
  percentChange_1h,
}

class CryptoDataSource extends DataGridSource {
  late List<DataGridRow> _cryptos;

  @override
  List<DataGridRow> get rows => _cryptos;

  CryptoDataSource({required List<Crypto> cryptos}) {
    buildDataGrid(cryptos);
  }

  void buildDataGrid(List<Crypto> cryptos) => _cryptos = cryptos
      .map<DataGridRow>(
        (crypto) => DataGridRow(
          // taken from enum list
          cells: CryptoColumn.values
              .map(
                (column) => DataGridCell<CryptoComparable>(
                  columnName: column.toString(),
                  value: CryptoComparable(column, crypto),
                ),
              ).toList(),
        ),
      ).toList();

  @override
  DataGridRowAdapter buildRow(DataGridRow row) => DataGridRowAdapter(
          cells: row.getCells().map<Widget>((dataGridCell) {
        final CryptoComparable cryptoWrapper = dataGridCell.value;
        final crypto = cryptoWrapper.crypto;
        final column = CryptoColumn.values
            .firstWhere((value) => value.toString() == dataGridCell.columnName);

        switch (column) {
          case CryptoColumn.id:
            return buildIdRow(crypto);
          case CryptoColumn.rank:
            return buildRankRow(crypto.rank);
          case CryptoColumn.price:
            return buildPriceRow(crypto.price);
          case CryptoColumn.name:
            return buildNameRow(crypto.name);
          case CryptoColumn.marketCap:
            return buildMarketCapRow(crypto.marketCap);
          case CryptoColumn.percentChange_1h:
            return buildPercentChangeRow(crypto.percentChange_1h);
        }
      }).toList());

  Widget buildIdRow(Crypto crypto) => Container(
        padding: EdgeInsets.all(10.0),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            buildLogo(crypto),
            SizedBox(width: 10),
            Expanded(
              child: Text(crypto.symbol.toUpperCase(), 
              overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      );

  Widget buildPriceRow(double price) => Container(
        padding: EdgeInsets.all(16),
        child: Text(
          '\$$price',
          style: TextStyle(color: Colors.black),
        ),
      );

  Widget buildNameRow(name) => Container(
        padding: EdgeInsets.all(16),
        alignment: Alignment.centerLeft,
        child: Text(
          '$name',
          style: TextStyle(color: Colors.black),
        ),
      );

  Widget buildRankRow(rank) => Container(
        padding: EdgeInsets.all(16.0),
        alignment: Alignment.centerLeft,
        child: Text(
          '$rank',
          style: TextStyle(color: Colors.black),
          overflow: TextOverflow.ellipsis,
        ),
      );

  Widget buildMarketCapRow(marketCap) => Container(
        padding: EdgeInsets.all(16),
        alignment: Alignment.centerLeft,
        child: Text(
          '\$$marketCap',
          style: TextStyle(color: Colors.black),
        ),
      );

  Widget buildPercentChangeRow(percentChange_1h) => Container(
        padding: EdgeInsets.all(16),
        child: Text(
          '$percentChange_1h',
          style: TextStyle(color: Colors.white),
        ),
      );

  Widget buildLogo(Crypto crypto) {
    final isSvg = crypto.image.endsWith('.svg');

    return CircleAvatar(
      radius: 20,
      child: isSvg
          ? SvgPicture.network(crypto.image)
          : Image.network(crypto.image),
    );
  }
}
