abstract class AppConfig {
  static const String channelID = "Crendly";

  static const String login = '/api/auth/login';
  static const String updatePersonalInformation =
      '/Identity-Service/api/profilemanagement/update_profile/';
  static const String signUpStageOne = '/api/auth/platform/signupv2';
  static const String verifyOtp = '/api/auth/verify_emailOrPhone';
  static const String updateEmploymentDetails =
      "/Identity-Service/api/Identity/update-employment_details";

  static const String updateRegulatoryId =
      "/Identity-Service/api/Identity/update-regulatory_Id";

  static const String getResidenceCategories =
      "/Identity-Service/api/Identity/GetResidenceCategories";
}
