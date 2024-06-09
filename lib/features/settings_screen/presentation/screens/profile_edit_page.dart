import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:rick_and_morty/features/settings_screen/consts/consts.dart';
import 'package:rick_and_morty/features/settings_screen/presentation/screens/name_edit.dart';
import 'package:rick_and_morty/features/settings_screen/presentation/widgets/shared_prefs_widget.dart';
import 'package:rick_and_morty/theme/app_colors.dart';

class ProfileEditPage extends StatefulWidget {
  const ProfileEditPage({super.key});

  @override
  State<ProfileEditPage> createState() => _ProfileEditPageState();
}

class _ProfileEditPageState extends State<ProfileEditPage> {
  
  String? imagePath;
    File? pickedFile;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      // appBar: AppBar(
      //   backgroundColor: AppColors.darkbackgr,
      //   title: Text(
      //     'Редактировать профиль',
      //     style: TextStyle(
      //       color: AppColors.white,
      //       fontSize: 20,
      //       fontWeight: FontWeight.w700,
      //     ),
      //   ),
      //   leading: IconButton(
      //     color: AppColors.white,
      //     onPressed: () {
      //       Navigator.pop(context, imagePath);
      //     },
      //     icon: Icon(Icons.arrow_back),
      //   ),
      // ),
      body: ConstrainedBox(
        constraints:BoxConstraints(
    maxHeight: MediaQuery.of(context).size.height, 
  ), 
        child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
          children: [
             Padding(
          padding: const EdgeInsets.only(top: 47),
          child: Row(
            children: [
              IconButton(onPressed: (){
                Navigator.pop(context, imagePath);
              }, 
              icon: Icon(
                Icons.arrow_back,
                color: theme.iconTheme.color,
              ),),
              Text(
                'Редактировать профиль',
                style: theme.textTheme.bodyLarge?.copyWith(
                  fontSize: 20,
                 fontWeight: FontWeight.w700,
                ),
                ),
            ],
          ),
        ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 30),
                    child: CircleAvatar(
                      
                      backgroundImage: imagePath != null
                          ? FileImage(File(imagePath!))
                          : null,
                      radius: 65,
                    ),
                  ),
                ),
                SizedBox(height: 8),
                Center(
                  child: InkWell(
                    onTap: openDialog,
                    child: Text(
                      'Изменить фото',
                      style: TextStyle(
                        color: AppColors.seriescolor,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 80),
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => NameEdit(),
                      ),
                    );
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(left: 16.0, right: 16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'профиль',
                          style: TextStyle(color: AppColors.hintext),
                        ),
                        SizedBox(height: 30),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Изменить ФИО',
                                  style: theme.textTheme.bodyLarge?.copyWith(
                                    fontSize: 17,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                SizedBox(height: 8),
                           Text('${SharedPrefsWidget.prefs.getString(AppConsts.name)} ${SharedPrefsWidget.prefs.getString(AppConsts.sureName)}',
                                 style: TextStyle(
                                 color: AppColors.hintext,
                                 fontSize: 16,
                                  fontWeight: FontWeight.w600,
                             ),
                               ),
                              ],
                            ),
                            Icon(
                              Icons.arrow_right,
                              color: theme.iconTheme.color,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

 

  void openDialog(){
    showDialog(context: context, 
    builder: (context)=> AlertDialog(
      content: SizedBox(
        height: 400,
        child: Column(
          children: [
            TextButton(onPressed: (){
              pickImage(source: ImageSource.gallery);
              Navigator.pop(context);
            }, 
            child: Text('Gallery', ),),
            TextButton(onPressed: (){
              pickImage(source: ImageSource.camera);
              Navigator.pop(context);
            }, 
            child: Text('Camera' , ),),
          ],
        ),
      ),
    )
    );
  }

  Future<void> pickImage({required ImageSource source}) async {
    final ImagePicker imagePicker = ImagePicker();
    XFile? file = await imagePicker.pickImage(source: source);
    if (file != null) {
      setState(() {
        imagePath = file.path;
      });
    }
  }
}
