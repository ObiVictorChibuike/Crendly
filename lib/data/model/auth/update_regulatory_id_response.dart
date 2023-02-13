// To parse this JSON data, do
//
//     final updateRegulatoryId = updateRegulatoryIdFromJson(jsonString);

class UpdateRegulatoryIdResponse {
  UpdateRegulatoryIdResponse({
    this.status,
    this.errorMessage,
    this.data,
    this.message,
  });

  bool? status;
  dynamic errorMessage;
  dynamic data;
  String? message;

  factory UpdateRegulatoryIdResponse.fromJson(Map<String, dynamic> json) =>
      UpdateRegulatoryIdResponse(
        status: json["status"],
        errorMessage: json["errorMessage"],
        data: json["data"],
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "errorMessage": errorMessage,
        "data": data,
        "message": message,
      };
}
