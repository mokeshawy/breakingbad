import 'package:breakingbad/core/constans/colors.dart';
import 'package:breakingbad/features/characters/business_logic/cubit/characters_cubit.dart';
import 'package:breakingbad/features/characters/presentation/widgets/characters_item_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/models/response/characters_response_dto.dart';
import '../widgets/icon_button_widget.dart';

class CharactersScreen extends StatefulWidget {
  const CharactersScreen({super.key});

  @override
  _CharactersScreenState createState() => _CharactersScreenState();
}

class _CharactersScreenState extends State<CharactersScreen> {
  late List<Results> results;

  late List<Results> searchedResults;
  bool isSearching = false;
  final searchTextController = TextEditingController();

  @override
  void initState() {
    super.initState();
    BlocProvider.of<CharactersCubit>(context).getAllCharacters();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: MyColors.yellow,
        title: isSearching ? buildSearchFiled() : buildAppBarTitle(),
        actions: buildAppBarActions(),
      ),
      body: builderBlocWidget(),
    );
  }

  Widget buildAppBarTitle() {
    return const Text('Characters', style: TextStyle(color: MyColors.grey));
  }

  Widget buildSearchFiled() {
    return TextField(
      controller: searchTextController,
      cursorColor: MyColors.grey,
      decoration: const InputDecoration(
          hintText: 'Find a character...',
          border: InputBorder.none,
          hintStyle: TextStyle(color: MyColors.grey, fontSize: 16)),
      style: const TextStyle(color: MyColors.grey, fontSize: 16),
      onChanged: (searchedCharacter) {
        addSearchedForItemsToSearchedList(searchedCharacter);
      },
    );
  }

  void addSearchedForItemsToSearchedList(String searchedCharacter) {
    searchedResults = results
        .where((character) =>
            character.name!.toLowerCase().startsWith(searchedCharacter))
        .toList();
    setState(() {});
  }

  List<Widget> buildAppBarActions() {
    if (isSearching) {
      return [
        iconButton(Icons.clear, MyColors.grey, onPressed: () {
          clearSearch();
          Navigator.pop(context);
        })
      ];
    }
    return [
      iconButton(Icons.search, MyColors.grey, onPressed: () {
        startSearch();
      })
    ];
  }

  void startSearch() {
    ModalRoute.of(context)
        ?.addLocalHistoryEntry(LocalHistoryEntry(onRemove: stopSearching));
    setState(() {
      isSearching = true;
    });
  }

  void stopSearching() {
    clearSearch();
    setState(() {
      isSearching = false;
    });
  }

  void clearSearch() {
    setState(() {
      searchTextController.clear();
    });
  }

  Widget builderBlocWidget() {
    return BlocBuilder<CharactersCubit, CharactersState>(
        builder: (context, state) {
      if (state is CharactersLoaded) {
        results = (state).charactersResponseDto.results ?? [];
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
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 2 / 3,
          crossAxisSpacing: 1,
          mainAxisSpacing: 1,
        ),
        shrinkWrap: true,
        physics: const ClampingScrollPhysics(),
        padding: EdgeInsets.zero,
        itemCount: handleCharacterItemCount(),
        itemBuilder: (context, index) {
          return CharactersItem(result: setCharactersItems(index));
        });
  }

  int handleCharacterItemCount() {
    if (searchTextController.text.isEmpty) {
      return results.length;
    }
    return searchedResults.length;
  }

  Results setCharactersItems(int index) {
    if (searchTextController.text.isEmpty) {
      return results[index];
    }
    return searchedResults[index];
  }

  Widget showLoadingIndicator() =>
      const Center(child: CircularProgressIndicator(color: MyColors.yellow));
}
