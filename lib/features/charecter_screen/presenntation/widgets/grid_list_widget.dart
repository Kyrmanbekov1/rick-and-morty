import 'package:flutter/material.dart';
import 'package:rick_and_morty/features/charecter_screen/data/models/charecter_model.dart';
import 'package:rick_and_morty/theme/app_colors.dart';

class GridListWidget extends StatelessWidget {
  const GridListWidget({
    super.key,
     required this.characters
  });
final Results characters;
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      children: [
        CircleAvatar(
          backgroundImage: NetworkImage(characters.image ?? ''),
          radius: 50,
        ),
        const SizedBox(
          height: 15,
        ),
        Column(
      crossAxisAlignment: CrossAxisAlignment.center,
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
    style: theme.textTheme.bodyLarge?.copyWith(
      fontSize: 14,
      fontWeight: FontWeight.w400,
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
    )
      ],
    );
  }
}
