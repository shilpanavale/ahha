import 'package:demo/Login/reset_pass_success.dart';
import 'package:demo/Utils/app_theme.dart';
import 'package:demo/Utils/asset_files.dart';
import 'package:demo/Utils/common_button.dart';
import 'package:demo/Utils/custome_app_bar.dart';
import 'package:demo/Utils/text_fields.dart';
import 'package:demo/dashboard_page.dart';
import 'package:flutter/material.dart';


class ResetPassPage extends StatefulWidget {

  const ResetPassPage({Key? key}) : super(key: key);
  @override
  ResetPassPageState createState() => ResetPassPageState();
}

class ResetPassPageState extends State<ResetPassPage> {
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
               //const SizedBox(height: 20),
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
                   Text('Reset Password',style: StyleForApp.headline,),
                 ],
               ),
               const SizedBox(height: 15,),
               Row(
                 mainAxisAlignment: MainAxisAlignment.center,
                 children: [
                   Text('Enter your new password',style: StyleForApp.textStyle13NormalWhite,),
                 ],
               ),
               const SizedBox(height: 20,),
               CommonTextField.passwordTextField(Icons.remove_red_eye, "Enter new password", newPassController, TextInputType.text,_passwordVisible,setState),
               CommonTextField.passwordTextField(Icons.remove_red_eye, "Confirm your new password", confirmPassController, TextInputType.text,_passwordVisible,setState),
               const SizedBox(height: 30,),
               CommonButtonForAllApp(title: 'Reset',onPressed: (){
                 if (_formKey.currentState!.validate()) {
                   // If the form is valid,
                   // perform further actions here
                   if(newPassController.text!=confirmPassController.text){
                     ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                         content: Text("Confirm password not matching")));
                   }else{
                     Navigator.push(context, MaterialPageRoute(builder: (context)=>const MyHomePage()));
                   }

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