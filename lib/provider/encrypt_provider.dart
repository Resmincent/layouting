import 'package:encrypt/encrypt.dart' as encrypt;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class EncryptService {
  TextEditingController textEditingController = TextEditingController();

  String encryptedText = '';
  String decryptedText = '';
  String encryptedFile = '';

  late encrypt.Encrypted encrypted;

  final key = encrypt.Key.fromUtf8('my 32 length key................');
  final iv = encrypt.IV.fromLength(16);
  late final encrypt.Encrypter encrypter;

  EncryptService() {
    encrypter = encrypt.Encrypter(encrypt.AES(key));
  }

  Future<void> encryptText() async {
    encrypted = encrypter.encrypt(textEditingController.text, iv: iv);
    encryptedText = encrypted.base64;
  }

  Future<void> decryptText() async {
    decryptedText = encrypter.decrypt(encrypted, iv: iv);
  }

  Future<void> encryptFile(String assetPath) async {
    final fileBytes = await rootBundle.load(assetPath);
    final fileData = fileBytes.buffer.asUint8List();

    final encryptedFileData = encrypter.encryptBytes(fileData, iv: iv);
    encryptedFile = encryptedFileData.base64;
  }
}
