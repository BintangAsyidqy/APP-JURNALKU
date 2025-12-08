import 'package:flutter/material.dart';
import '../widgets/profile_header.dart';
import 'login.blade.dart';
import 'dashboard_page.dart';
import 'jurnal_pembiasaan.dart';
import 'pengaturan_akun.dart';
import 'profile_page.dart';

class CatatanSikapPage extends StatelessWidget {
  const CatatanSikapPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: const Icon(Icons.home_outlined, color: Colors.grey),
        title: ProfileHeader(
          name: 'Muhammad Bintang Asyiday',
          subtitle: 'PPLG XII - 4',
          onAvatarTapDown: (details) async {
            final RenderBox overlay =
                Overlay.of(context).context.findRenderObject() as RenderBox;
            final dx = details.globalPosition.dx;
            final dy = details.globalPosition.dy;
            final selected = await showMenu<String>(
              context: context,
              position: RelativeRect.fromLTRB(
                dx,
                dy,
                overlay.size.width - dx,
                overlay.size.height - dy,
              ),
              items: [
                const PopupMenuItem(
                  value: 'dashboard',
                  child: ListTile(
                    leading: Icon(Icons.home_outlined),
                    title: Text('Dashboard'),
                  ),
                ),
                const PopupMenuItem(
                  value: 'jurnal',
                  child: ListTile(
                    leading: Icon(Icons.book),
                    title: Text('Jurnal Pembiasaan'),
                  ),
                ),
                const PopupMenuItem(
                  value: 'catatan',
                  child: ListTile(
                    leading: Icon(Icons.report_problem),
                    title: Text('Catatan Sikap'),
                  ),
                ),
                const PopupMenuDivider(),
                const PopupMenuItem(
                  value: 'panduan',
                  child: ListTile(
                    leading: Icon(Icons.book_outlined),
                    title: Text('Panduan Penggunaan'),
                  ),
                ),
                const PopupMenuItem(
                  value: 'pengaturan',
                  child: ListTile(
                    leading: Icon(Icons.settings),
                    title: Text('Pengaturan Akun'),
                  ),
                ),
                const PopupMenuItem(
                  value: 'logout',
                  child: ListTile(
                    leading: Icon(Icons.logout),
                    title: Text('Log Out'),
                  ),
                ),
              ],
            );

            if (selected == null) return;
            if (selected == 'dashboard') {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (_) => const DashboardPage()),
              );
            } else if (selected == 'jurnal') {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const JurnalPembiasaanPage()),
              );
            } else if (selected == 'pengaturan') {
              // Debug: show SnackBar and log to console to verify selection
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Navigating to Pengaturan Akun...'),
                ),
              );
              // ignore: avoid_print
              print('Menu selected: pengaturan');
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const PengaturanAkun()),
              );
            } else if (selected == 'logout') {
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (_) => const LoginPage()),
                (r) => false,
              );
            }
          },
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          const Text(
            'Catatan Sikap Saya',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          const Text(
            'Lihat catatan sikap dan perilaku yang telah dilaporkan',
            style: TextStyle(fontSize: 14, color: Colors.grey),
          ),
          const SizedBox(height: 24),
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.orange[50],
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: Colors.orange[200]!),
            ),
            child: Row(
              children: [
                Icon(Icons.warning_amber, color: Colors.orange[600]),
                const SizedBox(width: 12),
                const Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Perhatian',
                        style: TextStyle(fontWeight: FontWeight.w600),
                      ),
                      SizedBox(height: 4),
                      Text(
                        'Jika Anda merasa ada catatan yang tidak sesuai atau keliru, silakan hubungi guru jurusan untuk mengajukan klarifikasi.',
                        style: TextStyle(fontSize: 12),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 32),
          _buildStatCard(
            'Total Catatan',
            '0',
            Icons.description_outlined,
            Colors.blue,
          ),
          const SizedBox(height: 16),
          _buildStatCard(
            'Dalam Perbaikan',
            '0',
            Icons.build_outlined,
            Colors.orange,
          ),
          const SizedBox(height: 16),
          _buildStatCard(
            'Sudah Berubah',
            '0',
            Icons.check_circle_outline,
            Colors.green,
          ),
          const SizedBox(height: 32),
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.1),
                  spreadRadius: 1,
                  blurRadius: 4,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // header tabel (scrollable horizontally jika perlu)
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 8,
                    ),
                    child: Row(
                      children: [
                        _tableHeader('No', width: 48),
                        _tableHeader('Kategori', width: 110),
                        _tableHeader('Catatan', width: 110),
                        _tableHeader('Status', width: 110),
                        _tableHeader('Dilaporkan', width: 120),
                        _tableHeader('Update Terakhir', width: 130),
                        _tableHeader('Aksi', width: 80),
                      ],
                    ),
                  ),
                ),
                // body tabel - tampilkan pesan kosong saat belum ada data
                // batasi lebar pesan agar tidak ikut bergeser saat header di-scroll
                Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 16,
                    horizontal: 16,
                  ),
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width - 32,
                    child: Center(
                      child: Column(
                        children: const [
                          Icon(
                            Icons.check_circle_outline,
                            size: 64,
                            color: Colors.grey,
                          ),
                          SizedBox(height: 12),
                          Text(
                            'Tidak ada catatan',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                              color: Colors.black87,
                            ),
                          ),
                          SizedBox(height: 6),
                          Text(
                            'Belum ada catatan sikap yang dilaporkan',
                            style: TextStyle(fontSize: 14, color: Colors.grey),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStatCard(
    String title,
    String count,
    IconData icon,
    Color color,
  ) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(fontSize: 14, color: Colors.grey),
                ),
                const SizedBox(height: 8),
                Text(
                  count,
                  style: const TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: color.withOpacity(0.1),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Icon(icon, color: color, size: 24),
          ),
        ],
      ),
    );
  }

  Widget _tableHeader(String title, {required double width}) {
    return Container(
      width: width,
      padding: const EdgeInsets.only(right: 10),
      alignment: Alignment.centerLeft,
      child: Text(
        title,
        overflow: TextOverflow.ellipsis,
        style: const TextStyle(
          fontSize: 13,
          fontWeight: FontWeight.w600,
          color: Colors.grey,
        ),
      ),
    );
  }
}
