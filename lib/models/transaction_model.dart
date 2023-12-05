class TransactionModel {
  int? id;
  bool? verified;
  String? created;
  String? usdtAmount;
  String? description;
  String? transactionType;
  int? profile;

  TransactionModel(
      {this.id,
      this.verified,
      this.created,
      this.usdtAmount,
      this.description,
      this.transactionType,
      this.profile});

  TransactionModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    verified = json['verified'];
    created = json['created'];
    usdtAmount = json['usdt_amount'];
    description = json['description'];
    transactionType = json['transaction_type'];
    profile = json['profile'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['verified'] = this.verified;
    data['created'] = this.created;
    data['usdt_amount'] = this.usdtAmount;
    data['description'] = this.description;
    data['transaction_type'] = this.transactionType;
    data['profile'] = this.profile;
    return data;
  }
}
