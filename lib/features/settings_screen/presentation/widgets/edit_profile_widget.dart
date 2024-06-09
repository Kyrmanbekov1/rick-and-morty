import 'package:flutter/material.dart';
import 'package:rick_and_morty/theme/app_colors.dart';

class CreateProfileTextField extends StatelessWidget {
  const CreateProfileTextField({super.key,
  required this.hintText,
  required this.title,
  required this.controller,
  });

  final String hintText;
  final String title;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
       crossAxisAlignment: CrossAxisAlignment.start,
       children: [
       Text(
        title,
          style: theme.textTheme.bodyLarge,
            ),
            TextField(
              style: theme.textTheme.bodyLarge,
              controller: controller,
              decoration:  InputDecoration(
             
                 
              
                hintText: hintText,
                
                 enabledBorder:OutlineInputBorder(
            borderRadius: BorderRadius.circular(30)
           ) ,
              ),
            ),
       ],
    );
  }
}