

import 'package:flutter/material.dart';
import 'package:pokedex/features/common/models/podemon.dart';
import 'package:pokedex/features/pokedex/screens/details/container/details_container.dart';



class HomePage extends StatelessWidget {
  const HomePage ({Key? key, required this.list, required this.onItemTap}) : super(key: key);
  final List<Pokemon> list;
   final Function(String, DetailArguments) onItemTap;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: list.length,
        itemBuilder: (BuildContext context, index){
          return ListTile(
            title: Text(list[index].name),
            onTap: () => onItemTap('/details', DetailArguments(name: list[index].name),),
          );
        }
        ),

    );
  }
}