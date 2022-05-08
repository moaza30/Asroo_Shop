// To parse this JSON data, do
//
//     final quranModel = quranModelFromJson(jsonString);

import 'dart:convert';

QuranModel quranModelFromJson(String str) =>
    QuranModel.fromJson(json.decode(str));

String quranModelToJson(QuranModel data) => json.encode(data.toJson());

class QuranModel {
  QuranModel({
    required this.verses,
    required this.meta,
  });

  List<Verse> verses;
  Meta meta;

  factory QuranModel.fromJson(Map<String, dynamic> json) => QuranModel(
        verses: List<Verse>.from(json["verses"].map((x) => Verse.fromJson(x))),
        meta: Meta.fromJson(json["meta"]),
      );

  Map<String, dynamic> toJson() => {
        "verses": List<dynamic>.from(verses.map((x) => x.toJson())),
        "meta": meta.toJson(),
      };
}

class Meta {
  Meta({
    required this.filters,
  });

  Filters filters;

  factory Meta.fromJson(Map<String, dynamic> json) => Meta(
        filters: Filters.fromJson(json["filters"]),
      );

  Map<String, dynamic> toJson() => {
        "filters": filters.toJson(),
      };
}

class Filters {
  Filters({
    required this.juzNumber,
    required this.chapterNumber,
  });

  String juzNumber;
  String chapterNumber;

  factory Filters.fromJson(Map<String, dynamic> json) => Filters(
        juzNumber: json["juz_number"],
        chapterNumber: json["chapter_number"],
      );

  Map<String, dynamic> toJson() => {
        "juz_number": juzNumber,
        "chapter_number": chapterNumber,
      };
}

class Verse {
  Verse({
    required this.id,
    required this.verseKey,
    required this.textIndopak,
  });

  int id;
  String verseKey;
  String textIndopak;

  factory Verse.fromJson(Map<String, dynamic> json) => Verse(
        id: json["id"],
        verseKey: json["verse_key"],
        textIndopak: json["text_indopak"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "verse_key": verseKey,
        "text_indopak": textIndopak,
      };
}
