import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_and_morty/features/charecter_screen/presenntation/cubit/character_cubit.dart';
import 'package:rick_and_morty/resources/resources.dart';
import 'package:rick_and_morty/theme/app_colors.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    required this.hintext,
    required this.controller,

  });

final hintext;
final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.only(right: 12,
      left: 12,
      top: 50
      ),
      child: TextField(
        style: theme.textTheme.bodyLarge?.copyWith(
          fontSize: 15,
        ),
        onChanged: (value) {
          BlocProvider.of<CharacterCubit>(context).characterResults(  value);
        },
        controller: controller,
        decoration: InputDecoration(
          prefixIcon: Icon(Icons.search),
          suffixIcon: IconButton(onPressed: (){},
           icon: Image.asset(AppPngs.filter)),
          hintText: hintext,
          hintStyle: TextStyle(
            color: AppColors.hintext
          ),
          fillColor: AppColors.darktextfield,
           enabledBorder:OutlineInputBorder(
            borderRadius: BorderRadius.circular(30)
           ) ,
        ),
        
      ),
    );
  }
}