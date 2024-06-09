import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent_bottom_nav_bar_v2.dart';
import 'package:rick_and_morty/features/charecter_screen/presenntation/screens/character_page.dart';
import 'package:rick_and_morty/features/settings_screen/presentation/screens/profile_page.dart';
import 'package:rick_and_morty/resources/resources.dart';
import 'package:rick_and_morty/theme/app_colors.dart';
import 'package:rick_and_morty/theme/theme.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
     final theme = Theme.of(context);
    return PersistentTabView(
      backgroundColor: theme.scaffoldBackgroundColor,
      tabs: [
        PersistentTabConfig(
          screen: CharacterPage(),
          
          item: ItemConfig(
            activeForegroundColor: AppColors.green,
            icon: Image.asset(AppPngs.character,),
            // activeColorSecondary: AppColors.green,
            title: "Character",
          ),
        ),
        PersistentTabConfig(
          screen: CharacterPage(),
          item: ItemConfig(
            activeForegroundColor: AppColors.green,
            icon: Image.asset(AppPngs.location),
            title: "Location",
          ),
        ),
        PersistentTabConfig(
          screen: ProfilePage(),
          item: ItemConfig(
            activeForegroundColor: AppColors.green,
            icon: Image.asset(AppPngs.episodes,),
            title: "Episodes",
          ),
        ),
        PersistentTabConfig(
          screen: ProfilePage(),
          item: ItemConfig(
            activeForegroundColor: AppColors.green,
            icon: Image.asset(AppPngs.settings),
            title: "Settings",
          ),
        ),
      ],
      navBarBuilder: (navBarConfig) => Style1BottomNavBar(
        navBarConfig: navBarConfig,
      ),
    );
  }
}

