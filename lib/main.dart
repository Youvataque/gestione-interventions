import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gestionnaire_interventions/Components/FondamentalAppCompo/MyTabbar.dart';
import 'package:gestionnaire_interventions/Components/Tools/Theme/ColorsTheme.dart';
import 'package:gestionnaire_interventions/Components/ViewTemplates/BackTemplate.dart';
import 'package:gestionnaire_interventions/oldComponent/connect.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:gestionnaire_interventions/view/Logins/SignIn.dart';
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
          theme: lightTheme,
          home: FutureBuilder<bool>(
            future: loaded,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                FlutterNativeSplash.remove();
                if (snapshot.data ?? false) {
                  return MyTabbar();
                } else {
                  return const SignIn();
                }
              } else if (snapshot.connectionState == ConnectionState.waiting) {
                  return const BackTemplate(
                  content: Center(
                    child: CupertinoActivityIndicator(
                      radius: 15,
                    ),
                  )
                );
              } else {
                return const SignIn();
              }
            },
          ),
        )
    );
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
