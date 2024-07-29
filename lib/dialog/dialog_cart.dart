import 'package:belajar_layouting/screens/list_product.dart';
import 'package:flutter/material.dart';

class DialogCart extends StatelessWidget {
  const DialogCart({super.key});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      backgroundColor: Colors.blueAccent,
      child: const Icon(Icons.shopping_cart),
      onPressed: () {
        showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: const Text(
                "Masukkan kedalam keranjang",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              content: const Text(
                "Apakah kamu yakin ingin memasukan item ini kedalam keranjang?",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
              ),
              actions: <Widget>[
                TextButton(
                    child: const Text('Close'),
                    onPressed: () {
                      Navigator.of(context).pop();
                    }),
                TextButton(
                    child: const Text('Confirm'),
                    onPressed: () {
                      Navigator.of(context).pushAndRemoveUntil(
                        MaterialPageRoute(
                            builder: (context) => const ListProduct()),
                        (Route<dynamic> route) => false,
                      );
                    }),
              ],
            );
          },
        );
      },
    );
  }
}
