import 'package:flash_chat/screens/login_screen.dart';
import 'package:flash_chat/screens/registration_screen.dart';
import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flash_chat/components/welcome_buttons.dart';
class WelcomeScreen extends StatefulWidget {

  static String id='welcome_screen';

  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> with SingleTickerProviderStateMixin {


  AnimationController controller;
  Animation animation;

  @override
  void initState() {
    super.initState();
    controller= AnimationController(
      duration: Duration(seconds: 1),
      vsync: this,
      // upperBound: 100.0,  //when using curves not use this it will crash your app;


    );


  //  animation = CurvedAnimation(parent: controller, curve: Curves.decelerate);


    controller.forward();

    animation=ColorTween(begin: Colors.blueGrey,end: Colors.white).animate(controller);

    // animation.addStatusListener((status) {                 ////  bounsing effect
    //   if(status==AnimationStatus.completed){
    //     controller.reverse(from: 1.0);
    //   } else if (status==AnimationStatus.dismissed){
    //     controller.forward();
    //   }
    //  });

    controller.addListener(() {
      setState(() {
        
      });
      print(controller.value);
    });
  }


  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:animation.value,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Row(
              children: <Widget>[
                Hero(
                  tag: 'logo',
                  child: Container(
                    child: Image.asset('images/logo.png'),
                  //  height: animation.value *100,                //// when you un comment the bouund in upper
                      height: 60.0,
                  ),
                ),
                  DefaultTextStyle(
                   style: const TextStyle(
                     fontSize: 45.0,
                     fontWeight: FontWeight.w900,
                     color: Colors.black54,
                ),
    
                    child: AnimatedTextKit(
                      animatedTexts: [
                        TypewriterAnimatedText('Flash Chat'),
                      ],
                       onTap: () {
                          print("Tap Event");
                        },
                    ),
                  ),  

              ],
            ),
            SizedBox(
              height: 48.0,
            ),
            WelcomeButtons(
              color: Colors.lightBlueAccent,
              text: 'Log In' ,
              onPressed: () {
                    Navigator.pushNamed(context, LoginScreen.id);
                  },
            ),
            WelcomeButtons(
              color: Colors.blueAccent,
              text: 'Register' ,
              onPressed: () {
                    Navigator.pushNamed(context,  RegistrationScreen.id);
                  },
            ),
          ],
        ),
      ),
    );
  }
}
