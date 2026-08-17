import 'package:ecommerce/presentation/splash_screen/splash_screen.dart';
import 'package:ecommerce/providers/auth_provider.dart';
import 'package:ecommerce/providers/carousel_provider.dart';
import 'package:ecommerce/providers/cart_provider.dart';
import 'package:ecommerce/providers/product_provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:rxdart/rxdart.dart';

@pragma('vm:entry-point')
Future<void> _backgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp();
  // Handle background message
  print('Handling a foreground message: ${message.messageId}');
  print('Message data: ${message.data}');
  print('Message notification: ${message.notification?.title}');
  print('Message notification: ${message.notification?.body}');

}

final _messageStreamController = BehaviorSubject<RemoteMessage>();

Future<void> main() async {

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  FirebaseMessaging.onBackgroundMessage(_backgroundHandler);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => CarouselProvider()),
        ChangeNotifierProvider(create: (_) => ProductProvider()),
        ChangeNotifierProvider(create: (_) => CartProvider()),
        ChangeNotifierProvider(create: (_) => AuthProvider())
      ],
      child: MaterialApp(
        title: 'E Commerce',
        theme: ThemeData(
          colorScheme: .fromSeed(seedColor: Colors.deepPurple),
        ),
        home: const SplashScreen(),
      ),
    );
  }
}
