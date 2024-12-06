// import 'package:flutter_riverpod/flutter_riverpod.dart'; // importing the Provider from Riverpod
import 'package:riverpod_annotation/riverpod_annotation.dart'; // importing this makes the one above redundant, as this contains everything from the one above
import 'package:riverpod_files/models/product.dart'; // importing the product model

/* Riverpod will generate this file and therefore, this 'part' statement tells
    it that this file is part of that one */
part 'products_provider.g.dart';

// Creating a list of Product classes using the model
const List<Product> allProducts = [
  Product(
      id: '1',
      title: 'Groovy Shorts',
      price: 12,
      image: 'assets/products/shorts.png'),
  Product(
      id: '2',
      title: 'Karati Kit',
      price: 45,
      image: 'assets/products/karati.png'),
  Product(
      id: '3',
      title: 'Denim Jeans',
      price: 35,
      image: 'assets/products/jeans.png'),
  Product(
      id: '4',
      title: 'Red Backpack',
      price: 25,
      image: 'assets/products/backpack.png'),
  Product(
      id: '5',
      title: 'Drum & Sticks',
      price: 75,
      image: 'assets/products/drum.png'),
  Product(
      id: '6',
      title: 'Blue Suitcase',
      price: 60,
      image: 'assets/products/suitcase.png'),
  Product(
      id: '7',
      title: 'Roller Skates',
      price: 50,
      image: 'assets/products/skates.png'),
  Product(
      id: '8',
      title: 'Electric Guitar',
      price: 120,
      image: 'assets/products/guitar.png'),
];

// Creating an instance of the Provider (provided by Riverpod), which takes a function
// This Provider returns the list above

// final productsProvider = Provider((ref) {
//   return allProducts;
// }); ---> THIS HAS BEEN REPLACED BY THE GENERATED PROVIDER ON LINE 62

/* This Provider uses the .where() to return only produces under price(50).
    It doesn't return a List, so the toList() is applied */

// final reducedProductsProvider = Provider((ref) {
//   return allProducts.where((p) => p.price < 50).toList();
// }); ---> THIS HAS BEEN REPLACED BY THE GENERATED PROVIDER ON LINE 72

@riverpod
List<Product> products(ref) {
  return allProducts;
}

@riverpod
List<Product> reducedProducts(ref) {
  return allProducts.where((p) => p.price < 50).toList();
}
