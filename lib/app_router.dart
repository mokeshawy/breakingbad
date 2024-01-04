import 'package:breakingbad/characters/business_logic/cubit/characters_cubit.dart';
import 'package:breakingbad/characters/data/repository/characters_repository.dart';
import 'package:breakingbad/characters/data/web_services/chracters_web_services.dart';
import 'package:breakingbad/characters/presentation/screens/chracters_details_screen.dart';
import 'package:breakingbad/characters/presentation/screens/chracters_screen.dart';
import 'package:breakingbad/core/constans/strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppRouter {
  late CharcatersRepository charcatersRepository;
  late CharactersCubit charactersCubit;

  AppRouter() {
    charcatersRepository = CharcatersRepository(CharactersWebServices());
    charactersCubit = CharactersCubit(charcatersRepository);
  }

  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case charactersScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
              create: (BuildContext context) =>
                  CharactersCubit(charcatersRepository),
              child: ChractersScreen()),
        );
      case charactersDetailsScreen:
        return MaterialPageRoute(builder: (_) => CharactersDetailsScreen());
    }
    return null;
  }
}
