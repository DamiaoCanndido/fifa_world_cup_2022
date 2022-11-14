import 'package:google_sign_in/google_sign_in.dart';

class GoogleSignInAPI {
  static final _googleSignIn = GoogleSignIn();

  static Future<GoogleSignInAccount?> login() => _googleSignIn.signIn();

  static Future<GoogleSignInAccount?> logout() => _googleSignIn.disconnect();

  static Future<String> getAccessToken(GoogleSignInAccount? user) async {
    String bearer = "";
    await user!.authHeaders.then((value) => {bearer = value.values.first});
    String token = bearer.split(" ")[1];
    return token;
  }
}
