import 'package:flutter_money_formatter/flutter_money_formatter.dart';

class Cart {
  int quantity;
  int productId;
  String productName;
  String productImage;
  double productPrice;

  Cart(
      {this.productId,
      this.quantity,
      this.productName,
      this.productImage,
      this.productPrice});

  String getPrice() {
    FlutterMoneyFormatter fmf = FlutterMoneyFormatter(
        amount: this.productPrice,
        settings: MoneyFormatterSettings(
            symbol: 'IDR',
            thousandSeparator: '.',
            decimalSeparator: ',',
            symbolAndNumberSeparator: ' ',
            fractionDigits: 0,
            compactFormatType: CompactFormatType.short));

    return fmf.output.symbolOnLeft;
  }

  String getTotalPrice() {
    FlutterMoneyFormatter fmf = FlutterMoneyFormatter(
        amount: this.productPrice * this.quantity,
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
