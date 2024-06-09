import 'package:rick_and_morty/features/charecter_screen/data/models/episode_model.dart';
import 'package:rick_and_morty/features/charecter_screen/data/repositories/episode_repository.dart';
import 'package:rick_and_morty/features/charecter_screen/domain/get_episode_use_case.dart';

class EpisodeRepositoryImpl implements EpisodeRepository{
  EpisodeRepositoryImpl({required this.useCase});
  final GetEpisodeDataUseCase useCase;
  
  
 

  @override
  Future<EpisodeModel> getEpisodes(String? results1)async {
    
   return await useCase.getEpisodes(name: results1 ?? '');
 


}}