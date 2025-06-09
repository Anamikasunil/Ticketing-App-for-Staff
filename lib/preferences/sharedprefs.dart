// import 'package:shared_preferences/shared_preferences.dart';

// class PreferencesManager {
//   static late SharedPreferences _prefs;

//   static Future<void> init() async {
//     _prefs = await SharedPreferences.getInstance();
//   }

//   static SharedPreferences get instance => _prefs;
// }

// //settt

// class SetPreferences {
//   static Future<void> setState(String username) async {
//     await PreferencesManager.instance.setString('username', username);
//   }
// }

// // gett

// class GetPreferences {
//   static String? getState() {
//     return PreferencesManager.instance.getString('username');
//   }
// }
