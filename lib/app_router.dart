import 'package:breakingbad/core/constans/strings.dart';
import 'package:breakingbad/core/services_locator/services_locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'features/characters/business_logic/cubit/characters_cubit.dart';
import 'features/characters/presentation/screens/chracters_details_screen.dart';
import 'features/characters/presentation/screens/chracters_screen.dart';

class AppRouter {
  AppRouter();

  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case charactersScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
              create: (BuildContext context) =>
                  servicesLocator<CharactersCubit>(),
              child: const CharactersScreen()),
        );
      case charactersDetailsScreen:
        return MaterialPageRoute(builder: (_) => const CharactersDetailsScreen());
    }
    return null;
  }
}
