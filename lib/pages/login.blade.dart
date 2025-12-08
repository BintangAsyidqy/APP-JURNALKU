import 'package:flutter/material.dart';
import 'dashboard_page.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    final features = [
      {
        'title': 'Dirancang untuk Sekolah Kami',
        'desc':
            'Dikembangkan khusus untuk memenuhi kebutuhan sekolah kami dengan fokus pada kemajuan siswa kami.',
        'colors': [Color(0xFFFFE066), Color(0xFFFFC93C)],
        'icon': Icons.home,
      },
      {
        'title': 'Pemantauan yang Terstruktur',
        'desc':
            'Memudahkan guru dalam menyusun dan memantau daftar kompetensi keahlian yang harus dikuasai siswa.',
        'colors': [
          Color.fromARGB(255, 220, 151, 207),
          Color.fromARGB(255, 237, 100, 166),
        ],
        'icon': Icons.share,
      },
      {
        'title': 'Fitur Praktis dan Bermanfaat',
        'desc':
            'Termasuk reminder otomatis, grafik perkembangan, dan analisis mendalam untuk efektivitas belajar.',
        'colors': [
          Color.fromARGB(255, 183, 225, 255),
          Color.fromARGB(255, 100, 200, 255),
        ],
        'icon': Icons.people,
      },
      {
        'title': 'Pengajuan Kompetensi oleh Siswa',
        'desc':
            'Siswa dapat mengajukan kompetensi yang telah dikuasai untuk diverifikasi oleh guru.',
        'colors': [Color(0xFFFFF3D4), Color(0xFFFFD699)],
        'icon': Icons.school,
      },
      {
        'title': 'Validasi dan Tanda Tangan Guru',
        'desc':
            'Setiap kompetensi yang disetujui akan diberikan tanda terima dan tanda tangan guru sebagai bukti.',
        'colors': [
          Color.fromARGB(255, 204, 255, 177),
          Color.fromARGB(255, 150, 230, 100),
        ],
        'icon': Icons.book,
      },
      {
        'title': 'Pantauan Real-Time dan Transparan',
        'desc':
            'Monitoring langsung, menciptakan lingkungan belajar yang efisien.',
        'colors': [
          Color.fromARGB(255, 254, 200, 240),
          Color.fromARGB(255, 255, 150, 220),
        ],
        'icon': Icons.tv,
      },
    ];

    return Scaffold(
      floatingActionButton: SizedBox(
        width: 170,
        height: 50,
        child: FloatingActionButton.extended(
          onPressed: () {},
          backgroundColor: Color(0xFF02398C),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
          icon: Icon(Icons.explore, color: Colors.white),
          label: Text(
            'Jelajahi siswa',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
          ),
        ),
      ),

      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              // GAMBAR
              SizedBox(
                width: double.infinity,
                height: 240,
                child: Image.asset(
                  'assets/images/header.jpg',
                  fit: BoxFit.cover,
                ),
              ),

              // CARD LOGIN
              Transform.translate(
                offset: Offset(0, -40),
                child: Center(
                  child: Card(
                    elevation: 4,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    margin: EdgeInsets.symmetric(horizontal: 24),
                    child: Padding(
                      padding: EdgeInsets.all(24),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          RichText(
                            text: TextSpan(
                              text: 'Masuk untuk memulai ',
                              style: TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                              children: [
                                TextSpan(
                                  text: 'Jurnalku',
                                  style: TextStyle(color: Color(0xFF02398C)),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 40),

                          Text(
                            'Username atau NIS',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          SizedBox(height: 8),
                          TextField(
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: Color(0xFFF0F4FF),
                              contentPadding: EdgeInsets.symmetric(
                                horizontal: 16,
                                vertical: 14,
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                                borderSide: BorderSide(
                                  color: Colors.grey,
                                  width: 1,
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                                borderSide: BorderSide(
                                  color: Colors.blue,
                                  width: 1,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: 15),

                          Text(
                            'Password',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          SizedBox(height: 8),
                          TextField(
                            obscureText: true,
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: Color(0xFFF0F4FF),
                              contentPadding: EdgeInsets.symmetric(
                                horizontal: 16,
                                vertical: 14,
                              ),
                              suffixIcon: Icon(
                                Icons.visibility_outlined,
                                color: Colors.grey[700],
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                                borderSide: BorderSide(
                                  color: Colors.grey,
                                  width: 1,
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                                borderSide: BorderSide(
                                  color: Colors.blue,
                                  width: 1,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: 25),

                          SizedBox(
                            width: double.infinity,
                            height: 48,
                            child: ElevatedButton(
                              onPressed: () {
                                // Ganti halaman ke Dashboard dan hapus halaman Login dari stack
                                Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                    builder: (_) => const DashboardPage(),
                                  ),
                                );
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Color(0xFF02398C),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                              ),
                              child: Text(
                                'Masuk',
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: 25),

                          Center(
                            child: Text(
                              'Lupa password? Hubungi guru laboran.',
                              style: TextStyle(color: Colors.grey[800]),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),

              SizedBox(height: 15),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 24),
                child: Column(
                  children: [
                    Text(
                      "Menyatukan Upaya untuk Kemajuan Siswa",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey[900],
                      ),
                    ),
                    SizedBox(height: 15),
                    Text(
                      "Jurnalku adalah aplikasi cerdas yang membantu guru dan siswa "
                      "dalam memantau dan mengelola kompetensi keahlian siswa secara efektif.",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.black54,
                        height: 1.5,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(height: 40),
                    ListView.separated(
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: features.length,
                      separatorBuilder: (_, __) => SizedBox(height: 20),
                      itemBuilder: (context, index) {
                        final f = features[index];
                        final colors = f['colors'] as List<Color>;
                        final iconData = f['icon'] as IconData;
                        return Container(
                          padding: EdgeInsets.all(20),
                          decoration: BoxDecoration(
                            color: Color(0xFFF8F9FA),
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(
                              color: Colors.grey[300]!,
                              width: 2,
                            ),
                          ),
                          child: Row(
                            children: [
                              Container(
                                padding: EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                    colors: colors,
                                    begin: Alignment.topLeft,
                                    end: Alignment.bottomRight,
                                  ),
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: Icon(
                                  iconData,
                                  color: Colors.black,
                                  size: 32,
                                ),
                              ),
                              SizedBox(width: 16),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      f['title'] as String,
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    SizedBox(height: 6),
                                    Text(
                                      f['desc'] as String,
                                      style: TextStyle(
                                        color: Colors.black54,
                                        height: 1.4,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),

              // FOOTER
              Container(
                width: double.infinity,
                color: Color(0xFF02398C),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          IconButton(
                            onPressed: () {},
                            icon: Icon(Icons.chat),
                            color: Colors.white,
                            tooltip: 'WhatsApp',
                          ),
                          SizedBox(width: 8),
                          IconButton(
                            onPressed: () {},
                            icon: Icon(Icons.camera_alt),
                            color: Colors.white,
                            tooltip: 'Instagram',
                          ),
                          SizedBox(width: 8),
                          IconButton(
                            onPressed: () {},
                            icon: Icon(Icons.business),
                            color: Colors.white,
                            tooltip: 'LinkedIn',
                          ),
                          SizedBox(width: 8),
                          IconButton(
                            onPressed: () {},
                            icon: Icon(Icons.play_circle_fill),
                            color: Colors.white,
                            tooltip: 'YouTube',
                          ),
                        ],
                      ),
                      SizedBox(height: 8),
                      Text(
                        '© GEN-28 PPLG SMK Wikrama Bogor. All Rights Reserved.',
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.white),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
