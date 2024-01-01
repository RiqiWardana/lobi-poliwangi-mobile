import 'dart:convert';
import 'ApiModelPrestasi.dart';
import 'package:http/http.dart' as http;

class ApirepositoryBeasiswa {
  String urlApi = 'http://127.0.0.1:8000/api/get-data-prestasi-all';
  Future getData() async {
    try {
      final response = await http.get(Uri.parse(urlApi));
      if (response.statusCode == 200) {
        Iterable itbeasiswa = jsonDecode(response.body)['data'];
        List<prestasiMahasiswa> repoBeasiswa =
            itbeasiswa.map((e) => prestasiMahasiswa.fromJson(e)).toList();
        return repoBeasiswa;
      }
    } catch (e, stackTrace) {
      print('Terjadi kesalahan: $e');
      print('StackTrace: $stackTrace');
    }
  }
}
