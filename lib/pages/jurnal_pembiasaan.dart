import 'package:flutter/material.dart';
import 'login.blade.dart';
import 'dashboard_page.dart';
import 'catatan_sikap.dart';
import 'pengaturan_akun.dart';
import 'profile_page.dart';
import '../widgets/profile_header.dart';

class JurnalPembiasaanPage extends StatefulWidget {
  const JurnalPembiasaanPage({super.key});

  @override
  State<JurnalPembiasaanPage> createState() => _JurnalPembiasaanPageState();
}

class _JurnalPembiasaanPageState extends State<JurnalPembiasaanPage> {
  // Status untuk tanggal: 'filled', 'not-filled', 'pending', 'future'
  final Map<int, String> dateStatus = {
    3: 'not-filled',
    4: 'not-filled',
    5: 'not-filled',
    6: 'not-filled',
    7: 'not-filled',
    10: 'not-filled',
  };

  // Tambahan: list untuk menyimpan pekerjaan yang ditambahkan
  final List<Map<String, String>> _pekerjaanList = [
    {'pekerjaan': 'Membuat aplikasi Flutter', 'tgl': '20 Nov', 'saksi': 'Budi'},
    {'pekerjaan': 'Belajar Dart Programming', 'tgl': '21 Nov', 'saksi': 'Andi'},
  ];

  // Tambahan: list untuk menyimpan materi yang ditambahkan
  final List<Map<String, String>> _materiList = [
    {'materi': 'Flutter Widget', 'sts': 'A', 'tgl': '20 Nov'},
    {'materi': 'State Management', 'sts': 'P', 'tgl': '22 Nov'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      body: SafeArea(
        child: Column(
          children: [
            _buildHeader(),
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildTitle(),
                    const SizedBox(height: 16),
                    _buildBackButton(),
                    const SizedBox(height: 16),
                    _buildPembiasaanHarian(),
                    const SizedBox(height: 16),
                    _buildPekerjaanSection(),
                    const SizedBox(height: 16),
                    _buildMateriSection(),
                    const SizedBox(height: 16),
                    _buildPoinSection(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
  Widget _buildHeader() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          const Icon(Icons.home, color: Colors.grey),
          const SizedBox(width: 12),
          Expanded(
            child: ProfileHeader(
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
                } else if (selected == 'catatan') {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => const CatatanSikapPage()),
                  );
                } else if (selected == 'profil') {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => const StudentProfilePage(),
                    ),
                  );
                } else if (selected == 'pengaturan') {
                  
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
        ],
      ),
    );
  }

  // ========================= TITLE =========================
  Widget _buildTitle() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        Text(
          'Jurnal Pembiasaan',
          style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 4),
        Text(
          'NOVEMBER - 2025',
          style: TextStyle(color: Colors.grey, fontSize: 16),
        ),
      ],
    );
  }

  // ========================= BUTTON =========================
  Widget _buildBackButton() {
    return ElevatedButton.icon(
      onPressed: () {},
      icon: const Icon(Icons.arrow_back),
      label: const Text('Bulan Sebelumnya'),
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.blue[700],
        foregroundColor: Colors.white,
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      ),
    );
  }

  // ========================= PEMBIASAAN HARIAN =========================
  Widget _buildPembiasaanHarian() {
    return _buildCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'A. Pembiasaan harian',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16),
          _buildLegend(),
          const SizedBox(height: 16),
          _buildCalendar(),
        ],
      ),
    );
  }

  Widget _buildLegend() {
    return Row(
      children: [
        _buildLegendItem(Colors.green, 'Sudah diisi'),
        const SizedBox(width: 24),
        _buildLegendItem(Colors.yellow[700]!, 'Belum diisi'),
        const SizedBox(width: 24),
        _buildLegendItem(Colors.red, 'Tidak diisi'),
      ],
    );
  }

  Widget _buildLegendItem(Color color, String label) {
    return Row(
      children: [
        Container(
          width: 12,
          height: 12,
          decoration: BoxDecoration(color: color, shape: BoxShape.circle),
        ),
        const SizedBox(width: 8),
        Text(label, style: const TextStyle(fontSize: 13)),
      ],
    );
  }

  Widget _buildCalendar() {
    final weeks = [
      [null, null, null, null, null, null, 1, 2],
      [3, 4, 5, 6, 7, 8, 9],
      [10, 11, 12, 13, 14, 15, 16],
      [17, 18, 19, 20, 21, 22, 23],
      [24, 25, 26, 27, 28, 29, 30],
    ];

    return Column(
      children: weeks.map((week) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 8),
          child: Row(
            children: week.map((date) {
              return Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 4),
                  child: date != null
                      ? _buildDateCell(date)
                      : const SizedBox(height: 50),
                ),
              );
            }).toList(),
          ),
        );
      }).toList(),
    );
  }

  Widget _buildDateCell(int date) {
    String? status = dateStatus[date];
    if (status == null && date >= 12 && date <= 28) status = 'future';

    Color bgColor = Colors.white;
    Color borderColor = Colors.grey[300]!;
    bool showError = false;

    switch (status) {
      case 'filled':
        bgColor = Colors.green[50]!;
        borderColor = Colors.green;
        break;
      case 'not-filled':
        bgColor = const Color.fromARGB(
          255,
          236,
          204,
          207,
        ); // <- lebih soft dari red[50]
        borderColor = const Color.fromARGB(255, 245, 150, 143);
        showError = true;
        break;
      case 'pending':
        bgColor = Colors.yellow[50]!;
        borderColor = Colors.yellow[700]!;
        break;
      case 'future':
        bgColor = Colors.grey[200]!;
        borderColor = Colors.grey[300]!;
        break;
    }

    return Stack(
      children: [
        Container(
          height: 50,
          decoration: BoxDecoration(
            color: bgColor,
            border: Border.all(color: borderColor, width: 2),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Center(
            child: Text(
              '$date',
              style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
            ),
          ),
        ),
        if (showError)
          Positioned(
            top: -4,
            right: -4,
            child: Container(
              width: 20,
              height: 20,
              decoration: const BoxDecoration(
                color: Color.fromARGB(255, 251, 88, 77),
                shape: BoxShape.circle,
              ),
              child: const Icon(Icons.close, color: Colors.white, size: 14),
            ),
          ),
      ],
    );
  }

  Widget _buildPekerjaanSection() {
    return _buildCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'B. Pekerjaan yang dilakukan',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16),
          _buildPekerjaanTable(),
        ],
      ),
    );
  }

  Widget _buildPekerjaanTable() {
    return Column(
      children: [
        ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: _pekerjaanList.length,
          itemBuilder: (context, index) {
            final item = _pekerjaanList[index];
            return Container(
              margin: const EdgeInsets.only(bottom: 12),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: Colors.grey[300]!),
              ),
              child: ExpansionTile(
                shape: const Border(),
                collapsedShape: const Border(),
                leading: Icon(Icons.work_outline, color: Colors.blue[600], size: 24),
                title: Text(
                  item['pekerjaan'] ?? '',
                  style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500, color: Colors.black87),
                ),
                subtitle: Text(
                  'Tanggal: ${item['tgl'] ?? ''}',
                  style: TextStyle(fontSize: 12, color: Colors.grey[600]),
                ),
                children: [
                  Padding(
                    padding: const EdgeInsets.all(16),
                    child: Row(
                      children: [
                        Icon(Icons.person_outline, size: 16, color: Colors.grey[700]),
                        const SizedBox(width: 8),
                        Text('Saksi: ${item['saksi'] ?? ''}', style: TextStyle(fontSize: 13, color: Colors.grey[700])),
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        ),
        const SizedBox(height: 12),
        Align(
          alignment: Alignment.centerLeft,
          child: TextButton.icon(
            onPressed: _showAddPekerjaanDialog,
            icon: const Icon(Icons.add),
            label: const Text('Tambah Pekerjaan'),
          ),
        ),
      ],
    );
  }

  // Dialog untuk input pekerjaan — TextField memakai underline (garis) sesuai permintaan
  Future<void> _showAddPekerjaanDialog() async {
    final TextEditingController pekerjaanController = TextEditingController();
    final TextEditingController tglController = TextEditingController();
    final TextEditingController saksiController = TextEditingController();

    await showDialog(
      context: context,
      builder: (ctx) {
        return AlertDialog(
          title: const Text('Tambah Pekerjaan'),
          content: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(
                  controller: pekerjaanController,
                  decoration: const InputDecoration(
                    labelText: 'Pekerjaan',
                    border:
                        UnderlineInputBorder(), // <-- garis masuk (underline)
                  ),
                ),
                TextField(
                  controller: tglController,
                  decoration: const InputDecoration(
                    labelText: 'Tgl',
                    border: UnderlineInputBorder(),
                  ),
                ),
                TextField(
                  controller: saksiController,
                  decoration: const InputDecoration(
                    labelText: 'Saksi',
                    border: UnderlineInputBorder(),
                  ),
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(ctx).pop();
              },
              child: const Text('Batal'),
            ),
            ElevatedButton(
              onPressed: () {
                final String p = pekerjaanController.text.trim();
                if (p.isEmpty) {
                  // sederhana: jangan simpan jika kosong
                  return;
                }
                setState(() {
                  _pekerjaanList.add({
                    'pekerjaan': p,
                    'tgl': tglController.text.trim(),
                    'saksi': saksiController.text.trim(),
                  });
                });
                Navigator.of(ctx).pop();
              },
              child: const Text('Simpan'),
            ),
          ],
        );
      },
    );

    pekerjaanController.dispose();
    tglController.dispose();
    saksiController.dispose();
  }

  // ========================= MATERI =========================
  Widget _buildMateriSection() {
    return _buildCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'C. Materi yang dipelajari',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16),
          _buildMateriTable(),
          const SizedBox(height: 16),
          const SizedBox(height: 16),
          Row(
            children: [
              _buildLegendItem(Colors.green, 'A : Approved'),
              const SizedBox(width: 20),
              _buildLegendItem(Colors.yellow[700]!, 'P : Pending'),
              const SizedBox(width: 20),
              _buildLegendItem(Colors.red, 'R : Revisi'),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildMateriTable() {
    return Column(
      children: [
        ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: _materiList.length,
          itemBuilder: (context, index) {
            final item = _materiList[index];
            final sts = item['sts'] ?? '';
            Color iconColor = sts == 'A' ? Colors.green : (sts == 'P' ? Colors.orange : Colors.red);
            return Container(
              margin: const EdgeInsets.only(bottom: 12),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: Colors.grey[300]!),
              ),
              child: ExpansionTile(
                shape: const Border(),
                collapsedShape: const Border(),
                leading: Icon(Icons.book_outlined, color: iconColor, size: 24),
                title: Text(
                  item['materi'] ?? '',
                  style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500, color: Colors.black87),
                ),
                subtitle: Text(
                  'Status: $sts',
                  style: TextStyle(fontSize: 12, color: Colors.grey[600]),
                ),
                children: [
                  Padding(
                    padding: const EdgeInsets.all(16),
                    child: Row(
                      children: [
                        Icon(Icons.calendar_today, size: 16, color: Colors.grey[700]),
                        const SizedBox(width: 8),
                        Text('Tanggal: ${item['tgl'] ?? ''}', style: TextStyle(fontSize: 13, color: Colors.grey[700])),
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        ),
        const SizedBox(height: 12),
        Align(
          alignment: Alignment.centerLeft,
          child: TextButton.icon(
            onPressed: _showAddMateriDialog,
            icon: const Icon(Icons.add),
            label: const Text('Tambah Materi'),
          ),
        ),
      ],
    );
  }

  // Dialog untuk input materi — TextField memakai underline
  Future<void> _showAddMateriDialog() async {
    final TextEditingController materiController = TextEditingController();
    final TextEditingController stsController = TextEditingController();
    final TextEditingController tglController = TextEditingController();

    await showDialog(
      context: context,
      builder: (ctx) {
        return AlertDialog(
          title: const Text('Tambah Materi'),
          content: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(
                  controller: materiController,
                  decoration: const InputDecoration(
                    labelText: 'Materi',
                    border: UnderlineInputBorder(),
                  ),
                ),
                TextField(
                  controller: stsController,
                  decoration: const InputDecoration(
                    labelText: 'Sts (A/P/R)',
                    border: UnderlineInputBorder(),
                  ),
                ),
                TextField(
                  controller: tglController,
                  decoration: const InputDecoration(
                    labelText: 'Tgl',
                    border: UnderlineInputBorder(),
                  ),
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(ctx).pop();
              },
              child: const Text('Batal'),
            ),
            ElevatedButton(
              onPressed: () {
                final String m = materiController.text.trim();
                if (m.isEmpty) {
                  return;
                }
                setState(() {
                  _materiList.add({
                    'materi': m,
                    'sts': stsController.text.trim(),
                    'tgl': tglController.text.trim(),
                  });
                });
                Navigator.of(ctx).pop();
              },
              child: const Text('Simpan'),
            ),
          ],
        );
      },
    );

    materiController.dispose();
    stsController.dispose();
    tglController.dispose();
  }

  // ========================= POIN =========================
  Widget _buildPoinSection() {
    return _buildCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'D. Poin',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16),
          _buildPoinExpansion(),
        ],
      ),
    );
  }

  Widget _buildPoinExpansion() {
    final poinData = [
      {'kategori': 'Minggu 1 (M1)', 'project': '5', 'pertanyaan': '3', 'total': '8'},
      {'kategori': 'Minggu 2 (M2)', 'project': '5', 'pertanyaan': '4', 'total': '9'},
      {'kategori': 'Minggu 3 (M3)', 'project': '0', 'pertanyaan': '0', 'total': '0'},
      {'kategori': 'Minggu 4 (M4)', 'project': '0', 'pertanyaan': '0', 'total': '0'},
    ];

    return Column(
      children: [
        ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: poinData.length,
          itemBuilder: (context, index) {
            final item = poinData[index];
            return Container(
              margin: const EdgeInsets.only(bottom: 12),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: Colors.grey[300]!),
              ),
              child: ExpansionTile(
                shape: const Border(),
                collapsedShape: const Border(),
                leading: Icon(Icons.star_outline, color: Colors.amber[700], size: 24),
                title: Text(
                  item['kategori'] ?? '',
                  style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500, color: Colors.black87),
                ),
                subtitle: Text(
                  'Total Poin: ${item['total']}',
                  style: TextStyle(fontSize: 12, color: Colors.grey[600]),
                ),
                children: [
                  Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Project/Progress:', style: TextStyle(fontSize: 13, color: Colors.grey[700])),
                            Text('${item['project']} poin', style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w500)),
                          ],
                        ),
                        const SizedBox(height: 8),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Pertanyaan/Laporan:', style: TextStyle(fontSize: 13, color: Colors.grey[700])),
                            Text('${item['pertanyaan']} poin', style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w500)),
                          ],
                        ),
                        const Divider(height: 24),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text('Total Minggu Ini:', style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
                            Text('${item['total']} poin', style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Colors.blue)),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        ),
        const SizedBox(height: 16),
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.blue[50],
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: Colors.blue[200]!),
          ),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Jumlah Poin Ceklist Pembiasaan:', style: TextStyle(fontSize: 13, color: Colors.grey[700])),
                  const Text('0', style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500)),
                ],
              ),
              const SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text('Jumlah Keseluruhan Poin:', style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
                  Text('17', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.blue)),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildTableSection({
    required String title,
    required List<String> headers,
    required String emptyMessage,
    required VoidCallback onAdd,
    required String addButtonText,
  }) {
    return _buildCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16),
          _buildTable(headers: headers, emptyMessage: emptyMessage),
          const SizedBox(height: 16),
          TextButton.icon(
            onPressed: onAdd,
            icon: const Icon(Icons.add),
            label: Text(addButtonText),
          ),
        ],
      ),
    );
  }

  Widget _buildTable({
    required List<String> headers,
    required String emptyMessage,
  }) {
    return Table(
      border: TableBorder.all(color: Colors.grey[300]!),
      columnWidths: headers.length == 3
          ? const {
              0: FlexColumnWidth(3),
              1: FlexColumnWidth(1),
              2: FlexColumnWidth(1),
            }
          : null,
      children: [
        TableRow(
          decoration: BoxDecoration(color: Colors.grey[100]),
          children: headers.map((header) {
            return Padding(
              padding: const EdgeInsets.all(12),
              child: Text(
                header,
                style: const TextStyle(fontWeight: FontWeight.bold),
                textAlign: header == 'Pekerjaan' || header == 'Materi'
                    ? TextAlign.left
                    : TextAlign.center,
              ),
            );
          }).toList(),
        ),
        TableRow(
          children: [
            Padding(
              padding: const EdgeInsets.all(16),
              child: Text(
                emptyMessage,
                style: TextStyle(
                  color: Colors.grey[600],
                  fontStyle: FontStyle.italic,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            ...List.generate(
              headers.length - 1,
              (_) => const SizedBox.shrink(),
            ),
          ],
        ),
      ],
    );
  }



  Widget _buildCard({required Widget child}) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: child,
    );
  }
}
