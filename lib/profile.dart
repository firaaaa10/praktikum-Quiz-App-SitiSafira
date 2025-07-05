import 'package:flutter/material.dart';

class Profile extends StatelessWidget {
  const Profile({super.key, required this.onRestart});

  final void Function() onRestart;

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.lightBlue,
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const CircleAvatar(
                radius: 70,
                // --- FOTO PROFIL DIUBAH MENJADI ASET LOKAL ---
                backgroundImage: AssetImage('assets/images/cihuy.jpg'),
              ),
              SizedBox(height: screenSize.height * 0.03),
              const Text(
                'Nama Mahasiswa',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.white70,
                  fontWeight: FontWeight.w300,
                ),
              ),
              const Text(
                'ATMA FATHUL HADI',
                style: TextStyle(
                  fontSize: 26,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: screenSize.height * 0.02),
              const Text(
                'NPM',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.white70,
                  fontWeight: FontWeight.w300,
                ),
              ),
              const Text(
                '202210010425',
                style: TextStyle(
                  fontSize: 26,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: screenSize.height * 0.04),
              buildInfoCard(
                context,
                icon: Icons.email,
                label: 'Email',
                value: 'Atmafathulhadi17@gmail.com',
                screenSize: screenSize,
              ),
              SizedBox(height: screenSize.height * 0.015),
              buildInfoCard(
                context,
                icon: Icons.phone,
                label: 'Telepon',
                value: '+62 858 4996 0781',
                screenSize: screenSize,
              ),
              SizedBox(height: screenSize.height * 0.015),
              buildInfoCard(
                context,
                icon: Icons.school,
                label: 'Jurusan',
                value: 'Teknik Informatika',
                screenSize: screenSize,
              ),
              SizedBox(height: screenSize.height * 0.015),
              buildInfoCard(
                context,
                icon: Icons.calendar_today,
                label: 'Tanggal Lahir',
                value: '17 April 2004',
                screenSize: screenSize,
              ),
              const SizedBox(height: 18),
              TextButton(
                onPressed: onRestart,
                child: const Text(
                  'Kembali',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildInfoCard(
    BuildContext context, {
    required IconData icon,
    required String label,
    required String value,
    required Size screenSize,
  }) {
    return Container(
      width: screenSize.width * 0.85,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 7, 82, 123),
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        children: [
          Icon(icon, color: Colors.white, size: 28),
          const SizedBox(width: 15),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label,
                  style: const TextStyle(
                    fontSize: 16,
                    color: Colors.white70,
                    fontWeight: FontWeight.w300,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  value,
                  style: const TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
