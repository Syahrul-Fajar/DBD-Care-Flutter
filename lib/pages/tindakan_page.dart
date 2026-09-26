import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';
import 'package:online_cource_app/theme/app_theme.dart';
import 'package:online_cource_app/pages/tanda_bahaya_page.dart';

class TindakanPage extends StatelessWidget {
  const TindakanPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF1F8F6),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.5,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new_rounded,
              color: AppTheme.textColor),
          onPressed: () => Get.back(),
        ),
        title: Text(
          'Tindakan Awal',
          style: GoogleFonts.poppins(
            fontWeight: FontWeight.bold,
            color: AppTheme.textColor,
            fontSize: 18,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Warning banner
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [Color(0xFF00695C), Color(0xFF00897B)],
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      const Icon(Icons.health_and_safety,
                          color: Colors.white, size: 28),
                      const SizedBox(width: 10),
                      Text(
                        'Tindakan Saat Tanda Bahaya Muncul',
                        style: GoogleFonts.poppins(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 14, vertical: 8),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.15),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Row(
                      children: [
                        const Icon(Icons.warning_rounded,
                            color: Colors.yellow, size: 18),
                        const SizedBox(width: 8),
                        Expanded(
                          child: Text(
                            '⚠ Jangan tunggu kondisi semakin parah.',
                            style: GoogleFonts.poppins(
                              fontSize: 13,
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            // Steps
            Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Langkah yang harus diambil:',
                    style: GoogleFonts.poppins(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: AppTheme.textColor,
                    ),
                  ),
                  const SizedBox(height: 16),
                  _buildActionCard(
                    number: '1',
                    title: 'Segera ke Fasilitas Kesehatan',
                    description:
                        'Jika tanda bahaya DBD muncul, segera bawa pasien ke puskesmas, klinik, atau rumah sakit terdekat. Jangan menunda penanganan.',
                    icon: Icons.local_hospital_outlined,
                    color: const Color(0xFFE53935),
                  ),
                  _buildActionCard(
                    number: '2',
                    title: 'Pantau Kondisi Pasien',
                    description:
                        'Amati terus tanda-tanda vital pasien: tingkat kesadaran, warna kulit, frekuensi napas, dan ada tidaknya perdarahan baru.',
                    icon: Icons.monitor_heart_outlined,
                    color: const Color(0xFF0288D1),
                  ),
                  _buildActionCard(
                    number: '3',
                    title: 'Cukupi Kebutuhan Cairan',
                    description:
                        'Jika pasien masih sadar dan dapat minum, berikan cairan yang cukup: air putih, oralit, atau jus buah. Hindari minuman berkafein.',
                    icon: Icons.local_drink_outlined,
                    color: const Color(0xFF00897B),
                  ),
                  _buildActionCard(
                    number: '4',
                    title: 'Hindari Obat Tanpa Arahan',
                    description:
                        'Jangan berikan aspirin, ibuprofen, atau obat antiinflamasi lainnya tanpa petunjuk tenaga kesehatan. Hanya parasetamol yang aman.',
                    icon: Icons.no_meals_outlined,
                    color: const Color(0xFFFF8F00),
                    isLast: true,
                  ),

                  // Additional info
                  const SizedBox(height: 8),
                  Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: const Color(0xFFE8F5E9),
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(
                          color: const Color(0xFF43A047).withOpacity(0.4)),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            const Icon(Icons.tips_and_updates_outlined,
                                color: Color(0xFF2E7D32), size: 18),
                            const SizedBox(width: 8),
                            Text(
                              'Catatan Penting',
                              style: GoogleFonts.poppins(
                                fontSize: 13,
                                fontWeight: FontWeight.bold,
                                color: const Color(0xFF2E7D32),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 8),
                        Text(
                          'Dokter akan memantau kadar trombosit dan hematokrit melalui pemeriksaan darah. Pasien mungkin perlu dirawat inap jika kondisinya mengkhawatirkan. Ikuti instruksi tenaga kesehatan sepenuhnya.',
                          style: GoogleFonts.poppins(
                            fontSize: 12,
                            color: const Color(0xFF1B5E20),
                            height: 1.6,
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 24),

                  // Back to warning button
                  OutlinedButton.icon(
                    onPressed: () {
                      Get.to(() => const TandaBahayaPage(),
                          transition: Transition.rightToLeft);
                    },
                    icon: const Icon(Icons.warning_amber_rounded,
                        color: Color(0xFFE53935), size: 18),
                    label: Text(
                      'Kembali ke Tanda Bahaya',
                      style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w600,
                        color: const Color(0xFFE53935),
                      ),
                    ),
                    style: OutlinedButton.styleFrom(
                      side: const BorderSide(color: Color(0xFFE53935)),
                      minimumSize: const Size(double.infinity, 50),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildActionCard({
    required String number,
    required String title,
    required String description,
    required IconData icon,
    required Color color,
    bool isLast = false,
  }) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Number + vertical line
        Column(
          children: [
            Container(
              width: 36,
              height: 36,
              decoration: BoxDecoration(
                color: color,
                shape: BoxShape.circle,
              ),
              child: Center(
                child: Text(
                  number,
                  style: GoogleFonts.poppins(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            if (!isLast)
              Container(
                width: 2,
                height: 60,
                color: color.withOpacity(0.2),
              ),
          ],
        ),
        const SizedBox(width: 14),

        // Content card
        Expanded(
          child: Container(
            margin: EdgeInsets.only(bottom: isLast ? 0 : 16),
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(14),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.04),
                  blurRadius: 8,
                  offset: const Offset(0, 3),
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Icon(icon, color: color, size: 20),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Text(
                        title,
                        style: GoogleFonts.poppins(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: AppTheme.textColor,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Text(
                  description,
                  style: GoogleFonts.poppins(
                    fontSize: 13,
                    color: AppTheme.secondaryTextColor,
                    height: 1.5,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
