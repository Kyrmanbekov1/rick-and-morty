import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:rick_and_morty/features/charecter_screen/data/models/charecter_model.dart';
import 'package:rick_and_morty/features/charecter_screen/presenntation/widgets/character_info_container.dart';
import 'package:rick_and_morty/theme/app_colors.dart';

class CharacterInfoScreen extends StatelessWidget {
  const CharacterInfoScreen({
    super.key,
     required this.characters});
final Results characters;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  height: 200,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      fit: BoxFit.fill,
                      image: NetworkImage(characters.image ?? '',),
                    colorFilter: ColorFilter.mode(
          Colors.white.withOpacity(0.8), 
          BlendMode.dstATop,
        ),
                    ),
                  ),
                  
                ),
                Center(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 120),
                    child: CircleAvatar(
                      radius: 69,
                      backgroundColor: AppColors.darkbackgr,
                      child: CircleAvatar(
                        
                          backgroundImage: NetworkImage(characters.image ?? '',  ),
                          radius: 65,
                        ),
                    ),
                  ),
                  
                ),
                
              ],
            ),
            Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          
            SizedBox(
        height: 3,
            ),
            Text(
        characters.name ?? '',
            style: TextStyle(
        color: AppColors.white,
        fontSize: 25,
            ),
            ),
            SizedBox(
        height: 3,
            ),
            Text(
             characters.status ?? '',
            style: TextStyle(
        color: AppColors.green,
        fontSize: 20,
            ),
            ),
            SizedBox(height: 14,),
            Text(
        characters.created?? '',
        style: TextStyle(
          color: AppColors.white
        ),
            ),
            SizedBox(height: 15,),
            Padding(
        padding: const EdgeInsets.all(15.0),
        child: Row(
          children: [
            CharacterInfoCintainer(subtitle: characters.gender ?? '', title: 'Пол'),
            SizedBox(width:  200,),
            CharacterInfoCintainer(subtitle: characters.species ?? '', title: 'Расса'),
          ],
        ),
        
            ),
            Column(
        children: [
          Row(
            children: [
              Column(
                children: [
                  CharacterInfoCintainer(subtitle: characters.origin?.name ?? '' , title: 'Место рождения')
                ],
                
              ),
              Spacer(),
              Icon(Icons.arrow_right, color: AppColors.white,)
            ],
          ),
          Row(
            children: [
              Column(
                children: [
                  CharacterInfoCintainer(subtitle: characters.location?.name ?? '' , title: 'Местоположение')
                ],
                
              ),
              Spacer(),
              Icon(Icons.arrow_right,
              color: AppColors.white,)
            ],
          ),
        ],
            ),
            SizedBox(height: 30,),
            Divider(height: 8, color: AppColors.additText,),
        
            Padding(
        padding: const EdgeInsets.all(14.0),
        child: Row(
          children: [
           Text('Эпизоды',
           style: TextStyle(
            color: AppColors.white,
            fontSize: 18,
            fontWeight: FontWeight.w600,
           ),
           ),
           SizedBox(width: 180,),
            Text('Все эпизоды',
           style: TextStyle(
            color: AppColors.additText,
            fontSize: 14,
            fontWeight: FontWeight.w400,
           ),
           ),
          ],
        ),
            ),
            ListView.builder(
        shrinkWrap: true,
        itemCount: characters.episode?.length,
        itemBuilder: (context, index)=> InfoViewWidget(characters: characters) 
        )
        ],
            )
          ],
        ),
      ),
    );
  }
}



class InfoViewWidget extends StatelessWidget {
  const InfoViewWidget({
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
              backgroundImage: NetworkImage(characters.episode?.first ?? ''),
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
                characters.episode?.first ?? '',
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

