import 'package:oauth2_client/google_oauth2_client.dart';
import 'package:oauth2_client/oauth2_helper.dart';

class Oauth2ClientExample {
  Oauth2ClientExample();

  Future<void> fetchFiles() async {
    var hlp = OAuth2Helper(
      GoogleOAuth2Client(
          redirectUri: 'com.aaha.demo:/oauth2redirect',
          customUriScheme: 'com.aaha.demo'),
      grantType: OAuth2Helper.AUTHORIZATION_CODE,
      clientId: '177996490229-4piasftsakdvak4e5kh192tvmv7s85tg.apps.googleusercontent.com',
      clientSecret: 'XXX-XXX-XXX',
      scopes: ['email'],
    );

    var resp = await hlp.get('https://www.googleapis.com/drive/v3/files');

    print(resp.body);
  }
}