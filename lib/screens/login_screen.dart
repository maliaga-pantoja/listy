import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../theme.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 32.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Spacer(),
              // Top Card / Container
              Container(
                padding: const EdgeInsets.all(32),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(24),
                  border: Border.all(color: Colors.black.withOpacity(0.05)),
                ),
                child: Column(
                  children: [
                    // Icon
                    Container(
                      width: 80,
                      height: 80,
                      decoration: BoxDecoration(
                        color: AppTheme.primaryBlue.withOpacity(0.1),
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(
                        Icons.task_alt,
                        color: AppTheme.primaryBlue,
                        size: 40,
                      ),
                    ),
                    const SizedBox(height: 24),
                    Text(
                      'Bienvenido de nuevo',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.montserrat(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        color: AppTheme.textDark,
                      ),
                    ),
                    const SizedBox(height: 12),
                    Text(
                      'Organiza tu día y alcanza tus metas con TaskMaster.',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.montserrat(
                        fontSize: 14,
                        color: AppTheme.textGray,
                        height: 1.5,
                      ),
                    ),
                    const SizedBox(height: 32),
                    // Google Login Button
                    OutlinedButton(
                      onPressed: () {},
                      style: OutlinedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 14),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        side: BorderSide(color: Colors.black.withOpacity(0.1)),
                        backgroundColor: AppTheme.backgroundGray,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(Icons.g_mobiledata, size: 30, color: Colors.blue), // Using icon placeholder for google
                          const SizedBox(width: 8),
                          Text(
                            'Continuar con Google',
                            style: GoogleFonts.montserrat(
                              fontSize: 15,
                              fontWeight: FontWeight.w600,
                              color: AppTheme.textDark,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 16),
                    // Guest Login Button
                    ElevatedButton(
                      onPressed: () {
                        // Navigate to home
                      },
                      child: const Text('Continuar como invitado'),
                    ),
                  ],
                ),
              ),
              const Spacer(),
              // Bottom Progress segments simulation
              Row(
                children: [
                  Expanded(child: Container(height: 4, color: AppTheme.primaryBlue.withOpacity(0.2))),
                  Expanded(child: Container(height: 4, color: AppTheme.primaryBlue.withOpacity(0.4))),
                  Expanded(child: Container(height: 4, color: AppTheme.primaryBlue.withOpacity(0.6))),
                  Expanded(child: Container(height: 4, color: AppTheme.primaryBlue)),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
