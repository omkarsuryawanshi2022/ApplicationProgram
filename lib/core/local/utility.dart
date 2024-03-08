import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';

class Utils {
  /// vakya
  static FlutterTts flutterTts = FlutterTts();

  // static TextToSpeech tts = TextToSpeech();
  // static void speak(String? text) async {
  // await tts.setLanguage('mr-IN');
  // await tts.setPitch(1.0);
  // await tts.speak(text!);
  // }
  // void stopSpeaking() {
  // tts.stop();
  // }

  // static void textToSpeechVakya(String? text) async {
  //
  //  await flutterTts.setLanguage('mr-IN');
  //  await flutterTts.setVoice({
  //    'name': 'mr-IN-Wavenet-A',
  //    'locale': 'mr-IN',
  //    'quality': 'best',
  //  });
  //  await flutterTts.setVolume(0.5);        /// 1.0 is default and ranges from .5 to 2.0// Set the language
  //  await flutterTts.setSpeechRate(0.4);   /// Set the speech rate (1.0 is normal)
  //  await flutterTts.setPitch(.9);
  //  // await flutterTts.setSilence(1);
  //
  //  if (text != null && text.isNotEmpty) {
  //    List<String> words = text.split('  '); // Split the text into words using space as the delimiter
  //    for (String word in words) {
  //      await flutterTts.speak(word); // Speak each word separately
  //      await Future.delayed(Duration(milliseconds: 2000)); // Add a delay between words (adjust as needed)
  //    }
  //  } else {
  //     await flutterTts.speak('परत्, प्रयत्न करा');
  //   }
  // }

  /// shabdha
  //  static FlutterTts flutterTtsShabdha = FlutterTts();
  //  static void textToSpeechShabdha(String? text) async {
  //
  //    await flutterTtsShabdha.setLanguage('mr-IN-Wavenet-C');      // Set the language
  //    await flutterTtsShabdha.setSpeechRate(0.2);   // Set the speech rate (1.0 is normal)
  //    await flutterTtsShabdha.setVolume(0.6);     /// 1.0 is default and ranges from .5 to 2.0
  //    // await flutterTts.setVoice('');
  //
  //    if (text != null) {
  //      List<String> words = text.split('  '); // Split the text into words using space as the delimiter
  //      for (String word in words) {
  //        await flutterTtsShabdha.speak(word); // Speak each word separately
  //      }
  //
  //    } else {
  //      await flutterTtsShabdha.speak('परत्, प्रयत्न करा');
  //    }
  //  }
  //
  //  static void textToSpeechWord(String? text) async {
  //
  //    await flutterTts.setLanguage('mr-IN');      // Set the language
  //    // await flutterTts.setLanguage('mr-IN');
  //    await flutterTts.setVoice({
  //      'name': 'mr-IN-Wavenet-A',
  //      'locale': 'mr-IN',
  //      'quality': 'best',
  //    });
  //    await flutterTts.setPitch(1.0);
  //
  //    if (text != null && text.isNotEmpty) {
  //      await flutterTts.speak(text); // Speak each word separately
  //      await Future.delayed(Duration(milliseconds: 2000)); // Add a delay between words (adjust as needed)
  //
  //    } else {
  //      await flutterTts.speak('परत्, प्रयत्न करा');
  //    }
  //  }

  static var loginBackgroundShape = const BoxDecoration(
    borderRadius: BorderRadius.only(
      bottomLeft: Radius.circular(50),
      bottomRight: Radius.circular(50),
    ),
    color: Color(0XFF4DBDDA),
    // color: themeAccentColor,
    boxShadow: [
      BoxShadow(
        offset: Offset(0.05, 0.05),
        color: Colors.grey,
        blurRadius: 2,
        spreadRadius: 0.001,
      ),
    ],
  );

  static var loginBox = const BoxDecoration(
    borderRadius: BorderRadius.all(Radius.circular(12)),

/*      topLeft: Radius.circular(12),
      topRight: Radius.circular(12),
      bottomLeft: Radius.circular(12),
      bottomRight: Radius.circular(12),
    ),*/
    color: Color(0XFFffffff),
    // color: themeAccentColor,
    boxShadow: [
      BoxShadow(
        offset: Offset(0.05, 0.05),
        color: Colors.grey,
        blurRadius: 2,
        spreadRadius: 0.001,
      ),
    ],
  );

  static Future<bool> checkInternetConnectivity() async {
    final connectivityResult = await (Connectivity().checkConnectivity());

    if (connectivityResult == ConnectivityResult.mobile ||
        connectivityResult == ConnectivityResult.wifi ||
        connectivityResult == ConnectivityResult.ethernet) {
      return true;
    }

    /*if (connectivityResult == ConnectivityResult.mobile) {
      // I am connected to a mobile network.
    } else if (connectivityResult == ConnectivityResult.wifi) {
      // I am connected to a wifi network.
    } else if (connectivityResult == ConnectivityResult.ethernet) {
      // I am connected to a ethernet network.
    } else if (connectivityResult == ConnectivityResult.vpn) {
      // I am connected to a vpn network.
      // Note for iOS and macOS:
      // There is no separate network interface type for [vpn].
      // It returns [other] on any device (also simulator)
    } else if (connectivityResult == ConnectivityResult.bluetooth) {
      // I am connected to a bluetooth.
    } else if (connectivityResult == ConnectivityResult.other) {
      // I am connected to a network which is not in the above mentioned networks.
    } else if (connectivityResult == ConnectivityResult.none) {
      return false;
    }*/
    return false;
  }
}
