import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../theme.dart';

class TasksScreen extends StatelessWidget {
  const TasksScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            const Icon(Icons.check_circle, size: 28),
            const SizedBox(width: 8),
            Text(
              'Hoy',
              style: GoogleFonts.montserrat(
                fontWeight: FontWeight.bold,
                fontSize: 22,
              ),
            ),
          ],
        ),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.search)),
          IconButton(onPressed: () {}, icon: const Icon(Icons.more_vert)),
          const SizedBox(width: 8),
        ],
      ),
      body: Column(
        children: [
          // Tab bar simulation
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
            child: Container(
              height: 50,
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.05),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      margin: const EdgeInsets.all(4),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.05),
                            blurRadius: 4,
                          ),
                        ],
                      ),
                      child: Text(
                        'Pendientes',
                        style: GoogleFonts.montserrat(
                          fontWeight: FontWeight.bold,
                          color: AppTheme.primaryBlue,
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      alignment: Alignment.center,
                      child: Text(
                        'Cumplidas',
                        style: GoogleFonts.montserrat(
                          fontWeight: FontWeight.bold,
                          color: AppTheme.textGray,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          
          Expanded(
            child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              children: [
                const SizedBox(height: 8),
                Row(
                  children: [
                    const Icon(Icons.sort, color: AppTheme.primaryBlue, size: 16),
                    const SizedBox(width: 4),
                    Text(
                      'VENCIMIENTO PRÓXIMO',
                      style: GoogleFonts.montserrat(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        color: AppTheme.primaryBlue,
                        letterSpacing: 1.2,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                
                // Task Cards
                _buildTaskCard(
                  title: 'Comprar víveres de la semana',
                  subtitle: 'Mañana',
                  tag: 'WORK',
                  tagColor: const Color(0xFFE3F2FD),
                  tagTextColor: AppTheme.primaryBlue,
                  icon: Icons.flag,
                  iconColor: Colors.orange,
                ),
                _buildTaskCard(
                  title: 'Sesión de gimnasio',
                  subtitle: 'Hoy, 7:00 PM',
                  tag: 'SHOPPING',
                  tagColor: const Color(0xFFE8F5E9),
                  tagTextColor: Colors.green,
                  icon: Icons.flag,
                  iconColor: Colors.black12,
                ),
                _buildTaskCard(
                  title: 'Gym workout session',
                  subtitle: 'Today, 7:00 PM',
                  tag: 'PERSONAL',
                  tagColor: const Color(0xFFF3E5F5),
                  tagTextColor: Colors.purple,
                  icon: Icons.priority_high,
                  iconColor: Colors.red,
                ),
                
                const SizedBox(height: 16),
                Row(
                  children: [
                    const Icon(Icons.keyboard_arrow_down, color: AppTheme.textGray),
                    const SizedBox(width: 4),
                    Text(
                      'Completadas (2)',
                      style: GoogleFonts.montserrat(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: AppTheme.textGray,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                
                // Completed Task Card
                _buildTaskCard(
                  title: 'Enviar correo al equipo de diseño',
                  isCompleted: true,
                ),
              ],
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: AppTheme.primaryBlue,
        shape: const CircleBorder(),
        child: const Icon(Icons.add, color: Colors.white, size: 32),
      ),
    );
  }

  Widget _buildTaskCard({
    required String title,
    String? subtitle,
    String? tag,
    Color? tagColor,
    Color? tagTextColor,
    IconData? icon,
    Color? iconColor,
    bool isCompleted = false,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.black.withOpacity(0.05)),
      ),
      child: Row(
        children: [
          Container(
            width: 28,
            height: 28,
            decoration: BoxDecoration(
              color: isCompleted ? AppTheme.primaryBlue : Colors.transparent,
              borderRadius: BorderRadius.circular(8),
              border: Border.all(
                color: isCompleted ? AppTheme.primaryBlue : AppTheme.primaryBlue.withOpacity(0.3),
                width: 2,
              ),
            ),
            child: isCompleted ? const Icon(Icons.check, size: 20, color: Colors.white) : null,
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: GoogleFonts.montserrat(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    decoration: isCompleted ? TextDecoration.lineThrough : null,
                    color: isCompleted ? AppTheme.textGray.withOpacity(0.6) : AppTheme.textDark,
                  ),
                ),
                if (subtitle != null) ...[
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      Icon(Icons.calendar_today, size: 12, color: AppTheme.textGray.withOpacity(0.6)),
                      const SizedBox(width: 4),
                      Text(
                        subtitle,
                        style: GoogleFonts.montserrat(
                          fontSize: 12,
                          color: AppTheme.textGray.withOpacity(0.6),
                        ),
                      ),
                      if (tag != null) ...[
                        const SizedBox(width: 12),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                          decoration: BoxDecoration(
                            color: tagColor,
                            borderRadius: BorderRadius.circular(6),
                          ),
                          child: Text(
                            tag,
                            style: GoogleFonts.montserrat(
                              fontSize: 10,
                              fontWeight: FontWeight.bold,
                              color: tagTextColor,
                            ),
                          ),
                        ),
                      ],
                    ],
                  ),
                ],
              ],
            ),
          ),
          if (icon != null)
            Icon(icon, color: iconColor, size: 20),
        ],
      ),
    );
  }
}
