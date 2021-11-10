import 'dart:convert';
import 'dart:math';

import 'package:crypto/crypto.dart';

class RandomNumberHashCalculator {
  String calculateRandomNumberHash({required int iterationsCount}) {
    String curDigest = '';
    for(int i = 0; i < iterationsCount; ++i) {
      final randomNumber = Random.secure().nextInt(200);
      curDigest += randomNumber.toString();
      curDigest = sha256.convert(utf8.encode(curDigest)).toString();
    }

    return curDigest;
  }
}