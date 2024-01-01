import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'apiModel.dart';
import 'DetailBeasiswa.dart';

class BeasiswaCard extends StatelessWidget {
  final String scholarship;
  final List<Map<String, dynamic>> formDataList;

  BeasiswaCard(Text text,
      {Key? key, required this.scholarship, required this.formDataList})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Card(
        elevation: 5.0,
        margin: EdgeInsets.all(8.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                scholarship,
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CustomCard extends StatelessWidget {
  final String imagePath;
  final String title;
  final String description;
  final String tanggal_penutupan;
  final dynamic post;
  final bool isActive;

  const CustomCard({
    required this.imagePath,
    required this.title,
    required this.description,
    required this.tanggal_penutupan,
    required this.post,
    required this.isActive,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        _showDetail(context, post);
      },
      child: Card(
        elevation: 10.0,
        margin: EdgeInsets.all(8.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start, // Posisikan ke atas
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image.asset(
                imagePath,
                width: 80,
                height: 80,
                fit: BoxFit.cover,
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      'Tenggat: ${DateFormat('dd MMMM yyyy').format(DateTime.parse(tanggal_penutupan))}',
                      style: TextStyle(
                        fontSize: 14.0,
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      description,
                      style: TextStyle(
                        fontSize: 14.0,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.all(8.0),
              margin: EdgeInsets.only(left: 8.0), // Tambahkan margin ke kiri
              decoration: BoxDecoration(
                color: isActive ? Colors.green : Colors.red,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10.0),
                  bottomRight: Radius.circular(10.0),
                ),
              ),
              child: Text(
                isActive ? 'Aktif' : 'Tidak Aktif',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showDetail(BuildContext context, Beasiswa beasiswa) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => DetailBeasiswaPage(beasiswa: beasiswa),
      ),
    );
  }
}

class SmallCard extends StatelessWidget {
  final Function(String) onFilterSelected;

  const SmallCard({required this.onFilterSelected});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Tampilkan dialog atau lakukan tindakan lain jika diperlukan
      },
      child: Card(
        elevation: 5.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15.0),
            gradient: LinearGradient(
              colors: [
                Color.fromARGB(255, 215, 237, 255),
                Color.fromARGB(255, 255, 255, 255)
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      'Waktu',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18.0,
                      ),
                    ),
                    SizedBox(width: 156.0),
                    Text(
                      'Status',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18.0,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 8.0),
                Row(
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width * 0.4,
                      child: FilterOptionWidget(
                        optionText: 'Terbaru',
                        onTap: () => onFilterSelected('Terbaru'),
                      ),
                    ),
                    SizedBox(width: 8.0), // Spacer
                    Container(
                      width: MediaQuery.of(context).size.width * 0.4,
                      child: FilterOptionWidget(
                        optionText: 'Aktif',
                        onTap: () => onFilterSelected('Aktif'),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 8.0),
                Row(
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width * 0.4,
                      child: FilterOptionWidget(
                        optionText: 'Terlama',
                        onTap: () => onFilterSelected('Terlama'),
                      ),
                    ),
                    SizedBox(width: 8.0),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.4,
                      child: FilterOptionWidget(
                        optionText: 'Tidak Aktif',
                        onTap: () => onFilterSelected('Tidak Aktif'),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class FilterOptionWidget extends StatelessWidget {
  final String optionText;
  final VoidCallback onTap;

  const FilterOptionWidget({
    required this.optionText,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.0),
          border: Border.all(color: Colors.grey),
        ),
        child: Text(
          optionText,
          style: TextStyle(fontSize: 16.0),
        ),
      ),
    );
  }
}
