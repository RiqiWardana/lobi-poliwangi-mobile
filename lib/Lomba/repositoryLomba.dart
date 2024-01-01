import 'dart:convert';
import 'ApiModel.dart';
import 'package:http/http.dart' as http;

class ApirepositoryLomba {
  String urlApi = 'http://127.0.0.1:8000/api/get-data-lomba-all';
  Future getData() async {
    try {
      final response = await http.get(Uri.parse(urlApi));
      if (response.statusCode == 200) {
        print(response.body);
        Iterable itbeasiswa = jsonDecode(response.body)['data'];
        List<Lomba> repoBeasiswa =
            itbeasiswa.map((e) => Lomba.fromJson(e)).toList();
        return repoBeasiswa;
      }
    } catch (e) {
      print('eror nih');
    }
  }
}
