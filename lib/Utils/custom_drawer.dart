import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:online_cource_app/About/about_screen.dart';
import 'package:online_cource_app/Courses/alll_courses.dart';
import 'package:online_cource_app/Courses/enrolled_course.dart';
import 'package:online_cource_app/Exam/exam_home.dart';

import 'package:online_cource_app/Home/home_page.dart';
import 'package:online_cource_app/Login/login_page.dart';

import 'package:online_cource_app/controllers/auth_controller.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            decoration: const BoxDecoration(
              color: Color(0xFF1565C0),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 80,
                  height: 80,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.15),
                        blurRadius: 12,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: ClipOval(
                    child: Image.asset(
                      'assets/logo_dbd_care.jpg',
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
                const SizedBox(height: 8),
                const Text(
                  'DBD Care',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 0.5,
                  ),
                ),
                const Text(
                  'Edukasi DBD',
                  style: TextStyle(
                    color: Colors.white70,
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ),
          ListTile(
            leading: const Icon(OctIcons.home),
            title: const Text('Home'),
            onTap: () {
              Get.to(() => const MyHomePage());
            },
          ),
          ListTile(
            leading: const Icon(OctIcons.book),
            title: const Text('All Courses'),
            onTap: () {
              Get.to(() => const CourseListPage());
            },
          ),
          ListTile(
            leading: const Icon(OctIcons.diff_ignored),
            title: const Text('Enrolled'),
            onTap: () {
              Get.to(() => const EnrolledCoursesScreen());
            },
          ),
          ListTile(
            leading: const Icon(OctIcons.telescope),
            title: const Text('Exam'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const ExamHome()),
              );
            },
          ),
          ListTile(
            leading: const Icon(OctIcons.info),
            title: const Text('About'),
            onTap: () {
              Get.to(() => const AboutPage());
            },
          ),
          ListTile(
            leading: const Icon(OctIcons.sign_out),
            title: const Text('Sign Out'),
            onTap: () {
              // Navigate to LoginPage
              AuthController().signOutUsers();
              Get.off(() => const LoginPage());
            },
          ),
        ],
      ),
    );
  }
}
