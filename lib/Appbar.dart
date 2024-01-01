import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          bottom: PreferredSize(
            preferredSize: Size.fromHeight(230),
            child: Stack(
              alignment: Alignment.topCenter,
              children: [
                Image.asset(
                  'assets/gambar_jkt.jpg',
                  fit: BoxFit.fill,
                ),
                Positioned(
                  top: 10.0,
                  child: Text(
                    'Teks di Tengah Gambar',
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      color: Colors.white,
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                Positioned(
                  top: 5,
                  left: 50,
                  child: Container(
                    width: 280,
                    height: 30,
                    child: TextField(
                      style: TextStyle(color: Colors.black.withOpacity(0.8)),
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
                        contentPadding: EdgeInsets.symmetric(horizontal: 40),
                      ),
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
        ),
        body: Center(
          child: Text('Hello World'),
        ),
      ),
    );
  }
}
