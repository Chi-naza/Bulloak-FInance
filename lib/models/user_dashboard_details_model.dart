class UserDashboardDetailsModel {
  Profile? profile;
  List<Transactions>? transactions;
  List<PlanHistory>? planHistory;
  List<Referrals>? referrals;
  String? totalDeposits;
  String? totalWithdrawals;
  int? totalBonuses;
  dynamic referredBy;

  UserDashboardDetailsModel(
      {this.profile,
      this.transactions,
      this.planHistory,
      this.referrals,
      this.totalDeposits,
      this.totalWithdrawals,
      this.totalBonuses,
      this.referredBy});

  UserDashboardDetailsModel.fromJson(Map<dynamic, dynamic> json) {
    profile =
        json['profile'] != null ? new Profile.fromJson(json['profile']) : null;
    if (json['transactions'] != null) {
      transactions = <Transactions>[];
      json['transactions'].forEach((v) {
        transactions!.add(new Transactions.fromJson(v));
      });
    }
    if (json['plan_history'] != null) {
      planHistory = <PlanHistory>[];
      json['plan_history'].forEach((v) {
        planHistory!.add(new PlanHistory.fromJson(v));
      });
    }
    if (json['referrals'] != null) {
      referrals = <Referrals>[];
      json['referrals'].forEach((v) {
        referrals!.add(new Referrals.fromJson(v));
      });
    }
    totalDeposits = json['total_deposits'];
    totalWithdrawals = json['total_withdrawals'];
    totalBonuses = json['total_bonuses'];
    referredBy = json['referred_by'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.profile != null) {
      data['profile'] = this.profile!.toJson();
    }
    if (this.transactions != null) {
      data['transactions'] = this.transactions!.map((v) => v.toJson()).toList();
    }
    if (this.planHistory != null) {
      data['plan_history'] = this.planHistory!.map((v) => v.toJson()).toList();
    }
    if (this.referrals != null) {
      data['referrals'] = this.referrals!.map((v) => v.toJson()).toList();
    }
    data['total_deposits'] = this.totalDeposits;
    data['total_withdrawals'] = this.totalWithdrawals;
    data['total_bonuses'] = this.totalBonuses;
    data['referred_by'] = this.referredBy;
    return data;
  }
}

class Profile {
  int? id;
  User? user;
  String? country;
  String? image;
  double? availableBalance;
  double? liveProfit;
  double? bookBalance;
  bool? loginemailblocked;

  Profile(
      {this.id,
      this.user,
      this.country,
      this.image,
      this.availableBalance,
      this.liveProfit,
      this.bookBalance,
      this.loginemailblocked});

  Profile.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
    country = json['country'];
    image = json['image'];
    availableBalance = json['available_balance'];
    liveProfit = json['live_profit'];
    bookBalance = json['book_balance'];
    loginemailblocked = json['loginemailblocked'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
    data['country'] = this.country;
    data['image'] = this.image;
    data['available_balance'] = this.availableBalance;
    data['live_profit'] = this.liveProfit;
    data['book_balance'] = this.bookBalance;
    data['loginemailblocked'] = this.loginemailblocked;
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

class PlanHistory {
  int? id;
  String? amount;
  String? profit;
  String? created;
  int? investmentplan;
  int? profile;

  PlanHistory(
      {this.id,
      this.amount,
      this.profit,
      this.created,
      this.investmentplan,
      this.profile});

  PlanHistory.fromJson(Map<String, dynamic> json) {
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
