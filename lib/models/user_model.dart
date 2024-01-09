class UserModel {
  int? id;
  User? user;
  String? country;
  String? image;
  double? availableBalance;
  double? liveProfit;
  double? bookBalance;
  bool? loginemailblocked;

  UserModel(
      {this.id,
      this.user,
      this.country,
      this.image,
      this.availableBalance,
      this.liveProfit,
      this.bookBalance,
      this.loginemailblocked});

  UserModel.fromJson(Map<String, dynamic> json) {
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
