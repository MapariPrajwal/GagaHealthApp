import 'package:flutter/material.dart';

class BuyItemTile extends StatelessWidget {
  final String packName;
  final String packPrice;
  final String packImagePath;
  // ignore: prefer_typing_uninitialized_variables
  final color;
  void Function()? onPressed;
  BuyItemTile(
      {super.key,
      required this.packName,
      required this.packPrice,
      required this.packImagePath,
      required this.color,
      required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: color[100],
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image.asset(
              packImagePath,
              height: 64,
            ),
            Text(packName),
            MaterialButton(
              onPressed: onPressed,
              color:color[800],
              child: Text(
                'INR $packPrice',
              style: const TextStyle(color: Colors.white,
              fontWeight: FontWeight.bold),),

            ),
          ],
        ),
      ),
    );
  }
}
