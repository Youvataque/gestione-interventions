import 'dart:io';
import 'dart:ui';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gestionnaire_interventions/Logins/SignIn.dart';
import 'package:gestionnaire_interventions/component/connect.dart';
import 'package:gestionnaire_interventions/component/tabbar.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'component/tool.dart';
// firebase
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({
    super.key,
  });

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  late Future<bool> loaded;
  // This widget is the root of your application.
  @override
  void initState() {
    super.initState();
    loaded = loading();
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
        canPop: false,
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
              splashColor: Platform.isIOS ? Colors.transparent : mainColor(),
              primaryColor: mainColor(),
              primarySwatch: buildMaterialcolor(mainColor())),
          home: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
              child: Container(
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("src/BackgroundAppWhite.jpg"),
                        fit: BoxFit.cover)),
                child: Scaffold(
                  backgroundColor: Colors.transparent,
                  body: FutureBuilder<bool>(
                    future: loaded,
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.done) {
                        // vérfie que les données sont DL
                        FlutterNativeSplash.remove();
                        if (snapshot.data ?? false) {
                          // si data true
                          return Tabbar();
                        } else {
                          // sinon
                          return const SignIn();
                        }
                      } else if (snapshot.connectionState ==
                          ConnectionState.waiting) {
                        return const Center(
                          child: CupertinoActivityIndicator(
                            radius: 15,
                          ),
                        );
                      } else {
                        // renvoie sur un chargement en attendant le chargement de snapshot
                        return Center(
                          // temp
                          child: Container(
                            color: Colors.black12,
                            height: MediaQuery.sizeOf(context).height,
                            width: MediaQuery.sizeOf(context).width,
                          ),
                        );
                      }
                    },
                  ),
                ),
              )),
        ));
  }

  // vérifie que l'utilisateur est connecté
  bool isUserLoggedIn() {
    final user = FirebaseAuth.instance.currentUser;
    return user != null;
  }

  // charge toutes les données depuis connect
  Future<bool> loading() async {
    if (isUserLoggedIn()) {
      userData = await getUser();
      entrepriseData = await getEntreprise();
      clients = await getClients();
      lastClim = await getLast("Clim");
      lastPompe = await getLast("Pompe");
      lastInterC = await getLastInterC();
      lastInterP = await getLastInterP();
      allInterC = await getInterventionC();
      allInterP = await getInterventionP();
      serialDataClim = await getSerialDataClim();
      serialDataPompe = await getSerialDataPompe();
    }
    return isUserLoggedIn();
  }
}
