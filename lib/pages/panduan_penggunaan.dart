import 'package:flutter/material.dart';

class PanduanPenggunaan extends StatelessWidget {
  const PanduanPenggunaan({super.key});

  @override
  Widget build(BuildContext context) {
    final umumGuides = [
      {
        'title': 'Unggah Profile',
        'description': 'Panduan untuk mengunggah profile pengguna',
        'icon': Icons.description,
      },
      {
        'title': 'Ganti Password',
        'description': 'Panduan untuk mengganti password pengguna',
        'icon': Icons.description,
      },
    ];

    final siswaGuides = [
      {
        'title': 'Mengisi Jurnal',
        'description': 'Panduan untuk mengisi kegiatan sehari-hari',
        'icon': Icons.description,
      },
      {
        'title': 'Kelengkapan Profile',
        'description': 'Kelengkapan untuk melengkapi profile',
        'icon': Icons.description,
      },
      {
        'title': 'Mengelola Portofolio',
        'description': 'Panduan untuk menambah, edit, dan menghapus portofolio',
        'icon': Icons.photo,
      },
      {
        'title': 'Mengelola Sertifikat',
        'description': 'Panduan untuk menambah, edit, dan menghapus sertifikat',
        'icon': Icons.check_box,
      },
      {
        'title': 'Catatan Sikap Saya',
        'description': 'Panduan untuk melihat, dan memahami catatan sikap',
        'icon': Icons.info,
      },
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Panduan Penggunaan'),
        backgroundColor: const Color(0xFF02398C),
      ),
      backgroundColor: Colors.grey[100],
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(25),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            Row(
              children: [
                const Icon(Icons.book, size: 35, color: Color(0xFF02398C)),
                const SizedBox(width: 10),
                const Text(
                  'Panduan Penggunaan',
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.w800,
                    color: Color(0xFF02398C),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 30),

            const Text(
              'Selamat datang di panduan penggunaan aplikasi Jurnalku. Panduan ini akan membantu Anda memahami cara menggunakan fitur-fitur yang tersedia dengan optimal.',
              style: TextStyle(fontSize: 18, color: Colors.grey),
            ),

            const SizedBox(height: 30),

            // Umum
            const Text(
              'Umum',
              style: TextStyle(
                fontSize: 20,
                color: Colors.black,
                fontWeight: FontWeight.w800,
              ),
            ),
            const SizedBox(height: 5),
            Divider(color: Colors.grey[300]),
            const SizedBox(height: 5),
            Column(
              children: List.generate(umumGuides.length, (index) {
                final guide = umumGuides[index];
                return Column(
                  children: [
                    Card(
                      child: Container(
                        padding: const EdgeInsets.all(15),
                        child: Row(
                          children: [
                            Container(
                              padding: const EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                color: const Color.fromARGB(255, 210, 225, 244),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Icon(
                                guide['icon'] as IconData,
                                color: const Color(0xFF02398C), size: 20,
                              ),
                            ),
                            const SizedBox(width: 15),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    guide['title'] as String,
                                    style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  const SizedBox(height: 5),
                                  Text(
                                    guide['description'] as String,
                                    style: TextStyle(
                                      fontSize: 14,
                                      color: Colors.grey[600],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    if (index < umumGuides.length - 1) const SizedBox(height: 5),
                  ],
                );
              }),
            ),

            const SizedBox(height: 25),
            // untuk siswa
            const Text(
              'Untuk Siswa',
              style: TextStyle(
                fontSize: 20,
                color: Colors.black,
                fontWeight: FontWeight.w800,
              ),
            ),
            const SizedBox(height: 5),
            Divider(color: Colors.grey[300]),
            const SizedBox(height: 5),
            Column(
              children: List.generate(siswaGuides.length, (index) {
                final guide = siswaGuides[index];
                return Column(
                  children: [
                    Card(
                      child: Container(
                        padding: const EdgeInsets.all(15),
                        child: Row(
                          children: [
                            Container(
                              padding: const EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                color: const Color.fromARGB(255, 210, 225, 244),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Icon(
                                guide['icon'] as IconData,
                                color: const Color(0xFF02398C), size: 20,
                              ),
                            ),
                            const SizedBox(width: 15),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    guide['title'] as String,
                                    style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  const SizedBox(height: 5),
                                  Text(
                                    guide['description'] as String,
                                    style: TextStyle(
                                      fontSize: 14,
                                      color: Colors.grey[600],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    if (index < siswaGuides.length - 1) const SizedBox(height: 5),
                  ],
                );
              }),
            ),
          ],
        ),
      ),
    );
  }
}
