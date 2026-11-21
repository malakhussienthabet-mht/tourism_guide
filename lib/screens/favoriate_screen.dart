
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/fav_provider.dart';
import '../widgets/attraction_card.dart';

class FavoriateScreen extends StatelessWidget {
  const FavoriateScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<FavProvider>(
      builder: (context, favProvider, child) {
        if (favProvider.favouriteItems.isEmpty) {
          return const Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.favorite_border,
                  size: 80,
                  color: Colors.grey,
                ),
                SizedBox(height: 16),
                Text(
                  "No favorites yet!",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                    color: Colors.grey,
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  "Tap the heart icon on any place to add it here.",
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          );
        }

        return ListView.builder(
          padding: const EdgeInsets.symmetric(vertical: 8),
          itemCount: favProvider.favouriteItems.length,
          itemBuilder: (context, index) {
            final attraction = favProvider.favouriteItems[index];
            return AttractionCard(attraction: attraction);
          },
        );
      },
    );
  }
}
