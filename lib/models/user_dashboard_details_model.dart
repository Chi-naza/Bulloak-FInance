class UserDashboardDetailsModel {
  Profile? profile;
  List<Transactions>? transactions;
  List<Referrals>? referrals;
  int? referralsProfit;

  UserDashboardDetailsModel(
      {this.profile, this.transactions, this.referrals, this.referralsProfit});

  UserDashboardDetailsModel.fromJson(Map<String, dynamic> json) {
    profile =
        json['profile'] != null ? new Profile.fromJson(json['profile']) : null;
    if (json['transactions'] != null) {
      transactions = <Transactions>[];
      json['transactions'].forEach((v) {
        transactions!.add(new Transactions.fromJson(v));
      });
    }
    if (json['referrals'] != null) {
      referrals = <Referrals>[];
      json['referrals'].forEach((v) {
        referrals!.add(new Referrals.fromJson(v));
      });
    }
    referralsProfit = json['referrals_profit'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.profile != null) {
      data['profile'] = this.profile!.toJson();
    }
    if (this.transactions != null) {
      data['transactions'] = this.transactions!.map((v) => v.toJson()).toList();
    }
    if (this.referrals != null) {
      data['referrals'] = this.referrals!.map((v) => v.toJson()).toList();
    }
    data['referrals_profit'] = this.referralsProfit;
    return data;
  }
}

class Profile {
  int? id;
  User? user;
  dynamic fullName;
  dynamic phoneNumber;
  dynamic address;
  String? country;
  String? image;
  double? availableBalance;
  double? liveProfit;
  double? bookBalance;
  bool? loginemailblocked;
  dynamic facebook;
  dynamic instagram;
  dynamic twitter;

  Profile(
      {this.id,
      this.user,
      this.fullName,
      this.phoneNumber,
      this.address,
      this.country,
      this.image,
      this.availableBalance,
      this.liveProfit,
      this.bookBalance,
      this.loginemailblocked,
      this.facebook,
      this.instagram,
      this.twitter});

  Profile.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
    fullName = json['full_name'];
    phoneNumber = json['phone_number'];
    address = json['address'];
    country = json['country'];
    image = json['image'];
    availableBalance = json['available_balance'];
    liveProfit = json['live_profit'];
    bookBalance = json['book_balance'];
    loginemailblocked = json['loginemailblocked'];
    facebook = json['facebook'];
    instagram = json['instagram'];
    twitter = json['twitter'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
    data['full_name'] = this.fullName;
    data['phone_number'] = this.phoneNumber;
    data['address'] = this.address;
    data['country'] = this.country;
    data['image'] = this.image;
    data['available_balance'] = this.availableBalance;
    data['live_profit'] = this.liveProfit;
    data['book_balance'] = this.bookBalance;
    data['loginemailblocked'] = this.loginemailblocked;
    data['facebook'] = this.facebook;
    data['instagram'] = this.instagram;
    data['twitter'] = this.twitter;
    return data;
  }
}

class User {
  String? email;
  String? firstName;
  String? username;
  String? lastName;

  User({this.email, this.firstName, this.username, this.lastName});

  User.fromJson(Map<String, dynamic> json) {
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

class Transactions {
  int? id;
  bool? verified;
  String? created;
  String? usdtAmount;
  String? description;
  String? transactionType;
  int? profile;

  Transactions(
      {this.id,
      this.verified,
      this.created,
      this.usdtAmount,
      this.description,
      this.transactionType,
      this.profile});

  Transactions.fromJson(Map<String, dynamic> json) {
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

class Referrals {
  int? id;
  User? referredUser;
  String? referralProfit;
  int? user;

  Referrals({this.id, this.referredUser, this.referralProfit, this.user});

  Referrals.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    referredUser = json['referred_user'] != null
        ? new User.fromJson(json['referred_user'])
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
