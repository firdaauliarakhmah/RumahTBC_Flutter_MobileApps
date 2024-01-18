class UserData {
  // final int id;
  final String? nik;
  final String? name;
  final String? noTelp;
  final String? email;
  final String? alamat;
  final String? imageProfile;
  final String? jk;
  final String? tanggalLahir;

  UserData({
    // required this.id,
    required this.nik,
    required this.name,
    required this.noTelp,
    required this.email,
    required this.alamat,
    required this.imageProfile,
    required this.jk,
    required this.tanggalLahir
    });


  factory UserData.fromJson(Map<String, dynamic> json) {
    return UserData(
      // id: json['id'],
      nik: json['nik'],
      name: json['nama_lengkap'],
      noTelp: json['no_hp'],
      email: json['email'],
      alamat: json['alamat'],
      imageProfile: json['gambar'],
      jk: json['jenis_kelamin'],
      tanggalLahir: json['tanggal_lahir']
    );
  }
}