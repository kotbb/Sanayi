import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ResponseDetailsWidget extends StatelessWidget {
  const ResponseDetailsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: BorderRadius.circular(15.r),
      ),
      child: Column(
        children: [
          ListTile(
            leading: Icon(Icons.access_time, color: Colors.green),
            title: Text('Response Time'),
            subtitle: Text('We typically respond within 1-2 hours'),
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.language, color: Colors.green),
            title: Text('Working Hours'),
            subtitle: Text('Sunday - Thursday, 8:00 AM - 6:00 PM'),
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.help, color: Colors.green),
            title: Text('Need Help?'),
            subtitle: Text('Feel free to ask us anything'),
          ),
        ],
      ),
    );
  }
}
