import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../theme.dart';

class NewTaskScreen extends StatelessWidget {
  const NewTaskScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Nueva Tarea',
          style: GoogleFonts.montserrat(fontWeight: FontWeight.bold),
        ),
        leading: IconButton(
          icon: const Icon(Icons.close),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildSectionLabel('Título de la tarea'),
            const SizedBox(height: 8),
            _buildTextField(hintText: '¿Qué hay que hacer?'),
            
            const SizedBox(height: 24),
            _buildSectionLabel('Descripción'),
            const SizedBox(height: 8),
            _buildTextField(hintText: 'Añade más detalles sobre esta tarea...', maxLines: 4),
            
            const SizedBox(height: 24),
            _buildSectionLabel('Fecha de vencimiento'),
            const SizedBox(height: 8),
            _buildTextField(
              hintText: 'mm/dd/yyyy',
              prefixIcon: Icons.calendar_today,
              suffixIcon: Icons.calendar_month_outlined,
            ),
            
            const SizedBox(height: 24),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: Colors.black.withOpacity(0.05)),
              ),
              child: Row(
                children: [
                  const Icon(Icons.notifications, color: AppTheme.primaryBlue),
                  const SizedBox(width: 12),
                  Text(
                    'Notificaciones',
                    style: GoogleFonts.montserrat(
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                      color: AppTheme.textDark,
                    ),
                  ),
                  const Spacer(),
                  Switch(
                    value: true,
                    onChanged: (val) {},
                    activeColor: AppTheme.primaryBlue,
                  ),
                ],
              ),
            ),
            
            const SizedBox(height: 24),
            _buildSectionLabel('Añadir adjuntos'),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildAttachmentButton(Icons.mic, 'Audio'),
                _buildAttachmentButton(Icons.image, 'Galería'),
                _buildAttachmentButton(Icons.camera_alt, 'Cámara'),
                _buildAttachmentButton(Icons.link, 'Enlace'),
              ],
            ),
            
            const SizedBox(height: 32),
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: AppTheme.textGray.withOpacity(0.2), style: BorderStyle.solid),
                color: Colors.transparent,
              ),
              child: Row(
                children: [
                   Icon(Icons.info_outline, color: AppTheme.textGray.withOpacity(0.6), size: 20),
                   const SizedBox(width: 12),
                   Expanded(
                     child: Text(
                       'Los cambios se sincronizan automáticamente con tu cuenta en la nube.',
                       style: GoogleFonts.montserrat(
                         fontSize: 12,
                         color: AppTheme.textGray.withOpacity(0.6),
                       ),
                     ),
                   ),
                ],
              ),
            ),
            
            const SizedBox(height: 32),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {},
                child: const Text('Crear Tarea'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionLabel(String label) {
    return Text(
      label,
      style: GoogleFonts.montserrat(
        fontSize: 15,
        fontWeight: FontWeight.bold,
        color: AppTheme.textDark,
      ),
    );
  }

  Widget _buildTextField({
    required String hintText,
    int maxLines = 1,
    IconData? prefixIcon,
    IconData? suffixIcon,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: AppTheme.backgroundGray,
        borderRadius: BorderRadius.circular(16),
      ),
      child: TextField(
        maxLines: maxLines,
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: GoogleFonts.montserrat(
            color: AppTheme.textGray.withOpacity(0.4),
            fontSize: 15,
          ),
          prefixIcon: prefixIcon != null ? Icon(prefixIcon, color: AppTheme.textGray.withOpacity(0.6), size: 20) : null,
          suffixIcon: suffixIcon != null ? Icon(suffixIcon, color: Colors.black, size: 20) : null,
          border: InputBorder.none,
          contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        ),
      ),
    );
  }

  Widget _buildAttachmentButton(IconData icon, String label) {
    return Column(
      children: [
        Container(
          width: 60,
          height: 60,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: Colors.black.withOpacity(0.05)),
          ),
          child: Icon(icon, color: AppTheme.textDark, size: 24),
        ),
        const SizedBox(height: 8),
        Text(
          label,
          style: GoogleFonts.montserrat(
            fontSize: 12,
            fontWeight: FontWeight.w600,
            color: AppTheme.textDark,
          ),
        ),
      ],
    );
  }
}
