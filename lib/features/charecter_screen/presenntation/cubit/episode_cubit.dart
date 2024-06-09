import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:rick_and_morty/features/charecter_screen/data/models/episode_model.dart';
import 'package:rick_and_morty/features/charecter_screen/data/repositories/episode_repository.dart';

part 'episode_state.dart';

class EpisodeCubit extends Cubit<EpisodeState> {
  EpisodeCubit({required this.episodeRepository, this.url}) : super(EpisodeInitial());
  final EpisodeRepository episodeRepository;
  final String? url;

  Future<void> episodeResults(String? url) async {
    emit(EpisodeLoading());
    try {
      final EpisodeModel episodeModel = await episodeRepository.getEpisodes(url ?? this.url ?? '');
      emit(EpisodeSuccess(episodeModel: episodeModel));
    } catch (e) {
      print("Ошибка в episodeResults: $e");
      emit(EpisodeError());
    }
  }
}
