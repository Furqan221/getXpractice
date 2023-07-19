import 'package:getx/export_all.dart';

class CartPage extends StatelessWidget {
  final CartController cartController = Get.put(CartController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Shopping Cart'),
      ),
      body: Obx(() => ListView.builder(
            itemCount: cartController.cartCount.value,
            itemBuilder: (context, index) {
              final item = cartController.cartItems[index];
              return ListTile(
                title: Text(item.name.value),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Quantity: ${item.quantity}'),
                    Text('Price: \$${item.price.toStringAsFixed(2)}'),
                    Text(
                        'Total: \$${(item.quantity * item.price.value).toStringAsFixed(2)}'),
                  ],
                ),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                      icon: Icon(Icons.remove),
                      onPressed: () {
                        cartController.decreaseQuantity(item);
                      },
                    ),
                    IconButton(
                      icon: Icon(Icons.add),
                      onPressed: () {
                        cartController.increaseQuantity(item);
                      },
                    ),
                    IconButton(
                      icon: Icon(Icons.remove_shopping_cart),
                      onPressed: () {
                        cartController.removeFromCart(item);
                      },
                    ),
                  ],
                ),
              );
            },
          )),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add_shopping_cart),
        onPressed: () {
          cartController.addToCart('New Item', 1, 10.0);
        },
      ),
      bottomNavigationBar: Container(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Total Amount: \$${cartController.totalAmount.toStringAsFixed(2)}',
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8.0),
            ElevatedButton(
              onPressed: () {
                // Place order logic
              },
              child: Text('Place Order'),
            ),
          ],
        ),
      ),
    );
  }
}
