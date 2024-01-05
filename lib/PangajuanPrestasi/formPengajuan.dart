import 'package:flutter/material.dart';
import 'package:lobi_poliwangi_mobile/Preestasi/ApiModelPrestasi.dart';
import 'package:lobi_poliwangi_mobile/Preestasi/repositoryPrestasi.dart';

class PrestasiMahasiswaForm extends StatefulWidget {
  @override
  _PrestasiMahasiswaFormState createState() => _PrestasiMahasiswaFormState();
}

class _PrestasiMahasiswaFormState extends State<PrestasiMahasiswaForm> {
  // Controller untuk mengontrol input pada form
  TextEditingController idController = TextEditingController();
  TextEditingController nimController = TextEditingController();
  TextEditingController namaMahasiswaController = TextEditingController();
  TextEditingController namaPerlombaanPrestasiController =
      TextEditingController();
  TextEditingController namaPrestasiController = TextEditingController();
  TextEditingController tingkatanController = TextEditingController();
  TextEditingController namaJurusanController = TextEditingController();
  TextEditingController namaProdiController = TextEditingController();
  TextEditingController usernameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Form Mahasiswa'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              TextField(
                controller: idController,
                decoration: InputDecoration(labelText: 'ID'),
                keyboardType: TextInputType.number,
              ),
              TextField(
                controller: nimController,
                decoration: InputDecoration(labelText: 'NIM'),
              ),
              TextField(
                controller: namaMahasiswaController,
                decoration: InputDecoration(labelText: 'Nama Mahasiswa'),
              ),
              TextField(
                controller: namaPerlombaanPrestasiController,
                decoration:
                    InputDecoration(labelText: 'Nama Perlombaan Prestasi'),
              ),
              TextField(
                controller: namaPrestasiController,
                decoration: InputDecoration(labelText: 'Nama Prestasi'),
              ),
              TextField(
                controller: tingkatanController,
                decoration: InputDecoration(labelText: 'Tingkatan'),
              ),
              TextField(
                controller: namaJurusanController,
                decoration: InputDecoration(labelText: 'Nama Jurusan'),
              ),
              TextField(
                controller: namaProdiController,
                decoration: InputDecoration(labelText: 'Nama Prodi'),
              ),
              TextField(
                controller: usernameController,
                decoration: InputDecoration(labelText: 'Username'),
              ),
              SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  PrestasiMahasiswa prestasiMahasiswa = PrestasiMahasiswa(
                    id: int.parse(idController.text),
                    nim: nimController.text,
                    namaMahasiswa: namaMahasiswaController.text,
                    prestasi: Prestasi(
                      namaPerlombaanPrestasi:
                          namaPerlombaanPrestasiController.text,
                      namaPrestasi: namaPrestasiController.text,
                      tingkatan: Tingkatan(tingkatan: tingkatanController.text),
                    ),
                    jurusan: Jurusan(
                      namaJurusan: namaJurusanController.text,
                      prodi: Prodi(namaProdi: namaProdiController.text),
                    ),
                    accountAdmin:
                        AccountAdmin(id: 1, username: usernameController.text),
                    createdAt: DateTime.now(),
                  );

                  // Lakukan sesuatu dengan objek prestasiMahasiswa, misalnya mengirimnya ke API
                  // atau menyimpannya ke database.
                },
                child: Text('Simpan'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: PrestasiMahasiswaForm(),
  ));
}
