import 'package:dio/dio.dart';
import 'package:rick_and_morty/features/charecter_screen/data/models/charecter_model.dart';

class GetCharactersDataUseCase{
  final Dio dio;
  GetCharactersDataUseCase({required this.dio});

  Future<Charactermodel> getData({required String? name}) async{
    final Response response = await dio.get('character/?name=$name',
    );
    

    return Charactermodel.fromJson(response.data);
    
  }
  
}