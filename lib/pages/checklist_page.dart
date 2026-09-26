import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';
import 'package:online_cource_app/theme/app_theme.dart';
import 'package:online_cource_app/model/dbd_data.dart';

class ChecklistPage extends StatefulWidget {
  const ChecklistPage({super.key});

  @override
  State<ChecklistPage> createState() => _ChecklistPageState();
}

class _ChecklistPageState extends State<ChecklistPage> {
  final List<bool> _checked =
      List.generate(DbdData.preventionChecklist.length, (_) => false);

  int get _completedCount => _checked.where((v) => v).length;
  int get _totalCount => _checked.length;

  @override
  Widget build(BuildContext context) {
    final double progress = _completedCount / _totalCount;

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
          'Checklist Pencegahan',
          style: GoogleFonts.poppins(
            fontWeight: FontWeight.bold,
            color: AppTheme.textColor,
            fontSize: 18,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Progress Header
            Container(
              color: Colors.white,
              padding: const EdgeInsets.fromLTRB(20, 16, 20, 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Checklist Pencegahan Hari Ini',
                        style: GoogleFonts.poppins(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: AppTheme.textColor,
                        ),
                      ),
                      Text(
                        '$_completedCount/$_totalCount',
                        style: GoogleFonts.poppins(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: const Color(0xFF2E7D32),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(4),
                    child: LinearProgressIndicator(
                      value: progress,
                      minHeight: 8,
                      backgroundColor: const Color(0xFFE8F5E9),
                      valueColor: const AlwaysStoppedAnimation<Color>(
                          Color(0xFF43A047)),
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    progress == 1.0
                        ? '🎉 Semua kegiatan sudah dilakukan hari ini!'
                        : 'Tandai kegiatan yang sudah Anda lakukan',
                    style: GoogleFonts.poppins(
                      fontSize: 12,
                      color: progress == 1.0
                          ? const Color(0xFF2E7D32)
                          : AppTheme.secondaryTextColor,
                      fontWeight: progress == 1.0
                          ? FontWeight.w600
                          : FontWeight.normal,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),

            // Checklist Items
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                children: List.generate(
                  DbdData.preventionChecklist.length,
                  (index) => _buildCheckItem(index),
                ),
              ),
            ),

            const SizedBox(height: 20),

            // Info box
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: const Color(0xFFE3F2FD),
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                      color: const Color(0xFF1565C0).withOpacity(0.2)),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Icon(Icons.lightbulb_outline_rounded,
                        color: Color(0xFF1565C0), size: 20),
                    const SizedBox(width: 10),
                    Expanded(
                      child: Text(
                        'Lakukan kegiatan pencegahan ini secara rutin setiap hari untuk memutus siklus perkembangbiakan nyamuk Aedes aegypti di sekitar rumah Anda.',
                        style: GoogleFonts.poppins(
                          fontSize: 12,
                          color: const Color(0xFF0D47A1),
                          height: 1.6,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 32),
          ],
        ),
      ),
    );
  }

  Widget _buildCheckItem(int index) {
    final item = DbdData.preventionChecklist[index];
    final bool isChecked = _checked[index];

    return GestureDetector(
      onTap: () => setState(() => _checked[index] = !_checked[index]),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 250),
        margin: const EdgeInsets.only(bottom: 10),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: isChecked ? const Color(0xFFE8F5E9) : Colors.white,
          borderRadius: BorderRadius.circular(14),
          border: Border.all(
            color: isChecked
                ? const Color(0xFF43A047).withOpacity(0.5)
                : const Color(0xFFE0E0E0),
            width: 1.5,
          ),
          boxShadow: [
            BoxShadow(
              color: isChecked
                  ? const Color(0xFF43A047).withOpacity(0.08)
                  : Colors.black.withOpacity(0.03),
              blurRadius: 8,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Row(
          children: [
            // Icon
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: isChecked
                    ? const Color(0xFF43A047).withOpacity(0.12)
                    : const Color(0xFF2E7D32).withOpacity(0.06),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Icon(
                item.icon,
                color: isChecked
                    ? const Color(0xFF43A047)
                    : AppTheme.secondaryTextColor,
                size: 20,
              ),
            ),
            const SizedBox(width: 14),

            // Text
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    item.title,
                    style: GoogleFonts.poppins(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: isChecked
                          ? const Color(0xFF2E7D32)
                          : AppTheme.textColor,
                      decoration:
                          isChecked ? TextDecoration.lineThrough : null,
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    item.description,
                    style: GoogleFonts.poppins(
                      fontSize: 12,
                      color: AppTheme.secondaryTextColor,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 10),

            // Checkbox
            AnimatedContainer(
              duration: const Duration(milliseconds: 250),
              width: 26,
              height: 26,
              decoration: BoxDecoration(
                color: isChecked ? const Color(0xFF43A047) : Colors.white,
                shape: BoxShape.circle,
                border: Border.all(
                  color: isChecked
                      ? const Color(0xFF43A047)
                      : const Color(0xFFBDBDBD),
                  width: 2,
                ),
              ),
              child: isChecked
                  ? const Icon(Icons.check_rounded,
                      color: Colors.white, size: 16)
                  : null,
            ),
          ],
        ),
      ),
    );
  }
}
