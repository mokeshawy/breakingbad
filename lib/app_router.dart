
import 'package:breakingbad/core/constans/strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'features/characters/business_logic/cubit/characters_cubit.dart';
import 'features/characters/data/repository/characters_repository.dart';
import 'features/characters/data/web_services/chracters_web_services.dart';
import 'features/characters/presentation/screens/chracters_details_screen.dart';
import 'features/characters/presentation/screens/chracters_screen.dart';

class AppRouter {
  late CharactersRepository charactersRepository;
  late CharactersCubit charactersCubit;

  AppRouter() {
    charactersRepository = CharactersRepository(CharactersWebServices());
    charactersCubit = CharactersCubit(charactersRepository);
  }

  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case charactersScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
              create: (BuildContext context) =>
                  CharactersCubit(charactersRepository),
              child: CharactersScreen()),
        );
      case charactersDetailsScreen:
        return MaterialPageRoute(builder: (_) => CharactersDetailsScreen());
    }
    return null;
  }
}
