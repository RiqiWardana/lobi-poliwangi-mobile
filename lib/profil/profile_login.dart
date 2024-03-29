import 'package:flutter/material.dart';
import 'package:lobi_poliwangi_mobile/InputBeasiswa/fromBeasiswa.dart';
import 'package:lobi_poliwangi_mobile/InputLomba/formLomba.dart';
import 'package:lobi_poliwangi_mobile/PangajuanPrestasi/formPengajuan.dart';
import 'package:lobi_poliwangi_mobile/profil/PrestasiSaya.dart';

class ProfileScreen extends StatelessWidget {
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
              child: const Text(
                'Profile',
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
              width: double.infinity, // Make the button take the full width
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: ElevatedButton(
                onPressed: () {
                  // Perform log out logic here
                  // For example, you can navigate to the login screen or show a confirmation dialog
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                ),
                child: const Text('Log Out'),
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
            offset: Offset(0, 3), // changes position of the shadow
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(50.0),
              child: Image.asset(
                'assets/profile.jpg',
                width: 100,
                height: 100,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(height: 16),
            const Text(
              'Rahmah Sary F ',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const Text(
              '362258302177',
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey,
              ),
            ),
            const Text(
              'Program of Study: Computer Science',
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey,
              ),
            ),
            SizedBox(height: 16),
            ProfileOption(
              title: 'Prestasi saya',
              description: 'Lihat data Prestasi',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => PrestasiListScreen()),
                );
              },
            ),
            ProfileOption(
              title: 'Mengajukan Prestasi',
              description: 'Mengajukan Informasi',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => PrestasiMahasiswaForm(),
                  ),
                );
              },
            ),
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
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            subtitle: Text(
              description,
              style: const TextStyle(
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
