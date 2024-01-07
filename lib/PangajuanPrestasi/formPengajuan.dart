import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:lobi_poliwangi_mobile/PangajuanPrestasi/ImageHelper.dart';
import 'package:lobi_poliwangi_mobile/Preestasi/ApiModelPrestasi.dart';
import 'package:lobi_poliwangi_mobile/Preestasi/repositoryPrestasi.dart';

class PrestasiMahasiswaForm extends StatefulWidget {
  @override
  _PrestasiMahasiswaFormState createState() => _PrestasiMahasiswaFormState();
}

class _PrestasiMahasiswaFormState extends State<PrestasiMahasiswaForm> {
  // Controller untuk mengontrol input pada form
  TextEditingController namaMahasiswaController = TextEditingController();
  TextEditingController NIMMahasiswaController = TextEditingController();
  TextEditingController prestasiMahasiswaController = TextEditingController();
  TextEditingController namaPerlombaanPrestasiController =
      TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  ImageHelper image = ImageHelper();
  XFile? selectedImage;

  DateTime selectedDate = DateTime.now();
  final DateFormat _dateFormat = DateFormat('dd/MM/yy');
  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );

    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

  String selectedValue = 'TRPL';
  List<String> options = ['TRPL', 'TRK', 'BSD', 'Lainnya'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff1C2868),
      appBar: AppBar(
        backgroundColor: Color(0xff1C2868),
        title: Text(
          'Prestasi',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Nama Mahasiswa
                Text(
                  'Nama Mahasiswa',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                  ),
                ),
                SizedBox(
                  height: 8,
                ),
                TextFormFieldComponent(
                  validationForm: 'Harap Isi Nama Mahasiswa',
                  controllerForm: namaMahasiswaController,
                  hintTextField: 'Masukan Nama Mahasiswa',
                  regex: RegExp(r'^[a-zA-Z0-9 !@#$%^&*()-_+=]+$'),
                ),
                SizedBox(height: 16),

                //NIM
                Text(
                  'NIM ',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                  ),
                ),
                SizedBox(
                  height: 8,
                ),
                TextFormFieldComponent(
                  validationForm: 'Harap Isi NIM Mahasiswa ',
                  controllerForm: NIMMahasiswaController,
                  hintTextField: 'Masukan NIM Mahasiswa',
                  regex: RegExp(r'^[0-9]+$'),
                ),
                SizedBox(height: 16),
                Text(
                  'Prodi',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                  ),
                ),
                SizedBox(
                  height: 8,
                ),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white70,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: DropdownButton<String>(
                    isExpanded: true,
                    value: selectedValue,
                    dropdownColor: Colors.white,
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    onChanged: (newValue) {
                      setState(() {
                        selectedValue = newValue!;
                      });
                    },
                    items: options.map((option) {
                      return DropdownMenuItem<String>(
                        value: option,
                        child: Text(option),
                      );
                    }).toList(),
                  ),
                ),
                SizedBox(
                  height: 16,
                ),

                //prestasi mahasiswa
                Text(
                  'Prestasi Mahasiswa',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                  ),
                ),
                SizedBox(
                  height: 8,
                ),
                TextFormFieldComponent(
                  validationForm: 'Harap Isi Prestasi Mahasiswa',
                  controllerForm: prestasiMahasiswaController,
                  hintTextField: 'Masukan Prestasi Mahasiswa',
                  regex: RegExp(r'^[a-zA-Z0-9 !@#$%^&*()-_+=]+$'),
                ),
                SizedBox(height: 16),

                //Nama Perlombaan
                Text(
                  'Nama Perlombaan',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                  ),
                ),
                SizedBox(
                  height: 8,
                ),
                TextFormFieldComponent(
                  validationForm: 'Harap Isi Nama Perlombaan',
                  controllerForm: namaPerlombaanPrestasiController,
                  hintTextField: 'Masukan Nama Perlombaan',
                  regex: RegExp(r'^[a-zA-Z0-9 !@#$%^&*()-_+=]+$'),
                ),
                SizedBox(height: 16),

                Text(
                  'Tanggal Prestasi',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                  ),
                ),
                SizedBox(
                  height: 8,
                ),
                Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 4,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: Colors.white70,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        '${_dateFormat.format(selectedDate)}',
                        style: TextStyle(fontSize: 16.0),
                      ),
                      SizedBox(height: 20.0),
                      IconButton(
                        onPressed: () {
                          _selectDate(context);
                        },
                        icon: Icon(Icons.calendar_month_rounded),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 16),
                Text(
                  'Foto Mahasiswa',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                  ),
                ),
                SizedBox(
                  height: 8,
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    fixedSize: Size(MediaQuery.of(context).size.width, 30),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  onPressed: () async {
                    final XFile? file = await image.pickImage();
                    setState(() {
                      selectedImage = file;
                    });
                    // image.pickImage();
                  },
                  child: Text(
                    'Pilih Dari Gallery',
                  ),
                ),
                SizedBox(
                  height: 8,
                ),
                selectedImage != null
                    ? Image.file(File(selectedImage!.path))
                    : Center(
                        child: Text(
                          'Harap Upload Foto Mahasiswa',
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ),
                SizedBox(
                  height: 16,
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      fixedSize: Size(MediaQuery.of(context).size.width, 32),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      )),
                  onPressed: () {
                    print(namaMahasiswaController.text);
                    print(NIMMahasiswaController.text);
                    print(prestasiMahasiswaController.text);
                    print(namaPerlombaanPrestasiController.text);
                    print(selectedDate);
                    print(selectedImage);
                    print(selectedValue);
                    // PrestasiMahasiswa prestasiMahasiswa = PrestasiMahasiswa(
                    //   id: int.parse(idController.text),
                    //   nim: nimController.text,
                    //   namaMahasiswa: namaMahasiswaController.text,
                    //   prestasi: Prestasi(
                    //     namaPerlombaanPrestasi:
                    //         namaPerlombaanPrestasiController.text,
                    //     namaPrestasi: namaPrestasiController.text,
                    //     tingkatan: Tingkatan(tingkatan: tingkatanController.text),
                    //   ),
                    //   jurusan: Jurusan(
                    //     namaJurusan: namaJurusanController.text,
                    //     prodi: Prodi(namaProdi: namaProdiController.text),
                    //   ),
                    //   accountAdmin:
                    //       AccountAdmin(id: 1, username: usernameController.text),
                    //   createdAt: DateTime.now(),
                    // );

                    // Lakukan sesuatu dengan objek prestasiMahasiswa, misalnya mengirimnya ke API
                    // atau menyimpannya ke database.
                  },
                  child: Text('Simpan'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class TextFormFieldComponent extends StatelessWidget {
  final String? validationForm;
  final TextEditingController? controllerForm;
  final String? hintTextField;
  RegExp? regex;
  TextFormFieldComponent(
      {required this.validationForm,
      required this.controllerForm,
      required this.hintTextField,
      required this.regex,
      super.key});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (value) {
        if (value == null || value.isEmpty) {
          return validationForm;
        }
        return null;
      },
      inputFormatters: [
        FilteringTextInputFormatter.allow(regex!),
      ],
      autovalidateMode: AutovalidateMode.onUserInteraction,
      controller: controllerForm,
      keyboardType: TextInputType.text,
      obscureText: false,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.all(16.0),
        filled: true,
        fillColor: Colors.white70,
        hintText: hintTextField,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(12),
          ),
          gapPadding: 2.0,
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.grey.shade400,
            width: 2,
          ),
          borderRadius: BorderRadius.all(
            Radius.circular(12),
          ),
          gapPadding: 2.0,
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.grey.shade400,
            width: 2,
          ),
          borderRadius: BorderRadius.all(
            Radius.circular(12),
          ),
          gapPadding: 2.0,
        ),
        errorStyle: TextStyle(
          color: Colors.red.shade200,
        ),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.red.shade400,
            width: 2,
          ),
          borderRadius: BorderRadius.all(
            Radius.circular(12),
          ),
          gapPadding: 2.0,
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
