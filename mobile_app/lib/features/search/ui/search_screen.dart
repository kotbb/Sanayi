import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sanayi_app/core/helpers/spacing.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 12.w),
          child: Column(
            children: [
              TextFormField(
                onChanged: (value) {},
                decoration: InputDecoration(
                  icon: Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Color(0xfffebf0f4),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Icon(Icons.search, color: const Color(0xff102144)),
                    ),
                  ),
                  hint: Text("Search here categorys, craftman, etc ..."),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(32.r)),
                  ),
                ),
              ),
              verticalSpace(24),
              Expanded(
                child: ListView.builder(itemBuilder: (context, index) {}),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
