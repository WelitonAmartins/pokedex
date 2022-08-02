import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:pokedex/features/common/error/failure.dart';
import 'package:pokedex/features/common/models/podemon.dart';
import 'package:pokedex/features/common/repository/pokemon_repository.dart';
import 'package:pokedex/features/common/widgets/po_error.dart';
import 'package:pokedex/features/common/widgets/po_loaging.dart';
import 'package:pokedex/features/pokedex/screens/details/pages/detail_page.dart';

class DetailArguments {
   DetailArguments({required this.name});

  final String name;
}

class DetailContainer extends StatelessWidget {
  const DetailContainer({Key? key, required this.repository, required this.arguments}) : super(key: key);
  final IPokemonRepository repository;
  final DetailArguments arguments;

 @override
  Widget build(BuildContext context) {
    
    return FutureBuilder<List<Pokemon>>(
      future: repository.getAllPokemons(),
      builder: (context, snapshot) {
      if (snapshot.connectionState == ConnectionState.waiting) {
        return PoLoading();
      }
      if (snapshot.connectionState == ConnectionState.done &&
          snapshot.hasData) {
        return DetailPage(name: arguments.name);
      }

      if (snapshot.hasError) {
        return PoError(error: (snapshot.error as Failure).message!);
      }
      return Container();
    });
  }
}