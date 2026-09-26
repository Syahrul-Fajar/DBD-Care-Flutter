import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';
import 'package:online_cource_app/theme/app_theme.dart';
import 'package:online_cource_app/model/dbd_data.dart';
import 'package:online_cource_app/pages/home_page.dart';
import 'package:online_cource_app/pages/quiz_page.dart';

class QuizResultPage extends StatelessWidget {
  final int score;
  final int totalQuestions;

  const QuizResultPage({
    super.key,
    required this.score,
    required this.totalQuestions,
  });

  @override
  Widget build(BuildContext context) {
    final int percentage = (score / totalQuestions * 100).round();

    String categoryLabel;
    String feedbackTitle;
    String feedbackMessage;
    Color themeColor;
    IconData feedbackIcon;

    if (percentage == 100) {
      categoryLabel = 'Sangat Baik';
      feedbackTitle = 'Sempurna! 🏆';
      feedbackMessage =
          'Luar biasa! Anda memahami seluruh materi DBD dengan sangat baik. Tetap waspada dan bagikan pengetahuan ini kepada keluarga!';
      themeColor = const Color(0xFF1565C0);
      feedbackIcon = Icons.emoji_events_outlined;
    } else if (percentage >= 80) {
      categoryLabel = 'Baik';
      feedbackTitle = 'Hasil Baik! 👍';
      feedbackMessage =
          'Anda sudah memahami sebagian besar materi. Tetap pelajari kembali bagian tanda bahaya agar lebih siap mengenali kondisi darurat.';
      themeColor = const Color(0xFF43A047);
      feedbackIcon = Icons.thumb_up_alt_outlined;
    } else if (percentage >= 60) {
      categoryLabel = 'Cukup';
      feedbackTitle = 'Cukup Baik';
      feedbackMessage =
          'Pemahaman Anda cukup, namun perlu diperkuat terutama pada materi tanda bahaya dan tindakan awal DBD. Bacalah kembali materinya.';
      themeColor = const Color(0xFFFF8F00);
      feedbackIcon = Icons.star_half_rounded;
    } else {
      categoryLabel = 'Perlu Belajar Ulang';
      feedbackTitle = 'Ayo Belajar Lagi!';
      feedbackMessage =
          'Jangan berkecil hati! Baca kembali semua materi secara perlahan, terutama bagian Gejala, Tanda Bahaya, dan Pencegahan DBD.';
      themeColor = const Color(0xFFE53935);
      feedbackIcon = Icons.menu_book_outlined;
    }

    return Scaffold(
      backgroundColor: AppTheme.backgroundColor,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 32.0),
          child: Column(
            children: [
              // Icon
              Container(
                padding: const EdgeInsets.all(24),
                decoration: BoxDecoration(
                  color: themeColor.withOpacity(0.1),
                  shape: BoxShape.circle,
                ),
                child: Icon(feedbackIcon, size: 76, color: themeColor),
              ),
              const SizedBox(height: 24),

              // Title
              Text(
                feedbackTitle,
                style: GoogleFonts.poppins(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                  color: themeColor,
                ),
              ),
              const SizedBox(height: 12),

              // Category badge
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
                decoration: BoxDecoration(
                  color: themeColor.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(30),
                  border: Border.all(color: themeColor.withOpacity(0.3)),
                ),
                child: Text(
                  'Kategori: $categoryLabel',
                  style: GoogleFonts.poppins(
                    fontSize: 13,
                    fontWeight: FontWeight.bold,
                    color: themeColor,
                  ),
                ),
              ),
              const SizedBox(height: 16),

              // Feedback message
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Text(
                  feedbackMessage,
                  style: GoogleFonts.poppins(
                    fontSize: 14,
                    color: AppTheme.secondaryTextColor,
                    height: 1.6,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(height: 32),

              // Score Card
              Container(
                padding: const EdgeInsets.symmetric(vertical: 28, horizontal: 32),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.05),
                      blurRadius: 15,
                      offset: const Offset(0, 5),
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    Text(
                      'Skor Anda',
                      style: GoogleFonts.poppins(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: AppTheme.secondaryTextColor,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      '$percentage',
                      style: GoogleFonts.poppins(
                        fontSize: 64,
                        fontWeight: FontWeight.bold,
                        color: themeColor,
                        height: 1.0,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      '$score Benar dari $totalQuestions Soal',
                      style: GoogleFonts.poppins(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: AppTheme.textColor,
                      ),
                    ),
                    const SizedBox(height: 16),

                    // Score legend
                    _buildScoreLegend(percentage),
                  ],
                ),
              ),
              const SizedBox(height: 32),

              // Buttons
              OutlinedButton(
                onPressed: () {
                  Get.off(() => const QuizPage(), transition: Transition.fade);
                },
                style: OutlinedButton.styleFrom(
                  side: const BorderSide(color: AppTheme.primaryColor, width: 1.5),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(14)),
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  minimumSize: const Size(double.infinity, 52),
                ),
                child: Text(
                  'Ulangi Kuis',
                  style: GoogleFonts.poppins(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: AppTheme.primaryColor,
                  ),
                ),
              ),
              const SizedBox(height: 14),

              ElevatedButton(
                onPressed: () {
                  Get.offAll(() => const HomePage(), transition: Transition.fade);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppTheme.primaryColor,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(14)),
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  minimumSize: const Size(double.infinity, 52),
                ),
                child: Text(
                  'Kembali ke Beranda',
                  style: GoogleFonts.poppins(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildScoreLegend(int userScore) {
    final categories = [
      {'label': '0–50', 'name': 'Perlu Belajar Ulang', 'min': 0, 'max': 50},
      {'label': '60–70', 'name': 'Cukup', 'min': 60, 'max': 70},
      {'label': '80–90', 'name': 'Baik', 'min': 80, 'max': 90},
      {'label': '100', 'name': 'Sangat Baik', 'min': 100, 'max': 100},
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Divider(color: Colors.grey[200]),
        const SizedBox(height: 8),
        Text(
          'Kategori Skor',
          style: GoogleFonts.poppins(
            fontSize: 12,
            fontWeight: FontWeight.bold,
            color: AppTheme.secondaryTextColor,
          ),
        ),
        const SizedBox(height: 8),
        ...categories.map((cat) {
          final int min = cat['min'] as int;
          final int max = cat['max'] as int;
          final bool isActive = userScore >= min && userScore <= max;
          return Padding(
            padding: const EdgeInsets.only(bottom: 4),
            child: Row(
              children: [
                if (isActive)
                  const Icon(Icons.arrow_right_rounded,
                      size: 16, color: Color(0xFF1565C0))
                else
                  const SizedBox(width: 16),
                const SizedBox(width: 4),
                Text(
                  '${cat['label']} ',
                  style: GoogleFonts.poppins(
                    fontSize: 12,
                    fontWeight:
                        isActive ? FontWeight.bold : FontWeight.normal,
                    color: isActive
                        ? const Color(0xFF1565C0)
                        : AppTheme.secondaryTextColor,
                  ),
                ),
                Text(
                  ': ${cat['name']}',
                  style: GoogleFonts.poppins(
                    fontSize: 12,
                    fontWeight:
                        isActive ? FontWeight.bold : FontWeight.normal,
                    color: isActive
                        ? const Color(0xFF1565C0)
                        : AppTheme.secondaryTextColor,
                  ),
                ),
              ],
            ),
          );
        }),
      ],
    );
  }
}
