import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:meta/meta.dart';
import 'package:rick_and_morty/features/charecter_screen/data/models/charecter_model.dart';
import 'package:rick_and_morty/features/charecter_screen/data/repositories/character_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'character_state.dart';

class CharacterCubit extends Cubit<CharacterState> {
  CharacterCubit ({required this.repository, this.name}): super(CharacterInitial());
  final CharacterRepository repository;
  final String? name;
  
  Future characterResults(String? name ,) async{
  emit(CharacterLoading());
  try{
   
 final Charactermodel model = await repository.getData(name ?? this.name ?? '');
emit(CharacterSuccess(charactermodel: model));
  }catch(e){
    print("Error in characterResults: $e");
    
    emit(CharacterError());
  }
}
  
  
}
