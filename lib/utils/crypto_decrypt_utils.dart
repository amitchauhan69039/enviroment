import 'dart:convert';
import 'dart:typed_data';
import 'package:crypto/crypto.dart';
import 'package:encrypt/encrypt.dart';
import 'dart:math';

import '../model/encrypt_model.dart';

class CryptoDecryptUtils {
  static String cryptoJsAesDecrypt(String encryptedJson) {
    try {
      String passphrase = "secret key 123";

      Map<String, dynamic> jsonData = jsonDecode(encryptedJson);
      String ct = jsonData['ct']; // Extract "ct" value
      String ivHex = jsonData['iv']; // Extract "iv" value
      String saltHex = jsonData['s']; // Extract "s" value

      Uint8List iv = hexStringToByteArray(ivHex);
      Uint8List salt = hexStringToByteArray(saltHex);

      print("cryptoJsAesDecrypt:iv ${iv.toString()} salt ${salt.toString()}");

      Uint8List cipherData = base64.decode(ct);

      Uint8List dx = Uint8List(0);
      Uint8List salted = Uint8List(0);


      while (salted.length < 48) {
        var md = md5.convert([...dx, ...utf8.encode(passphrase), ...salt]);
        dx = Uint8List.fromList(md.bytes);
        salted = concatenateByteArrays(salted, dx);
      }

      Uint8List key = salted.sublist(0, 32);


      final encrypter = Encrypter(AES(Key(key), mode: AESMode.cbc));
      final decrypted = encrypter.decrypt64(ct, iv: IV(iv));

      return decrypted;
    } catch (e) {
      print("Exception: ${e.toString()}");
      return ""; // Consider proper error handling
    }
  }

  static Uint8List hexStringToByteArray(String s) {
    print('index : ${s.length ~/ 2}');
    var result = Uint8List(s.length ~/ 2);
    for (var i = 0; i < s.length; i += 2) {
      result[i ~/ 2] = ((int.parse(s[i], radix: 16) << 4) + int.parse(s[i + 1], radix: 16));
    }
    return result;
  }

  static Uint8List concatenateByteArrays(Uint8List a, Uint8List b) {
    Uint8List result = Uint8List(a.length + b.length);
    result.setRange(0, a.length, a);
    result.setRange(a.length, result.length, b);
    return result;
  }



  static EncryptModel cryptoJsAesEncryptRequestModel(String jsonString) {
    EncryptModel? encryptRequestModel;
    try {
      String passphrase = "secret key 123";
      final salt = List<int>.generate(8, (i) => Random.secure().nextInt(256));


      Uint8List salted = Uint8List(0);
      while (salted.length < 48) {
        var md = md5.convert(salted + utf8.encode(passphrase) + salt);
        salted = Uint8List.fromList(salted + md.bytes);
      }

      Uint8List key = salted.sublist(0, 32);
      Uint8List iv = salted.sublist(32, 48);

      final encrypter = Encrypter(AES(Key(key), mode: AESMode.cbc));
      final encrypted = encrypter.encrypt(jsonString, iv: IV(iv));

      String encryptedBase64 = base64.encode(encrypted.bytes);
      String ivHex = bytesToHex(iv);
      String saltHex = bytesToHex(salt);

      encryptRequestModel = EncryptModel()
        ..ct = encryptedBase64
        ..iv = ivHex
        ..s = saltHex;

      return encryptRequestModel;
    } catch (e) {
      print("Exception: ${e.toString()}");
    }
    return encryptRequestModel ?? EncryptModel();
  }

  static String bytesToHex(List<int> bytes) {
    StringBuffer result = StringBuffer();
    for (int b in bytes) {
      result.write(b.toRadixString(16).padLeft(2, '0'));
    }
    return result.toString();
  }


}