
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
  static normalTextField(var icon, var labelText,TextEditingController controller,TextInputType type) {
    return Padding(
      padding: const EdgeInsets.only(top: 3, bottom: 3, right: 30, left: 30),
      child: Column(
        children: [
          Container(
            // width: MediaQuery.of(context).size.width,
            //padding: const EdgeInsets.only(left: 10.0, right: 10.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15.0),
              color: ColorsForApp.blackVeryLightColor,
              // border: Border.all()
            ),
            child: TextFormField(
              controller: controller,
              textInputAction: TextInputAction.done,
              autofocus: false,
              // maxLength: 10,
              keyboardType: type,
              style:TextStyle(fontSize: 14.0, color: ColorsForApp.nearlyWhite),
              decoration: InputDecoration(
                  //suffixIcon: Icon(icon, color: ColorsForApp.nearlyWhite,),
                  counterText: "",
                  //iconColor: ColorsForApp.lightGrayColor,
                  isDense: true,
                  contentPadding: EdgeInsets.all(10.0),

                  fillColor:ColorsForApp.blackVeryLightColor,
                  //border: OutlineInputBorder(),
                  labelText: labelText,
                  labelStyle: TextStyle(fontSize: 14.0, color: ColorsForApp.nearlyWhite),
                  border: InputBorder.none




              ),
              minLines: 1,
              maxLines: 1,
            ),
          ),

        ],
      ),
    );
  }
  static passwordTextField(var icon, var labelText,TextEditingController controller,TextInputType type) {
    return Padding(
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
              obscureText: true,
              // maxLength: 10,
              keyboardType: type,
              style:TextStyle(fontSize: 14.0, color: ColorsForApp.nearlyWhite),
              decoration: InputDecoration(

                  suffixIcon: Icon(icon, color: ColorsForApp.nearlyWhite,),
                  counterText: "",
                  //iconColor: ColorsForApp.lightGrayColor,
                  isDense: true,
                  contentPadding: EdgeInsets.all(10.0),
                  fillColor:ColorsForApp.blackVeryLightColor,
                  //border: OutlineInputBorder(),
                  labelText: labelText,
                  labelStyle: TextStyle(fontSize: 14.0, color: ColorsForApp.nearlyWhite),
                  border: InputBorder.none




              ),
              minLines: 1,
              maxLines: 1,
            ),
          ),

        ],
      ),
    );
  }

}