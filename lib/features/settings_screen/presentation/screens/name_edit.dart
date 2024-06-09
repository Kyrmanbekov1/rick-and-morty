import 'package:flutter/material.dart';
import 'package:rick_and_morty/features/settings_screen/consts/consts.dart';
import 'package:rick_and_morty/features/settings_screen/presentation/widgets/app_button.dart';
import 'package:rick_and_morty/features/settings_screen/presentation/widgets/edit_profile_widget.dart';
import 'package:rick_and_morty/features/settings_screen/presentation/widgets/shared_prefs_widget.dart';
import 'package:rick_and_morty/theme/app_colors.dart';
import 'package:shared_preferences/shared_preferences.dart';

class NameEdit extends StatelessWidget {
  const NameEdit({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
     final TextEditingController controllername = TextEditingController();
    final TextEditingController controllersurename = TextEditingController();
    return Scaffold(
      body: ConstrainedBox(
        constraints:  BoxConstraints(
    maxHeight: MediaQuery.of(context).size.height, 
  ), 
        child: Column(
          children: [
            Padding(
          padding: const EdgeInsets.only(top: 47),
          child: Row(
            children: [
              IconButton(onPressed: (){
                Navigator.pop(context);
              }, 
              icon: Icon(
                Icons.arrow_back,
                color: theme.iconTheme.color,
              ),),
              Text(
                'Изменить ФИО',
                style: theme.textTheme.bodyLarge?.copyWith(
                  fontSize: 20,
                 fontWeight: FontWeight.w700,
                ),
                ),
            ],
          ),
        ),
        SizedBox(height: 60,),

          Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(18.0),
                child: CreateProfileTextField(
                  hintText: 'Асан' , 
                  title: 'Имя', 
                  controller: controllername,),
              ),
                SizedBox(height: 40,),
                Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: CreateProfileTextField(
                  hintText: 'Асанов', 
                  title: 'Фамилия', 
                  controller: controllersurename,),
                ),
            ],
          ),
          const Spacer(),
          AppButton(
            
            onPressed: () async {
                 final SharedPreferences prefs = SharedPrefsWidget.prefs;
              await prefs.setString(AppConsts.name, controllername.text);
              await prefs.setString(AppConsts.sureName, controllersurename.text );
                
                // await prefs.setBool(AppConsts.isLogined, true);

              Navigator.pop(context);
            },
            title: 'Сохранить',
            ),
            SizedBox(height: 115,),
          ],
          
        ),
      ),
    );
  }
}