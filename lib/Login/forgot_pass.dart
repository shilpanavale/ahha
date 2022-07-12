import 'package:demo/Login/check_mail.dart';
import 'package:demo/Login/reset_pass.dart';
import 'package:demo/Login/reset_pass_success.dart';
import 'package:demo/Utils/app_theme.dart';
import 'package:demo/Utils/asset_files.dart';
import 'package:demo/Utils/common_button.dart';
import 'package:demo/Utils/text_fields.dart';
import 'package:flutter/material.dart';

import '../Utils/custome_app_bar.dart';


class ForgotPassPage extends StatefulWidget {

  const ForgotPassPage({Key? key}) : super(key: key);
  @override
  ForgotPassPageState createState() => ForgotPassPageState();
}

class ForgotPassPageState extends State<ForgotPassPage> {
  TextEditingController newPassController=TextEditingController();
  TextEditingController confirmPassController=TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool value=false;
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
         child: Form(
           key: _formKey,
           child: Column(
             children: [
               AppLogo.appLogo,
               Padding(
                 padding: const EdgeInsets.all(15.0),
                 child: Container(
                   height: 50,
                   width: double.infinity,
                   decoration: BoxDecoration(
                     borderRadius: BorderRadius.circular(15.0),
                     color: Colors.transparent,

                   ),
                 ),
               ),
               SizedBox(height: 10,),
               Row(
                 mainAxisAlignment: MainAxisAlignment.center,
                 children: [
                   Text('Forgot Password',style: StyleForApp.headline,),
                 ],
               ),
               SizedBox(height: 15,),
               Row(
                 mainAxisAlignment: MainAxisAlignment.center,
                 children: [
                   Text('Enter the email associated with your account\n and we will send an email with instructions to\n'
                       'reset your password',style: StyleForApp.textStyle13NormalWhite,),
                 ],
               ),
               SizedBox(height: 20,),
               CommonTextField.emailTextField(Icons.email, "Email address", newPassController, TextInputType.text),

               SizedBox(height: 30,),
               CommonButtonForAllApp(title: 'Reset',onPressed: (){
                 if (_formKey.currentState!.validate()) {
                   // If the form is valid,
                   // perform further actions here
                   Navigator.push(context, MaterialPageRoute(builder: (context)=>CheckMail()));
                 }

               },),
               const SizedBox(height: 10),


             ],
           ),
         ),
       ),
     ),
   );
  }

}