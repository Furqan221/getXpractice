import 'package:getx/export_all.dart';

class CartItem {
  RxString name;
  RxInt quantity;
  RxDouble price;

  CartItem({required this.name, required this.quantity, required this.price});
}

class CartController extends GetxController {
  var cartItems = <CartItem>[].obs;

  void addToCart(String name, int quantity, double price) {
    cartItems.add(
        CartItem(name: name.obs, quantity: quantity.obs, price: price.obs));
  }

  void removeFromCart(CartItem item) {
    cartItems.remove(item);
  }

  void increaseQuantity(CartItem item) {
    item.quantity++;
  }

  void decreaseQuantity(CartItem item) {
    if (item.quantity > 1) {
      item.quantity--;
    }
  }

  RxDouble get totalAmount {
    RxDouble total = 0.0.obs;
    for (var item in cartItems) {
      total.value += item.quantity.value * item.price.value;
    }
    return total;
  }

  RxInt get cartCount {
    return cartItems.length.obs;
  }
}
