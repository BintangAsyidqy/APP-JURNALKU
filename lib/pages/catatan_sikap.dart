import 'package:flutter/material.dart';
import '../widgets/profile_header.dart';
import 'login.blade.dart';
import 'dashboard_page.dart';
import 'jurnal_pembiasaan.dart';
import 'pengaturan_akun.dart';
import 'profile_page.dart';

class CatatanSikapPage extends StatefulWidget {
  const CatatanSikapPage({super.key});

  @override
  State<CatatanSikapPage> createState() => _CatatanSikapPageState();
}

class _CatatanSikapPageState extends State<CatatanSikapPage> {
  final List<BehaviorNote> notes = [
    BehaviorNote(
      category: 'Terlambat',
      description: 'Datang terlambat ke sekolah tanpa keterangan',
      status: 'Dalam Perbaikan',
      reportedDate: '20 Nov 2025',
      lastUpdate: '22 Nov 2025',
    ),
    BehaviorNote(
      category: 'Tidak Mengerjakan Tugas',
      description: 'Tidak mengumpulkan tugas matematika',
      status: 'Sudah Berubah',
      reportedDate: '15 Nov 2025',
      lastUpdate: '24 Nov 2025',
    ),
  ];

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
            '${notes.length}',
            Icons.description_outlined,
            Colors.blue,
          ),
          const SizedBox(height: 16),
          _buildStatCard(
            'Dalam Perbaikan',
            '${notes.where((n) => n.status == 'Dalam Perbaikan').length}',
            Icons.build_outlined,
            Colors.orange,
          ),
          const SizedBox(height: 16),
          _buildStatCard(
            'Sudah Berubah',
            '${notes.where((n) => n.status == 'Sudah Berubah').length}',
            Icons.check_circle_outline,
            Colors.green,
          ),
          const SizedBox(height: 32),
          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: notes.length,
            itemBuilder: (context, index) {
              final note = notes[index];
              return Container(
                margin: const EdgeInsets.only(bottom: 12),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.05),
                      blurRadius: 8,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: ExpansionTile(
                  shape: const Border(),
                  collapsedShape: const Border(),
                  leading: Icon(
                    Icons.report_problem,
                    color: note.status == 'Dalam Perbaikan' ? Colors.orange[600] : Colors.green[600],
                    size: 24,
                  ),
                  title: Text(
                    note.category,
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: Colors.black87,
                    ),
                  ),
                  subtitle: Text(
                    'Status: ${note.status}',
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.grey[600],
                    ),
                  ),
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _detailRow('Catatan', note.description),
                          const SizedBox(height: 8),
                          _detailRow('Dilaporkan', note.reportedDate),
                          const SizedBox(height: 8),
                          _detailRow('Update Terakhir', note.lastUpdate),
                          const SizedBox(height: 16),
                          SizedBox(
                            width: double.infinity,
                            child: ElevatedButton(
                              onPressed: () {},
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.blue,
                                foregroundColor: Colors.white,
                                padding: const EdgeInsets.symmetric(vertical: 12),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(6),
                                ),
                                elevation: 0,
                              ),
                              child: const Text(
                                'Lihat Detail',
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
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
            },
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

  Widget _detailRow(String label, String value) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: 120,
          child: Text(
            label,
            style: const TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w600,
              color: Colors.grey,
            ),
          ),
        ),
        Expanded(
          child: Text(
            value,
            style: const TextStyle(
              fontSize: 13,
              color: Colors.black87,
            ),
          ),
        ),
      ],
    );
  }
}

class BehaviorNote {
  final String category;
  final String description;
  final String status;
  final String reportedDate;
  final String lastUpdate;

  BehaviorNote({
    required this.category,
    required this.description,
    required this.status,
    required this.reportedDate,
    required this.lastUpdate,
  });
}
