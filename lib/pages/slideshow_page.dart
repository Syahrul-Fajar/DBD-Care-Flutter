import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';
import 'package:online_cource_app/theme/app_theme.dart';
import 'package:online_cource_app/Model/dbd_data.dart';
import 'package:online_cource_app/pages/summary_page.dart';

class SlideshowPage extends StatefulWidget {
  final DbdTopic topic;

  const SlideshowPage({super.key, required this.topic});

  @override
  State<SlideshowPage> createState() => _SlideshowPageState();
}

class _SlideshowPageState extends State<SlideshowPage> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _showDetailSheet(BuildContext context, String detail) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (_) => Container(
        constraints:
            BoxConstraints(maxHeight: MediaQuery.of(context).size.height * 0.6),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Handle
            Container(
              margin: const EdgeInsets.only(top: 12),
              width: 40,
              height: 4,
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(2),
              ),
            ),
            Flexible(
              child: SingleChildScrollView(
                padding: const EdgeInsets.fromLTRB(24, 20, 24, 32),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        const Icon(Icons.info_outline_rounded,
                            color: AppTheme.primaryColor, size: 22),
                        const SizedBox(width: 8),
                        Text(
                          'Detail Tambahan',
                          style: GoogleFonts.poppins(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: AppTheme.textColor,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    Text(
                      detail,
                      style: GoogleFonts.poppins(
                        fontSize: 14,
                        color: AppTheme.textColor,
                        height: 1.7,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    int totalSlides = widget.topic.slides.length;
    bool isLastSlide = _currentPage == totalSlides - 1;

    return Scaffold(
      backgroundColor: AppTheme.backgroundColor,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.5,
        title: Text(
          widget.topic.title,
          style: GoogleFonts.poppins(
            fontWeight: FontWeight.bold,
            color: AppTheme.textColor,
            fontSize: 18,
          ),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new_rounded,
              color: AppTheme.textColor),
          onPressed: () => Get.back(),
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            // Progress bar
            Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: 24.0, vertical: 14.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Slide ${_currentPage + 1} dari $totalSlides',
                        style: GoogleFonts.poppins(
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                          color: AppTheme.secondaryTextColor,
                        ),
                      ),
                      Text(
                        '${((_currentPage + 1) / totalSlides * 100).round()}%',
                        style: GoogleFonts.poppins(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          color: AppTheme.primaryColor,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(4),
                    child: LinearProgressIndicator(
                      value: (_currentPage + 1) / totalSlides,
                      minHeight: 6,
                      backgroundColor: AppTheme.dividerColor,
                      valueColor: const AlwaysStoppedAnimation<Color>(
                          AppTheme.primaryColor),
                    ),
                  ),
                ],
              ),
            ),

            // PageView slides
            Expanded(
              child: PageView.builder(
                controller: _pageController,
                onPageChanged: (index) => setState(() => _currentPage = index),
                itemCount: totalSlides,
                itemBuilder: (context, index) {
                  final slide = widget.topic.slides[index];
                  return _buildSlideContent(context, slide);
                },
              ),
            ),

            // Navigation bar
            Container(
              color: Colors.white,
              padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 16.0),
              child: Row(
                children: [
                  // Prev Button
                  if (_currentPage > 0)
                    Expanded(
                      flex: 2,
                      child: Padding(
                        padding: const EdgeInsets.only(right: 10),
                        child: OutlinedButton(
                          onPressed: () {
                            _pageController.previousPage(
                              duration: const Duration(milliseconds: 300),
                              curve: Curves.easeInOut,
                            );
                          },
                          style: OutlinedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                            padding: const EdgeInsets.symmetric(vertical: 14),
                            side: BorderSide(
                                color: AppTheme.primaryColor.withOpacity(0.5)),
                          ),
                          child: Text(
                            'Sebelumnya',
                            style: GoogleFonts.poppins(
                              fontWeight: FontWeight.w600,
                              color: AppTheme.primaryColor,
                              fontSize: 13,
                            ),
                          ),
                        ),
                      ),
                    ),

                  // Next / Finish Button
                  Expanded(
                    flex: 3,
                    child: ElevatedButton(
                      onPressed: () {
                        if (isLastSlide) {
                          Get.off(
                            () => SummaryPage(topic: widget.topic),
                            transition: Transition.rightToLeftWithFade,
                          );
                        } else {
                          _pageController.nextPage(
                            duration: const Duration(milliseconds: 300),
                            curve: Curves.easeInOut,
                          );
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: isLastSlide
                            ? const Color(0xFF2E7D32)
                            : AppTheme.primaryColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        padding: const EdgeInsets.symmetric(vertical: 14),
                      ),
                      child: Text(
                        isLastSlide ? 'Saya Mengerti ✓' : 'Lanjut →',
                        style: GoogleFonts.poppins(
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                          color: Colors.white,
                        ),
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

  Widget _buildSlideContent(BuildContext context, DbdSlide slide) {
    IconData icon;
    Color iconColor;

    switch (slide.illustrationType) {
      case 'virus':
        icon = Icons.coronavirus_outlined;
        iconColor = const Color(0xFFE53935);
        break;
      case 'mosquito':
        icon = Icons.bug_report_outlined;
        iconColor = Colors.brown;
        break;
      case 'blood':
        icon = Icons.water_drop_outlined;
        iconColor = Colors.red;
        break;
      case 'community':
        icon = Icons.people_alt_outlined;
        iconColor = const Color(0xFF1565C0);
        break;
      case 'prevention':
        icon = Icons.shield_outlined;
        iconColor = const Color(0xFF2E7D32);
        break;
      case 'drain':
        icon = Icons.bathtub_outlined;
        iconColor = Colors.blueGrey;
        break;
      case 'cover':
        icon = Icons.inventory_2_outlined;
        iconColor = Colors.brown;
        break;
      case 'recycle':
        icon = Icons.autorenew_rounded;
        iconColor = Colors.green;
        break;
      case 'protection':
        icon = Icons.dry_cleaning_outlined;
        iconColor = Colors.teal;
        break;
      case 'check':
        icon = Icons.search_outlined;
        iconColor = const Color(0xFF00897B);
        break;
      default:
        icon = Icons.menu_book_outlined;
        iconColor = AppTheme.primaryColor;
    }

    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const SizedBox(height: 12),

          // ── IMAGE / ICON SECTION ──────────────────────────────
          if (slide.imageUrl != null)
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.14),
                    blurRadius: 18,
                    offset: const Offset(0, 6),
                  ),
                ],
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: AspectRatio(
                  aspectRatio: 1.0,
                  child: slide.imageUrl!.startsWith('http')
                      ? Image.network(
                          slide.imageUrl!,
                          fit: BoxFit.cover,
                        )
                      : Image.asset(
                          slide.imageUrl!,
                          fit: BoxFit.cover,
                        ),
                ),
              ),
            )
          else
            Center(
              child: Container(
                width: 150,
                height: 150,
                decoration: BoxDecoration(
                  gradient: RadialGradient(
                    colors: [
                      iconColor.withOpacity(0.18),
                      iconColor.withOpacity(0.05),
                    ],
                  ),
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: iconColor.withOpacity(0.2),
                    width: 2,
                  ),
                ),
                child: Icon(icon, size: 76, color: iconColor),
              ),
            ),

          const SizedBox(height: 18),

          // ── TEXT CONTENT CARD ─────────────────────────────────
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.06),
                  blurRadius: 12,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Gradient header with title
                Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        AppTheme.primaryColor,
                        AppTheme.primaryColor.withOpacity(0.78),
                      ],
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                    ),
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                    ),
                  ),
                  padding: const EdgeInsets.symmetric(
                      horizontal: 18, vertical: 14),
                  child: Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(7),
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.22),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Icon(
                          slide.imageUrl != null
                              ? Icons.info_outline_rounded
                              : icon,
                          color: Colors.white,
                          size: 18,
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Text(
                          slide.title,
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

                // Body text
                Padding(
                  padding: const EdgeInsets.fromLTRB(18, 14, 18, 18),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        slide.content,
                        style: GoogleFonts.poppins(
                          fontSize: 13.5,
                          color: AppTheme.secondaryTextColor,
                          height: 1.8,
                        ),
                        textAlign: TextAlign.left,
                      ),

                      // Detail row button
                      if (slide.detail != null) ...[
                        const SizedBox(height: 14),
                        const Divider(height: 1, thickness: 1),
                        const SizedBox(height: 12),
                        InkWell(
                          onTap: () =>
                              _showDetailSheet(context, slide.detail!),
                          borderRadius: BorderRadius.circular(10),
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 14, vertical: 10),
                            decoration: BoxDecoration(
                              color:
                                  AppTheme.primaryColor.withOpacity(0.07),
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(
                                color:
                                    AppTheme.primaryColor.withOpacity(0.25),
                              ),
                            ),
                            child: Row(
                              children: [
                                const Icon(
                                  Icons.lightbulb_outline_rounded,
                                  size: 16,
                                  color: AppTheme.primaryColor,
                                ),
                                const SizedBox(width: 8),
                                Expanded(
                                  child: Text(
                                    'Lihat Penjelasan Lebih Lengkap',
                                    style: GoogleFonts.poppins(
                                      fontSize: 12.5,
                                      fontWeight: FontWeight.w600,
                                      color: AppTheme.primaryColor,
                                    ),
                                  ),
                                ),
                                const Icon(
                                  Icons.chevron_right_rounded,
                                  size: 18,
                                  color: AppTheme.primaryColor,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ],
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 20),
        ],
      ),
    );
  }
}
