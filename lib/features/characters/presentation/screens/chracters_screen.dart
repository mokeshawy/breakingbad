import 'package:breakingbad/core/constans/colors.dart';
import 'package:breakingbad/features/characters/business_logic/cubit/characters_cubit.dart';
import 'package:breakingbad/features/characters/presentation/widgets/characters_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/models/response/characters_response_dto.dart';

class CharactersScreen extends StatefulWidget {
  const CharactersScreen({super.key});

  @override
  _CharactersScreenState createState() => _CharactersScreenState();
}

class _CharactersScreenState extends State<CharactersScreen> {
  late CharactersResponseDto charactersResponseDto;

  @override
  void initState() {
    super.initState();
    charactersResponseDto =
        BlocProvider.of<CharactersCubit>(context).getAllCharacters();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: MyColors.yellow,
        title: Text('Characters', style: TextStyle(color: MyColors.grey)),
      ),
      body: builderBlocWidget(),
    );
  }

  Widget builderBlocWidget() {
    return BlocBuilder<CharactersCubit, CharactersState>(
        builder: (context, state) {
      if (state is CharactersLoaded) {
        charactersResponseDto = (state).charactersResponseDto;
        return buildLoadedListWidgets();
      } else {
        return showLoadingIndicator();
      }
    });
  }

  Widget buildLoadedListWidgets() {
    return SingleChildScrollView(
      child: Container(
        color: MyColors.grey,
        child: Column(
          children: [
            buildCharactersList(),
          ],
        ),
      ),
    );
  }

  Widget buildCharactersList() {
    return GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 2 / 3,
          crossAxisSpacing: 1,
          mainAxisSpacing: 1,
        ),
        shrinkWrap: true,
        physics: const ClampingScrollPhysics(),
        padding: EdgeInsets.zero,
        itemCount: charactersResponseDto.results?.length,
        itemBuilder: (context, index) {
          charactersResponseDto.results?.forEach((element) {});
          //TODO NOT DONE
          return CharactersItem(
              result: getResult(charactersResponseDto.results));
        });
  }
}

Widget showLoadingIndicator() {
  return const Center(child: CircularProgressIndicator(color: MyColors.yellow));
}

Results getResult(List<Results>? result) {
  Results? _result;
  result?.forEach((element) {
    _result = element;
  });
  return _result!;
}
