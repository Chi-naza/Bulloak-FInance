class ReferralModel {
  int? id;
  ReferredUser? referredUser;
  String? referralProfit;
  int? user;

  ReferralModel({this.id, this.referredUser, this.referralProfit, this.user});

  ReferralModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    referredUser = json['referred_user'] != null
        ? new ReferredUser.fromJson(json['referred_user'])
        : null;
    referralProfit = json['referral_profit'];
    user = json['user'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    if (this.referredUser != null) {
      data['referred_user'] = this.referredUser!.toJson();
    }
    data['referral_profit'] = this.referralProfit;
    data['user'] = this.user;
    return data;
  }
}

class ReferredUser {
  String? email;
  String? firstName;
  String? username;
  String? lastName;

  ReferredUser({this.email, this.firstName, this.username, this.lastName});

  ReferredUser.fromJson(Map<String, dynamic> json) {
    email = json['email'];
    firstName = json['first_name'];
    username = json['username'];
    lastName = json['last_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['email'] = this.email;
    data['first_name'] = this.firstName;
    data['username'] = this.username;
    data['last_name'] = this.lastName;
    return data;
  }
}
