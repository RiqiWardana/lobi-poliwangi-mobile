import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:lobi_poliwangi_mobile/PangajuanPrestasi/ImageHelper.dart';

class FromBeasiswa extends StatefulWidget {
  const FromBeasiswa({super.key});

  @override
  State<FromBeasiswa> createState() => _FromBeasiswaState();
}

class _FromBeasiswaState extends State<FromBeasiswa> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController namaBeasiswaController = TextEditingController();
  TextEditingController linkPendaftaranController = TextEditingController();
  TextEditingController namaInstansiController = TextEditingController();
  TextEditingController persyaratanController = TextEditingController();

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

  ImageHelper image = ImageHelper();
  XFile? selectedImage;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff1C2868),
      appBar: AppBar(
        backgroundColor: Color(0xff1C2868),
        title: Text(
          'Input beasiswa',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Nama Beasiswa
                  Text(
                    'Nama Beasiswa',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                    ),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  TextFormFieldComponent(
                    validationForm: 'Harap Isi Nama Beasiswa',
                    controllerForm: namaBeasiswaController,
                    hintTextField: 'Masukan Nama Beasiswa',
                    regex: RegExp(r'^[a-zA-Z0-9 !@#$%^&*()-_+=]+$'),
                  ),
                  SizedBox(height: 16),

                  // Link Pendaftaran
                  Text(
                    'Link Pendaftaran',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                    ),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  TextFormFieldComponent(
                    validationForm: 'Harap Isi Link Pendaftaran',
                    controllerForm: linkPendaftaranController,
                    hintTextField: 'Masukan Link',
                    regex: RegExp(r'^[a-zA-Z0-9 !@#$%^&*()-_+=]+$'),
                  ),
                  SizedBox(height: 16),

                  // Tanggal Penutupan Regristasi
                  Text(
                    'Tanggal Penutupan Regristasi',
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

                  // Persyaratan
                  Text(
                    'Persyaratan',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                    ),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  TextFormFieldMultipleLineComponent(
                    validationForm: 'Harap Isi Persyaratan',
                    controllerForm: persyaratanController,
                    hintTextField: 'Masukan Persyaratan',
                  ),
                  SizedBox(height: 16),

                  // Nama Instansi
                  Text(
                    'Nama Instansi',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                    ),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  TextFormFieldComponent(
                    validationForm: 'Harap Isi Nama Instansi',
                    controllerForm: namaInstansiController,
                    hintTextField: 'Masukan Nama Instansi',
                    regex: RegExp(r'^[a-zA-Z0-9 !@#$%^&*()-_+=]+$'),
                  ),
                  SizedBox(height: 16),
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
                  selectedImage != null
                      ? Image.file(
                          File(
                            selectedImage!.path,
                          ),
                        )
                      : Center(
                          child: Text(
                            'Harap Upload Foto Beasiswa',
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
                      ),
                    ),
                    onPressed: () {
                      print(namaBeasiswaController.text);
                      print(linkPendaftaranController.text);
                      print(selectedDate);
                      print(persyaratanController.text);
                      print(namaInstansiController.text);
                      print(selectedImage);
                    },
                    child: Text('Simpan'),
                  ),
                ],
              ),
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

class TextFormFieldMultipleLineComponent extends StatelessWidget {
  final String? validationForm;
  final TextEditingController? controllerForm;
  final String? hintTextField;

  TextFormFieldMultipleLineComponent({
    required this.validationForm,
    required this.controllerForm,
    required this.hintTextField,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (value) {
        if (value == null || value.isEmpty) {
          return validationForm;
        }
        return null;
      },
      autovalidateMode: AutovalidateMode.onUserInteraction,
      controller: controllerForm,
      keyboardType: TextInputType.multiline, // Use multiline type
      minLines: 3,
      maxLines: 5, // Allow multiple lines
      obscureText: false,
      textInputAction: TextInputAction.newline, // Enable newline action
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
    home: FromBeasiswa(),
  ));
}
