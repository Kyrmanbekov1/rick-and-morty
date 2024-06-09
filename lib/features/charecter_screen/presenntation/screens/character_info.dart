import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_and_morty/features/charecter_screen/data/models/charecter_model.dart';
import 'package:rick_and_morty/features/charecter_screen/data/models/episode_model.dart';
import 'package:rick_and_morty/features/charecter_screen/presenntation/cubit/episode_cubit.dart';
import 'package:rick_and_morty/features/charecter_screen/presenntation/widgets/character_info_container.dart';
import 'package:rick_and_morty/theme/app_colors.dart';

class CharacterInfoScreen extends StatefulWidget {
  const CharacterInfoScreen({super.key, required this.characters});
  final Results characters;

  @override
  State<CharacterInfoScreen> createState() => _CharacterInfoScreenState();
}

class _CharacterInfoScreenState extends State<CharacterInfoScreen> {
  late EpisodeCubit episodeCubit;

  @override
  void initState() {
    episodeCubit = BlocProvider.of<EpisodeCubit>(context);
    episodeCubit.episodeResults(null);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  height: 200,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      fit: BoxFit.fill,
                      image: NetworkImage(widget.characters.image ?? ''),
                      colorFilter: ColorFilter.mode(
                        Colors.white.withOpacity(0.8),
                        BlendMode.dstATop,
                      ),
                    ),
                  ),
                ),
                Center(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 120),
                    child: CircleAvatar(
                      radius: 69,
                      backgroundColor: AppColors.darkbackgr,
                      child: CircleAvatar(
                        backgroundImage: NetworkImage(widget.characters.image ?? ''),
                        radius: 65,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 3),
                Text(
                  widget.characters.name ?? '',
                  style: TextStyle(
                    color: AppColors.white,
                    fontSize: 25,
                  ),
                ),
                SizedBox(height: 3),
                Text(
                  widget.characters.status ?? '',
                  style: TextStyle(
                    color: AppColors.green,
                    fontSize: 20,
                  ),
                ),
                SizedBox(height: 14),
                Text(
                  widget.characters.created ?? '',
                  style: TextStyle(color: AppColors.white),
                ),
                SizedBox(height: 15),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Row(
                    children: [
                      CharacterInfoCintainer(
                        subtitle: widget.characters.gender ?? '',
                        title: 'Пол',
                      ),
                      SizedBox(width: 200),
                      CharacterInfoCintainer(
                        subtitle: widget.characters.species ?? '',
                        title: 'Расса',
                      ),
                    ],
                  ),
                ),
                Column(
                  children: [
                    Row(
                      children: [
                        Column(
                          children: [
                            CharacterInfoCintainer(
                              subtitle: widget.characters.origin?.name ?? '',
                              title: 'Место рождения',
                            ),
                          ],
                        ),
                        Spacer(),
                        Icon(
                          Icons.arrow_right,
                          color: theme.iconTheme.color,
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Column(
                          children: [
                            CharacterInfoCintainer(
                              subtitle: widget.characters.location?.name ?? '',
                              title: 'Местоположение',
                            ),
                          ],
                        ),
                        Spacer(),
                        Icon(
                          Icons.arrow_right,
                          color: theme.iconTheme.color,
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 30),
                Divider(
                  height: 8,
                  color: AppColors.additText,
                ),
                Padding(
                  padding: const EdgeInsets.all(14.0),
                  child: Row(
                    children: [
                      Text(
                        'Эпизоды',
                        style: TextStyle(
                          color: AppColors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SizedBox(width: 180),
                      Text(
                        'Все эпизоды',
                        style: TextStyle(
                          color: AppColors.additText,
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                ),
                BlocBuilder<EpisodeCubit, EpisodeState>(
                  builder: (context, state) {
                    if (state is EpisodeLoading) {
                      return CircularProgressIndicator();
                    } else if (state is EpisodeSuccess) {
                      return ListView.builder(
                       scrollDirection: Axis.vertical,
              shrinkWrap: true,
                        itemCount: state.episodeModel?.results1?.length ?? 0,
                        itemBuilder: (context, index) {
                          final episode = state.episodeModel!.results1![index];
                          return Column(
                            children: [
                              InfoViewWidget(results1: episode, characterImage: widget.characters.image,)
                            ],
                          );
                          // return Column(
                          //   crossAxisAlignment: CrossAxisAlignment.start,
                          //   children: [
                          //     Text(
                          //       'Серия ${episode.name}',
                          //       style: TextStyle(color: Color(0xff22A2BD)),
                          //     ),
                          //     Text(episode.name ?? ''),
                          //   ],
                          // );
                        },
                      );
                    } else if (state is EpisodeError) {
                      return Text('Ошибка загрузки эпизодов');
                    } else {
                      return Container();
                    }
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class InfoViewWidget extends StatelessWidget {
  const InfoViewWidget({
    super.key,
    required this.results1,
    required this.characterImage
  });
  final Results1 results1;
  final String? characterImage;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 14),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: CircleAvatar(
              backgroundImage: NetworkImage(characterImage ?? ''),
              radius: 35,
            ),
          ),
          SizedBox(
            height: 16,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text('Серия ',
                  style: TextStyle(
                    color: AppColors.seriescolor
                  ),
                  ),
                  Text(
                results1.id.toString()   ,
                style: TextStyle(color: AppColors.seriescolor),
              ),
                ],
              ),
              
              SizedBox(
                height: 3,
              ),
              Text(
                results1.name ?? '',
                style: theme.textTheme.bodyLarge?.copyWith(
                  fontWeight: FontWeight.w400,
                  fontSize: 14
                ),
              ),
              SizedBox(
                height: 3,
              ),
              Text(
                '${results1.airDate ?? ''}',
                style: TextStyle(
                  color: AppColors.additText,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
