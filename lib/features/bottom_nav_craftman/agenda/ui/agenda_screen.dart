import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sanayi_app/features/bottom_nav_craftman/agenda/ui/widgets/my_services/my_services_tab.dart';
import 'package:sanayi_app/features/bottom_nav_craftman/agenda/ui/widgets/work_schedule/work_schedule_tab.dart';

class AgendaScreen extends StatelessWidget {
  const AgendaScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'Work Schedule & Services',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22.sp),
          ),
          bottom: TabBar(
            labelColor: const Color(0xff102144),
            indicatorColor: const Color(0xff102144),
            tabs: [
              Tab(text: 'Work Schedule'),
              Tab(text: 'My Services'),
            ],
          ),
        ),
        body: TabBarView(children: [WorkScheduleTab(), MyServicesTab()]),
      ),
    );
  }
}
