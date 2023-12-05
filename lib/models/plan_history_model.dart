class PlanHistoryModel {
  int? id;
  String? amount;
  String? profit;
  String? created;
  int? investmentplan;
  int? profile;

  PlanHistoryModel(
      {this.id,
      this.amount,
      this.profit,
      this.created,
      this.investmentplan,
      this.profile});

  PlanHistoryModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    amount = json['amount'];
    profit = json['profit'];
    created = json['created'];
    investmentplan = json['investmentplan'];
    profile = json['profile'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['amount'] = this.amount;
    data['profit'] = this.profit;
    data['created'] = this.created;
    data['investmentplan'] = this.investmentplan;
    data['profile'] = this.profile;
    return data;
  }
}
