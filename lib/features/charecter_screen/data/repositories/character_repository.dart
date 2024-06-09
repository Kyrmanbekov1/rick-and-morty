import 'package:rick_and_morty/features/charecter_screen/data/models/charecter_model.dart';
abstract class CharacterRepository{
  Future<Charactermodel> getData( String? results,);
}