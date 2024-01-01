import 'package:flutter/material.dart';
import 'CardBeasiswa.dart';
import 'package:lobi_poliwangi_mobile/Beasiswa/apiModel.dart';
import 'package:lobi_poliwangi_mobile/Beasiswa/repositoryBeasiswa.dart';
import 'package:lobi_poliwangi_mobile/Lomba/ApiModel.dart';
import 'package:lobi_poliwangi_mobile/Lomba/repositoryLomba.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: tampilanBeranda(),
      theme: ThemeData(
        scaffoldBackgroundColor: const Color.fromARGB(255, 7, 40, 88),
      ),
    );
  }
}

class tampilanBeranda extends StatefulWidget {
  const tampilanBeranda({Key? key}) : super(key: key);
  @override
  _tampilanBerandaState createState() => _tampilanBerandaState();
}

class _tampilanBerandaState extends State<tampilanBeranda> {
  List<Beasiswa> dataSuplier = [];
  List<Lomba> dataLomba = [];
  ApirepositoryBeasiswa apirepository = ApirepositoryBeasiswa();

  getData() async {
    dataSuplier = await apirepository.getData();
    setState(() {});
  }

  @override
  void initState() {
    getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final LebarApp = MediaQuery.of(context).size.width;
    final Tinggipp = MediaQuery.of(context).size.height;

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              alignment: Alignment.topCenter,
              children: [
                Image.asset(
                  'assets/aula-69800.jpg',
                  fit: BoxFit.fitWidth,
                ),
                Positioned(
                  top: Tinggipp * 0.2,
                  child: Text(
                    '''Lobi Poliwangi''',
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      color: Colors.white,
                      fontSize: 30.0,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                Positioned(
                  top: 10,
                  left: 50,
                  child: Stack(
                    children: [
                      Container(
                        width: LebarApp * 0.8,
                        height: 30,
                        child: TextField(
                          decoration: InputDecoration(
                            hintText: 'Cari...',
                            hintStyle: TextStyle(
                              color: const Color.fromARGB(255, 119, 119, 119)
                                  .withOpacity(0.8),
                            ),
                            fillColor: Color.fromARGB(220, 255, 255, 255),
                            filled: true,
                            border: OutlineInputBorder(
                              borderSide: BorderSide.none,
                              borderRadius: BorderRadius.circular(30.0),
                            ),
                            contentPadding:
                                EdgeInsets.symmetric(horizontal: 40),
                          ),
                        ),
                      ),
                      Positioned(
                        left: 5,
                        top: 1,
                        child: Icon(
                          Icons.search,
                          color: const Color.fromARGB(255, 194, 194, 194),
                        ),
                        height: 30,
                        width: 30,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 3.0),
                  child: Text(
                    'Beasiswa',
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      color: Colors.white10,
                      fontSize: 23.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
            Container(
              height: 200,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: dataSuplier.length,
                itemBuilder: (context, index) {
                  Beasiswa beasiswa = dataSuplier[index];
                  return BeasiswaCard(
                    title: beasiswa.namaBeasiswa,
                    content: beasiswa.persyaratan,
                    imagePath: 'assets/japan-lomba-1.jpg',
                  );
                },
              ),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 3.0),
                  child: Text(
                    'Lomba',
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      color: Colors.white10,
                      fontSize: 23.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
            Container(
              height: 200,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: dataLomba.length,
                itemBuilder: (context, index) {
                  Lomba lomba = dataLomba[index];
                  return BeasiswaCard(
                    title: lomba.namaLomba,
                    content: lomba.persyaratan,
                    imagePath: 'assets/japan-lomba-2.jpg',
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
