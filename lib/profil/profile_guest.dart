import 'package:flutter/material.dart';
import 'package:lobi_poliwangi_mobile/InputBeasiswa/fromBeasiswa.dart';
import 'package:lobi_poliwangi_mobile/InputLomba/formLomba.dart';
import 'package:lobi_poliwangi_mobile/Login_mahasiswa/LoginForm.dart';

class ProfileGuest extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF1C2868),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              color: Color(0xFF1C2868),
              padding: EdgeInsets.all(16.0),
              alignment: Alignment.center,
              child: Text(
                'Guest Profile',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: ProfileCard(),
              ),
            ),
            SizedBox(height: 16),
            Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.blue,
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => LoginApp()),
                  );
                },
                child: Text('Login'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ProfileCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.0),
        color: Color(0xFFD0D5EE),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 3,
            blurRadius: 7,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(
              Icons.person,
              size: 100,
              color: Colors.grey,
            ),
            SizedBox(height: 16),
            Text(
              'Guest',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 16),
            ProfileOption(
              title: 'Mengajukan Beasiswa',
              description: 'Mengajukan Informasi Beasiswa',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => FromBeasiswa()),
                );
              },
            ),
            ProfileOption(
              title: 'Mengajukan Lomba',
              description: 'Mengajukan Informasi Lomba',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => FormLomba()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class ProfileOption extends StatelessWidget {
  final String title;
  final String description;
  final Function()? onTap;

  ProfileOption({required this.title, required this.description, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Divider(),
        InkWell(
          onTap: onTap,
          splashColor: Colors.white.withOpacity(0.9),
          child: ListTile(
            title: Text(
              title,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            subtitle: Text(
              description,
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey,
              ),
            ),
            trailing: Icon(Icons.arrow_forward_ios),
          ),
        ),
      ],
    );
  }
}
