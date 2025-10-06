import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sanayi_app/core/styles/colors.dart';
import 'package:sanayi_app/generated/locale_keys.g.dart';

class BuildClientInfoCard extends StatelessWidget {
  Map<String, dynamic> requestDetails;

  BuildClientInfoCard({super.key, required this.requestDetails});

  void _contactClient(BuildContext context) {
    // Implement client contact
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Calling client...'),
        backgroundColor: const Color(0xff102144),
      ),
    );
  }

  void _showLocation(
    BuildContext context,
    Map<String, dynamic> requestDetails,
  ) {
    // Show client location on map
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Opening client location on map...'),
        backgroundColor: const Color(0xff102144),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(bottom: 8),
          child: Text(
            LocaleKeys.craftmanHome_bookingDetails_clientInfo.tr(),
            style: Theme.of(context).textTheme.labelLarge,
          ),
        ),
        Card(
          elevation: 2,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.r),
          ),
          child: Padding(
            padding: EdgeInsets.all(16),
            child: Column(
              children: [
                ListTile(
                  leading: Icon(Icons.person, color: ColorsManager.mainBlue),
                  title: Text(
                    requestDetails['clientName'],
                    style: Theme.of(context).textTheme.labelMedium,
                  ),
                ),
                ListTile(
                  leading: Icon(Icons.phone, color: ColorsManager.mainBlue),
                  title: Text(
                    requestDetails['phone'],
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  trailing: IconButton(
                    icon: Icon(Icons.phone, color: Colors.green),
                    onPressed: () => _contactClient(context),
                  ),
                ),
                ListTile(
                  leading: Icon(
                    Icons.location_on,
                    color: ColorsManager.mainBlue,
                  ),
                  title: Text(
                    requestDetails['address'],
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  trailing: IconButton(
                    icon: Icon(Icons.map, color: Colors.red),
                    onPressed: () => _showLocation(context, requestDetails),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
