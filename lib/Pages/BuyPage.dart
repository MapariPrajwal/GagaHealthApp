// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'package:gagahealth/model/packCart.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class BuyPage extends StatelessWidget {
  const BuyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          iconTheme: const IconThemeData(color: Colors.black),
        ),
        body: Consumer<PackCart>(
          builder: (context, value, child) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
              Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Text(
                'Cart',
                style: GoogleFonts.nobile(
                  fontSize: 36,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
              Expanded(
                child: ListView.builder(
                  itemCount: value.packCart.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.grey[200],
                            borderRadius: BorderRadius.circular(8)),
                        child: ListTile(
                          leading: Image.asset(
                            value.packCart[index][2],
                            height: 32,
                          ),
                          title: Text(value.packCart[index][0]),
                          subtitle: Text('INR '+value.packCart[index][1]),
                          trailing: IconButton(
                            icon: const Icon(Icons.cancel),
                            onPressed: () =>
                                Provider.of<PackCart>(context, listen: false)
                                    .deletePackFromCart(index),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
              //Total + pay
              Padding(
                padding: const EdgeInsets.all(36.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  padding: const EdgeInsets.all(24),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Total Price",
                            style: TextStyle(color: Colors.grey[100]),
                          ),
                          const SizedBox(
                            height: 4,
                          ),
                          Text(
                            value.calculateTotal(),
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          )
                        ],
                      ),
                      Container(
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey.shade100),
                            borderRadius: BorderRadius.circular(12)),
                        padding: const EdgeInsets.all(12),
                        child: Row(
                          children: const [
                            Text("Pay Now",
                                style: TextStyle(
                                  color: Colors.white,
                                )),
                            Icon(
                              Icons.arrow_forward_ios,
                              size: 16,
                              color: Colors.white,
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ]);
          },
        ));
  }
}
