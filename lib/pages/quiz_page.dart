import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';
import 'package:online_cource_app/theme/app_theme.dart';
import 'package:online_cource_app/model/dbd_data.dart';
import 'package:online_cource_app/pages/quiz_result_page.dart';

class QuizPage extends StatefulWidget {
  const QuizPage({super.key});

  @override
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  int _currentQuestionIndex = 0;
  int _selectedOptionIndex = -1;
  bool _isAnswered = false;
  int _score = 0;

  void _handleOptionSelection(int optionIndex) {
    if (_isAnswered) return;

    setState(() {
      _selectedOptionIndex = optionIndex;
      _isAnswered = true;
      if (optionIndex == DbdData.quizQuestions[_currentQuestionIndex].correctAnswerIndex) {
        _score++;
      }
    });
  }

  void _handleNextQuestion() {
    int totalQuestions = DbdData.quizQuestions.length;
    if (_currentQuestionIndex < totalQuestions - 1) {
      setState(() {
        _currentQuestionIndex++;
        _selectedOptionIndex = -1;
        _isAnswered = false;
      });
    } else {
      Get.off(
        () => QuizResultPage(score: _score, totalQuestions: totalQuestions),
        transition: Transition.rightToLeftWithFade,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    int totalQuestions = DbdData.quizQuestions.length;
    final question = DbdData.quizQuestions[_currentQuestionIndex];
    bool isLastQuestion = _currentQuestionIndex == totalQuestions - 1;

    return Scaffold(
      backgroundColor: AppTheme.backgroundColor,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.5,
        title: Text(
          'Evaluasi Pengetahuan',
          style: GoogleFonts.poppins(
            fontWeight: FontWeight.bold,
            color: AppTheme.textColor,
            fontSize: 18,
          ),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new_rounded, color: AppTheme.textColor),
          onPressed: () => Get.back(),
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            // Quiz Progress Header
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Pertanyaan ${_currentQuestionIndex + 1} dari $totalQuestions',
                        style: GoogleFonts.poppins(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: AppTheme.primaryColor,
                        ),
                      ),
                      Text(
                        'Skor: $_score',
                        style: GoogleFonts.poppins(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: const Color(0xFF43A047),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  // Progress Bar
                  LinearProgressIndicator(
                    value: (_currentQuestionIndex + 1) / totalQuestions,
                    backgroundColor: AppTheme.dividerColor,
                    valueColor: const AlwaysStoppedAnimation<Color>(AppTheme.primaryColor),
                    minHeight: 6,
                    borderRadius: BorderRadius.circular(3),
                  ),
                ],
              ),
            ),

            // Scrollable Question & Options
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Question Text Box
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(16),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.02),
                            blurRadius: 10,
                            offset: const Offset(0, 4),
                          ),
                        ],
                      ),
                      child: Text(
                        question.question,
                        style: GoogleFonts.poppins(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: AppTheme.textColor,
                          height: 1.5,
                        ),
                      ),
                    ),
                    const SizedBox(height: 24),

                    // Options list
                    ...List.generate(
                      question.options.length,
                      (index) => _buildOptionButton(index, question),
                    ),
                    const SizedBox(height: 20),

                    // Explanation Box
                    if (_isAnswered) _buildExplanationBox(question),
                  ],
                ),
              ),
            ),

            // Next Action Button
            if (_isAnswered)
              Padding(
                padding: const EdgeInsets.all(24.0),
                child: ElevatedButton(
                  onPressed: _handleNextQuestion,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: isLastQuestion
                        ? const Color(0xFF02C39A)
                        : AppTheme.primaryColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    minimumSize: const Size(double.infinity, 50),
                  ),
                  child: Text(
                    isLastQuestion ? 'Lihat Hasil Evaluasi' : 'Pertanyaan Berikutnya',
                    style: GoogleFonts.poppins(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildOptionButton(int index, QuizQuestion question) {
    final optionText = question.options[index];
    Color buttonBgColor = Colors.white;
    Color borderAndTextColor = AppTheme.textColor;
    IconData? indicatorIcon;

    if (_isAnswered) {
      if (index == question.correctAnswerIndex) {
        // Correct Option
        buttonBgColor = const Color(0xFFE8F5E9);
        borderAndTextColor = const Color(0xFF43A047);
        indicatorIcon = Icons.check_circle_rounded;
      } else if (index == _selectedOptionIndex) {
        // Wrong Option selected by user
        buttonBgColor = const Color(0xFFFFEBEE);
        borderAndTextColor = const Color(0xFFE53935);
        indicatorIcon = Icons.cancel_rounded;
      } else {
        // Other non-selected options
        buttonBgColor = Colors.white.withOpacity(0.6);
        borderAndTextColor = AppTheme.secondaryTextColor;
      }
    } else {
      // Not answered yet
      buttonBgColor = Colors.white;
      borderAndTextColor = AppTheme.textColor;
    }

    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      width: double.infinity,
      decoration: BoxDecoration(
        color: buttonBgColor,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: _isAnswered && (index == question.correctAnswerIndex || index == _selectedOptionIndex)
              ? borderAndTextColor
              : AppTheme.dividerColor,
          width: 1.5,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.01),
            blurRadius: 5,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () => _handleOptionSelection(index),
          borderRadius: BorderRadius.circular(12),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    optionText,
                    style: GoogleFonts.poppins(
                      fontSize: 14,
                      fontWeight: _isAnswered && index == _selectedOptionIndex
                          ? FontWeight.bold
                          : FontWeight.normal,
                      color: borderAndTextColor,
                    ),
                  ),
                ),
                if (indicatorIcon != null)
                  Icon(
                    indicatorIcon,
                    color: borderAndTextColor,
                    size: 20,
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildExplanationBox(QuizQuestion question) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFFE8F0FE),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: const Color(0xFF1A73E8).withOpacity(0.3),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Icon(
                Icons.lightbulb_outline_rounded,
                color: Color(0xFF1A73E8),
                size: 20,
              ),
              const SizedBox(width: 8),
              Text(
                'Pembahasan',
                style: GoogleFonts.poppins(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: const Color(0xFF1A73E8),
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Text(
            question.explanation,
            style: GoogleFonts.poppins(
              fontSize: 13,
              color: const Color(0xFF1E293B),
              height: 1.5,
            ),
          ),
        ],
      ),
    );
  }
}
