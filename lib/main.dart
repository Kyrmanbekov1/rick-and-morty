import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:rick_and_morty/core/config/dio_settings.dart';
import 'package:rick_and_morty/features/charecter_screen/data/repositories/character_repository.dart';
import 'package:rick_and_morty/features/charecter_screen/domain/character_repository_model.dart';
import 'package:rick_and_morty/features/charecter_screen/domain/get_character_data_use_case.dart';
import 'package:rick_and_morty/features/charecter_screen/presenntation/cubit/character_cubit.dart';
import 'package:rick_and_morty/features/charecter_screen/presenntation/screens/splashscreen.dart';
import 'package:rick_and_morty/theme/theme.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ThemeProvider(),
      child: Builder(builder: (context) {
        return TextFieldUnfocus(
          child: MultiRepositoryProvider(
            providers: [
              RepositoryProvider(
                create: (context) => DioSettings(),
              ),
              RepositoryProvider(
                create: (context) => GetCharactersDataUseCase(dio: RepositoryProvider.of<DioSettings>(context).dio),
              ),
               RepositoryProvider(
                create: (context) => CharacterRepositoryImpl(useCase: RepositoryProvider.of<GetCharactersDataUseCase>(context)),
              ),
              
            ],
            child: MultiBlocProvider(
              providers: [
                BlocProvider<CharacterCubit>(
                  create: (context) => CharacterCubit(repository: RepositoryProvider.of<CharacterRepositoryImpl>(context)),
                ),
              ],
              child: MaterialApp(
                theme: context.watch<ThemeProvider>().theme,
                debugShowCheckedModeBanner: false,
                home: Splash(),
              ),
            ),
          ),
        );
      }),
    );
  }
}

class TextFieldUnfocus extends StatelessWidget {
  const TextFieldUnfocus({super.key, required this.child});
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: () {
        FocusScopeNode currentFocus = FocusScope.of(context);
        if (!currentFocus.hasPrimaryFocus &&
            currentFocus.focusedChild != null) {
          currentFocus.focusedChild!.unfocus();
        }
      },
      child: child,
    );
  }
}
