import 'package:flutter/material.dart';
import 'package:rajamark_app/dashboard/user_manual.dart';
import 'package:rajamark_app/shared/sidebar.dart';
import 'package:rajamark_app/shared/top_row_widget.dart';
import 'package:rajamark_app/dashboard/exam.dart';
import 'package:rajamark_app/dashboard/account.dart';
import 'package:rajamark_app/auth/login.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({Key? key,}) : super(key: key);

  @override
  _DashboardPageState createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  Widget _currentContent = const UserManual();

  void _showExamDashboard() {
    setState(() {
      _currentContent = const ExamDashboard();
    });
  }

  void _showAccountDashboard() {
    setState(() {
      _currentContent = const AccountDashboard();
    });
  }

  void _userManualView() {
    setState(() {
      _currentContent = const UserManual();
    });
  }

  void _logout() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => LoginPage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          if (constraints.maxWidth < 700) {
            // Mobile layout
            return Column(
              children: [
                Sidebar(
                  onExamTap: _showExamDashboard, 
                  onAccountTap: _showAccountDashboard, 
                  onManualTap: _userManualView, 
                  onLogoutTap: _logout,
                ),
                Expanded(
                  child: _currentContent,
                )
              ],
            );
          } else {
            // Desktop layout
            return Row(
              children: [
                Sidebar(
                  onExamTap: _showExamDashboard, 
                  onAccountTap: _showAccountDashboard, 
                  onManualTap: _userManualView, 
                  onLogoutTap: _logout,
                ),
                Expanded(
                  child: _currentContent,
                ),
              ],
            );
          }
        },
      ),
    );
  }
}