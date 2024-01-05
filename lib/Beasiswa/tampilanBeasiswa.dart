import 'package:flutter/material.dart';
import 'apiModel.dart';
import 'repositoryBeasiswa.dart';
import 'Card.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: tampilanBeasiswa(),
      theme: ThemeData(
        scaffoldBackgroundColor: const Color.fromARGB(255, 7, 40, 88),
      ),
    );
  }
}

class tampilanBeasiswa extends StatefulWidget {
  const tampilanBeasiswa({Key? key}) : super(key: key);
  @override
  _tampilanBeasiswaState createState() => _tampilanBeasiswaState();
}

class _tampilanBeasiswaState extends State<tampilanBeasiswa> {
  bool isSmallCardVisible = false;
  String selectedFilter = '';
  List<Beasiswa> dataSuplier = [];
    TextEditingController searchController = TextEditingController();
  ApirepositoryBeasiswa apirepository = ApirepositoryBeasiswa();

  void sortData() {
    if (selectedFilter == 'Terbaru') {
      dataSuplier.sort((a, b) => b.createdAt.compareTo(a.createdAt));
    } else if (selectedFilter == 'Terlama') {
      dataSuplier.sort((a, b) => a.createdAt.compareTo(b.createdAt));
    } else {
      dataSuplier.sort((a, b) => b.createdAt.compareTo(a.createdAt));
    }
  }

  getData() async {
    dataSuplier = await apirepository.getData();
    setState(() {});
  }

  @override
  void initState() {
    getData();
    super.initState();
  }

    void performSearch(String query) {
    if (query.isEmpty) {
      getData();
    } else {
      List<Beasiswa> filteredData = dataSuplier
          .where((lomba) =>
              lomba.namaBeasiswa.toLowerCase().contains(query.toLowerCase()))
          .toList();

      // Update the UI with the filtered data
      setState(() {
        dataSuplier = filteredData;
      });
    }
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
                    '''Informasi
                    Beasiswa''',
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
                          controller: searchController,
                          onChanged: (value) {
                            performSearch(value);
                          },
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
                if (isSmallCardVisible)
                  Positioned(
                      top: 10,
                      right: 35,
                      child: SmallCard(onFilterSelected: (filter) {
                        setState(() {
                          if (filter != selectedFilter) {
                            selectedFilter = filter;
                            sortData();
                          } else
                            selectedFilter = '';
                        });
                      })),
                Positioned(
                  top: 5,
                  right: 5,
                  child: IconButton(
                    icon: Icon(Icons.tune_rounded),
                    color: Colors.white,
                    onPressed: () {
                      setState(() {
                        isSmallCardVisible = !isSmallCardVisible;
                      });
                    },
                  ),
                ),
              ],
            ),
            ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: dataSuplier.length,
              itemBuilder: (context, index) {
                Beasiswa beasiswa = dataSuplier[index];
                if (selectedFilter.isEmpty ||
                    beasiswa.matchFilter(selectedFilter)) {
                  return CustomCard(
                    imagePath: 'assets/japan-lomba-1.jpg',
                    title: beasiswa.namaBeasiswa,
                    description: beasiswa.persyaratan,
                    tanggal_penutupan: beasiswa.tanggalPenutupan.toString(),
                    post: beasiswa,
                    isActive: beasiswa.isAktif(),
                  );
                } else {
                  return SizedBox.shrink();
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
