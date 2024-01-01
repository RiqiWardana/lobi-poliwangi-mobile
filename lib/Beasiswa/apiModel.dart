class Beasiswa {
  int id;
  String namaBeasiswa;
  InstansiBeasiswa instansiBeasiswa;
  String persyaratan;
  String linkPendaftaran;
  DateTime tanggalPenutupan;
  Status status;
  Tingkatan tingkatan;
  AccountAdmin accountAdmin;
  DateTime createdAt;
  Beasiswa({
    required this.id,
    required this.namaBeasiswa,
    required this.instansiBeasiswa,
    required this.persyaratan,
    required this.linkPendaftaran,
    required this.tanggalPenutupan,
    required this.status,
    required this.tingkatan,
    required this.accountAdmin,
    required this.createdAt,
  });

  factory Beasiswa.fromJson(Map<String, dynamic> json) => Beasiswa(
        id: json["id"],
        namaBeasiswa: json["nama_beasiswa"],
        instansiBeasiswa: InstansiBeasiswa.fromJson(json["instansi_beasiswa"]),
        persyaratan: json["persyaratan"],
        linkPendaftaran: json["link_pendaftaran"],
        tanggalPenutupan: DateTime.parse(json["tanggal_penutupan"]),
        status: Status.fromJson(json["status"]),
        tingkatan: Tingkatan.fromJson(json["tingkatan"]),
        accountAdmin: AccountAdmin.fromJson(json["account_admin"]),
        createdAt: DateTime.parse(json["created_at"]),
      );
  bool isAktif() {
    return DateTime.now().isBefore(tanggalPenutupan);
  }

  final List<Beasiswa> kategoriBeasiswa = [];
  bool matchFilter(String filter) {
    switch (filter) {
      case 'Aktif':
        return isAktif();
      case 'Tidak Aktif':
        return !isAktif();
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

class InstansiBeasiswa {
  String namaInstansiBeasiswa;

  InstansiBeasiswa({
    required this.namaInstansiBeasiswa,
  });

  factory InstansiBeasiswa.fromJson(Map<String, dynamic> json) =>
      InstansiBeasiswa(
        namaInstansiBeasiswa: json["nama_instansi_beasiswa"],
      );

  Map<String, dynamic> toJson() => {
        "nama_instansi_beasiswa": namaInstansiBeasiswa,
      };
}

class Status {
  String status;

  Status({
    required this.status,
  });

  factory Status.fromJson(Map<String, dynamic> json) => Status(
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
        "status": status,
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
