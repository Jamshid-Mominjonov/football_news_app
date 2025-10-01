import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:football_news_app/features/home/domain/entities/favourites_entity.dart';
import '../../riverpod/news_provider.dart';

class ImgTitle extends ConsumerStatefulWidget {
  final Function onTap;
  final String image;
  final String title;
  final String date;
  final int index;
  final String originalUrl;
  const ImgTitle({
    super.key,
    required this.image,
    required this.title,
    required this.date,
    required this.index,
    required this.onTap,
    required this.originalUrl,
  });

  @override
  ConsumerState<ImgTitle> createState() => _ImgTitleState();
}

class _ImgTitleState extends ConsumerState<ImgTitle> {
  bool isTapped = false;

  void tapIcon() {
    setState(() {
      isTapped = !isTapped;
    });
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    final themeProvider = ref.watch(themeNotifierProvider);
    return Container(
      color: themeProvider == ThemeMode.light ? Colors.white : Color(0xFF0A0D12),
      width: screenWidth,
      height: screenHeight * 0.32,
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Stack(
              children: [
                Image.network(
                  widget.image,
                  fit: BoxFit.cover,
                  height: screenHeight * 0.2,
                  width: screenWidth,
                  errorBuilder: (context, error, stackTrace) {
                    return (Icon(
                      Icons.broken_image,
                      size: screenHeight * 0.2,
                      color: Colors.grey,
                    ));
                  },
                ),
                Positioned(
                  top: screenHeight * 0.012,
                    right: screenWidth * 0.02,
                    child: GestureDetector(
                      onTap: () {
                         tapIcon();
                         isTapped
                         ? ref.read(addToFavouritesNotifier.notifier).addToFavourites(
                           Favourites(
                               image: widget.image,
                               title: widget.title.tr(),
                               originalUrl: widget.originalUrl,
                           )
                         ) : null;
                        },
                        child: Image.asset(
                            isTapped
                                ? 'assets/images/wishlist_on.png'
                                : 'assets/images/wishlist_off.png',

                        ),
                    ),
                ),
              ],
            ),
          ),
          SizedBox(height: screenHeight * 0.01),
          SizedBox(
            height: screenHeight * 0.07,
            child: Text(
              widget.title.tr(),
              overflow: TextOverflow.ellipsis,
               maxLines: 2,
              style: TextStyle(
                fontSize: 20,
                color: themeProvider == ThemeMode.light
                        ? Colors.black
                        : Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Row(
            children: [
              Text(
                widget.date,
              ),
              Spacer(),
              GestureDetector(
                onTap: () => widget.onTap(),
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
        ],
      ),
    );
  }
}