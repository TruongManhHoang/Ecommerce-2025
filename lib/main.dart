import 'package:ecommerce_app/data/repositories/authentication/authentication_repository.dart';
import 'package:ecommerce_app/utils/local_storage/storage_utility.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'app.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

Future<void> main() async {
  // Todo: Add Widgets Binding
  final WidgetsBinding widgetsBinding =
      WidgetsFlutterBinding.ensureInitialized();
  //Todo: Init Local Storage
  // await GetStorage.init();
  await TLocalStorage.init('myBucket');
  //Todo: Await Native Splash
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  //Todo: Initialize Firebase

  FirebaseOptions firebaseOptions = DefaultFirebaseOptions.currentPlatform;
  print("🔥 Firebase đang kết nối với: ${firebaseOptions.projectId}");
// ...

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  ).then((FirebaseApp value) => Get.put(AuthenticationRepository()));
  //Todo: Initialize Authentication

  runApp(const App());
}
