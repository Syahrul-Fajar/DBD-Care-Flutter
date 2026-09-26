import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';
import 'package:online_cource_app/theme/app_theme.dart';
import 'package:online_cource_app/Model/dbd_data.dart';
import 'package:online_cource_app/pages/tindakan_page.dart';

class TandaBahayaPage extends StatefulWidget {
  const TandaBahayaPage({super.key});

  @override
  State<TandaBahayaPage> createState() => _TandaBahayaPageState();
}

class _TandaBahayaPageState extends State<TandaBahayaPage> {
  int? _selectedIndex;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFF8F8),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.5,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new_rounded,
              color: AppTheme.textColor),
          onPressed: () => Get.back(),
        ),
        title: Text(
          'Tanda Bahaya DBD',
          style: GoogleFonts.poppins(
            fontWeight: FontWeight.bold,
            color: AppTheme.textColor,
            fontSize: 18,
          ),
        ),
      ),
      body: Column(
        children: [
      // Warning Banner
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [Color(0xFFB71C1C), Color(0xFFE53935)],
              ),
            ),
            child: Row(
              children: [
                const Icon(Icons.warning_rounded, color: Colors.white, size: 24),
                const SizedBox(width: 12),
                Expanded(
                  child: Text(
                    'Segera waspadai kondisi berikut. Jika muncul, JANGAN TUNDA penanganan medis.',
                    style: GoogleFonts.poppins(
                      fontSize: 12,
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                      height: 1.4,
                    ),
                  ),
                ),
              ],
            ),
          ),

          // Dengue Berat label
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            color: const Color(0xFFFFEBEE),
            child: Row(
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                  decoration: BoxDecoration(
                    color: const Color(0xFFB71C1C),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    'DENGUE BERAT (Severe Dengue)',
                    style: GoogleFonts.poppins(
                      fontSize: 11,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: Text(
                    '— Darurat, RUJUK SEGERA',
                    style: GoogleFonts.poppins(
                      fontSize: 11,
                      color: const Color(0xFFB71C1C),
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),
          ),

          // List
          Expanded(
            child: _selectedIndex == null
                ? _buildWarningList()
                : _buildWarningDetail(_selectedIndex!),
          ),
        ],
      ),
    );
  }

  Widget _buildWarningList() {
    final severeItems = DbdData.warningSigns.where((s) => s.category == 'severe').toList();
    final warningItems = DbdData.warningSigns.where((s) => s.category == 'warning').toList();

    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        // Severe items
        ...severeItems.map((sign) {
          final int index = DbdData.warningSigns.indexOf(sign);
          return _buildSignCard(sign, index, const Color(0xFFB71C1C), const Color(0xFFFFEBEE));
        }),

        // Warning signs section header
        const SizedBox(height: 8),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          decoration: BoxDecoration(
            color: const Color(0xFFFFF3E0),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Row(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                decoration: BoxDecoration(
                  color: const Color(0xFFE65100),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  'DENGUE DENGAN WARNING SIGNS',
                  style: GoogleFonts.poppins(
                    fontSize: 11,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: Text(
                  '— RUJUK ke RS',
                  style: GoogleFonts.poppins(
                    fontSize: 11,
                    color: const Color(0xFFE65100),
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 10),

        // Warning items
        ...warningItems.map((sign) {
          final int index = DbdData.warningSigns.indexOf(sign);
          return _buildSignCard(sign, index, const Color(0xFFE65100), const Color(0xFFFFF3E0));
        }),
        const SizedBox(height: 16),
      ],
    );
  }

  Widget _buildSignCard(WarningSign sign, int index, Color accentColor, Color bgColor) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: accentColor.withOpacity(0.3), width: 1),
        boxShadow: [
          BoxShadow(
            color: accentColor.withOpacity(0.05),
            blurRadius: 8,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () => setState(() => _selectedIndex = index),
          borderRadius: BorderRadius.circular(14),
          child: Padding(
            padding: const EdgeInsets.all(14.0),
            child: Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: accentColor.withOpacity(0.08),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Icon(sign.icon, color: accentColor, size: 22),
                ),
                const SizedBox(width: 14),
                Expanded(
                  child: Text(
                    sign.title,
                    style: GoogleFonts.poppins(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: AppTheme.textColor,
                    ),
                  ),
                ),
                Icon(
                  Icons.arrow_forward_ios_rounded,
                  color: accentColor,
                  size: 14,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildWarningDetail(int index) {
    final sign = DbdData.warningSigns[index];
    final Color accentColor = sign.category == 'severe'
        ? const Color(0xFFB71C1C)
        : const Color(0xFFE65100);
    final String categoryLabel = sign.category == 'severe'
        ? 'DENGUE BERAT — Darurat'
        : 'DENGUE DENGAN WARNING SIGNS';

    return SingleChildScrollView(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Back button
          GestureDetector(
            onTap: () => setState(() => _selectedIndex = null),
            child: Row(
              children: [
                Icon(Icons.arrow_back_ios_rounded, size: 14, color: accentColor),
                Text(
                  'Kembali ke daftar',
                  style: GoogleFonts.poppins(
                    fontSize: 13,
                    color: accentColor,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),

          // Category badge
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 5),
            decoration: BoxDecoration(
              color: accentColor,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Text(
              categoryLabel,
              style: GoogleFonts.poppins(
                fontSize: 11,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
          const SizedBox(height: 16),

          // Title section
          if (sign.imageUrl != null)
            Container(
              width: double.infinity,
              margin: const EdgeInsets.only(bottom: 20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: accentColor.withOpacity(0.2)),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Image.asset(
                  sign.imageUrl!,
                  width: double.infinity,
                  fit: BoxFit.contain,
                ),
              ),
            )
          else
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: accentColor.withOpacity(0.06),
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: accentColor.withOpacity(0.2)),
              ),
              child: Column(
                children: [
                  Container(
                    padding: const EdgeInsets.all(14),
                    decoration: BoxDecoration(
                      color: accentColor.withOpacity(0.1),
                      shape: BoxShape.circle,
                    ),
                    child: Icon(sign.icon, color: accentColor, size: 36),
                  ),
                  const SizedBox(height: 14),
                  Text(
                    sign.title,
                    style: GoogleFonts.poppins(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: accentColor,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          if (sign.imageUrl == null) const SizedBox(height: 20),

          // Description
          Text(
            'Penjelasan',
            style: GoogleFonts.poppins(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: AppTheme.textColor,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            sign.description,
            style: GoogleFonts.poppins(
              fontSize: 14,
              color: AppTheme.textColor,
              height: 1.7,
            ),
          ),
          const SizedBox(height: 20),

          // Risk section
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: const Color(0xFFFFF3E0),
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: const Color(0xFFFF8F00).withOpacity(0.4)),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    const Icon(Icons.warning_amber_rounded,
                        color: Color(0xFFFF8F00), size: 18),
                    const SizedBox(width: 8),
                    Text(
                      'Risiko jika diabaikan',
                      style: GoogleFonts.poppins(
                        fontSize: 13,
                        fontWeight: FontWeight.bold,
                        color: const Color(0xFFE65100),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Text(
                  sign.risk,
                  style: GoogleFonts.poppins(
                    fontSize: 13,
                    color: const Color(0xFF5D4037),
                    height: 1.5,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 24),

          // CTA Button
          ElevatedButton.icon(
            onPressed: () {
              Get.to(() => const TindakanPage(),
                  transition: Transition.rightToLeft);
            },
            icon: const Icon(Icons.health_and_safety_outlined,
                color: Colors.white),
            label: Text(
              'Apa yang harus dilakukan?',
              style: GoogleFonts.poppins(
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF00897B),
              minimumSize: const Size(double.infinity, 50),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
          ),
          const SizedBox(height: 12),
          OutlinedButton(
            onPressed: () => setState(() => _selectedIndex = null),
            style: OutlinedButton.styleFrom(
              side: BorderSide(color: accentColor),
              minimumSize: const Size(double.infinity, 50),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            child: Text(
              'Kembali ke Tanda Bahaya',
              style: GoogleFonts.poppins(
                fontWeight: FontWeight.w600,
                color: accentColor,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
