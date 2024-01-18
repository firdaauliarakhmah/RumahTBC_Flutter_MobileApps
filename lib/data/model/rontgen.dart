import 'dart:convert';

class Rontgen {
  final int id;
  final String nik;
  final String hospital;
  final String date;
  final String doctor;
  final String imageURL;
  final String analisa;

  Rontgen(
      {required this.id,
      required this.nik,
      required this.hospital,
      required this.date,
      required this.doctor,
      required this.imageURL,
      required this.analisa,
      });

  factory Rontgen.fromJson(Map<String, dynamic> json) {
    String jsonStringImg = json['gambar_rontgen'];
    jsonStringImg = jsonStringImg.replaceAll("'", '"');

    Map<String,dynamic> img= jsonDecode(jsonStringImg);

    return Rontgen(
        id: json['id'],
        nik: json['nik'],
        hospital: json['nama_rumah_sakit'],
        date: json['tanggal_pemeriksaan'],
        doctor: json['dokter'],
        imageURL: img['public_id'],
        analisa: json['hasil_analisa'],
        );
  }
}
