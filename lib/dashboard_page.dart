import 'package:demo/Dashboard/new_home.dart';
import 'package:demo/Dashboard/search_result.dart';
import 'package:demo/Dashboard/zoom_drawer.dart';
import 'package:demo/Utils/app_theme.dart';
import 'package:demo/Utils/asset_files.dart';
import 'package:demo/dashboard_page1.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_carousel_slider/carousel_slider.dart';
import 'package:flutter_carousel_slider/carousel_slider_indicators.dart';
import 'package:flutter_carousel_slider/carousel_slider_transforms.dart';
import 'package:flutter_share/flutter_share.dart';
import 'package:flutter_speech/flutter_speech.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

class MyHomePage extends StatefulWidget {
  final zoomController;
  const MyHomePage({Key? key,this.zoomController}) : super(key: key);


  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>  with TickerProviderStateMixin {

  int tabIndex = 0;
  TextEditingController searchController=TextEditingController();

  late TabController _tabController;
  List<Tab> scrollableTabs=[
    Tab(text: 'Work',),
    Tab(text: 'Family',),
    Tab(text: 'Relationship',),
    Tab(text: 'Mind & Money',)
  ];
  @override
  void initState() {
    super.initState();
    activateSpeechRecognizer();
    _tabController = TabController(length: 4, vsync: this);
    _tabController.animateTo(2);
  }
  GlobalKey<_MyHomePageState> _sliderKey = GlobalKey();
  final List<Color> colors = [
    Colors.red,
    Colors.orange,
    Colors.yellow,
    Colors.green,
    Colors.blue,
    Colors.indigo,
    Colors.purple,
  ];
  final List<String> letters = [
    "A",
    "B",
    "C",
    "D",
    "E",
    "F",
    "G",
  ];
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
          leading: InkWell(
            onTap: () => widget.zoomController.toggle(),
            child: Icon(Icons.menu),
          ),
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
          actions: [
            Container(
                height: 80,
                child:Center(child: Text("Login",style: StyleForApp.textStyle13NormalWhite,))
            ),
            Container(
                height: 80,
                child:Center(
                    child: IconButton(
                      onPressed: (){
                       // Navigator.push(context, MaterialPageRoute(builder: (context)=>ZoomDrawerPage()));
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>HomeScreen()));



                      },
                      icon: Icon(Icons.menu,color: ColorsForApp.white,),
                    )
                )
            )
          ],
        ),
        body: SizedBox(
            height: MediaQuery
                .of(context)
                .size
                .height,
            width: MediaQuery
                .of(context)
                .size
                .width,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  search(),
                  sliderListUI(),
                  carsoulUI(),
                  dia(),
                  Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Row(
                      mainAxisAlignment:MainAxisAlignment.start ,
                      children: [
                        Text("Recommendation",style: StyleForApp.subHeadline,textAlign: TextAlign.start,),
                      ],
                    ),
                  ),
                  recommendationUI(),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Container(
                      decoration: BoxDecoration(
                          image: DecorationImage(
                            fit: BoxFit.fill,
                            image: AssetImage(
                              AssetsFiles.mountain,
                            ),
                          ),
                          borderRadius: BorderRadius.circular(15),
                          color: ColorsForApp.blackVeryLightColor),
                      height: 130,width: MediaQuery.of(context).size.width,
                      child: Padding(
                        padding: const EdgeInsets.all(3.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("Practice",style: StyleForApp.textStyle13NormalWhite,textAlign: TextAlign.start),
                            const Text("Awareness",style: StyleForApp.headline,),
                          ],
                        ),
                      ),

                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Row(
                      mainAxisAlignment:MainAxisAlignment.start ,
                      children: const [
                        Text("Add a goal",style: StyleForApp.subHeadline,textAlign: TextAlign.start,),
                      ],
                    ),
                  ),
                  setGoalUI(),
                ],
              ),
            )
        )
    );
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
                border: InputBorder.none,

            ),
            onSubmitted: (value){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>SearchResultPage(searchText: value)));
            },

          ),
        ),
      ),
    );
  }

 Widget dia(){
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Container(
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(15),color: ColorsForApp.blackVeryLightColor),
              height: 160,
              //width: 110,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    height: 60,width: 80,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(topLeft: Radius.circular(20),topRight:Radius.circular(20)
                          ,bottomLeft: Radius.circular(20),bottomRight:Radius.circular(20) ),

                    ),
                    child: Image.asset(AssetsFiles.dialGlowGif,fit: BoxFit.cover,),
                  ),
                  Text("Dia",style: StyleForApp.headlineGreenColor,),
                  Text("Talk to me",style: StyleForApp.textStyle13NormalWhite,)
                ],
              ),

            ),
          ),
          SizedBox(width: 5,),
          Expanded(
            child: Container(
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(15),color: ColorsForApp.blackVeryLightColor),
              height: 160,
              //width: 110,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Icon(Icons.sports_golf_rounded,color: ColorsForApp.greenColor,),
                  Text("Search",style: StyleForApp.headlineGreenColor,),
                  Text("Type how you feel",style: StyleForApp.textStyle13NormalWhite,textAlign: TextAlign.center)
                ],
              ),

            ),
          ),
          SizedBox(width: 5,),
          Expanded(
            child: Container(
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(15),color: ColorsForApp.blackVeryLightColor),
              height: 160,
              //width: 100,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    height: 60,width: 80,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(topLeft: Radius.circular(20),topRight:Radius.circular(20)
                          ,bottomLeft: Radius.circular(20),bottomRight:Radius.circular(20) ),

                    ),
                    child: Image.asset(AssetsFiles.mindGif,fit: BoxFit.cover,),
                  ),
                  Text("Mind",style: StyleForApp.headlineGreenColor,),
                  Text("Track your progress",style: StyleForApp.textStyle13NormalWhite,textAlign: TextAlign.center,)
                ],
              ),

            ),
          )
        ],
      ),
    );
 }
 Widget recommendationUI(){
    return  Padding(
      padding: const EdgeInsets.all(10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.fill,
                    image: AssetImage(
                      AssetsFiles.mountain,
                    ),
                  ),
                  borderRadius: BorderRadius.circular(15),color: ColorsForApp.blackVeryLightColor),
              height: 130,
             // width: 160,
              child: Padding(
                padding: const EdgeInsets.all(3.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Improve",style: StyleForApp.textStyle13NormalWhite,textAlign: TextAlign.start),
                    Text("Empathy",style: StyleForApp.headline,),
                  ],
                ),
              ),

            ),
          ),
          SizedBox(width: 8,),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.fill,
                    image: AssetImage(
                      AssetsFiles.mountain,
                    ),
                  ),
                  borderRadius: BorderRadius.circular(15),color: ColorsForApp.blackVeryLightColor),
              height: 130,
              //width: 160,
              child: Padding(
                padding: const EdgeInsets.all(3.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Be",style: StyleForApp.textStyle13NormalWhite,textAlign: TextAlign.start),
                    Text("Health",style: StyleForApp.headline,),
                  ],
                ),
              ),

            ),
          ),
        ],
      ),
    );
 }
 Widget setGoalUI(){
    return  Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        decoration: BoxDecoration(
            color: ColorsForApp.blackVeryLightColor, borderRadius: BorderRadius.circular(15)),
        height: 200,
        child: Builder(
            builder: (context) {
              return Row(
                children: [
                  /* IconButton(
                                  icon: Icon(Icons.arrow_back_ios,color: Colors.white),
                                  onPressed: (){
                                    if(_tabController.index > 0){
                                      _tabController.animateTo(_tabController.index - 1);
                                    }else{
                                      Scaffold.of(context).showSnackBar(SnackBar(content: Text("Can't go back"),));
                                    }
                                  },
                                ),*/
                  Expanded(
                    child: ListView.builder(
                      itemBuilder: (context,index){
                        return InkWell(
                          onTap: (){
                            share();
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                                width:150,
                                decoration: BoxDecoration(
                                  color: ColorsForApp.appBackGround,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Expanded(
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Container(
                                          decoration: BoxDecoration(
                                              image: DecorationImage(
                                                fit: BoxFit.fill,
                                                image: AssetImage(
                                                  AssetsFiles.mountain,
                                                ),
                                              ),
                                              borderRadius: BorderRadius.circular(10)),
                                          height: 80,

                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 3.0,right: 3.0),
                                      child: ElevatedButton(
                                        onPressed: () {  },
                                        style: ElevatedButton.styleFrom(
                                          primary: ColorsForApp.greenColor,
                                        ),

                                        child: Text("Set to goal",style: StyleForApp.textStyle13NormalWhite,),
                                      ),
                                    )
                                  ],
                                )
                            ),
                          ),
                        );
                      },
                      itemCount: 4,scrollDirection: Axis.horizontal,),
                  ),
                  /* IconButton(
                                  icon: Icon(Icons.arrow_forward_ios,color: Colors.white),
                                  onPressed: (){
                                    if(_tabController.index+1 < 20){
                                      _tabController.animateTo(_tabController.index + 1);
                                    }else{
                                      Scaffold.of(context).showSnackBar(SnackBar(content: Text("Can't move forward"),));
                                    }
                                  },
                                ),*/
                ],
              );
            }
        ),
      ),
    );
 }
 Widget carsoulUI(){
    return  Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        height: 200,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15)),

        child: CarouselSlider.builder(
            key: _sliderKey,
            unlimitedMode: true,
            slideBuilder: (index) {
              return Container(
                alignment: Alignment.center,

                decoration: BoxDecoration(
                    color: colors[index],
                    borderRadius: BorderRadius.circular(15)),
                child: Text(
                  letters[index],
                  style: TextStyle(fontSize: 200, color: Colors.white),
                ),
              );
            },
            slideTransform: CubeTransform(),
            slideIndicator: CircularSlideIndicator(
              padding: EdgeInsets.only(bottom: 15),
            ),
            itemCount: colors.length),
      ),
    );
 }
 Widget sliderListUI(){
    return  Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        decoration: BoxDecoration(
            color: ColorsForApp.blackVeryLightColor, borderRadius: BorderRadius.circular(15)),
        height: 60,
        child: Builder(
            builder: (context) {
              return Row(
                children: [
                  IconButton(
                    icon: Icon(Icons.arrow_back_ios,color: Colors.white),
                    onPressed: (){
                      if(_tabController.index > 0){
                        _tabController.animateTo(_tabController.index - 1);
                      }else{
                        Scaffold.of(context).showSnackBar(SnackBar(content: Text("Can't go back"),));
                      }
                    },
                  ),
                  Expanded(
                    child: TabBar(
                      isScrollable: true,
                      controller: _tabController,
                      indicatorColor: ColorsForApp.blackVeryLightColor,
                      labelStyle: TextStyle(
                          color: Colors.white
                      ),
                      unselectedLabelColor: Colors.white,
                      labelColor: Colors.green,
                      tabs: scrollableTabs,
                    ),
                  ),
                  IconButton(
                    icon: Icon(Icons.arrow_forward_ios,color: Colors.white),
                    onPressed: (){
                      if(_tabController.index+1 < 20){
                        _tabController.animateTo(_tabController.index + 1);
                      }else{
                        Scaffold.of(context).showSnackBar(SnackBar(content: Text("Can't move forward"),));
                      }
                    },
                  ),
                ],
              );
            }
        ),
      ),
    );
 }

  Future<void> share() async {
    await FlutterShare.share(
        title: 'Example share',
        text: 'Example share text',
        linkUrl: 'https://flutter.dev/',
        chooserTitle: 'Example Chooser Title');
  }

}

