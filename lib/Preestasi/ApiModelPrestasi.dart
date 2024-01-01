class prestasiMahasiswa {
  int id;
  String nim;
  String namaMahasiswa;
  Prestasi prestasi;
  Jurusan jurusan;
  AccountAdmin accountAdmin;
  DateTime createdAt;

  prestasiMahasiswa({
    required this.id,
    required this.nim,
    required this.namaMahasiswa,
    required this.prestasi,
    required this.jurusan,
    required this.accountAdmin,
    required this.createdAt,
  });

  factory prestasiMahasiswa.fromJson(Map<String, dynamic> json) =>
      prestasiMahasiswa(
        id: json["id"],
        nim: json["nim"],
        namaMahasiswa: json["nama_mahasiswa"],
        prestasi: Prestasi.fromJson(json["prestasi"]),
        jurusan: Jurusan.fromJson(json["jurusan"]),
        accountAdmin: AccountAdmin.fromJson(json["account_admin"]),
        createdAt: DateTime.parse(json["created_at"]),
      );
  final List<prestasiMahasiswa> kategoriBeasiswa = [];
  bool matchFilter(String filter) {
    switch (filter) {
      case 'Terbaru':
      case 'Terlama':
      default:
        return true;
    }
  }
  
}

class AccountAdmin {
  int id;
  String username;

  AccountAdmin({
    required this.id,
    required this.username,
  });

  factory AccountAdmin.fromJson(Map<String, dynamic> json) => AccountAdmin(
        id: json["id"],
        username: json["username"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "username": username,
      };
}


class Jurusan {
  String namaJurusan;
  Prodi prodi;

  Jurusan({
    required this.namaJurusan,
    required this.prodi,
  });

  factory Jurusan.fromJson(Map<String, dynamic> json) => Jurusan(
        namaJurusan: json["nama_jurusan"],
        prodi: Prodi.fromJson(json["prodi"]),
      );

  Map<String, dynamic> toJson() => {
        "nama_jurusan": namaJurusan,
        "prodi": prodi.toJson(),
      };
}

class Prodi {
  String namaProdi;

  Prodi({
    required this.namaProdi,
  });

  factory Prodi.fromJson(Map<String, dynamic> json) => Prodi(
        namaProdi: json["nama_prodi"],
      );

  Map<String, dynamic> toJson() => {
        "nama_prodi": namaProdi,
      };
}

class Prestasi {
  String namaPerlombaanPrestasi;
  String namaPrestasi;
  Tingkatan tingkatan;

  Prestasi({
    required this.namaPerlombaanPrestasi,
    required this.namaPrestasi,
    required this.tingkatan,
  });

  factory Prestasi.fromJson(Map<String, dynamic> json) => Prestasi(
        namaPerlombaanPrestasi: json["nama_perlombaan_prestasi"],
        namaPrestasi: json["nama_prestasi"],
        tingkatan: Tingkatan.fromJson(json["tingkatan"]),
      );

  Map<String, dynamic> toJson() => {
        "nama_perlombaan_prestasi": namaPerlombaanPrestasi,
        "nama_prestasi": namaPrestasi,
        "tingkatan": tingkatan.toJson(),
      };
}

class Tingkatan {
  String tingkatan;

  Tingkatan({
    required this.tingkatan,
  });

  factory Tingkatan.fromJson(Map<String, dynamic> json) => Tingkatan(
        tingkatan: json["tingkatan"],
      );

  Map<String, dynamic> toJson() => {
        "tingkatan": tingkatan,
      };
}
