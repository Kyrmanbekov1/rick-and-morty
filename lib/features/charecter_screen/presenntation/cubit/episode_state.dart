part of 'episode_cubit.dart';

@immutable
sealed class EpisodeState {}

final class EpisodeInitial extends EpisodeState {}
final class EpisodeLoading extends EpisodeState {}
final class EpisodeSuccess extends EpisodeState {
final EpisodeModel? episodeModel;

EpisodeSuccess({required this.episodeModel});

}
final class EpisodeError extends EpisodeState {}
