import 'package:firebase_app_check/firebase_app_check.dart';

Future initializeFirebaseAppCheck() => FirebaseAppCheck.instance.activate(
      webProvider:
          ReCaptchaV3Provider('6Lf-xVQqAAAAAFWmueGep29zZR0BVSTJ6XIRxAbZ'),
      androidProvider: AndroidProvider.playIntegrity,
    );
