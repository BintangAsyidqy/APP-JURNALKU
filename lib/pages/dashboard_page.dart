import 'package:flutter/material.dart';
import 'jurnal_pembiasaan.dart';
import 'catatan_sikap.dart';
import 'login.blade.dart';
import '../widgets/profile_header.dart';
import 'pengaturan_akun.dart';
import 'explore_page.dart';
import 'permintaan_saksi.dart';
import 'profile_page.dart';
import 'panduan_penggunaan.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 1,
        leading: IconButton(
          icon: const Icon(Icons.home_outlined, color: Colors.black87),
          onPressed: () {},
        ),
        title: ProfileHeader(
          name: 'Muhamad Azmi Naziyulloh',
          subtitle: 'PPLG XII-4',
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
                  value: 'profil',
                  child: ListTile(
                    leading: Icon(Icons.person_outline),
                    title: Text('Profil'),
                  ),
                ),
                const PopupMenuItem(
                  value: 'jelajahi',
                  child: ListTile(
                    leading: Icon(Icons.explore),
                    title: Text('Jelajahi'),
                  ),
                ),
                const PopupMenuDivider(),
                const PopupMenuItem(
                  value: 'jurnal',
                  child: ListTile(
                    leading: Icon(Icons.book),
                    title: Text('Jurnal Pembiasaan'),
                  ),
                ),
                const PopupMenuItem(
                  value: 'permintaan',
                  child: ListTile(
                    leading: Icon(Icons.person_add_alt_1_outlined),
                    title: Text('Permintaan Saksi'),
                  ),
                ),
                const PopupMenuItem(
                  value: 'progress',
                  child: ListTile(
                    leading: Icon(Icons.bar_chart),
                    title: Text('Progress'),
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
            if (selected == 'jurnal') {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const JurnalPembiasaanPage()),
              );
            } else if (selected == 'permintaan') {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const PermintaanSaksiPage()),
              );
            } else if (selected == 'jelajahi') {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const ExplorePage()),
              );
            } else if (selected == 'catatan') {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const CatatanSikapPage()),
              );
            } else if (selected == 'profil') {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const StudentProfilePage()),
              );
            } else if (selected == 'panduan') {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const PanduanPenggunaan()),
              );
            } else if (selected == 'pengaturan') {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Navigating to Pengaturan Akun...'),
                ),
              ) ;
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
                (route) => false,
              );
            }
          },
        ),
        centerTitle: false,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 18),

            // Large rounded info card
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [Color(0xFF2E59B8), Color(0xFF1F3E85)],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.circular(14),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.12),
                      blurRadius: 12,
                      offset: const Offset(0, 6),
                    ),
                  ],
                ),
                // Adjusted padding: reduce top padding so the text sits higher in the card
                // and lower bottom padding so the card doesn't extend too far downward.
                padding: const EdgeInsets.fromLTRB(40.0, 35.0, 40.0, 150.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Apa itu Jurnalku?',
                      style: theme.textTheme.headlineSmall?.copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 12),
                    Text(
                      'Jurnalku adalah aplikasi cerdas yang membantu guru dan siswa dalam memantau dan mengelola kompetensi keahlian siswa secara efektif, terstruktur, dan real-time. Dengan fitur lengkap, proses pemantauan menjadi lebih mudah dan transparan.',
                      style: theme.textTheme.bodyMedium?.copyWith(
                        color: Colors.white70,
                        height: 1.5,
                      ),
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 24),

            // Feature Cards Section
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                children: [
                  _buildFeatureCard(
                    icon: Icons.school_outlined,
                    title: 'Dirancang Khusus',
                    description:
                        'Memenuhi kebutuhan spesifik sekolah kami dengan fokus pada kemajuan siswa.',
                  ),
                  const SizedBox(height: 16),
                  _buildFeatureCard(
                    icon: Icons.people_outline,
                    title: 'Efektif',
                    description:
                        'Memudahkan siswa dan guru melihat perkembangan secara real-time.',
                  ),
                  const SizedBox(height: 16),
                  _buildFeatureCard(
                    icon: Icons.school,
                    title: 'Terintegrasi',
                    description:
                        'Pengajuan kompetensi siswa, validasi dan laporan perkembangan yang transparan.',
                  ),
                ],
              ),
            ),

            const SizedBox(height: 24),

            // Menu Aplikasi Section
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'MENU APLIKASI',
                    style: theme.textTheme.titleSmall?.copyWith(
                      color: Colors.black54,
                      fontWeight: FontWeight.w600,
                      letterSpacing: 0.5,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: Colors.grey.shade200),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.05),
                          blurRadius: 8,
                          offset: const Offset(0, 2),
                        ),
                      ],
                    ),
                    child: Column(
                      children: [
                        _buildMenuItem(
                          icon: Icons.person_outline,
                          title: 'Profil',
                          subtitle: 'Lihat dan kelola profilmu di sini.',
                          iconColor: Colors.blue,
                        ),
                        const Divider(height: 1),
                        _buildMenuItem(
                          icon: Icons.work_outline,
                          title: 'Portofolio',
                          subtitle:
                              'Lihat dan kelola portofolio kompetensimu di sini.',
                          iconColor: Colors.blue,
                        ),
                        const Divider(height: 1),
                        _buildMenuItem(
                          icon: Icons.verified_outlined,
                          title: 'Sertifikat',
                          subtitle:
                              'Lihat dan unduh sertifikat kompetensimu di sini.',
                          iconColor: Colors.blue,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 16),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: Colors.grey.shade200),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.05),
                          blurRadius: 8,
                          offset: const Offset(0, 2),
                        ),
                      ],
                    ),
                    child: Column(
                      children: [
                        _buildMenuItem(
                          icon: Icons.book_outlined,
                          title: 'Jurnal Pembiasaan',
                          subtitle:
                              'Catat dan pantau kegiatan pembiasaan harianmu.',
                          iconColor: Colors.blue,
                        ),
                        const Divider(height: 1),
                        _buildMenuItem(
                          icon: Icons.people_outline,
                          title: 'Permintaan Saksi',
                          subtitle:
                              'Lihat teman yang mengajukan permintaan saksi.',
                          iconColor: Colors.blue,
                        ),
                        const Divider(height: 1),
                        _buildMenuItem(
                          icon: Icons.show_chart,
                          title: 'Progress',
                          subtitle:
                              'Lihat kemajuan kompetensi dan pencapaian belajarmu.',
                          iconColor: Colors.blue,
                        ),
                        const Divider(height: 1),
                        _buildMenuItem(
                          icon: Icons.warning_amber_outlined,
                          title: 'Catatan Sikap',
                          subtitle: 'Lihat catatan sikap dan perilaku.',
                          iconColor: Colors.blue,
                        ),
                        const Divider(height: 1),
                        _buildMenuItem(
                          icon: Icons.book_outlined,
                          title: 'Panduan Penggunaan',
                          subtitle: 'Panduan cara menggunakan aplikasi',
                          iconColor: Colors.blue,
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) => const PanduanPenggunaan(),
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 24),

            // Statistik Kompetensi Section
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'STATISTIK KOMPETENSI',
                    style: theme.textTheme.titleSmall?.copyWith(
                      color: Colors.black54,
                      fontWeight: FontWeight.w600,
                      letterSpacing: 0.5,
                    ),
                  ),
                  const SizedBox(height: 16),
                  _buildStatCard(
                    title: 'Materi Diselesaikan',
                    value: '4',
                    status: 'Selesai',
                    statusColor: Colors.green,
                    icon: Icons.check_circle,
                    iconColor: Colors.green,
                  ),
                  const SizedBox(height: 12),
                  _buildStatCard(
                    title: 'Pengajuan Pending',
                    value: '0',
                    status: 'Pending',
                    statusColor: Colors.orange,
                    icon: Icons.schedule,
                    iconColor: Colors.orange,
                  ),
                  const SizedBox(height: 12),
                  _buildStatCard(
                    title: 'Materi Hari Ini',
                    value: '0',
                    status: 'Hari Ini',
                    statusColor: Colors.blue,
                    icon: Icons.calendar_today,
                    iconColor: Colors.blue,
                  ),
                  const SizedBox(height: 12),
                  _buildStatCard(
                    title: 'Materi Revisi',
                    value: '0',
                    status: 'Revisi',
                    statusColor: Colors.purple,
                    icon: Icons.refresh,
                    iconColor: Colors.purple,
                  ),
                ],
              ),
            ),

            const SizedBox(height: 24),

            // Progress Akademik Section
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: Colors.grey.shade200),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.05),
                      blurRadius: 8,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Progress Akademik',
                      style: theme.textTheme.titleLarge?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                      ),
                    ),
                    const SizedBox(height: 20),
                    _buildProgressRow('Selesai', 4, Colors.blue),
                    const SizedBox(height: 12),
                    _buildProgressRow('Pending', 0, Colors.purple),
                    const SizedBox(height: 12),
                    _buildProgressRow('Belum', 0, Colors.lightBlue.shade200),
                    const SizedBox(height: 12),
                    _buildProgressRow('Hari Ini', 0, Colors.cyan),
                    const SizedBox(height: 20),
                    Center(
                      child: TextButton.icon(
                        onPressed: () {},
                        icon: const Icon(Icons.arrow_forward),
                        label: const Text('Lihat Progress Kamu'),
                        style: TextButton.styleFrom(
                          foregroundColor: Colors.blue,
                        ),
                      ),
                    ),
                    const Divider(height: 32),
                    _buildKompetensiItem(
                      'Installasi Postman',
                      'Approved',
                      Colors.green,
                    ),
                    const SizedBox(height: 12),
                    _buildKompetensiItem(
                      'Implementasi Penggunaan Postman',
                      'Approved',
                      Colors.green,
                    ),
                    const SizedBox(height: 16),
                    Center(
                      child: TextButton.icon(
                        onPressed: () {},
                        icon: const Icon(Icons.arrow_forward),
                        label: const Text('Lihat semua Kompetensi'),
                        style: TextButton.styleFrom(
                          foregroundColor: Colors.black87,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 16),
            _buildFooter(),
          ],
        ),
      ),
    );
  }

  Widget _buildStatCard({
    required String title,
    required String value,
    required String status,
    required Color statusColor,
    required IconData icon,
    required Color iconColor,
  }) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.shade200),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.04),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      padding: const EdgeInsets.all(18.0),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 14,
                    color: Colors.black54,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  value,
                  style: const TextStyle(
                    fontSize: 36,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
                const SizedBox(height: 4),
                Row(
                  children: [
                    Container(
                      width: 8,
                      height: 8,
                      decoration: BoxDecoration(
                        color: statusColor,
                        shape: BoxShape.circle,
                      ),
                    ),
                    const SizedBox(width: 6),
                    Text(
                      status,
                      style: TextStyle(
                        fontSize: 13,
                        color: statusColor,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: iconColor.withOpacity(0.1),
              shape: BoxShape.circle,
            ),
            child: Icon(icon, color: iconColor, size: 28),
          ),
        ],
      ),
    );
  }

  Widget _buildProgressRow(String label, int value, Color color) {
    return Row(
      children: [
        Container(
          width: 12,
          height: 12,
          decoration: BoxDecoration(color: color, shape: BoxShape.circle),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Text(
            label,
            style: const TextStyle(fontSize: 15, color: Colors.black87),
          ),
        ),
        Text(
          value.toString(),
          style: const TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w600,
            color: Colors.black87,
          ),
        ),
      ],
    );
  }

  Widget _buildKompetensiItem(String title, String status, Color statusColor) {
    return Row(
      children: [
        Expanded(
          child: Text(
            title,
            style: const TextStyle(fontSize: 14, color: Colors.black87),
          ),
        ),
        const SizedBox(width: 12),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
          decoration: BoxDecoration(
            color: statusColor.withOpacity(0.1),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Text(
            status,
            style: TextStyle(
              fontSize: 12,
              color: statusColor,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildFeatureCard({
    required IconData icon,
    required String title,
    required String description,
  }) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.shade200),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      padding: const EdgeInsets.all(24.0),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: const Color(0xFF2E59B8).withOpacity(0.1),
              shape: BoxShape.circle,
            ),
            child: Icon(icon, size: 48, color: const Color(0xFF2E59B8)),
          ),
          const SizedBox(height: 16),
          Text(
            title,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            description,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 14,
              color: Colors.black54,
              height: 1.5,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMenuItem({
    required IconData icon,
    required String title,
    required String subtitle,
    required Color iconColor,
    VoidCallback? onTap,
  }) {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      leading: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: iconColor.withOpacity(0.1),
          shape: BoxShape.circle,
        ),
        child: Icon(icon, color: iconColor, size: 24),
      ),
      title: Text(
        title,
        style: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w600,
          color: Colors.black87,
        ),
      ),
      subtitle: Text(
        subtitle,
        style: const TextStyle(fontSize: 13, color: Colors.black54),
      ),
      trailing: const Icon(Icons.chevron_right, color: Colors.black54),
      onTap: onTap,
    );
  }

  Widget _buildFooter() {
    return Column(
      children: [
        // Light blue copyright bar
        Container(
          width: double.infinity,
          color: const Color(0xFFEAF4FF),
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          child: Row(
            children: [
              const Icon(Icons.copyright, color: Color(0xFF1E88E5)),
              const SizedBox(width: 8),
              Expanded(
                child: Text(
                  '© GEN-28 PPLG SMK Wikrama Bogor. All Rights Reserved.',
                  style: const TextStyle(
                    color: Color(0xFF0D47A1),
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
        ),

        // Dark bar with lock icon and domain (centered)
      ],
    );
  }
}
