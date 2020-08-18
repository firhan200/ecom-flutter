import 'package:flutter_money_formatter/flutter_money_formatter.dart';

class Product {
  final int id;
  final String name;
  final double price;
  final String imageUrl;

  Product({this.id, this.name, this.price, this.imageUrl});

  String getPrice() {
    FlutterMoneyFormatter fmf = FlutterMoneyFormatter(
        amount: this.price,
        settings: MoneyFormatterSettings(
            symbol: 'IDR',
            thousandSeparator: '.',
            decimalSeparator: ',',
            symbolAndNumberSeparator: ' ',
            fractionDigits: 0,
            compactFormatType: CompactFormatType.short));

    return fmf.output.symbolOnLeft;
  }
}
