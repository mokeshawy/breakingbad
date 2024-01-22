import 'package:breakingbad/core/services_locator/services_locator.dart';
import 'package:breakingbad/features/characters/business_logic/cubit/characters_cubit.dart';
import 'package:breakingbad/features/characters/data/data_soruce/characters_data_soruce_impl.dart';
import 'package:breakingbad/features/characters/data/repository/characters_repository_impl.dart';
import 'package:breakingbad/features/characters/domain/data_soruce/characters_data_soruce.dart';
import 'package:breakingbad/features/characters/domain/repository/characters_repository.dart';
import 'package:breakingbad/features/characters/domain/use_case/characters_usecase.dart';

Future<void> setUpCharactersDependencies() async {
  // Characters Data Source Dependencies
  servicesLocator.registerFactory<CharactersDataSource>(
      () => CharactersDataSourceImpl(servicesLocator()));

  // Characters Repository Dependencies
  servicesLocator.registerFactory<CharactersRepository>(
      () => CharactersRepositoryImpl(servicesLocator()));

  // Characters UseCase Dependencies
  servicesLocator.registerFactory(
      () => CharactersUseCase(servicesLocator()));

  // Characters Cubit Dependencies
  servicesLocator.registerFactory(() => CharactersCubit(servicesLocator()));
}
