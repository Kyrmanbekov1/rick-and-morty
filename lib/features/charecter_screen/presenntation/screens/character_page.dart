import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:rick_and_morty/features/charecter_screen/data/models/charecter_model.dart';
import 'package:rick_and_morty/features/charecter_screen/data/repositories/character_repository.dart';
import 'package:rick_and_morty/features/charecter_screen/presenntation/cubit/character_cubit.dart';
import 'package:rick_and_morty/features/charecter_screen/presenntation/screens/character_info.dart';
import 'package:rick_and_morty/features/charecter_screen/presenntation/widgets/custom_text_field.dart';
import 'package:rick_and_morty/features/charecter_screen/presenntation/widgets/grid_list_widget.dart';
import 'package:rick_and_morty/features/charecter_screen/presenntation/widgets/list_view.dart';
import 'package:rick_and_morty/resources/resources.dart';
import 'package:rick_and_morty/theme/app_colors.dart';

class CharacterPage extends StatefulWidget {
  const CharacterPage({super.key});

  @override
  State<CharacterPage> createState() => _CharacterPageState();
}

class _CharacterPageState extends State<CharacterPage> {
  final TextEditingController controller = TextEditingController();
  late CharacterCubit characterCubit;

  @override
  void initState() {
  BlocProvider.of<CharacterCubit>(context).characterResults('');
    super.initState();
  }

  bool isGridview = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: ConstrainedBox(
          constraints: BoxConstraints(
    maxHeight: MediaQuery.of(context).size.height, 
  ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomTextField(
                
                hintext: 'Найти персонажа',
                controller: controller,
              ),
              SizedBox(
                height: 8,
              ),
              Row(
                children: [
                  Text(
                    'Всего персонажей: 200',
                    style: TextStyle(
                      color: AppColors.additText,
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                      height: 1.60,
                      letterSpacing: 1.50,
                    ),
                  ),
                  Spacer(),
                  IconButton(
                      onPressed: () {
                        isGridview = !isGridview;
                        setState(() {});
                      },
                      icon: isGridview
                          ? Image.asset(AppPngs.list)
                          : Image.asset(AppPngs.grid))
                ],
              ),
              SizedBox(
                height: 6,
              ),
              BlocBuilder<CharacterCubit, CharacterState>(
            builder: (context, state) {
              if (state is CharacterSuccess) {
          return isGridview ? Expanded(
            child: GridView.builder(
              itemCount: state.charactermodel?.results?.length ?? 0,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
               itemBuilder: ((context, index) {
            
              
               
                  final character = state.charactermodel?.results?[index];
                  return character != null
                      ? InkWell(
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context)=> CharacterInfoScreen(characters: character,)));
                        },
                        child: GridListWidget(characters: character))
                      : SizedBox.shrink();
                
            })),
          ) : Expanded(
            child: ListView.builder(
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              itemCount: state.charactermodel?.results?.length ?? 0,
              itemBuilder: (context, index) {
                final character = state.charactermodel?.results?[index];
                return character != null
                    ? InkWell(
                      onTap: () {
                       
                       Navigator.push(context, MaterialPageRoute(builder: (context)=> CharacterInfoScreen(characters: character, )));
                      },
                      child: ListViewWidget(characters: character))
                    : SizedBox.shrink();
              },
            ),
          );
              }
            
              if(state is CharacterError){
                return Center(
                  child: Column(
                    children: [
                      Image.asset(AppPngs.errorcharacter,
                      height: 500,),
                      Text('Персонаж с таким именем не найден',
                      style: TextStyle(
                        color: AppColors.additText,
                      ),
                      ),
                    ],
                  ),
                );
              }
              return SizedBox.shrink();
            },
          )
              // ListViewWidget()
            ],
          ),
        ),
      ),
    );
  }


}

