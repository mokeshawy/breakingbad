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
      margin: const EdgeInsetsDirectional.fromSTEB(8, 8, 8, 8),
      padding: const EdgeInsetsDirectional.all(4),
      decoration: BoxDecoration(
          color: MyColors.grey, borderRadius: BorderRadius.circular(8)),
      child: GridTile(
        footer: Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          color: Colors.black54,
          alignment: Alignment.bottomCenter,
          child: titleText("${result.name}"),
        ),
        child: Container(
          color: MyColors.grey,
          child: result.image!.isNotEmpty
              ? fadeInImageResource(result.image ?? "")
              : Image.asset('assets/images/placeholder.png'),
        ),
      ),
    );
  }

  Text titleText(String name) {
    return Text(
      name,
      style: const TextStyle(
          height: 1.3,
          fontSize: 16,
          color: MyColors.white,
          fontWeight: FontWeight.bold),
      overflow: TextOverflow.ellipsis,
      maxLines: 2,
      textAlign: TextAlign.center,
    );
  }

  FadeInImage fadeInImageResource(String image) {
    return FadeInImage.assetNetwork(
      width: double.infinity,
      height: double.infinity,
      placeholder: 'assets/images/loading.gif',
      image: image,
      fit: BoxFit.cover,
    );
  }
}
