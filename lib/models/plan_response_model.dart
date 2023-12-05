class PlanResponseModel {
  List<Plans>? plans;
  List<Categories>? categories;

  PlanResponseModel({this.plans, this.categories});

  PlanResponseModel.fromJson(Map<String, dynamic> json) {
    if (json['plans'] != null) {
      plans = <Plans>[];
      json['plans'].forEach((v) {
        plans!.add(new Plans.fromJson(v));
      });
    }
    if (json['categories'] != null) {
      categories = <Categories>[];
      json['categories'].forEach((v) {
        categories!.add(new Categories.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.plans != null) {
      data['plans'] = this.plans!.map((v) => v.toJson()).toList();
    }
    if (this.categories != null) {
      data['categories'] = this.categories!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Plans {
  int? id;
  String? name;
  dynamic minimumAmount;
  dynamic maximumAmount;
  int? numberOfDays;
  double? investmentProfitPercent;
  double? referralProfitPercent;
  String? created;
  int? category;

  Plans(
      {this.id,
      this.name,
      this.minimumAmount,
      this.maximumAmount,
      this.numberOfDays,
      this.investmentProfitPercent,
      this.referralProfitPercent,
      this.created,
      this.category});

  Plans.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    minimumAmount = json['minimum_amount'];
    maximumAmount = json['maximum_amount'];
    numberOfDays = json['number_of_days'];
    investmentProfitPercent = json['investment_profit_percent'];
    referralProfitPercent = json['referral_profit_percent'];
    created = json['created'];
    category = json['category'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['minimum_amount'] = this.minimumAmount;
    data['maximum_amount'] = this.maximumAmount;
    data['number_of_days'] = this.numberOfDays;
    data['investment_profit_percent'] = this.investmentProfitPercent;
    data['referral_profit_percent'] = this.referralProfitPercent;
    data['created'] = this.created;
    data['category'] = this.category;
    return data;
  }
}

class Categories {
  int? id;
  String? name;

  Categories({this.id, this.name});

  Categories.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    return data;
  }
}
