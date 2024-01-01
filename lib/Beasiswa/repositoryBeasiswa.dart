import 'dart:convert';
import 'apiModel.dart';
import 'package:http/http.dart' as http;

class ApirepositoryBeasiswa {
  String urlApi = 'http://127.0.0.1:8000/api/get-data-beasiswa-all';
  Future getData() async {
    try {
      final response = await http.get(Uri.parse(urlApi));
      if (response.statusCode == 200) {
        print(response.body);
        Iterable itbeasiswa = jsonDecode(response.body)['data'];
        List<Beasiswa> repoBeasiswa =
            itbeasiswa.map((e) => Beasiswa.fromJson(e)).toList();
        return repoBeasiswa;
      }
    } catch (e) {
      print('eror nih');
    }
  }
}
