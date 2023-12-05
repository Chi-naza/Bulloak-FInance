//USER DASHBOARD BULLOAK

class UserDashboard {
  List<Profile>? profile;
  late List? transactions;
  late List<Referral>? referral;
  late List? referralsProfit;

  UserDashboard.fromJson(Map<String, dynamic> json) {
    profile =
        List.from(json['profile']).map((e) => Profile.fromJson(e)).toList();
  }

  UserDashboard(
      {this.profile, this.transactions, this.referral, this.referralsProfit});
}

class Profile {
  int? id;
  dynamic user;
  String? country;
  String? imageUrl;
  String? availableBalance;
  double? liveProfit;
  double? bookBalance;
  bool? loginEmailBlocked;

  Profile(
      {this.id,
      this.country,
      this.imageUrl,
      this.availableBalance,
      this.liveProfit,
      this.bookBalance,
      this.loginEmailBlocked});

  Profile.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    user = json['user'];
    country = json['country'];
    imageUrl = json['imageUrl'];
    availableBalance = json['available_balance'];
    liveProfit = json['live_profit'];
    bookBalance = json['book_balance'];
    loginEmailBlocked = json['loginEmailBlocked'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['user'] = user;
    data['country'] = country;
    data['imageUrl'] = imageUrl;
    data['available_balance'] = availableBalance;
    data['liveProfit'] = liveProfit;
    data['bookBalance'] = bookBalance;
    data['loginEmailBlocked'] = loginEmailBlocked;
    return data;
  }
}

class Referral {
  double? id;
  dynamic referredUser;
  String? referralProfit;
  int? user;

  Referral({
    this.id,
    this.referralProfit,
    this.referredUser,
    this.user,
  });
}
