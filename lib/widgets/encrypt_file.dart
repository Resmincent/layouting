import 'package:belajar_layouting/provider/encrypt_provider.dart';
import 'package:flutter/material.dart';

class EncryptFile extends StatefulWidget {
  const EncryptFile({super.key});

  @override
  State<EncryptFile> createState() => _EncryptFileState();
}

class _EncryptFileState extends State<EncryptFile> {
  final EncryptService encryptService = EncryptService();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              width: 90,
              child: ElevatedButton(
                onPressed: () async {
                  await encryptService.encryptFile('assets/files/Hallo.pdf');
                  setState(() {});
                },
                child: const Text(
                  "Encrypt File PDF",
                  style: TextStyle(fontSize: 8),
                ),
              ),
            ),
            const SizedBox(width: 5),
            SizedBox(
              width: 90,
              child: ElevatedButton(
                onPressed: () async {
                  await encryptService.encryptFile('assets/files/Hallo.docx');
                },
                child: const Text(
                  "Encrypt File Word",
                  style: TextStyle(fontSize: 8),
                ),
              ),
            ),
            const SizedBox(width: 5),
            SizedBox(
              width: 90,
              child: ElevatedButton(
                onPressed: () async {
                  await encryptService.encryptFile('assets/files/pr.xlsx');
                },
                child: const Text(
                  "Encrypt File Excel",
                  style: TextStyle(fontSize: 8),
                ),
              ),
            ),
            const SizedBox(width: 5),
            SizedBox(
              width: 90,
              child: ElevatedButton(
                onPressed: () async {
                  await encryptService.encryptFile('assets/images/tmli.jpeg');
                },
                child: const Text(
                  "Encrypt File Image",
                  style: TextStyle(fontSize: 8),
                ),
              ),
            ),
          ],
        ),
        Text(
          'Encrypt File:${encryptService.encryptedFile}',
          style: const TextStyle(fontSize: 12),
        )
      ],
    );
  }
}
