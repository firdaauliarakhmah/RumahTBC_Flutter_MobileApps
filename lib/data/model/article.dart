import 'dart:convert';

class Article {
  final int id;
  final String title;
  final String content;
  final String date;
  final String imageURL;
  final String category;
  final String penulis;

  Article(
      {required this.id,
      required this.title,
      required this.content,
      required this.date,
      required this.imageURL,
      required this.category,
      required this.penulis});

  factory Article.fromJson(Map<String, dynamic> json) {
    String jsonStringImg = json['gambar'];
    jsonStringImg = jsonStringImg.replaceAll("'", '"');

    Map<String,dynamic> img= jsonDecode(jsonStringImg);
    return Article(
        id: json['id'],
        title: json['judul'],
        content: json['isi'],
        date: json['tanggal_publikasi'],
        imageURL: img['public_id'],
        category: json['kategori'],
        penulis: json['penulis']);
  }
}