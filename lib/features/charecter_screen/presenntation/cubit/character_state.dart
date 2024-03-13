part of 'character_cubit.dart';

@immutable
sealed class CharacterState {}

final class CharacterInitial extends CharacterState {}
final class CharacterLoading extends CharacterState {}
final class CharacterSuccess extends CharacterState {
  final Charactermodel? charactermodel;
 

CharacterSuccess({required this.charactermodel,})  ;
}
final class CharacterError extends CharacterState {}