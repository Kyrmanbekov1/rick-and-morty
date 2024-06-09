import 'package:flutter/material.dart';
import 'package:rick_and_morty/theme/app_colors.dart';

class ThemeProvider extends ChangeNotifier{
bool isDarkTheme = true;

  ThemeData theme = ThemeData(
    scaffoldBackgroundColor: AppColors.darkbackgr
  );
void changeTheme(){
isDarkTheme =! isDarkTheme;
theme = ThemeData(
    scaffoldBackgroundColor: isDarkTheme? AppColors.darkbackgr : AppColors.lightbackgr,
    appBarTheme: AppBarTheme(backgroundColor:isDarkTheme? AppColors.darkbackgr : AppColors.lightbackgr, ),

          textTheme: TextTheme(
        bodyLarge: TextStyle(color: isDarkTheme ? AppColors.white : AppColors.darkbackgr),
      
      ),
  );
  notifyListeners();
}

}