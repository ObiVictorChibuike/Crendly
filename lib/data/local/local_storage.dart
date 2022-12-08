import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';


class LocalCachedData{
  final SharedPreferences _prefs;
  LocalCachedData._(this._prefs);
  static Future<LocalCachedData> create() async => LocalCachedData._(await SharedPreferences.getInstance());
  static LocalCachedData get instance => Get.find<LocalCachedData>();

  Future<String?> getAuthToken() async {
    String? token = _prefs.getString("token");
    return token;
  }

  Future<void> cacheAuthToken({required String? token}) async {
    _prefs.setString("token", token!);
  }

  Future<String?> getUserId() async {
    String? token = _prefs.getString("id");
    return token;
  }

  Future<void> cacheUserId({required String? userId}) async {
    _prefs.setString("id", userId!);
  }

  Future<String?> getUserEmail() async {
    String? email = _prefs.getString("userEmail");
    return email;
  }

  Future<void> cacheUserEmail({required String? email}) async {
    _prefs.setString("userEmail", email!);
  }

  Future<void> cachePassword({required String? password}) async {
    _prefs.setString("password", password!);
  }

  Future<String?> getPassword() async {
    String? password = _prefs.getString("password");
    return password;
  }

  // Future<void> cacheDriverProfileData({required DriverProfileData driverProfileData }) async {
  //   final sharedPreferences = await SharedPreferences.getInstance();
  //   sharedPreferences.setString("userdata", json.encode(driverProfileData.toJson()));
  // }
  //
  // Future<DriverProfileData?> getDriverProfileData() async {
  //   final sharedPreferences = await SharedPreferences.getInstance();
  //   String? userData = sharedPreferences.getString("userdata");
  //   return userData == null ? null : DriverProfileData.fromJson(jsonDecode(userData));
  // }

  Future<bool> getLoginStatus() async {
    bool? userData = _prefs.getBool("isLoggedIn");
    return userData ?? false;
  }

  Future<void> cacheLoginStatus({required bool isLoggedIn}) async {
    _prefs.setBool("isLoggedIn", isLoggedIn);
  }

// Future<void> saveUserDetails({required UserDetails userDetails}) async {
//   final sharedPreferences = await SharedPreferences.getInstance();
//   sharedPreferences.setString("saveUserDetails", jsonEncode(userDetails.toJson()));
// }
// Future<UserDetails> fetchUserDetails() async {
//   final sharedPreferences = await SharedPreferences.getInstance();
//   String? userData = sharedPreferences.getString("saveUserDetails");
//   return UserDetails.fromJson(jsonDecode(userData!));
// }

}