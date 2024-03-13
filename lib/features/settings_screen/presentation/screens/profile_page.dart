import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_and_morty/theme/app_colors.dart';
import 'package:rick_and_morty/theme/theme.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key, });
 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.darkbackgr,
        title: Text('Настройки', style: TextStyle(
          color: AppColors.white,
          fontSize: 20,
          fontWeight: FontWeight.w700,
        ),),
      ),
      body:Column(
        children: [
          Row(
            children: [
              CircleAvatar(
                radius: 50,
              ),
              Column(
                children: [
                  Text(
                   'fdd',
                    style: TextStyle(
                      color: AppColors.white,
                      fontSize: 16,
                  
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(height: 10,),
                  Text(
                   'dfdg',
                    style: TextStyle(
                      color: AppColors.additText,
                      fontSize: 16,
                  
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(height: 30,),
          ElevatedButton(onPressed: (){},
          child: Text('Редактировать',
          style: TextStyle(
            color: AppColors.proftext
          ),
          ),
          ),
          SizedBox(height: 30,),
Divider(
  height: 8,
  color: AppColors.additText,
),
SizedBox(height: 30,),



Column(
  children: [
            Text('Внешний вид',
style: TextStyle(
  color: AppColors.additText,
  fontSize: 10,
  fontWeight: FontWeight.w400,
),
),
   IconButton(onPressed: (){
    context.read<ThemeProvider>().changeTheme();
   }, icon: Icon(Icons.light_mode)),
    Padding(
      padding: const EdgeInsets.all(20.0),
      child: Row(children: [
        Icon(Icons.palette,
        color: AppColors.additText,),
        SizedBox(width: 20,),
     Text('Темная тема',
        style: TextStyle(
          color: AppColors.white,
          fontSize: 16,
          fontWeight: FontWeight.w600,
        ),
        ),
        SizedBox(width: 180,),
        Icon(Icons.arrow_right,
        color: AppColors.white,),
      ],),
    ),
  ],
),
SizedBox(height: 50,),

Divider(
  height: 8,
  color: AppColors.additText,
),

Padding(
  padding: const EdgeInsets.all(15.0),
  child: Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text('О приложении',
      style: TextStyle(
        color: AppColors.additText,
        fontSize: 16,
        fontWeight: FontWeight.w600,
      ),
      ),
      SizedBox(height: 8,),
      Text('Зигерионцы помещают Джерри и Рика в симуляцию, чтобы узнать секрет изготовления концен-трирован- ной темной материи.',
      style: TextStyle(
        color: AppColors.white,
        fontSize: 14,
        fontWeight: FontWeight.w500,
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
    Text('Версия приложения',
    style: TextStyle(
      color: AppColors.additText,
      fontSize: 15,
      fontWeight: FontWeight.w400,
    ),
    ),
    SizedBox(height: 8,),
    Text('Rick & Morty  v1.0.0',
    style: TextStyle(
      color: AppColors.white,
      fontSize: 15,
      fontWeight: FontWeight.w400,
    ),
    ),
  ],
)
        ],
      ),
    );
  }
}