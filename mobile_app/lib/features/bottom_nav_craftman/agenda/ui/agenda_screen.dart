import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sanayi_app/features/bottom_nav_craftman/agenda/ui/widgets/my_services/my_services_tab.dart';
import 'package:sanayi_app/features/bottom_nav_craftman/agenda/ui/widgets/work_schedule/work_schedule_tab.dart';
import 'package:sanayi_app/generated/locale_keys.g.dart';

class AgendaScreen extends StatelessWidget {
  const AgendaScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            LocaleKeys.btmNav_agenda.tr(),
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22.sp),
          ),
          centerTitle: true,
          leading: SizedBox(),
          bottom: TabBar(
            labelColor: const Color(0xff102144),
            indicatorColor: const Color(0xff102144),
            tabs: [
              Tab(text: LocaleKeys.agenda_workSchedule_tabName.tr()),
              Tab(text: LocaleKeys.agenda_myServices_tabName.tr()),
            ],
          ),
        ),
        body: TabBarView(children: [WorkScheduleTab(), MyServicesTab()]),
      ),
    );
  }
}
