
import 'package:demo/Utils/app_theme.dart';
import 'package:flutter/material.dart';


class CommonTextField{

  static mobileTextField(var icon, var labelText,TextEditingController controller,TextInputType type) {
    return Padding(
      padding: const EdgeInsets.only(top: 3, bottom: 3, right: 30, left: 30),
      child: Column(
        children: [
          TextFormField(
            controller: controller,
            textInputAction: TextInputAction.done,
            autofocus: false,
            maxLength: 10,
            keyboardType: type,
            decoration: InputDecoration(
             // prefixIcon: Icon(icon, color: SavangadiAppTheme.grey,),
              counterText: "",
             // iconColor: ColorsForApp.lightGrayColor,
              isDense: true,
              fillColor: Colors.black,
              //border: OutlineInputBorder(),
              labelText: labelText,
              labelStyle: const TextStyle(
                  fontSize: 16.0, color: ColorsForApp.nearlyWhite),

              //border: InputBorder.none,

            ),
            minLines: 1,
            maxLines: 1,
          ),

        ],
      ),
    );
  }

  static numberTextField(var icon, var labelText,TextEditingController controller,TextInputType type) {
    return Padding(
      padding: const EdgeInsets.only(top: 3, bottom: 3, right: 30, left: 30),
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15.0),
              color: Colors.grey.shade300,
              // border: Border.all()
            ),
            child: TextFormField(
              controller: controller,
              textInputAction: TextInputAction.done,
              autofocus: false,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
               // prefixIcon: Icon(icon, color: ColorsForApp.lightGrayColor,),
                counterText: "",
                //iconColor: ColorsForApp.lightGrayColor,
                isDense: true,
                fillColor: Colors.black,
                //border: OutlineInputBorder(),
                labelText: labelText,
                labelStyle: TextStyle(
                    fontSize: 14.0, color: HexColor("#838383")),

                border: InputBorder.none,

              ),
              minLines: 1,
              maxLines: 1,
            ),
          ),

        ],
      ),
    );
  }

  //text filed for inputType text
  static emailTextField(var icon, var labelText,TextEditingController controller,TextInputType type) {
    return Padding(
      padding: const EdgeInsets.only(top: 3, bottom: 3, right: 30, left: 30),
      child: Column(
        children: [
          Container(
            //height: 45,
            // width: MediaQuery.of(context).size.width,
            //padding: const EdgeInsets.only(left: 10.0, right: 10.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15.0),
              color: ColorsForApp.blackVeryLightColor,
              // border: Border.all()
            ),
            child: TextFormField(
              controller: controller,
              //autovalidateMode: AutovalidateMode.always,
              textInputAction: TextInputAction.done,
              autofocus: false,
              // maxLength: 10,
              keyboardType: type,
              style:const TextStyle(fontSize: 15.0, color: ColorsForApp.nearlyWhite),
              decoration: InputDecoration(
                  //suffixIcon: Icon(icon, color: ColorsForApp.nearlyWhite,),
                  counterText: "",
                  //iconColor: ColorsForApp.lightGrayColor,
                  isDense: true,
                  contentPadding: const EdgeInsets.all(10.0),
                  fillColor:ColorsForApp.blackVeryLightColor,
                  //border: OutlineInputBorder(),
                  labelText: labelText,
                  labelStyle: const TextStyle(fontSize: 14.0, color: ColorsForApp.nearlyWhite),
                  border: InputBorder.none
              ),
              minLines: 1,
              maxLines: 1,
              validator: (value){
                String pattern =
                    r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]"
                    r"{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]"
                    r"{0,253}[a-zA-Z0-9])?)*$";
                RegExp regex = RegExp(pattern);
                if(value!.isEmpty){
                  return "Please enter email";
                } if(!regex.hasMatch(value)) {
                  return 'Enter a valid email address';
                } else{ return null;}
              },
            ),
          ),

        ],
      ),
    );
  }
  static passwordTextField(var icon, var labelText,TextEditingController controller,TextInputType type
      ,bool _passwordVisible,StateSetter stateSetter ) {
    return StatefulBuilder(
     builder: (context,stateSetter){
       return  Padding(
         padding: const EdgeInsets.only(top: 3, bottom: 3, right: 30, left: 30),
         child: Column(
           children: [
             Container(
               // width: MediaQuery.of(context).size.width,
               //padding: const EdgeInsets.only(left: 10.0, right: 10.0),
               decoration: BoxDecoration(
                 borderRadius: BorderRadius.circular(15.0),
                 color:ColorsForApp.blackVeryLightColor,
                 // border: Border.all()
               ),
               child: TextFormField(
                 controller: controller,
                 textInputAction: TextInputAction.done,
                 autofocus: false,
                 obscureText: !_passwordVisible,//This will obscure text dynamically
                 // maxLength: 10,
                 keyboardType: type,
                 style:const TextStyle(fontSize: 14.0, color: ColorsForApp.nearlyWhite),
                 decoration: InputDecoration(
                     suffixIcon: IconButton(
                       icon: Icon(
                         // Based on passwordVisible state choose the icon
                           _passwordVisible
                               ? Icons.visibility
                               : Icons.visibility_off,
                           color: ColorsForApp.nearlyWhite
                       ),
                       onPressed: () {
                         // Update the state i.e. toogle the state of passwordVisible variable
                         stateSetter(() {
                           _passwordVisible = !_passwordVisible;
                         });
                       },
                     ),
                     //suffixIcon: Icon(icon, color: ColorsForApp.nearlyWhite,),
                     counterText: "",
                     //iconColor: ColorsForApp.lightGrayColor,
                     isDense: true,
                     contentPadding: const EdgeInsets.all(10.0),
                     fillColor:ColorsForApp.blackVeryLightColor,
                     //border: OutlineInputBorder(),
                     labelText: labelText,
                     labelStyle: const TextStyle(fontSize: 14.0, color: ColorsForApp.nearlyWhite),
                     border: InputBorder.none
                 ),
                 minLines: 1,
                 maxLines: 1,
                 validator: (value){
                   if(value!.isEmpty){
                     return "Please enter password";
                   } if(value.length<5){
                     return "Password is too short";
                   }else{
                     return null;
                   }
                 },
               ),
             ),

           ],
         ),
       );
     },
    );
  }

}