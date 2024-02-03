import 'package:swap_app/modals/coin_model.dart';

class HistoryModel {
  Coin? coin1;
  Coin? coin2;
  String? id;
  String? transaction;
  String? walletName;
  int? status;
  String? date;

  HistoryModel(
      {this.coin1,
      this.coin2,
      this.id,
      this.status,
      this.transaction,
      this.walletName,
      this.date});
}
