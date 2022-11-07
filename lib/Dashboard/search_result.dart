import 'dart:convert';
import 'dart:io';

import 'package:demo/Model/SearchModelClass.dart';
import 'package:demo/Utils/api_constants.dart';
import 'package:demo/Utils/app_theme.dart';
import 'package:demo/Utils/asset_files.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_speech/flutter_speech.dart';
import 'package:http/http.dart' as http;
class SearchResultPage extends StatefulWidget {
  final String searchText;
  const SearchResultPage({Key? key, required this.searchText}) : super(key: key);


  @override
  State<SearchResultPage> createState() => _SearchResultPageState();
}

class _SearchResultPageState extends State<SearchResultPage>  with TickerProviderStateMixin {


  TextEditingController searchController=TextEditingController();
  List<SuburlData>? allData=[];
  List<SuburlData>? searchList=[];

  @override
  void initState() {
    super.initState();
    getData().then((value){
      allData=value.results?.suburlData;
      searchList=value.results?.suburlData;
      setState(() {

      });
    });
    activateSpeechRecognizer();

  }

  late SpeechRecognition _speech;

  bool _speechRecognitionAvailable = false;
  bool _isListening = false;

  String transcription = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: ColorsForApp.appBackGround,
        appBar: AppBar(
          backgroundColor: ColorsForApp.appBackGround,
          elevation: 0,
          title: Container(
            height: 80,
            width: 110,
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

        ),
        body: Column(
          children: [
            search(),
            Expanded(
              child: searchList!.isNotEmpty
                  ? Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ListView.builder(
                shrinkWrap: true,
                itemCount: searchList!.length,
                itemBuilder: (context, index) => Card(
                    key: ValueKey(searchList![index].lid),
                    color: ColorsForApp.blackVeryLightColor,
                    elevation: 0,
                    margin: const EdgeInsets.symmetric(vertical: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height: 100,width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                fit: BoxFit.fill,
                                image: NetworkImage(
                                 "https://www.ahhaa.com/static/images/rect-icons/42.png"
                                ),
                              ),
                              borderRadius: BorderRadius.circular(15),
                              color: ColorsForApp.blackVeryLightColor),
                        ),
                        /*Text(
                            searchList![index].url!,
                          style: TextStyle(fontSize: 15,color: Colors.white),
                        ),*/
                        SizedBox(height: 5,),
                        Padding(
                          padding: const EdgeInsets.all(3.0),
                          child: Container(
                            height: 30,
                            child: Text(
                              searchList![index].title!,
                              textAlign: TextAlign.left,
                              style: TextStyle(fontFamily:'Poppins',fontSize: 15,color: Colors.white),
                            ),
                          ),
                        ),
                      ],
                    )
              )
              ),
                  )
                  : const Text(
                'No results found',
                style: TextStyle(fontFamily:'Poppins',fontSize: 24,color: Colors.white),
              ),
            ),

          ],
        )
    );
  }
  // This function is called whenever the text field changes
  void _runFilter(String enteredKeyword) {
    List<SuburlData>? results = [];
    if (enteredKeyword.isEmpty) {
      // if the search field is empty or only contains white-space, we'll display all users
      results = allData;
    } else {
      results = allData
          ?.where((user) =>
          user.title!.toLowerCase().contains(enteredKeyword.toLowerCase()))
          .toList();
      // we use the toLowerCase() method to make it case-insensitive
    }

    // Refresh the UI
    setState(() {
      searchList = results;
    });
  }
  void activateSpeechRecognizer() {
    print('_MyAppState.activateSpeechRecognizer... ');
    _speech = SpeechRecognition();
    _speech.setAvailabilityHandler(onSpeechAvailability);
    _speech.setRecognitionStartedHandler(onRecognitionStarted);
    _speech.setRecognitionResultHandler(onRecognitionResult);
    _speech.setRecognitionCompleteHandler(onRecognitionComplete);
    _speech.setErrorHandler(errorHandler);
    _speech.activate('en_US').then((res) {
      setState(() => _speechRecognitionAvailable = res);
    });
  }
  void onSpeechAvailability(bool result) => setState(() => _speechRecognitionAvailable =       result);


  void onRecognitionStarted() {
    setState(() => _isListening = true);
  }

  void onRecognitionResult(String text) {
    print('_MyAppState.onRecognitionResult... $text');
    setState(() {
      //transcription = text;
      searchController.text=text;
    });
  }

  void onRecognitionComplete(String text) {
    print('_MyAppState.onRecognitionComplete... $text');
    setState(() {
      _isListening = false;
      searchController.text=text;
     // transcription=text;
    });
  }

  void errorHandler() => activateSpeechRecognizer();
  void start() => _speech.activate('en_US').then((_) {
    return _speech.listen().then((result) {
      print('_MyAppState.start => result $result');
      setState(() {
        _isListening = result;
      });
    });
  });

  void cancel() =>
      _speech.cancel().then((_) => setState(() => _isListening = false));

  void stop() => _speech.stop().then((_) {
    setState(() => _isListening = false);
  });


  Widget search(){
    return   Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        width: double.infinity,
        height: 40,
        decoration: BoxDecoration(
            color: ColorsForApp.blackVeryLightColor, borderRadius: BorderRadius.circular(20)),
        child: Center(
          child: TextField(
            controller: searchController,style: StyleForApp.textStyle13NormalWhite,
            onChanged: (value) => _runFilter(value),
            decoration: InputDecoration(
                prefixIcon: const Icon(Icons.search,color: Colors.white,),

                suffixIcon: IconButton(
                  icon:  Icon(Icons.mic,color: ColorsForApp.greenColor,),
                  onPressed: _speechRecognitionAvailable && !_isListening
                      ? () => start()
                      : null,

                ),
                hintText: _isListening
                    ? 'Listening...'
                    : 'Type how you feel',
                contentPadding: const EdgeInsets.all(17),
                hintStyle: StyleForApp.textStyle13NormalWhite,
                border: InputBorder.none),
          ),
        ),
      ),
    );
  }


  Future<SearchModel> getData()  async {
     Map<String, String> requestHeaders = {
       'Content-type': 'application/json',
       'Accept': 'application/json',
       'Authorization': 'Api-Key fVdpE8pA.jUoBZLBkjUQb7iyYdKhCBUqEbNWjAQ1L'
     };

    var url=Uri.parse("${API.baseUrl}ewr/${widget.searchText}");
     var response = await http.get(url,
         headers: {
           HttpHeaders.authorizationHeader: 'Api-Key fVdpE8pA.jUoBZLBkjUQb7iyYdKhCBUqEbNWjAQ1L',
         }, );

     var tagObjsJson = jsonDecode(response.body);
     SearchModel searchModel=SearchModel.fromJson(tagObjsJson);
     return searchModel;
   }

}

