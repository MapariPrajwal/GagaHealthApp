// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'package:gagahealth/Components/buy_item_tile.dart';
import 'package:gagahealth/Pages/BuyPage.dart';
import 'package:gagahealth/model/packCart.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () =>
            Navigator.push(context, MaterialPageRoute(builder: (context) {
          return const BuyPage();
        })),
        backgroundColor: Colors.black,
        child: const Icon(Icons.shopping_bag),
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 48,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Text(
                'Good Morning',
                style: GoogleFonts.nobile(
                  fontSize: 36,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(
              height: 24,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Text(
                'Buy suitable Plans Now',
                style: GoogleFonts.nobile(),
              ),
            ),
            const SizedBox(
              height: 24,
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.0),
              child: Divider(),
            ),
            const SizedBox(
              height: 24,
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.0),
              child: Text(
                "Our Plans",
                style: TextStyle(fontSize: 16),
              ),
            ),
            Expanded(
              child: Consumer<PackCart>(
                builder: (context, value, child) {
                  return GridView.builder(
                    itemCount: value.shopPack.length,
                    padding: const EdgeInsets.all(8.0),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2, childAspectRatio: 1 / 1.3),
                    itemBuilder: (context, index) {
                      return BuyItemTile(
                        packName: value.shopPack[index][0],
                        packPrice: value.shopPack[index][1],
                        packImagePath: value.shopPack[index][2],
                        color: value.shopPack[index][3],
                        onPressed: () {
                          Provider.of<PackCart>(context, listen: false)
                              .addPackToCart(index);
                        },
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
