

class VerifyOtpResponseModel {
  VerifyOtpResponseModel({
    this.otp,
    this.username,
    this.channelId,
  });

  String? otp;
  String? username;
  String? channelId;

  factory VerifyOtpResponseModel.fromJson(Map<String, dynamic> json) => VerifyOtpResponseModel(
    otp: json["otp"] == null ? null : json["otp"],
    username: json["username"] == null ? null : json["username"],
    channelId: json["channelId"] == null ? null : json["channelId"],
  );

  Map<String, dynamic> toJson() => {
    "otp": otp == null ? null : otp,
    "username": username == null ? null : username,
    "channelId": channelId == null ? null : channelId,
  };
}
