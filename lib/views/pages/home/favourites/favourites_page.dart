import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../../core/route/route_names.dart';
import '../../../../viewModels/home/favourites/favourites_state.dart';
import '../../../../viewModels/home/news_provider.dart';
import '../../../widgets/home/favourites/favourites.dart';

class FavouritesPage extends ConsumerStatefulWidget {
  const FavouritesPage( {super.key,});

  @override
  ConsumerState<FavouritesPage> createState() => _FavouritesPageState();
}

class _FavouritesPageState extends ConsumerState<FavouritesPage> {

  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      ref.read(addToFavouritesNotifierProvider.notifier).getFavourites();
    });
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final favourites = ref.watch(addToFavouritesNotifierProvider);
    final themeProvider = ref.watch(themeNotifierProvider);
    return Scaffold(
      backgroundColor: themeProvider == ThemeMode.light ? Colors.white : Color(0xFF0A0D12),
      appBar: AppBar(
        backgroundColor: themeProvider == ThemeMode.light ? Colors.white : Color(0xFF0A0D12),
        leading: IconButton(
            onPressed: (){
              Navigator.pop(context);
              },
            icon: Icon(
                Icons.arrow_back_ios_new,
                color: themeProvider == ThemeMode.light ? Colors.black : Colors.white
            )
        ),
        title: Text(
          'Favourites',
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            color: themeProvider == ThemeMode.light ? Colors.black : Colors.white
          ),
        ).tr(),
        centerTitle: true,
      ),
      body: favourites is FavouritesSuccess
     ? SizedBox(
          height: screenHeight,
          child: ListView.builder(
            itemCount: favourites.favourites.length,
              itemBuilder: (context, index) {
              return Favourites(
                  image: favourites.favourites[index].image,
                  title: favourites.favourites[index].title,
                originalUrl: favourites.favourites[index].originalUrl,
                index: index,
                onTap: () {
                  Navigator.pushReplacementNamed(
                    context,
                    RouteNames.webViewPage,
                    arguments: favourites.favourites[index].originalUrl,
                  );
                },
              );
             },
          ),
        ) : SizedBox.shrink(),
    );
  }
}
