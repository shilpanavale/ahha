import 'package:demo/Login/account_verified.dart';
import 'package:demo/Login/change_pass.dart';
import 'package:demo/Login/reset_pass.dart';
import 'package:demo/Utils/app_theme.dart';
import 'package:demo/Utils/asset_files.dart';
import 'package:demo/Utils/common_button.dart';
import 'package:demo/Utils/text_fields.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';


class LoginPage extends StatefulWidget {

  const LoginPage({Key? key}) : super(key: key);
  @override
  LoginPageState createState() => LoginPageState();
}

class LoginPageState extends State<LoginPage> {
  TextEditingController emailController=TextEditingController();
  TextEditingController passController=TextEditingController();

  bool value=false;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
   return Scaffold(
     backgroundColor: ColorsForApp.appBackGround,
     body: SafeArea(
       child: SingleChildScrollView(
         child: Column( 
           children: [
             const SizedBox(height: 10),
             Row(
               mainAxisAlignment: MainAxisAlignment.center,
               children: [
                 Text('Ahhaa',style: TextStyle(fontSize:20,color: ColorsForApp.greenColor,fontWeight: FontWeight.bold),),
               ],
             ),
             const SizedBox(height: 20,),
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
               children: [
                 const Text('Login',style: StyleForApp.headline,),
               ],
             ),
             const SizedBox(height: 20,),
             CommonTextField.normalTextField(null, "Email Address", emailController, TextInputType.emailAddress),
             CommonTextField.passwordTextField(null, "Password", passController, TextInputType.text),
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
                       return Colors.white;
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
               Navigator.push(context, MaterialPageRoute(builder: (context)=>const ChangePassPage()));
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
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>const ResetPassPage()));
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
                       Navigator.push(context, MaterialPageRoute(builder: (context)=>const AccountVerified()));
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
 void resetPass(){

 }
}