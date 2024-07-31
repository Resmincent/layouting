import 'package:belajar_layouting/provider/encrypt_provider.dart';
import 'package:belajar_layouting/widgets/encrypt_file.dart';
import 'package:flutter/material.dart';

class EncryptScreen extends StatefulWidget {
  const EncryptScreen({super.key});

  @override
  State<EncryptScreen> createState() => _EncryptScreenState();
}

class _EncryptScreenState extends State<EncryptScreen> {
  final EncryptService encryptService = EncryptService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Encryption Text",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.w800),
        ),
        backgroundColor: Colors.blueAccent,
      ),
      body: Container(
        padding: const EdgeInsets.all(12),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextFormField(
              decoration: const InputDecoration(
                label: Text('Enter text to encrypt'),
              ),
              controller: encryptService.textEditingController,
            ),
            const SizedBox(height: 18),
            Text("Text Encrypt: ${encryptService.encryptedText}"),
            const SizedBox(height: 8),
            Text("Text Decrypt: ${encryptService.decryptedText}"),
            const SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () async {
                    await encryptService.encryptText();
                    setState(() {});
                  },
                  child: const Text("Encrypt"),
                ),
                const SizedBox(width: 15),
                ElevatedButton(
                  onPressed: () {
                    encryptService.decryptText();
                    setState(() {});
                  },
                  child: const Text("Decrypt"),
                ),
              ],
            ),
            const SizedBox(height: 12),
            const EncryptFile(),
            const Divider(
              color: Colors.black,
            ),
          ],
        ),
      ),
    );
  }
}
