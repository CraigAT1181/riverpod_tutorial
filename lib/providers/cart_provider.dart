import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:riverpod_files/models/product.dart';

// Indicates this file is part of the Provider generated by Riverpod
part 'cart_provider.g.dart';

// Simple add @riverpod and change the extends to _$<class name>
@riverpod
class CartNotifier extends _$CartNotifier {
  // Setting the initial state of our Set of Products
  @override
  Set<Product> build() {
    return {};
  }

  // If the product doesn't exist in state, add it
  void addProduct(Product product) {
    if (!state.contains(product)) {
      state = {...state, product};
    }
  }

// Rebuild state, excluding product if its ID matches that passed in
  void removeProduct(Product product) {
    state = state.where((p) => p.id != product.id).toSet();
  }
}

// No longer required due to generating a provider with Riverpod

// final cartNotifierProvider = NotifierProvider<CartNotifier, Set<Product>>(() {
//   return CartNotifier();
// });

@riverpod
int cartTotal(ref) {
  final cartProducts = ref.watch(cartNotifierProvider);

  int total = 0;

  for (Product product in cartProducts) {
    total += product.price;
  }

  return total;
}
