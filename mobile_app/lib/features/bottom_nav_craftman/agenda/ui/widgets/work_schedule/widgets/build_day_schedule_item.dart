import 'package:flutter/material.dart';

class BuildDayScheduleItem extends StatelessWidget {
  Map<String, dynamic> daySchedule;

  BuildDayScheduleItem({super.key, required this.daySchedule});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        daySchedule['day'],
        style: TextStyle(
          fontWeight: FontWeight.bold,
          color: daySchedule['active'] ? Colors.grey[800] : Colors.grey[400],
        ),
      ),
      subtitle: Text(
        daySchedule['active']
            ? '${daySchedule['from']} - ${daySchedule['to']}'
            : 'Not working',
        style: TextStyle(
          color: daySchedule['active'] ? Colors.grey[600] : Colors.grey[400],
        ),
      ),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Switch(value: daySchedule['active'], onChanged: (value) {}),
          IconButton(icon: Icon(Icons.edit, size: 20), onPressed: () {}),
        ],
      ),
    );
  }
}
