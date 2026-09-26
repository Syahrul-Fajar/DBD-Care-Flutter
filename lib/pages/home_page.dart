import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';
import 'package:online_cource_app/theme/app_theme.dart';
import 'package:online_cource_app/model/dbd_data.dart';
import 'package:online_cource_app/pages/slideshow_page.dart';
import 'package:online_cource_app/pages/gejala_page.dart';
import 'package:online_cource_app/pages/tanda_bahaya_page.dart';
import 'package:online_cource_app/pages/tindakan_page.dart';
import 'package:online_cource_app/pages/quiz_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.backgroundColor,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildModernHeader(),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 24, 20, 32),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Materi Pembelajaran',
                    style: GoogleFonts.poppins(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: AppTheme.textColor,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    'Pilih topik untuk memulai belajar',
                    style: GoogleFonts.poppins(
                      fontSize: 12,
                      color: AppTheme.secondaryTextColor,
                    ),
                  ),
                  const SizedBox(height: 16),

                  // Topic Cards
                  _buildTopicCard(
                    id: 'pengertian',
                    title: 'Pengertian DBD',
                    description:
                        'Pelajari apa itu DBD, penyebab, dan cara penularannya.',
                    icon: Icons.info_outline_rounded,
                    color: const Color(0xFF1565C0),
                  ),
                  _buildTopicCard(
                    id: 'gejala',
                    title: 'Gejala DBD',
                    description:
                        'Kenali gejala umum yang sering muncul pada penderita DBD.',
                    icon: Icons.sick_outlined,
                    color: const Color(0xFFFF8F00),
                  ),
                  _buildTopicCard(
                    id: 'tanda_bahaya',
                    title: 'Tanda Bahaya DBD',
                    description:
                        'Waspadai kondisi yang membutuhkan penanganan segera.',
                    icon: Icons.warning_amber_rounded,
                    color: const Color(0xFFE53935),
                  ),
                  _buildTopicCard(
                    id: 'tindakan',
                    title: 'Tindakan Awal',
                    description:
                        'Ketahui langkah yang harus dilakukan saat tanda bahaya muncul.',
                    icon: Icons.health_and_safety_outlined,
                    color: const Color(0xFF00897B),
                  ),
                  _buildTopicCard(
                    id: 'pencegahan',
                    title: 'Pencegahan DBD',
                    description:
                        'Pelajari 3M Plus dan cara mencegah gigitan nyamuk.',
                    icon: Icons.shield_outlined,
                    color: const Color(0xFF2E7D32),
                  ),

                  const SizedBox(height: 28),

                  // Section: Evaluasi
                  Text(
                    'Uji Pengetahuan',
                    style: GoogleFonts.poppins(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: AppTheme.textColor,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    'Setelah membaca semua materi',
                    style: GoogleFonts.poppins(
                      fontSize: 12,
                      color: AppTheme.secondaryTextColor,
                    ),
                  ),
                  const SizedBox(height: 16),

                  _buildQuizCard(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildModernHeader() {
    return Container(
      width: double.infinity,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Color(0xFF1976D2),
            Color(0xFF0D47A1),
            Color(0xFF0A2472),
          ],
        ),
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(32),
          bottomRight: Radius.circular(32),
        ),
        boxShadow: [
          BoxShadow(
            color: Color(0x440D47A1),
            blurRadius: 15,
            offset: Offset(0, 8),
          ),
        ],
      ),
      child: SafeArea(
        bottom: false,
        child: Stack(
          children: [
            // Decorative background patterns
            Positioned(
              right: -50,
              top: -50,
              child: Container(
                width: 150,
                height: 150,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white.withOpacity(0.05),
                ),
              ),
            ),
            Positioned(
              right: 40,
              top: 50,
              child: Container(
                width: 80,
                height: 80,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white.withOpacity(0.04),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(24, 20, 24, 28),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(6),
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.15),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: const Icon(Icons.health_and_safety, color: Colors.white, size: 18),
                      ),
                      const SizedBox(width: 8),
                      Text(
                        'mHealth',
                        style: GoogleFonts.poppins(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontSize: 16,
                          letterSpacing: 0.5,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 24),
                  Text(
                    'Selamat Datang, Ibu 👋',
                    style: GoogleFonts.poppins(
                      color: Colors.white.withOpacity(0.9),
                      fontSize: 13,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    'Siaga DBD Ibu',
                    style: GoogleFonts.poppins(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 24,
                      height: 1.2,
                    ),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    'Pusat edukasi interaktif untuk mengenali tanda bahaya DBD sejak dini.',
                    style: GoogleFonts.poppins(
                      color: Colors.white.withOpacity(0.8),
                      fontSize: 12,
                      height: 1.4,
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

  Widget _buildTopicCard({
    required String id,
    required String title,
    required String description,
    required IconData icon,
    required Color color,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.04),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () => _navigateToTopic(id),
          borderRadius: BorderRadius.circular(16),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                // Accent Icon Box
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: color.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Icon(icon, color: color, size: 26),
                ),
                const SizedBox(width: 16),

                // Text Column
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: GoogleFonts.poppins(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: AppTheme.textColor,
                        ),
                      ),
                      const SizedBox(height: 3),
                      Text(
                        description,
                        style: GoogleFonts.poppins(
                          fontSize: 12,
                          color: AppTheme.secondaryTextColor,
                          height: 1.4,
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),

                const SizedBox(width: 8),
                Icon(
                  Icons.arrow_forward_ios_rounded,
                  color: AppTheme.secondaryTextColor.withOpacity(0.4),
                  size: 14,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _navigateToTopic(String id) {
    switch (id) {
      case 'gejala':
        Get.to(() => const GejalaPage(), transition: Transition.rightToLeft);
        break;
      case 'tanda_bahaya':
        Get.to(() => const TandaBahayaPage(),
            transition: Transition.rightToLeft);
        break;
      case 'tindakan':
        Get.to(() => const TindakanPage(), transition: Transition.rightToLeft);
        break;
      default:
        final topic = DbdData.topics.firstWhere((t) => t.id == id);
        Get.to(() => SlideshowPage(topic: topic),
            transition: Transition.rightToLeft);
    }
  }

  Widget _buildQuizCard() {
    return Container(
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Color(0xFF6A1B9A),
            Color(0xFF4A148C),
          ],
        ),
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFF6A1B9A).withOpacity(0.35),
            blurRadius: 14,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () {
            Get.to(() => const QuizPage(), transition: Transition.rightToLeft);
          },
          borderRadius: BorderRadius.circular(16),
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: const Icon(
                    Icons.quiz_outlined,
                    color: Colors.white,
                    size: 30,
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Evaluasi Pengetahuan',
                        style: GoogleFonts.poppins(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(height: 3),
                      Text(
                        'Uji pemahaman Anda setelah membaca materi.',
                        style: GoogleFonts.poppins(
                          fontSize: 12,
                          color: Colors.white.withOpacity(0.8),
                        ),
                      ),
                      const SizedBox(height: 8),
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 4),
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.2),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Text(
                          '10 Soal Pilihan Ganda',
                          style: GoogleFonts.poppins(
                            fontSize: 11,
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const Icon(
                  Icons.arrow_forward_ios_rounded,
                  color: Colors.white,
                  size: 16,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
