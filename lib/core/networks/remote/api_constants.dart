class ApiConstants {
  static const localBaseUrl = "";
  static const baseUrl = "";
  static const socketUrl = "";

  // static const socketUrl ="";

  static const loginEndPoint = "user/auth/login";
  static const registerEndPoint = "user/auth/register";
  static const getAllCountriesEndPoint = "country";
  static const verifyEmailEndPoint = "user/auth/verifyAccount";
  static const changePasswordEndPoint = "user/auth/changePassword";
  static const getUserDataEndPoint = "user/auth/getMe";
  static const updateUserEndPoint = "user/auth/updateMe";
  static const deleteUserEndPoint = "user/auth/deleteMe";
  static const forgetPasswordEndPoint = "user/auth/forgotPassword";
  static const verifyResetPasswordEndPoint = "user/auth/verifyResetCode";
  static const resetPasswordEndPoint = "user/auth/resetPassword";
  static const getHomeCarouselDataEndPoint = "banner";
  static const getAllNotificationsEndPoint =
      "notifications/user/myNotifications";

  static String getChatMessages({required String id}) {
    return 'chat/$id';
  }

  static String acceptTransfer({required id}) {
    return "transfer/accept/$id";
  }

  static String rejectTransfer({required id}) {
    return "transfer/reject/$id";
  }

  static String cancelTransfer({required id}) {
    return "transfer/$id";
  }

  static String transferQrCodeToAnotherUser(
      {required qrCodeId, required userId}) {
    return "transfer/$qrCodeId/$userId";
  }

  static String toggleQrEnabledState({required id}) {
    return "qr/toggleEnabledState/$id";
  }

  static String toggleQrPublicState({required id}) {
    return "qr/togglePublicState/$id";
  }

  static String addQrCodeEndPoint({required id}) {
    return "qr/add/$id";
  }

  static String getGovernoratesOfCountry({required id}) {
    return "country/$id/governorates";
  }

  static String deleteChatEndPoint({required id}) {
    return "/$id";
  }

  static String clearChatEndPoint({required id}) {
    return "/$id";
  }

  static String getOneChatMessagesEndPoint({required id}) {
    return "/$id";
  }
}
