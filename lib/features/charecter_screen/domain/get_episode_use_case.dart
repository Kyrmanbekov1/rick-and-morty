import 'package:dio/dio.dart';
import 'package:rick_and_morty/features/charecter_screen/data/models/episode_model.dart';

class GetEpisodeDataUseCase{
  final Dio dio;
  GetEpisodeDataUseCase({required this.dio});

  Future<EpisodeModel> getEpisodes({required String? name}) async{
    final Response response = await dio.get('episode/?name=$name',
    );
    

    return EpisodeModel.fromJson(response.data);
    
  }
  
}