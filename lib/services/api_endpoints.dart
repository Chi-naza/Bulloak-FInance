class BulloakAPI {
  //base url
  static const String baseUrl = 'https://api.bulloak.org';

  // Auth
  static const String registerEndpoint = "$baseUrl/user/auth/create/"; //POST
  static const String loginEndpoint = "$baseUrl/user/auth/login/"; //POST
  static const String logoutEndpoint = "$baseUrl/user/auth/logout/"; //POST

  static const String passwordResetEndpoint =
      "$baseUrl/user/auth/password-reset/"; //POST
  static const String passwordResetCompleteEndpoint =
      "$baseUrl/user/auth/password-confirmation/"; //POST

  static const String verifyEmailEndpoint =
      "$baseUrl/user/auth/verify-email/"; //POST

  static const String resendVerifyEmailOtp =
      "$baseUrl/user/auth/resend-verify-email/";

  // PLANS
  static const String getAllPlansEndpoint = "$baseUrl/plans/"; //GET

  static const String getPlanHistoryEndpoint = "$baseUrl/plans/history"; //GET

  static const String subscribeToPlanEndpoint = "$baseUrl/plans/"; // POST

  static const String userEndPoint = "$baseUrl/user/"; //GET
  /// TRANSACTIONS
  static const String getUserTransactionsEndpoint =
      "$baseUrl/transaction/dashboard"; // POST
  static const String withdrawEndpoint = "$baseUrl/withdraw/"; // POST
  static const String depositEndpoint = "$baseUrl/deposit/"; // POST
  static const String allTxnEndpoint = "$baseUrl/transaction/dashboard"; //GET
  static const String transferEndpoint = "$baseUrl/transfer/"; //POST

  // REFERRAL
  static const String referralEndpoint = "$baseUrl/referral/"; //GET

  // DASHBOARD
  static getUserDashboardDetail(String userID) =>
      "$baseUrl/user/dashboard/user/$userID"; // GET

  static const getUserEndpoint = "$baseUrl/user/dashboard/users";
}
