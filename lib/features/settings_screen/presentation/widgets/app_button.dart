import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rick_and_morty/theme/app_colors.dart';

class AppButton extends StatelessWidget {
  const AppButton({
    super.key,
    required this.onPressed,
    required this.title,
  });
  final Function()? onPressed;
  final String title;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Center(
      child: SizedBox(
        height: 54.h,
        width: 296.w,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.seriescolor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(
                15,
                ),
            ),
          ),
          onPressed: onPressed, 
          child: Text(
            title,
             style: theme.textTheme.bodyLarge,
            
            ),
          
          ),
      ),
    );
  }
}