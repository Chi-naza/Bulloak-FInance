class DepWithDrawalModel {
  String? amount;
  String? walletType;
  String? walletAddress;
  String? usdtAmount;

  DepWithDrawalModel(
      {this.amount, this.walletType, this.walletAddress, this.usdtAmount});

  DepWithDrawalModel.fromJson(Map<String, dynamic> json) {
    amount = json['amount'];
    walletType = json['wallet_type'];
    walletAddress = json['wallet_address'];
    usdtAmount = json['usdt_amount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['amount'] = this.amount;
    data['wallet_type'] = this.walletType;
    data['wallet_address'] = this.walletAddress;
    data['usdt_amount'] = this.usdtAmount;
    return data;
  }
}
