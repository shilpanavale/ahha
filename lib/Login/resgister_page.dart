import 'package:demo/Login/account_verified.dart';
import 'package:demo/Login/change_pass.dart';
import 'package:demo/Login/login_page.dart';
import 'package:demo/Login/reset_pass.dart';
import 'package:demo/Utils/app_theme.dart';
import 'package:demo/Utils/asset_files.dart';
import 'package:demo/Utils/common_button.dart';
import 'package:demo/Utils/custome_app_bar.dart';
import 'package:demo/Utils/text_fields.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';


class RegisterPage extends StatefulWidget {

  const RegisterPage({Key? key}) : super(key: key);
  @override
  RegisterPageState createState() => RegisterPageState();
}

class RegisterPageState extends State<RegisterPage> {
  TextEditingController emailController=TextEditingController();
  TextEditingController passController=TextEditingController();
  bool _passwordVisible = false;
  bool value=false;
  bool loginOption=true;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
   return Scaffold(
     backgroundColor: ColorsForApp.appBackGround,
     appBar: CustomAppBar(
       onPressed: () {
         Navigator.of(context);
       }, title: '',),
     body: SafeArea(
       child: SingleChildScrollView(
         child:
         Column(
           children: [
            // const SizedBox(height: 10),
             AppLogo.appLogo,
            // const SizedBox(height: 20,),
             const SizedBox(height: 50,),
             Row(
               mainAxisAlignment: MainAxisAlignment.center,
               children: const [
                 Text('Register',style: StyleForApp.headline,),
               ],
             ),
             const SizedBox(height: 20,),
             CommonTextField.emailTextField(null, "Email Address", emailController, TextInputType.emailAddress),
             CommonTextField.passwordTextField(null, "Password", passController, TextInputType.text,_passwordVisible,setState),
             CommonTextField.passwordTextField(null, "Confirm Password", passController, TextInputType.text,_passwordVisible,setState),
             const SizedBox(height: 15),
             CommonButtonForAllApp(title: 'Register',onPressed: (){
               Navigator.push(context, MaterialPageRoute(builder: (context)=>const AccountVerified()));
             },),
             const SizedBox(height: 5),
             RichText(
               text:  TextSpan(
                 text: "By clicking register you agree to ? ",
                 style: const TextStyle(
                   fontSize: 15.0,
                   color: Colors.grey,
                 ),
                 children: [
                    TextSpan(
                      recognizer: TapGestureRecognizer()..onTap = () {
                        // Single tapped.
                        _launchUrl("https://www.ahhaa.com/terms");
                       // Navigator.push(context, MaterialPageRoute(builder: (context)=>const ResetPassPage()));
                      },

                     text: "Terms ",
                     style: const TextStyle(
                       fontSize: 15.0,
                       color: ColorsForApp.nearlyWhite,
                       fontWeight: FontWeight.w500,
                     ),
                   ),
                   TextSpan(
                     recognizer: TapGestureRecognizer()..onTap = () {
                       // Single tapped.
                       _launchUrl("https://www.ahhaa.com/privacy-policy");
                       // Navigator.push(context, MaterialPageRoute(builder: (context)=>const ResetPassPage()));
                     },

                     text: "& Policy",
                     style: const TextStyle(
                       fontSize: 15.0,
                       color: ColorsForApp.nearlyWhite,
                       fontWeight: FontWeight.w500,
                     ),
                   )
                 ],
               ),
             ),
             const SizedBox(height: 30),
             RichText(
               text: TextSpan(
                 text: "Already have an account? ",
                 style: const TextStyle(
                   fontSize: 16.0,
                   color: ColorsForApp.nearlyWhite,
                 ),
                 children: [
                   TextSpan(
                     text: "Login",
                     recognizer: TapGestureRecognizer()..onTap = () {
                       // Single tapped.
                       Navigator.push(context, MaterialPageRoute(builder: (context)=>const LoginPage()));
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
         )

       ),
     ),
   );
  }
  void _launchUrl(String _url) async {
    if (!await launchUrl(Uri.parse(_url))) throw 'Could not launch $_url';
  }
}