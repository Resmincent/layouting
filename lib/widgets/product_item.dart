import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:belajar_layouting/model/product_model.dart';
import 'package:belajar_layouting/provider/cart_provider.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:belajar_layouting/screens/detail_product.dart';

class ProductItem extends StatelessWidget {
  final Product product;
  const ProductItem({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          child: Image(
            width: 80,
            height: 80,
            image: NetworkImage(product.thumbnail),
            fit: BoxFit.fill,
          ),
        ),
        Expanded(
          child: Container(
            padding: const EdgeInsets.only(bottom: 8),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 8, right: 8),
                  child: Text(
                    product.title,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                if (product.brand != null)
                  Padding(
                    padding: const EdgeInsets.only(left: 8, right: 8),
                    child: Text(product.brand.toString()),
                  ),
                const SizedBox(height: 8),
                Padding(
                  padding: const EdgeInsets.only(left: 8, right: 8),
                  child: Text('\$${product.price.toStringAsFixed(2)}'),
                ),
                const SizedBox(height: 8),
                Padding(
                  padding: const EdgeInsets.only(left: 8, right: 8),
                  child: RatingBarIndicator(
                    rating: product.rating,
                    itemBuilder: (context, index) => const Icon(
                      Icons.star,
                      color: Colors.amber,
                    ),
                    itemCount: 5,
                    itemSize: 16.0,
                    direction: Axis.horizontal,
                  ),
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        Provider.of<CartProvider>(context, listen: false)
                            .addToCart(product);
                      },
                      child: const Text("Add to Cart"),
                    ),
                    IconButton(
                      icon: const Icon(Icons.arrow_forward),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                DetailProduct(product: product),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
