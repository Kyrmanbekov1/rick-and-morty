import 'package:rick_and_morty/features/charecter_screen/data/models/charecter_model.dart';
import 'package:rick_and_morty/features/charecter_screen/data/models/episode_model.dart';

abstract class CharacterRepository{
  Future<Charactermodel> getData( String? results,);
  Future<EpisodeModel> getEpisodes( String? url);
}