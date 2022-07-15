import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flash_chat/screens/welcome_screen.dart';
import 'package:flash_chat/screens/login_screen.dart';
import 'package:flash_chat/screens/registration_screen.dart';
import 'package:flash_chat/screens/chat_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    // ignore: prefer_const_constructors
    options: FirebaseOptions(
        apiKey: "AIzaSyDQyos4UcGLiH_UaQW4ZFst1ReKr7ApAvE",
        appId: "",
        messagingSenderId: "",
        projectId: "flash-chat-de35f"),
  );
  runApp(FlashChat());
}

class FlashChat extends StatelessWidget {
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();
  @override
  Widget build(BuildContext context) {
    return  FutureBuilder(future: _initialization,
    
    builder:(context,snapshot){
      if(snapshot.hasError){
        print('SomeThing Went Wrong');
      } if(snapshot.connectionState==ConnectionState.done){
        return MaterialApp(
          debugShowCheckedModeBanner: false,
      
        
         initialRoute: WelcomeScreen.id,
         routes: {
          ChatScreen.id:(context) => ChatScreen(),
          LoginScreen.id: (context) => LoginScreen(),
         RegistrationScreen.id:(context) => RegistrationScreen(),
         WelcomeScreen.id:(context) => WelcomeScreen()
      },
      );
      }
      return CircularProgressIndicator();
    }
    );
    
    
    
    
      
    
  }
}
