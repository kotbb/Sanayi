import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sanayi_app/core/helpers/spacing.dart';

class BuildAnimatedChooseCard extends StatelessWidget {
  String title;
  String description;
  Widget image;
  VoidCallback onTap;

  BuildAnimatedChooseCard({
    super.key,
    required this.title,
    required this.description,
    required this.image,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder(
      duration: const Duration(milliseconds: 200),
      tween: Tween<double>(begin: 1.0, end: 1.0),
      builder: (context, double scale, child) {
        return GestureDetector(
          onTapDown: (_) {
            // عمل Scale صغير عند الضغط
            (context as Element).markNeedsBuild();
          },
          onTapUp: (_) {
            onTap();
          },
          child: Transform.scale(
            scale: scale,
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16.r),
              ),
              elevation: 4,
              shadowColor: Colors.grey.withOpacity(0.3),
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 24.h, horizontal: 12.w),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    image,
                    verticalSpace(16),
                    Text(title, style: Theme.of(context).textTheme.labelLarge),
                    verticalSpace(12),
                    Text(
                      description,
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.displaySmall,
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
