import 'package:belajar_layouting/helper/db_helper.dart';
import 'package:belajar_layouting/model/cart_model.dart';
import 'package:belajar_layouting/model/product_model.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CartProvider with ChangeNotifier {
  DBHelper dbHelper = DBHelper();

  int _counter = 0;
  int _quantity = 0;

  int get counter => _counter;
  int get quantity => _quantity;

  double _totalPrice = 0.0;
  double get price => _totalPrice;

  List<Cart> cart = [];

  Future<List<Cart>> getData() async {
    cart = await dbHelper.getCartList();
    notifyListeners();
    return cart;
  }

  void _setProductPrefs() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setInt("product_item", _counter);
    prefs.setInt("product_quantity", _quantity);
    prefs.setDouble("product_total_price", _totalPrice);
    notifyListeners();
  }

  void _getProductPrefs() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    _counter = prefs.getInt("product_item") ?? 0;
    _totalPrice = prefs.getDouble("product_total_price") ?? 0;
    _quantity = prefs.getInt("product_quantity") ?? 0;
  }

  void addCounter() {
    _counter++;
    _setProductPrefs();
    notifyListeners();
  }

  void removeCounter() {
    _counter--;
    _setProductPrefs();
    notifyListeners();
  }

  int getCounter() {
    _getProductPrefs();
    return _counter;
  }

  void addQuantity(int id) {
    final index = cart.indexWhere((element) => element.id == id);
    cart[index].quantity!.value = cart[index].quantity!.value + 1;
    _setProductPrefs();
    notifyListeners();
  }

  void deleteQuantity(int id) {
    final index = cart.indexWhere((element) => element.id == id);
    final currentQuantity = cart[index].quantity!.value;
    if (currentQuantity <= 1) {
      currentQuantity == 1;
    } else {
      cart[index].quantity!.value = currentQuantity - 1;
    }
    _setProductPrefs();
    notifyListeners();
  }

  void removeItem(int id) {
    final index = cart.indexWhere((element) => element.id == id);
    dbHelper.deleteCartItem(id);
    cart.removeAt(index);
    removeCounter();
    _setProductPrefs();
    notifyListeners();
  }

  int getQuantity(int quantity) {
    _getProductPrefs();
    return quantity;
  }

  void addTotalPrice(double price) {
    _totalPrice = _totalPrice + price;
    _setProductPrefs();
    notifyListeners();
  }

  void removeTotalPrice(double price) {
    _totalPrice = _totalPrice - price;
    _setProductPrefs();
    notifyListeners();
  }

  double getTotalPrice() {
    _getProductPrefs();
    return _totalPrice;
  }

  void addToCart(Product product) {
    final cartItem = Cart(
      id: product.id,
      title: product.title,
      price: product.price,
      quantity: ValueNotifier(1),
      brand: product.brand,
      thumbnail: product.thumbnail,
    );

    final index = cart.indexWhere((item) => item.id == cartItem.id);
    if (index == -1) {
      cart.add(cartItem);
      dbHelper.insert(cartItem);
      addCounter();
      addTotalPrice(product.price);
    } else {
      addQuantity(cartItem.id!);
      addTotalPrice(product.price);
    }

    notifyListeners();
  }
}
