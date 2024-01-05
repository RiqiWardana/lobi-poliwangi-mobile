import 'package:flutter/material.dart';

class PrestasiListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<Prestasi> prestasiList = fetchPrestasiData();

    return Scaffold(
      backgroundColor: Color(0xFF1C2868),
      appBar: AppBar(
        title: Text('Prestasi Saya'),
        backgroundColor: Color(0xFF1C2868),
      ),
      body: ListView.builder(
        itemCount: prestasiList.length,
        itemBuilder: (context, index) {
          Prestasi prestasi = prestasiList[index];
          return PrestasiCard(prestasi: prestasi);
        },
      ),
    );
  }
}

class Prestasi {
  final String nama;
  final String status;

  Prestasi({required this.nama, required this.status});
}

class PrestasiCard extends StatelessWidget {
  final Prestasi prestasi;

  PrestasiCard({required this.prestasi});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(8.0),
      child: ListTile(
        title: Text(prestasi.nama),
        subtitle: Text('Status: ${prestasi.status}'),
      ),
    );
  }
}

List<Prestasi> fetchPrestasiData() {
  // Data statis, bisa diganti dengan data yang sesuai kebutuhan
  return [
    Prestasi(nama: 'Juara 1 Lomba ABC', status: 'Disetujui'),
    Prestasi(nama: 'Prestasi XYZ', status: 'Belum Disetujui'),
    Prestasi(nama: 'Lomba Flutter', status: 'Disetujui'),
    // Tambahkan data prestasi lainnya sesuai kebutuhan
  ];
}
