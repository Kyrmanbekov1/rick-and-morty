import 'package:rick_and_morty/features/charecter_screen/data/models/charecter_model.dart';
import 'package:rick_and_morty/features/charecter_screen/data/models/episode_model.dart';
import 'package:rick_and_morty/features/charecter_screen/data/repositories/character_repository.dart';
import 'package:rick_and_morty/features/charecter_screen/domain/get_character_data_use_case.dart';

class CharacterRepositoryImpl implements CharacterRepository{
  CharacterRepositoryImpl({required this.useCase});
  final GetCharactersDataUseCase useCase;
  
  
  @override
  Future<Charactermodel> getData(String? results) async{
  
   return await useCase.getData(name: results  ?? '');
  }




}