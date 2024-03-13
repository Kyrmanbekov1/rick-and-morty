import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:rick_and_morty/features/charecter_screen/data/models/charecter_model.dart';
import 'package:rick_and_morty/theme/app_colors.dart';

class ListViewWidget extends StatelessWidget {
  const ListViewWidget({
    super.key,
    required this.characters
  });
final Results characters;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 14),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: CircleAvatar(
              backgroundImage: NetworkImage(characters.image ?? ''),
              radius: 35,
            ),
          ),
          SizedBox(
            height: 16,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                characters.status ?? '',
          style: TextStyle(
            color: AppColors.green
          ),
          ),
          SizedBox(
            height: 3,
          ),
          Text(
            characters.name ?? '',
          style: TextStyle(
            color: AppColors.white,
          ),
          ),
          SizedBox(
            height: 3,
          ),
          Text(
            '${characters.species ?? ''}, ${characters.gender ?? ''}',
            
          style: TextStyle(
            color: AppColors.additText,
          ),
          ),
            ],
          ),
        ],
      ),
    );
  }
}

