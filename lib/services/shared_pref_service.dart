import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefService {
  static const String _keyToken = "token";

  final SharedPreferences pref;

  SharedPrefService(this.pref);

  Future<void> saveToken(String token) async {
    await pref.setString(_keyToken, token);
  }

  String? getToken() => pref.getString(_keyToken);

  Future<void> deleteToken() => pref.remove(_keyToken);
}
