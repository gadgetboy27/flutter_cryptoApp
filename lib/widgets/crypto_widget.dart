import 'package:flutter/material.dart';
import 'package:fluttercrypto/provider/crypto_provider.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';
import '../utils/crypto_data_source.dart';

class CryptoWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<CryptoProvider>(context);
    final cryptoDataSource = provider.cryptoDataSource;

    if (cryptoDataSource == null) {
      return Center(child: CircularProgressIndicator());
    } else {
      return SfDataGrid(
        allowSorting: true,
        frozenColumnsCount: 1,
        columnWidthMode: ColumnWidthMode.none,
        columns: buildGridColumns(),
        source: cryptoDataSource,
      );
    }
  }


  List<GridColumn> buildGridColumns() => <GridColumn>[
        GridColumn(
          columnName: CryptoColumn.id.toString(),
          label: Container(
            child: buildLabel('Crypto'),
            alignment: Alignment.center,
            ),
          width: 112
        ),
        GridColumn(
          columnName: CryptoColumn.rank.toString(),
          label: Container(
            child: buildLabel('Rank'),
                padding: EdgeInsets.symmetric(horizontal: 16.0),
          ),
        ),
        GridColumn(
          columnName: CryptoColumn.name.toString(),
          label: Container(
            child: buildLabel('Name'),
                padding: EdgeInsets.symmetric(horizontal: 10.0),
          ),
        ),
        GridColumn(
          columnName: CryptoColumn.price.toString(),
          label: Container(
            child: buildLabel('Price'),
                padding: EdgeInsets.symmetric(horizontal: 10.0),
          ),
        ),
        GridColumn(
          columnName: CryptoColumn.marketCap.toString(),
          label: Container(
            child: buildLabel('Market Cap'),
                padding: EdgeInsets.symmetric(horizontal: 8.0),
          ),
        ),
        GridColumn(
          columnName: CryptoColumn.percentChange_1h.toString(),
          label: buildLabel('1hr chng'),
        ),
      ];

  Widget buildLabel(String text) => Text(
        text,
      );
}
