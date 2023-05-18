import 'package:flutter/material.dart';
class PackCart extends ChangeNotifier{
  final List _shopPack =[
    ["Basic","999.00","Images/basic_plan.png",Colors.grey],
    ["Prime","1999.00","Images/prime_plan.png",Colors.grey],
    ["Holistic","2999.00","Images/holistic_plan.png",Colors.grey],
  ];

  final List _packCart = [];

  get packCart => _packCart;

  get shopPack => _shopPack;


  //Add Package to the Cart
  void addPackToCart(int index){
    _packCart.add(_shopPack[index]);
    notifyListeners();
  }
  //Remove Package from the Cart
  void deletePackFromCart(int index){
    _packCart.removeAt(index);
    notifyListeners();
  }

  //Calculate Total Price
  String calculateTotal(){
    double totalPrice=0;
    for(int i=0;i<packCart.length;i++){
       totalPrice+=double.parse(_packCart[i][1]);
    }
    return totalPrice.toStringAsFixed(2);
  }
}