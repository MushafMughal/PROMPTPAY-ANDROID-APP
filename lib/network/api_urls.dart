class AppUrl {
  // AUTH
  static const String baseUrl =
      "https://worthy-yak-creative.ngrok-free.app/api";
  static const String signup = "$baseUrl/auth/register/";
  static const String login = "$baseUrl/auth/login/";
  static const String accountDetails = "$baseUrl/core/accountdetails/";
  static const String cardDetails = "$baseUrl/core/carddetails/";
  static const String payeeList = "$baseUrl/core/getpayees/";
  static const String addPayee = "$baseUrl/core/addpayee/";
  static const String updateCard = "$baseUrl/core/updatecarddetails/";
  static const String transactions = "$baseUrl/core/transactionlist/";
  static const String normalChatbot = "$baseUrl/faqchatbot/rag/";
  static const String promptPayChatbot = "$baseUrl/promptpaychatbot/";
  static const String logout = "$baseUrl/auth/logout/";
}
