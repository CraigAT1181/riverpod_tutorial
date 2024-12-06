import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_files/providers/cart_provider.dart';

// StatefulWidget is changed to ConsumerStatefulWidget
class CartScreen extends ConsumerStatefulWidget {
  const CartScreen({super.key});

// State is changed to ConsumerState on lines 10 and 13
  @override
  ConsumerState<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends ConsumerState<CartScreen> {
  bool showCoupon = true;

  @override
  Widget build(BuildContext context) {
    // Create a new variable to store the reduced products from Provider
    final cartProducts = ref.watch(cartNotifierProvider);
    final total = ref.watch(cartTotalProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Cart'),
        centerTitle: true,
        // actions: [],
      ),
      body: Container(
        padding: const EdgeInsets.all(30),
        child: Column(
          children: [
            /* A .map() will return a lazy iterable, so we must convert it into
                a List on line 47 */
            Column(
              children: cartProducts.map((product) {
                return Container(
                  padding: const EdgeInsets.only(top: 10, bottom: 10),
                  child: Row(
                    children: [
                      Image.asset(product.image, width: 60, height: 60),
                      const SizedBox(width: 10),
                      Text(product.title),
                      const Expanded(child: SizedBox()),
                      Text('£${product.price}'),
                    ],
                  ),
                );
              }).toList(),
            ),

            // Output totals here
            Text('Total Price: £$total')
          ],
        ),
      ),
    );
  }
}
