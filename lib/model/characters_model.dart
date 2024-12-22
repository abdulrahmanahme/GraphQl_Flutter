// To parse this JSON data, do
//
//     final charactersModel = charactersModelFromJson(jsonString);

import 'dart:convert';

CharactersModel charactersModelFromJson(String str) => CharactersModel.fromJson(json.decode(str));

String charactersModelToJson(CharactersModel data) => json.encode(data.toJson());

class CharactersModel {
    String typename;
    Characters characters;

    CharactersModel({
        required this.typename,
        required this.characters,
    });

    factory CharactersModel.fromJson(Map<String, dynamic> json) => CharactersModel(
        typename: json["__typename"],
        characters: Characters.fromJson(json["characters"]),
    );

    Map<String, dynamic> toJson() => {
        "__typename": typename,
        "characters": characters.toJson(),
    };
}

class Characters {
    String typename;
    Info info;
    List<Result> results;

    Characters({
        required this.typename,
        required this.info,
        required this.results,
    });

    factory Characters.fromJson(Map<String, dynamic> json) => Characters(
        typename: json["__typename"],
        info: Info.fromJson(json["info"]),
        results: List<Result>.from(json["results"].map((x) => Result.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "__typename": typename,
        "info": info.toJson(),
        "results": List<dynamic>.from(results.map((x) => x.toJson())),
    };
}

class Info {
    String typename;
    int count;
    int pages;
    int next;
    int prev;

    Info({
        required this.typename,
        required this.count,
        required this.pages,
        required this.next,
        required this.prev,
    });

    factory Info.fromJson(Map<String, dynamic> json) => Info(
        typename: json["__typename"],
        count: json["count"],
        pages: json["pages"],
        next: json["next"],
        prev: json["prev"],
    );

    Map<String, dynamic> toJson() => {
        "__typename": typename,
        "count": count,
        "pages": pages,
        "next": next,
        "prev": prev,
    };
}

class Result {
    String typename;
    // int id;
    String name;
    String status;
    String species;
    String type;
    String gender;
    String image;
    DateTime created;

    Result({
        required this.typename,
        // required this.id,
        required this.name,
        required this.status,
        required this.species,
        required this.type,
        required this.gender,
        required this.image,
        required this.created,
    });

    factory Result.fromJson(Map<String, dynamic> json) => Result(
        typename: json["__typename"],
        // id: json["id"],
        name: json["name"],
        status: json["status"],
        species: json["species"],
        type: json["type"],
        gender: json["gender"],
        image: json["image"],
        created: DateTime.parse(json["created"]),
    );

    Map<String, dynamic> toJson() => {
        "__typename": typename,
        // "id": id,
        "name": name,
        "status": status,
        "species": species,
        "type": type,
        "gender": gender,
        "image": image,
        "created": created.toIso8601String(),
    };
}
