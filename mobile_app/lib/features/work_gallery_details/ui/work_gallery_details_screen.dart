import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sanayi_app/core/helpers/spacing.dart';
import 'package:sanayi_app/core/styles/colors.dart';
import 'package:sanayi_app/features/work_gallery_details/ui/widgets/client_review_widget.dart';
import 'package:sanayi_app/generated/locale_keys.g.dart';

class WorkGalleryDetailsScreen extends StatelessWidget {
  final List<String> images = [
    'https://picsum.photos/800/400?image=1',
    'https://picsum.photos/800/400?image=2',
    'https://picsum.photos/800/400?image=3',
  ];

  WorkGalleryDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 200.h,
            pinned: true,
            automaticallyImplyLeading: true,
            backgroundColor: Colors.black,
            flexibleSpace: FlexibleSpaceBar(
              background: CarouselSlider(
                options: CarouselOptions(
                  viewportFraction: 1,
                  enableInfiniteScroll: false,
                ),
                items: images.map((url) {
                  return Image.network(
                    url,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  );
                }).toList(),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(24),
                  topRight: Radius.circular(24),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Electrical Maintenance",
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  verticalSpace(8),
                  Row(
                    children: [
                      Icon(Icons.calendar_today, size: 16, color: Colors.grey),
                      horizontalSpace(6),
                      Text(
                        "Aug 2025",
                        style: Theme.of(
                          context,
                        ).textTheme.bodyMedium?.copyWith(color: Colors.grey),
                      ),
                      horizontalSpace(16),
                      Icon(Icons.place, size: 16, color: Colors.grey),
                      horizontalSpace(6),
                      Text(
                        "Gaza City",
                        style: Theme.of(
                          context,
                        ).textTheme.bodyMedium?.copyWith(color: Colors.grey),
                      ),
                      horizontalSpace(16),
                      Icon(Icons.timer, size: 16, color: Colors.grey),
                      horizontalSpace(6),
                      Text(
                        "3 Days",
                        style: Theme.of(
                          context,
                        ).textTheme.bodyMedium?.copyWith(color: Colors.grey),
                      ),
                    ],
                  ),
                  verticalSpace(24),
                  Divider(height: 1.h, color: Colors.grey),
                  verticalSpace(20),
                  Text(
                    LocaleKeys.clientHome_description.tr(),
                    style: Theme.of(context).textTheme.labelLarge,
                  ),
                  verticalSpace(12),
                  Text(
                    "This project involved fixing electrical wiring and replacing old switches. "
                    "I ensured all safety measures were taken, and the client was satisfied "
                    "with the results. The work was completed within 2 days. ",
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  verticalSpace(24),
                  Divider(height: 1.h, color: Colors.grey),
                  verticalSpace(16),
                  ClientReviewWidget(),
                  verticalSpace(60),
                ],
              ),
            ),
          ),
        ],
      ),

      // bottomNavigationBar: Container(
      //   padding: const EdgeInsets.all(16),
      //   decoration: const BoxDecoration(
      //     color: Colors.white,
      //     boxShadow: [
      //       BoxShadow(
      //         color: Colors.black12,
      //         blurRadius: 6,
      //         offset: Offset(0, -2),
      //       ),
      //     ],
      //   ),
      //   child: ElevatedButton(
      //     onPressed: () {
      //     },
      //     style: ElevatedButton.styleFrom(
      //       backgroundColor: const Color(0xff102144),
      //       shape: RoundedRectangleBorder(
      //         borderRadius: BorderRadius.circular(12),
      //       ),
      //       minimumSize: const Size.fromHeight(50),
      //     ),
      //     child: const Text(
      //       "Contact Craftsman",
      //       style: TextStyle(fontSize: 16, color: Colors.white),
      //     ),
      //   ),
      // ),
    );
  }
}
