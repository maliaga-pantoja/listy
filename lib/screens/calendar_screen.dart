import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '../theme.dart';
import '../main.dart';
import '../models/task_model.dart';

class CalendarScreen extends StatefulWidget {
  const CalendarScreen({super.key});

  @override
  State<CalendarScreen> createState() => _CalendarScreenState();
}

class _CalendarScreenState extends State<CalendarScreen> {
  DateTime _selectedDate = DateTime(2023, 10, 5);
  DateTime _currentMonth = DateTime(2023, 10, 1);

  @override
  Widget build(BuildContext context) {
    final isDark = Provider.of<ThemeProvider>(context).isDarkMode;
    final taskProvider = Provider.of<TaskProvider>(context);
    final daysWithTasks = taskProvider.getDaysWithTasks(
      _currentMonth.month,
      _currentMonth.year,
    );
    final tasksForSelectedDay = taskProvider.getTasksForDay(_selectedDate);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Calendario',
          style: GoogleFonts.montserrat(fontWeight: FontWeight.bold),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, size: 20),
          onPressed: () {},
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.add_circle,
              color: AppTheme.primaryBlue,
              size: 28,
            ),
          ),
          const SizedBox(width: 8),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    icon: Icon(
                      Icons.chevron_left,
                      size: 30,
                      color: isDark ? AppTheme.textDarkMode : AppTheme.textDark,
                    ),
                    onPressed: () {
                      setState(() {
                        _currentMonth = DateTime(
                          _currentMonth.year,
                          _currentMonth.month - 1,
                        );
                      });
                    },
                  ),
                  Text(
                    '${_getMonthName(_currentMonth.month)} ${_currentMonth.year}',
                    style: GoogleFonts.montserrat(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: isDark ? AppTheme.textDarkMode : AppTheme.textDark,
                    ),
                  ),
                  IconButton(
                    icon: Icon(
                      Icons.chevron_right,
                      size: 30,
                      color: isDark ? AppTheme.textDarkMode : AppTheme.textDark,
                    ),
                    onPressed: () {
                      setState(() {
                        _currentMonth = DateTime(
                          _currentMonth.year,
                          _currentMonth.month + 1,
                        );
                      });
                    },
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: ['LUN', 'MAR', 'MIÉ', 'JUE', 'VIE', 'SÁB', 'DOM']
                    .map(
                      (day) => Expanded(
                        child: Center(
                          child: Text(
                            day,
                            style: GoogleFonts.montserrat(
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                              color: isDark
                                  ? AppTheme.textDarkMode.withOpacity(0.6)
                                  : AppTheme.textGray,
                            ),
                          ),
                        ),
                      ),
                    )
                    .toList(),
              ),
            ),
            const SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 7,
                  mainAxisSpacing: 8,
                  crossAxisSpacing: 8,
                ),
                itemCount: _getDaysInMonth(_currentMonth),
                itemBuilder: (context, index) {
                  int firstDayOfMonth = DateTime(
                    _currentMonth.year,
                    _currentMonth.month,
                    1,
                  ).weekday;
                  int day = index - (firstDayOfMonth - 1);
                  int daysInMonth = DateTime(
                    _currentMonth.year,
                    _currentMonth.month + 1,
                    0,
                  ).day;
                  bool isCurrentMonth = day > 0 && day <= daysInMonth;

                  bool isToday =
                      day == DateTime.now().day &&
                      _currentMonth.month == DateTime.now().month &&
                      _currentMonth.year == DateTime.now().year;
                  bool isSelected =
                      isCurrentMonth &&
                      day == _selectedDate.day &&
                      _currentMonth.month == _selectedDate.month &&
                      _currentMonth.year == _selectedDate.year;
                  bool hasMarker =
                      isCurrentMonth && daysWithTasks.contains(day);

                  return GestureDetector(
                    onTap: isCurrentMonth
                        ? () {
                            setState(() {
                              _selectedDate = DateTime(
                                _currentMonth.year,
                                _currentMonth.month,
                                day,
                              );
                            });
                          }
                        : null,
                    child: Container(
                      decoration: BoxDecoration(
                        color: isSelected
                            ? AppTheme.primaryBlue
                            : (isToday
                                  ? AppTheme.primaryBlue.withOpacity(0.2)
                                  : Colors.transparent),
                        shape: BoxShape.circle,
                      ),
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              isCurrentMonth ? day.toString() : '',
                              style: GoogleFonts.montserrat(
                                fontSize: 16,
                                fontWeight: isToday || isSelected
                                    ? FontWeight.bold
                                    : FontWeight.w500,
                                color: isSelected
                                    ? Colors.white
                                    : (isCurrentMonth
                                          ? (isToday
                                                ? AppTheme.primaryBlue
                                                : (isDark
                                                      ? AppTheme.textDarkMode
                                                      : AppTheme.textDark))
                                          : Colors.transparent),
                              ),
                            ),
                            if (hasMarker && !isSelected)
                              Container(
                                margin: const EdgeInsets.only(top: 2),
                                width: 4,
                                height: 4,
                                decoration: BoxDecoration(
                                  color: isToday
                                      ? AppTheme.primaryBlue
                                      : AppTheme.primaryBlue,
                                  shape: BoxShape.circle,
                                ),
                              ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 32),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        'Tareas para ${_selectedDate.day} de ${_getMonthName(_selectedDate.month)}',
                        style: GoogleFonts.montserrat(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: isDark
                              ? AppTheme.textDarkMode
                              : AppTheme.textDark,
                        ),
                      ),
                      const SizedBox(width: 8),
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 2,
                        ),
                        decoration: BoxDecoration(
                          color: isDark
                              ? Colors.white.withOpacity(0.1)
                              : Colors.black.withOpacity(0.05),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Text(
                          '${tasksForSelectedDay.length} tareas',
                          style: GoogleFonts.montserrat(
                            fontSize: 12,
                            color: isDark
                                ? AppTheme.textDarkMode.withOpacity(0.7)
                                : AppTheme.textGray,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  if (tasksForSelectedDay.isEmpty)
                    Container(
                      padding: const EdgeInsets.all(20),
                      child: Center(
                        child: Text(
                          'No hay tareas para este día',
                          style: GoogleFonts.montserrat(
                            fontSize: 14,
                            color: AppTheme.textGray,
                          ),
                        ),
                      ),
                    )
                  else
                    ...tasksForSelectedDay.map(
                      (task) => _buildCalendarTaskItem(
                        title: task.title,
                        time:
                            '${task.startTime.format(context)} - ${task.endTime.format(context)}',
                        accentColor: task.color,
                        isCompleted: task.isCompleted,
                        isDark: isDark,
                        taskId: task.id,
                        taskProvider: taskProvider,
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

  String _getMonthName(int month) {
    const months = [
      'Enero',
      'Febrero',
      'Marzo',
      'Abril',
      'Mayo',
      'Junio',
      'Julio',
      'Agosto',
      'Septiembre',
      'Octubre',
      'Noviembre',
      'Diciembre',
    ];
    return months[month - 1];
  }

  int _getDaysInMonth(DateTime month) {
    int firstDayOfMonth = DateTime(month.year, month.month, 1).weekday;
    int daysInMonth = DateTime(month.year, month.month + 1, 0).day;
    return daysInMonth + firstDayOfMonth - 1;
  }

  Widget _buildCalendarTaskItem({
    required String title,
    required String time,
    required Color accentColor,
    bool isCompleted = false,
    bool isDark = false,
    required String taskId,
    required TaskProvider taskProvider,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: isDark ? AppTheme.surfaceDark : Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: isDark
              ? Colors.white.withOpacity(0.05)
              : Colors.black.withOpacity(0.05),
        ),
      ),
      child: Row(
        children: [
          Container(
            width: 4,
            height: 40,
            decoration: BoxDecoration(
              color: accentColor,
              borderRadius: BorderRadius.circular(2),
            ),
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
                    color: isCompleted
                        ? (isDark
                              ? AppTheme.textDarkMode.withOpacity(0.5)
                              : AppTheme.textGray)
                        : (isDark ? AppTheme.textDarkMode : AppTheme.textDark),
                  ),
                ),
                const SizedBox(height: 4),
                Row(
                  children: [
                    Icon(
                      Icons.access_time,
                      size: 14,
                      color: isCompleted
                          ? (isDark
                                ? AppTheme.textDarkMode.withOpacity(0.4)
                                : AppTheme.textGray.withOpacity(0.6))
                          : AppTheme.textGray,
                    ),
                    const SizedBox(width: 4),
                    Text(
                      time,
                      style: GoogleFonts.montserrat(
                        fontSize: 12,
                        color: isCompleted
                            ? (isDark
                                  ? AppTheme.textDarkMode.withOpacity(0.4)
                                  : AppTheme.textGray.withOpacity(0.6))
                            : AppTheme.textGray,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Checkbox(
            value: isCompleted,
            onChanged: (val) {
              taskProvider.toggleTaskCompletion(taskId);
            },
            activeColor: AppTheme.primaryBlue,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(6),
            ),
          ),
        ],
      ),
    );
  }
}
