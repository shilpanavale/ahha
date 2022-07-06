import 'package:demo/Login/login_page.dart';
import 'package:demo/Utils/app_theme.dart';
import 'package:demo/Utils/asset_files.dart';
import 'package:demo/Utils/common_button.dart';
import 'package:demo/Utils/text_fields.dart';
import 'package:flutter/material.dart';


class AccountVerified extends StatefulWidget {

  const AccountVerified({Key? key}) : super(key: key);
  @override
  AccountVerifiedState createState() => AccountVerifiedState();
}

class AccountVerifiedState extends State<AccountVerified> {
  TextEditingController newPassController=TextEditingController();
  TextEditingController confirmPassController=TextEditingController();

  bool value=false;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
   return Scaffold(
     backgroundColor: ColorsForApp.appBackGround,
     body: GestureDetector(
       onTap: (){

           Navigator.push(context, MaterialPageRoute(builder: (context)=>const LoginPage()));

       },
       child: SafeArea(
         child: SingleChildScrollView(
           child: Column(
             children: [
               const SizedBox(height: 20),
               Container(
                 height: 80,
                 width: 140,
                 decoration: BoxDecoration(
                   borderRadius: BorderRadius.circular(15.0),
                   color: Colors.transparent,
                   image: DecorationImage(
                     fit: BoxFit.fill,
                     image: AssetImage(
                       AssetsFiles.ahhaaLogo,
                     ),
                   ),
                 ),
               ),
               Padding(
                 padding: const EdgeInsets.all(15.0),
                 child: Container(
                   height: 170,
                   width: 250,
                   decoration: BoxDecoration(
                     borderRadius: BorderRadius.circular(15.0),
                     color: Colors.transparent,
                     image: DecorationImage(
                       fit: BoxFit.fill,
                       image: AssetImage(
                         AssetsFiles.accountSuccess,
                       ),
                     ),
                   ),
                   // child: Icon(Icons.check_box,color: ColorsForApp.greenColor,size: 100,),
                 ),
               ),
               SizedBox(height: 20,),
               Row(
                 mainAxisAlignment: MainAxisAlignment.center,
                 children: [
                   Text('Your account has been verified.',style: StyleForApp.textStyle14NormalWhite,),
                 ],
               ),
               SizedBox(height: 15,),
               Row(
                 mainAxisAlignment: MainAxisAlignment.center,
                 children: [
                   Text('Click anyware to continue.',style: StyleForApp.textStyle13NormalWhite,),
                 ],
               ),
               SizedBox(height: 20,),

               SizedBox(height: 30,),



             ],
           ),
         ),
       ),
     ),
   );
  }

}