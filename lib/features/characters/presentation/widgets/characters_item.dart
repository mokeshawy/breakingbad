import 'package:breakingbad/core/constans/colors.dart';
import 'package:breakingbad/features/characters/data/models/response/characters_response_dto.dart';
import 'package:flutter/material.dart';

class CharactersItem extends StatelessWidget {
  final Results result;

  const CharactersItem({Key? key, required this.result}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsetsDirectional.fromSTEB(8, 8, 8, 8),
      padding: EdgeInsetsDirectional.all(4),
      decoration: BoxDecoration(
          color: MyColors.grey, borderRadius: BorderRadius.circular(8)),
      child: GridTile(
        child: Container(
          color: MyColors.grey,
          child: result.image!.isNotEmpty ? FadeInImage.assetNetwork(
            width: double.infinity,
            height: double.infinity,
            placeholder: 'assets/images/loading.gif',
            image: result.image!,
            fit: BoxFit.cover,
          ) : Image.asset('assets/images/loading.gif'),
        ),
      ),
    );
  }
}
