import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalCachedData {
  final SharedPreferences _prefs;
  LocalCachedData._(this._prefs);
  static Future<LocalCachedData> create() async =>
      LocalCachedData._(await SharedPreferences.getInstance());
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

  Future<String?> getUserPhoneNumber() async {
    String? phoneNumber = _prefs.getString("phoneNumber");
    return phoneNumber;
  }

  Future<void> cacheUserPhoneNumber({required String? phoneNumber}) async {
    _prefs.setString("phoneNumber", phoneNumber!);
  }

  Future<String?> getUserDOB() async {
    String? dob = _prefs.getString("dob");
    return dob;
  }

  Future<void> cacheUserDOB({required String? dob}) async {
    _prefs.setString("dob", dob!);
  }

  Future<String?> getUserGender() async {
    String? gender = _prefs.getString("gender");
    return gender;
  }

  Future<void> cacheUserGender({required String? gender}) async {
    _prefs.setString("gender", gender!);
  }

  Future<String?> getUserLastName() async {
    String? lastName = _prefs.getString("lastName");
    return lastName;
  }

  Future<void> cacheUserLastName({required String? lastName}) async {
    _prefs.setString("lastName", lastName!);
  }

  Future<String?> getUserFirstName() async {
    String? firstName = _prefs.getString("firstName");
    return firstName;
  }

  Future<void> cacheUserFirstName({required String? firstName}) async {
    _prefs.setString("firstName", firstName!);
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
