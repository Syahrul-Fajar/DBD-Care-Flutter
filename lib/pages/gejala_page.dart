import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';
import 'package:online_cource_app/theme/app_theme.dart';
import 'package:online_cource_app/Model/dbd_data.dart';
class GejalaPage extends StatefulWidget {
  const GejalaPage({super.key});

  @override
  State<GejalaPage> createState() => _GejalaPageState();
}

class _GejalaPageState extends State<GejalaPage> {
  int? _expandedIndex;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.backgroundColor,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.5,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new_rounded,
              color: AppTheme.textColor),
          onPressed: () => Get.back(),
        ),
        title: Text(
          'Gejala DBD',
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
            // Header banner
            Container(
              width: double.infinity,
              padding: const EdgeInsets.fromLTRB(20, 20, 20, 24),
              decoration: const BoxDecoration(
                color: Colors.white,
                border: Border(
                  bottom: BorderSide(color: Color(0xFFEEEEEE)),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: const Color(0xFFFF8F00).withOpacity(0.1),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: const Icon(Icons.sick_outlined,
                            color: Color(0xFFFF8F00), size: 22),
                      ),
                      const SizedBox(width: 10),
                      Text(
                        'Gejala Umum DBD',
                        style: GoogleFonts.poppins(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: AppTheme.textColor,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Text(
                    'Pilih gejala untuk melihat penjelasan lebih lengkap:',
                    style: GoogleFonts.poppins(
                      fontSize: 13,
                      color: AppTheme.secondaryTextColor,
                    ),
                  ),
                ],
              ),
            ),

            // Symptom cards list
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: List.generate(
                  DbdData.symptoms.length,
                  (index) => _buildSymptomCard(index),
                ),
              ),
            ),

            // Note at bottom
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
              child: Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: const Color(0xFFFFF3E0),
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: const Color(0xFFFF8F00).withOpacity(0.3)),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Icon(Icons.info_outline_rounded,
                        color: Color(0xFFFF8F00), size: 20),
                    const SizedBox(width: 10),
                    Expanded(
                      child: Text(
                        'Jika mengalami gejala-gejala di atas, segera periksakan diri ke fasilitas kesehatan terdekat untuk mendapatkan penanganan yang tepat.',
                        style: GoogleFonts.poppins(
                          fontSize: 12,
                          color: const Color(0xFF5D4037),
                          height: 1.5,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }

  Widget _buildSymptomCard(int index) {
    final symptom = DbdData.symptoms[index];
    final bool isExpanded = _expandedIndex == index;

    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(
          color:
              isExpanded ? symptom.color.withOpacity(0.5) : Colors.transparent,
          width: 1.5,
        ),
        boxShadow: [
          BoxShadow(
            color: isExpanded
                ? symptom.color.withOpacity(0.12)
                : Colors.black.withOpacity(0.04),
            blurRadius: isExpanded ? 16 : 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () {
            setState(() {
              _expandedIndex = isExpanded ? null : index;
            });
          },
          borderRadius: BorderRadius.circular(14),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Card header row
                Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: symptom.color.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child:
                          Icon(symptom.icon, color: symptom.color, size: 24),
                    ),
                    const SizedBox(width: 14),
                    Expanded(
                      child: Text(
                        symptom.name,
                        style: GoogleFonts.poppins(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: AppTheme.textColor,
                        ),
                      ),
                    ),
                    AnimatedRotation(
                      duration: const Duration(milliseconds: 300),
                      turns: isExpanded ? 0.5 : 0,
                      child: Icon(
                        Icons.keyboard_arrow_down_rounded,
                        color: isExpanded
                            ? symptom.color
                            : AppTheme.secondaryTextColor,
                        size: 24,
                      ),
                    ),
                  ],
                ),

                // Expanded detail
                if (isExpanded) ...[
                  const SizedBox(height: 14),
                  Divider(color: symptom.color.withOpacity(0.2), height: 1),
                  const SizedBox(height: 14),
                  if (symptom.imageUrl != null) ...[
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        boxShadow: [
                          BoxShadow(
                            color: symptom.color.withOpacity(0.15),
                            blurRadius: 12,
                            offset: const Offset(0, 4),
                          ),
                        ],
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: AspectRatio(
                          aspectRatio: 1.0,
                          child: symptom.imageUrl!.startsWith('http')
                              ? Image.network(
                                  symptom.imageUrl!,
                                  fit: BoxFit.cover,
                                )
                              : Image.asset(
                                  symptom.imageUrl!,
                                  fit: BoxFit.cover,
                                ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 14),
                  ],
                  Text(
                    symptom.detail,
                    style: GoogleFonts.poppins(
                      fontSize: 13,
                      color: AppTheme.textColor,
                      height: 1.6,
                    ),
                  ),
                ],
              ],
            ),
          ),
        ),
      ),
    );
  }
}
