import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ReservationItemWidget extends StatelessWidget {
  String image;
  String title;
  String subTitle;
  Function()? onTap;

  ReservationItemWidget({
    super.key,
    required this.image,
    required this.title,
    required this.subTitle,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 100.h,
      padding: EdgeInsets.symmetric(horizontal: 6.w, vertical: 4.h),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20.r),
        boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 4)],
      ),
      child: ListTile(
        leading: CircleAvatar(
          radius: 30.r,
          backgroundColor: Colors.blue,
          backgroundImage: NetworkImage(image),
        ),
        title: Text(title, style: Theme.of(context).textTheme.labelLarge),
        subtitle: Text(subTitle, style: Theme.of(context).textTheme.bodyMedium),
        trailing: Icon(Icons.arrow_forward_ios_sharp),
        onTap: onTap,
      ),
    );
  }
}
