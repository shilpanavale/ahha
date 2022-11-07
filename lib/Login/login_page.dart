import 'dart:convert';

import 'package:demo/Login/account_verified.dart';
import 'package:demo/Login/change_pass.dart';
import 'package:demo/Login/check_mail.dart';
import 'package:demo/Login/forgot_pass.dart';
import 'package:demo/Login/first_register_page.dart';
import 'package:demo/Login/google_web.dart';
import 'package:demo/Login/reset_pass.dart';
import 'package:demo/Login/resgister_page.dart';
import 'package:demo/Utils/app_theme.dart';
import 'package:demo/Utils/asset_files.dart';
import 'package:demo/Utils/common_button.dart';
import 'package:demo/Utils/text_fields.dart';
import 'package:demo/google_outh_client.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_custom_tabs/flutter_custom_tabs.dart';
import 'package:flutter_web_auth/flutter_web_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:oauth2_client/google_oauth2_client.dart';
import 'package:oauth2_client/oauth2_client.dart';
import 'package:oauth2_client/oauth2_helper.dart';
import 'package:http/http.dart' as http;
GoogleSignIn _googleSignIn = GoogleSignIn(
  // Optional clientId
  // clientId: '479882132969-9i9aqik3jfjd7qhci1nqf0bm2g71rm1u.apps.googleusercontent.com',
  scopes: <String>[
    'email',

  ],
);

class LoginPage extends StatefulWidget {

  const LoginPage({Key? key}) : super(key: key);
  @override
  LoginPageState createState() => LoginPageState();
}

class LoginPageState extends State<LoginPage> {
  GoogleSignInAccount? _currentUser;
  TextEditingController emailController=TextEditingController();
  TextEditingController passController=TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool value=false;
  bool loginOption=true;
  bool _passwordVisible = false;

  @override
  void initState() {
    // TODO: implement initState
    _googleSignIn.onCurrentUserChanged.listen((GoogleSignInAccount? account) {
      setState(() {
        _currentUser = account;

      });
      if (_currentUser != null) {

      }
    });
    _googleSignIn.signInSilently();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
   return Scaffold(
     backgroundColor: ColorsForApp.appBackGround,
     body: SafeArea(
       child: SingleChildScrollView(
         child: loginOption==false?
           Form(
             key: _formKey,
             child: Column(
             children: [
               const SizedBox(height: 10),
               AppLogo.appLogo,
              // const SizedBox(height: 20,),
               Padding(
                 padding: const EdgeInsets.all(15.0),
                 child: Container(
                   height: 150,
                   width: double.infinity,
                   decoration: BoxDecoration(
                     borderRadius: BorderRadius.circular(15.0),
                     color: Colors.transparent,
                     image: DecorationImage(
                       fit: BoxFit.fill,
                       image: AssetImage(
                         AssetsFiles.mountain,
                       ),
                     ),
                   ),
                 ),
               ),
               const SizedBox(height: 20,),
               Row(
                 mainAxisAlignment: MainAxisAlignment.center,
                 children: const [
                   Text('Login',style: StyleForApp.headline,),
                 ],
               ),
               const SizedBox(height: 20,),
               CommonTextField.emailTextField(null, "Email Address", emailController, TextInputType.emailAddress),
               CommonTextField.passwordTextField(null, "Password", passController, TextInputType.text,_passwordVisible,setState),
               Padding(
                 padding: const EdgeInsets.only(top: 3, bottom: 3, right: 30, left: 30),
                 child: Row(
                   crossAxisAlignment: CrossAxisAlignment.center,
                   children: <Widget>[

                     Checkbox(
                       fillColor:MaterialStateProperty.resolveWith ((states) {
                         if (states.contains(MaterialState.disabled)) {
                         return Colors.green;
                         }
                         return Colors.green;
                         }),
                       value: value,
                       onChanged: (value) {
                         setState(() {
                           this.value = value!;
                         });
                       },
                     ),
                     const SizedBox(width: 10), //SizedBox
                      Text(
                       'Remember me ',
                       style: StyleForApp.textStyle13NormalWhite,
                     ), //Text

                   ], //<Widget>[]
                 ),
               ),
               CommonButtonForAllApp(title: 'Login',onPressed: (){
                 if (_formKey.currentState!.validate()) {
                   // If the form is valid,
                   // perform further actions here
                   Navigator.push(context, MaterialPageRoute(builder: (context)=>const ChangePassPage()));
                 }

               },),
               const SizedBox(height: 10),
               RichText(
                 text:  TextSpan(
                   text: "Forgot Password? ",
                   style: const TextStyle(
                     fontSize: 15.0,
                     color: Colors.grey,
                   ),
                   children: [
                      TextSpan(
                        recognizer: TapGestureRecognizer()..onTap = () {
                          // Single tapped.
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>const ForgotPassPage()));
                        },

                       text: "Click here",
                       style: const TextStyle(
                         fontSize: 15.0,
                         color: ColorsForApp.nearlyWhite,
                         fontWeight: FontWeight.w500,
                       ),
                     )
                   ],
                 ),
               ),
               const SizedBox(height: 15),
               RichText(
                 text: TextSpan(
                   text: "Dont have an account? ",
                   style: const TextStyle(
                     fontSize: 16.0,
                     color: ColorsForApp.nearlyWhite,
                   ),
                   children: [
                     TextSpan(
                       text: "Register",
                       recognizer: TapGestureRecognizer()..onTap = () {
                         // Single tapped.
                         Navigator.push(context, MaterialPageRoute(builder: (context)=>const RegisterPage()));
                       },
                       style: TextStyle(
                         fontSize: 16.0,
                         color: ColorsForApp.greenColor,
                         fontWeight: FontWeight.w500,
                       ),
                     )
                   ],
                 ),
               ),
               const SizedBox(height: 10),

             ],
         ),
           ):
         Column(
           children: [
             const SizedBox(height: 10),
             AppLogo.appLogo,
             // const SizedBox(height: 20,),
             Padding(
               padding: const EdgeInsets.all(15.0),
               child: Container(
                 height: 150,
                 width: double.infinity,
                 decoration: BoxDecoration(
                   borderRadius: BorderRadius.circular(15.0),
                   color: Colors.transparent,
                   image: DecorationImage(
                     fit: BoxFit.fill,
                     image: AssetImage(
                       AssetsFiles.mountain,
                     ),
                   ),
                 ),
               ),
             ),
             const SizedBox(height: 20,),
             Row(
               mainAxisAlignment: MainAxisAlignment.center,
               children: const [
                  Text('Login',style: StyleForApp.headline,),
               ],
             ),
             const SizedBox(height: 20,),
             InkWell(
               onTap: () {
                 setState(() {
                   loginOption=false;
                 });

               },

               child: Padding(
                 padding: const EdgeInsets.only(left: 15.0,right: 15.0,bottom: 5),
                 child: Container(
                   height: 45,
                   //width: 140,
                   decoration: BoxDecoration(
                     borderRadius: BorderRadius.circular(10.0),
                     color: ColorsForApp.blackVeryLightColor
                   ),
                   child: Center(
                     child: Row(
                       mainAxisAlignment: MainAxisAlignment.center,
                       children: [
                         Container(
                           height: 30,
                           width: 30,
                           decoration: BoxDecoration(
                             borderRadius: BorderRadius.circular(15.0),
                             color: Colors.transparent,
                             image: DecorationImage(
                               fit: BoxFit.fill,
                               image: AssetImage(
                                 AssetsFiles.email,
                               ),
                             ),
                           ),
                         ),
                         SizedBox(width: 10,),
                         Text("Email",style: StyleForApp.textStyle13NormalWhite,)
                       ],
                     ),
                   ),
                 ),
               ),
             ),
             InkWell(
               onTap: (){
                 //_launchUrl("https://accounts.google.com/o/oauth2/v2/auth?redirect_uri=https://3f44-103-166-188-163.ngrok.io&prompt=consent&response_type=code&client_id=807457244674-c396q89432kq0mid0avucm8cq47nqekf.apps.googleusercontent.com&scope=openid%20email%20profile&access_type=offline");
               //Navigator.push(context, MaterialPageRoute(builder: (context)=>const WebViewExample()));

               // login();
               //  _handleSignIn();
               //  fetchFiles();
                 //_launchURL(context);
                 //webAuthLogin();



                 },
               child: Padding(
                 padding: const EdgeInsets.only(left: 15.0,right: 15.0,bottom: 5),
                 child: Container(
                   height: 45,
                   //width: 140,
                   decoration: BoxDecoration(
                       borderRadius: BorderRadius.circular(10.0),
                       color: ColorsForApp.blackVeryLightColor
                   ),
                   child: Center(
                     child: Row(
                       mainAxisAlignment: MainAxisAlignment.center,
                       children: [
                         Container(
                           height: 30,
                           width: 40,
                           decoration: BoxDecoration(
                             borderRadius: BorderRadius.circular(15.0),
                             color: Colors.transparent,
                             image: DecorationImage(
                               fit: BoxFit.fill,
                               image: AssetImage(
                                 AssetsFiles.google,
                               ),
                             ),
                           ),
                         ),
                         SizedBox(width: 10,),
                         Text("Gmail",style: StyleForApp.textStyle13NormalWhite,)
                       ],
                     ),
                   ),
                 ),
               ),
             ),
             InkWell(
               onTap: (){
                 Navigator.push(context, MaterialPageRoute(builder: (context)=>const AccountVerified()));
               },
               child: Padding(
                 padding: const EdgeInsets.only(left: 15.0,right: 15.0,bottom: 5),
                 child: Container(
                   height: 45,
                   //width: 140,
                   decoration: BoxDecoration(
                       borderRadius: BorderRadius.circular(10.0),
                       color: ColorsForApp.blackVeryLightColor
                   ),
                   child: Center(
                     child: Row(
                       mainAxisAlignment: MainAxisAlignment.center,
                       children: [
                         Container(
                           height: 30,
                           width: 40,
                           decoration: BoxDecoration(
                             borderRadius: BorderRadius.circular(15.0),
                             color: Colors.transparent,
                             image: DecorationImage(
                               fit: BoxFit.fill,
                               image: AssetImage(
                                 AssetsFiles.facebook,
                               ),
                             ),
                           ),
                         ),
                         SizedBox(width: 10,),
                         Text("Facebook",style: StyleForApp.textStyle13NormalWhite,)
                       ],
                     ),
                   ),
                 ),
               ),
             ),
             const SizedBox(height: 10),

             RichText(
               text: TextSpan(
                 text: "Dont have an account? ",
                 style: const TextStyle(
                   fontSize: 16.0,
                   color: ColorsForApp.nearlyWhite,
                 ),
                 children: [
                   TextSpan(
                     text: "Register",
                     recognizer: TapGestureRecognizer()..onTap = () {
                       // Single tapped.
                       Navigator.push(context, MaterialPageRoute(builder: (context)=>const FirstRegisterPage()));
                     },
                     style: TextStyle(
                       fontSize: 16.0,
                       color: ColorsForApp.greenColor,
                       fontWeight: FontWeight.w500,
                     ),
                   )
                 ],
               ),
             ),
             const SizedBox(height: 10),

           ],
         ),
       ),
     ),
   );
  }

  newWebLogin() async {
    // Present the dialog to the user
    final result = await FlutterWebAuth.authenticate(url: "https://my-custom-app.com/connect", callbackUrlScheme: "my-custom-app");

// Extract token from resulting url
    final token = Uri.parse(result).queryParameters['token'];
  }


  webAuthLogin() async {
    List scopeList=['email','profile'];
    final url = Uri.https(
        'accounts.google.com', '/o/oauth2/auth', {
      'response_type': 'code',
      'client_id': '177996490229-3ocj448177mb578625pkllmiebsqjrul.apps.googleusercontent.com',
      'redirect_uri': 'https://ahhaademoapp.page.link/start',
      'scope': 'email',
    });
    //final url = Uri.parse('https://accounts.google.com/o/oauth2/auth?response_type=code&client_id=177996490229-3ocj448177mb578625pkllmiebsqjrul.apps.googleusercontent.com&redirect_uri=https://ahhaademoapp.page.link/start&scope=https%3A%2F%2Fwww.googleapis.com%2Fauth%2Fuserinfo.email+https%3A%2F%2Fwww.googleapis.com%2Fauth%2Fuserinfo.profile&state=JsOr4U8h7qpXDgxkiGF1sSXYwqiJk9&access_type=offline&include_granted_scopes=true');

// Present the dialog to the user
    final result = await FlutterWebAuth.authenticate(url: url.toString(), callbackUrlScheme: 'https://ahhaademoapp.page.link/start');

// Extract code from resulting url
    final code = Uri.parse(result).queryParameters['code'];

// Use this code to get an access token
    final response = await http.post(Uri.parse("'https://www.googleapis.com/oauth2/v4/token'"), body: {
    'client_id': '177996490229-3ocj448177mb578625pkllmiebsqjrul.apps.googleusercontent.com',
      'redirect_uri': 'https://ahhaademoapp.page.link/start',
      'grant_type': 'authorization_code',
      'code': code,
    });

// Get the access token from the response
    final accessToken = jsonDecode(response.body)['access_token'] as String;
    print("AccessTOKen-->$accessToken");
  }
  void _launchURL(BuildContext context) async {
    try {
      await launch(
          'https://accounts.google.com/o/oauth2/auth?response_type=code&client_id=177996490229-3ocj448177mb578625pkllmiebsqjrul.apps.googleusercontent.com&redirect_uri=https://ahhaademoapp.page.link/start&scope=https%3A%2F%2Fwww.googleapis.com%2Fauth%2Fuserinfo.email+https%3A%2F%2Fwww.googleapis.com%2Fauth%2Fuserinfo.profile&state=JsOr4U8h7qpXDgxkiGF1sSXYwqiJk9&access_type=offline&include_granted_scopes=true',
        customTabsOption: CustomTabsOption(
          toolbarColor: Theme.of(context).primaryColor,
          enableDefaultShare: true,
          enableUrlBarHiding: true,
          showPageTitle: true,
          /*animation: CustomTabsAnimation.slideIn(),
          // or user defined animation.
          animation: const CustomTabsAnimation(
            startEnter: 'slide_up',
            startExit: 'android:anim/fade_out',
            endEnter: 'android:anim/fade_in',
            endExit: 'slide_down',
          ),*/
          extraCustomTabs: const <String>[
            // ref. https://play.google.com/store/apps/details?id=org.mozilla.firefox
            'org.mozilla.firefox',
            // ref. https://play.google.com/store/apps/details?id=com.microsoft.emmx
            'com.microsoft.emmx',
          ],
        ),
        safariVCOption: SafariViewControllerOption(
          preferredBarTintColor: Theme.of(context).primaryColor,
          preferredControlTintColor: Colors.white,
          barCollapsingEnabled: true,
          entersReaderIfAvailable: false,
          dismissButtonStyle: SafariViewControllerDismissButtonStyle.close,
        ),
      );
    } catch (e) {
      // An exception is thrown if browser app is not installed on Android device.
      debugPrint(e.toString());
    }
  }

  Future<void> fetchFiles() async {
    /*var client = OAuth2Client(
        authorizeUrl: <YOUR_AUTHORIZE_URL>,
        tokenUrl: <YOUR_TOKEN_URL>,
        redirectUri: <YOUR_REDIRECT_URI>,
        customUriScheme: <YOUR_CUSTOM_SCHEME>);*/


    var hlp = OAuth2Helper(
      GoogleOAuth2Client(
          redirectUri: 'https://d21a5.page.link/start',
          customUriScheme: 'com.aaha.demo'),
      grantType: OAuth2Helper.AUTHORIZATION_CODE,
      clientId: '177996490229-4piasftsakdvak4e5kh192tvmv7s85tg.apps.googleusercontent.com',
      clientSecret: 'XXX-XXX-XXX',
      scopes: ['email'],
    );

    var resp = await hlp.get("https://www.googleapis.com/drive/v3/files");

    print(resp.body);
  }

  Future<void> _handleSignIn() async {
    try {
      await _googleSignIn.signIn();
    } catch (error) {
      print(error);
    }
  }

  void login() async {
    GoogleSignIn _googleSignIn = GoogleSignIn(
      scopes: [
        'email',
        // you can add extras if you require
      ],
    );

    _googleSignIn.signIn().then((GoogleSignInAccount? acc) async {
      GoogleSignInAuthentication? auth = await acc?.authentication;

      print(auth?.idToken);
      print(acc!.id);
      print(acc.email);
      print(acc.displayName);
      print(acc.photoUrl);



      acc.authentication.then((GoogleSignInAuthentication auth) async {
        print(auth.idToken);
        print(auth.accessToken);
      });
    });
  }


}