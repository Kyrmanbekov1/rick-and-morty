import 'package:flutter/material.dart';
import 'package:rick_and_morty/theme/app_colors.dart';

class CharacterInfoCintainer extends StatelessWidget {
  const CharacterInfoCintainer({super.key, required this.subtitle, required this.title});
  final String title;
  final String subtitle;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          title,
          style: TextStyle(
            color: AppColors.additText,
            fontWeight: FontWeight.w400,
            fontSize: 14,
            height: 2,
          ),
        ),
        Text(
          subtitle,
          style: TextStyle(
            color: AppColors.white,
            fontWeight: FontWeight.w400,
            fontSize: 14,
            height: 2,
          ),
        )
      ],
    );
  }
}