import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:graph_ql_flutter/Queryes/characters_query.dart';
import 'package:graph_ql_flutter/home_screen/person_card.dart';
import 'package:graph_ql_flutter/model/characters_model.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  CharactersModel? charactersModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Query(
        options: QueryOptions(
          document: gql(charactersQuery),
        ),
        builder: (QueryResult result,
            {VoidCallback? refetch, FetchMore? fetchMore}) {
          if (result.isLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          if (result.hasException) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(
                  child: Text(
                result.exception!.toString(),
                textAlign: TextAlign.center,
              )),
            );
          }

          if (result.data != null) {
            charactersModel = CharactersModel.fromJson(result.data!);
          }
          return ListView.builder(
              itemCount: charactersModel?.characters.results.length,
              itemBuilder: (context, index) {
                var item = charactersModel?.characters.results;
                final characterData = item![index];
                log('ss${characterData.name}');

                return Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: PersonCard(
                    name: characterData.name,
                    image: characterData.image,
                    type: characterData.type,
                  ),
                );
              });
        },
      ),
    );
  }
}
