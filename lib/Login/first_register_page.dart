import 'package:demo/Login/account_verified.dart';
import 'package:demo/Login/change_pass.dart';
import 'package:demo/Login/check_mail.dart';
import 'package:demo/Login/forgot_pass.dart';
import 'package:demo/Login/reset_pass.dart';
import 'package:demo/Login/resgister_page.dart';
import 'package:demo/Utils/app_theme.dart';
import 'package:demo/Utils/asset_files.dart';
import 'package:demo/Utils/common_button.dart';
import 'package:demo/Utils/text_fields.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../Utils/custome_app_bar.dart';


class FirstRegisterPage extends StatefulWidget {

  const FirstRegisterPage({Key? key}) : super(key: key);
  @override
  FirstRegisterPageState createState() => FirstRegisterPageState();
}

class FirstRegisterPageState extends State<FirstRegisterPage> {
  TextEditingController emailController=TextEditingController();
  TextEditingController passController=TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool value=false;
  bool loginOption=true;
  bool _passwordVisible = false;
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
         child: loginOption==false?
           Form(
             key: _formKey,
             child: Column(
             children: [
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
                   Text('Register',style: StyleForApp.headline,),
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
               CommonButtonForAllApp(title: 'Register',onPressed: (){
                 if (_formKey.currentState!.validate()) {
                   // If the form is valid,
                   // perform further actions here
                   Navigator.push(context, MaterialPageRoute(builder: (context)=>const CheckMail()));
                 }

               },),
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
                  Text('Register',style: StyleForApp.headline,),
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



           ],
         ),
       ),
     ),
   );
  }
 void resetPass(){

 }
}