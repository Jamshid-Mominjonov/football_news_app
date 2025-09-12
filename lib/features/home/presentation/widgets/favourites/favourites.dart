import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../riverpod/news_provider.dart';

class Favourites extends ConsumerWidget {
  final String image;
  final String title;
  final Function onTap;
  final int index;
  final String originalUrl;
  const Favourites({super.key, required this.image, required this.title,  required this.onTap, required this.index, required this.originalUrl});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    final themeMode = ref.watch(themeNotifierProvider);
    return Container(
      padding: EdgeInsets.only(left: screenWidth * 0.03),
      margin: EdgeInsets.only(bottom: screenHeight * 0.01),
      width: screenWidth,
      height: screenHeight * 0.1,
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.network(
              image,
              height: screenHeight * 0.1,
              width: screenWidth * 0.35,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stacktrace) {
                return Icon(
                  Icons.broken_image,
                  color: Colors.grey,
                  size: screenHeight * 0.1,
                );
              },
            ),
          ),
          SizedBox(width: screenWidth * 0.02),
          Expanded(
            child: Text(
              title.tr(),
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontSize: 18,
                color: themeMode == ThemeMode.light ? Colors.black : Colors.white,
              ),
            ),
          ),
          SizedBox(width: screenWidth * 0.01,),
          Padding(
            padding: EdgeInsets.only(right: screenWidth * 0.02),
            child: Column(
              children: [
                Expanded(
                  child: IconButton(onPressed: (){
                    ref.read(addToFavouritesNotifier.notifier).deleteFavourites(index);
                  },
                      icon: Icon(Icons.delete, color: Colors.red,)
                  ),
                ),
                GestureDetector(
                  onTap: () => onTap(),
                  child: Text(
                    'Read more',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.indigo,
                      fontWeight: FontWeight.w600,
                    ),
                  ).tr(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
