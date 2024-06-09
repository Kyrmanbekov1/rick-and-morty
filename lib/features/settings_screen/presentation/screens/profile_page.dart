import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_and_morty/features/settings_screen/consts/consts.dart';
import 'package:rick_and_morty/features/settings_screen/presentation/screens/profile_edit_page.dart';
import 'package:rick_and_morty/features/settings_screen/presentation/widgets/shared_prefs_widget.dart';
import 'package:rick_and_morty/theme/app_colors.dart';
import 'package:rick_and_morty/theme/theme.dart';

class ProfilePage extends StatefulWidget {
  final String? imagePath;

  const ProfilePage({super.key, this.imagePath});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  String? imagePath;

  @override
  void initState() {
    super.initState();
    imagePath = widget.imagePath;
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      body: SingleChildScrollView(
        child: ConstrainedBox(
          constraints: BoxConstraints(
            maxHeight: MediaQuery.of(context).size.height,
          ),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 50),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 25),
                      child: Text(
                        'Настройки',
                        style: theme.textTheme.bodyLarge?.copyWith(
                          fontSize: 20,
                          fontWeight: FontWeight.w600
                        ),
                        
                        // TextStyle(
                        //   color: AppColors.white,
                        //   fontSize: 20,
                        //   fontWeight: FontWeight.w600,
                        // ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 30),
              Column(
                children: [
                  Row(
                    children: [
                      CircleAvatar(
                        backgroundImage: imagePath != null
                            ? FileImage(File(imagePath!))
                            : null,
                        radius: 50,
                      ),
                      SizedBox(width: 16),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                           Text('${SharedPrefsWidget.prefs.getString(AppConsts.name)} ${SharedPrefsWidget.prefs.getString(AppConsts.sureName)}',
              style: theme.textTheme.bodyLarge?.copyWith(
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
              ),
                          // Text(
                          //   'fdd',
                          //   style: TextStyle(
                          //     color: AppColors.white,
                          //     fontSize: 16,
                          //     fontWeight: FontWeight.w600,
                          //   ),
                          // ),
                          // SizedBox(height: 10),
                          // Text(
                          //   'dfdg',
                          //   style: TextStyle(
                          //     color: AppColors.additText,
                          //     fontSize: 16,
                          //     fontWeight: FontWeight.w400,
                          //   ),
                          // ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 30),
                  ElevatedButton(
                    onPressed: () async {
                      final result = await Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ProfileEditPage(),
                        ),
                      );

                      if (result != null && result is String) {
                        setState(() {
                          imagePath = result;
                        });
                      }
                    },
                    child: Text(
                      'Редактировать',
                      style: TextStyle(color: AppColors.proftext),
                    ),
                  ),
                  SizedBox(height: 30),
                  Divider(
                    height: 8,
                    color: AppColors.additText,
                  ),
                  SizedBox(height: 30),
                  Column(
                    children: [
                      Text(
                        'Внешний вид',
                        style: TextStyle(
                          color: AppColors.additText,
                          fontSize: 10,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          context.read<ThemeProvider>().changeTheme();
                        },
                        icon: Icon(Icons.light_mode),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Row(
                          children: [
                            Icon(
                              Icons.palette,
                              color: AppColors.additText,
                            ),
                            SizedBox(width: 20),
                            Text(
                              'Темная тема',
                              style: theme.textTheme.bodyLarge?.copyWith(
                          fontSize: 20,
                          fontWeight: FontWeight.w600
                        ),
                            ),
                            Spacer(),
                            Icon(
                              Icons.arrow_right,
                              color: theme.iconTheme.color,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 50),
                  Divider(
                    height: 8,
                    color: AppColors.additText,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'О приложении',
                          style: TextStyle(
                            color: AppColors.additText,
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        SizedBox(height: 8),
                        Text(
                          'Зигерионцы помещают Джерри и Рика в симуляцию, чтобы узнать секрет изготовления концентрированной темной материи.',
                         style: theme.textTheme.bodyLarge?.copyWith(
                          fontSize: 14,
                          fontWeight: FontWeight.w500
                        ),
                        ),
                      ],
                    ),
                  ),
                  Divider(
                    height: 8,
                    color: AppColors.additText,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Версия приложения',
                        style: TextStyle(
                          color: AppColors.additText,
                          fontSize: 15,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      SizedBox(height: 8),
                      Text(
                        'Rick & Morty v1.0.0',
                        style: theme.textTheme.bodyLarge?.copyWith(
                          fontSize: 15,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
