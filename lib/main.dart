import 'package:flutter/material.dart';
import 'package:gerador_de_versiculospromessas/splash_screen.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:provider/provider.dart';
import 'ad_state/banner.dart';



void main(){

  WidgetsFlutterBinding.ensureInitialized();
  final initFuture = MobileAds.instance.initialize();
  final adState = AdState(initFuture);

  runApp(
      Provider.value(value: adState,
          builder: (context, child) => Myapp(
          )));
}

class Myapp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Frases do Dia',
      home: SplaScreen(),
    );
  }
}

