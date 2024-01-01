import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'ApiModelPrestasi.dart';

class DetailBeasiswaPage extends StatelessWidget {
  final prestasiMahasiswa beasiswa;

  const DetailBeasiswaPage({Key? key, required this.beasiswa})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(beasiswa.namaMahasiswa),
      ),
      body: Stack(
        children: [
          Image.network(
            'assets/japan-lomba-1.jpg',
            width: MediaQuery.of(context).size.width,
            fit: BoxFit.fitWidth,
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              height: MediaQuery.of(context).size.height /
                  2, // Mengurangi tinggi container
              padding:
                  EdgeInsets.only(bottom: 20, left: 16, right: 16, top: 15),
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 0, 2, 96),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    'Nama Beasiswa: ${beasiswa.namaMahasiswa}',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 18.0,
                    ),
                  ),
                  Text(
                    'Di Posting: ${DateFormat('dd-MM-yyyy').format(beasiswa.createdAt)}',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 18.0,
                    ),
                  ),
                  Text(
                    beasiswa.nim,
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 18.0,
                    ),
                  ),
                  Text(
                    '''Nama Prestasi: 
${beasiswa.prestasi.namaPrestasi}''',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 18.0,
                    ),
                  ),
                  // SizedBox(height: 16),
                  // Center(
                  //   child: Text(
                  //     'Kunjungi situs resmi beasiswa',
                  //     style: TextStyle(
                  //       color: const Color.fromARGB(255, 255, 255, 255),
                  //       decoration: TextDecoration.underline,
                  //     ),
                  //   ),
                  // ),
                  // SizedBox(height: 16),
                  // Center(
                  //   child: InkWell(
                  //     onTap: () {
                  //       print('Link diklik');
                  //       // Add your navigation logic or any action here
                  //     },
                  //     child: Container(
                  //       padding: EdgeInsets.all(16),
                  //       decoration: BoxDecoration(
                  //         color: Colors.white,
                  //         borderRadius: BorderRadius.circular(10),
                  //       ),
                  //       child: Text(
                  //         beasiswa.linkPendaftaran,
                  //         style: TextStyle(
                  //           color: const Color.fromARGB(255, 33, 44, 243),
                  //           fontSize: 16.0,
                  //         ),
                  //       ),
                  //     ),
                  //   ),
                  // ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
