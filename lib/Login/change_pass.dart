import 'package:demo/Login/reset_pass_success.dart';
import 'package:demo/Utils/app_theme.dart';
import 'package:demo/Utils/asset_files.dart';
import 'package:demo/Utils/common_button.dart';
import 'package:demo/Utils/text_fields.dart';
import 'package:flutter/material.dart';


class ChangePassPage extends StatefulWidget {

  const ChangePassPage({Key? key}) : super(key: key);
  @override
  ChangePassPageState createState() => ChangePassPageState();
}

class ChangePassPageState extends State<ChangePassPage> {
  TextEditingController newPassController=TextEditingController();
  TextEditingController confirmPassController=TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool value=false;
  bool _passwordVisible = false;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
   return Scaffold(
     backgroundColor: ColorsForApp.appBackGround,
     body: SafeArea(
       child: SingleChildScrollView(
         child: Form(
           key: _formKey,
           child: Column(
             children: [
               const SizedBox(height: 20),
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
               SizedBox(height: 20,),
               Row(
                 mainAxisAlignment: MainAxisAlignment.center,
                 children: [
                   Text('Change Password',style: StyleForApp.headline,),
                 ],
               ),
               SizedBox(height: 15,),
               Row(
                 mainAxisAlignment: MainAxisAlignment.center,
                 children: [
                   Text('Your new password must be different from\n previous used passwords ',style: StyleForApp.textStyle13NormalWhite,),
                 ],
               ),
               SizedBox(height: 20,),

               CommonTextField.passwordTextField(null, "Enter new password", newPassController, TextInputType.text,_passwordVisible,setState),
               CommonTextField.passwordTextField(null, "Confirm your new password", confirmPassController, TextInputType.text,_passwordVisible,setState),

               SizedBox(height: 30,),
               CommonButtonForAllApp(title: 'Reset',onPressed: (){
                 if (_formKey.currentState!.validate()) {
                   // If the form is valid,
                   // perform further actions here
                   Navigator.push(context, MaterialPageRoute(builder: (context)=>ResetPassSuccess()));
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