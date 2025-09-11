import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sanayi_app/core/helpers/spacing.dart';
import 'package:sanayi_app/core/routing/routes.dart';
import 'package:sanayi_app/features/rate_craftman/ui/widgets/rating_card.dart';

class RateCraftmanScreen extends StatefulWidget {
  const RateCraftmanScreen({super.key});

  @override
  State<RateCraftmanScreen> createState() => _RateCraftmanScreenState();
}

class _RateCraftmanScreenState extends State<RateCraftmanScreen> {
  //todo change it to stateless and put the stars logic in cubit
  double _rating = 0;
  final TextEditingController _commentController = TextEditingController();
  final FocusNode _commentFocusNode = FocusNode();

  @override
  void dispose() {
    _commentController.dispose();
    _commentFocusNode.dispose();
    super.dispose();
  }

  void _submitRating() {
    if (_rating == 0) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('يرجى اختيار تقييم قبل الإرسال'),
          backgroundColor: Colors.red,
        ),
      );
      return;
    }

    // إضافة لوجيك إرسال التقييم إلى الخادم
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('شكراً لك على تقييمك!'),
        backgroundColor: Colors.green,
      ),
    );

    // إعادة تعيين الحقول بعد الإرسال
    setState(() {
      _rating = 0;
      _commentController.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text(
          'Rate Service',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22.sp),
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Your feedback will be published after review.',
              style: TextStyle(fontSize: 14, color: Colors.grey[600]),
            ),
            verticalSpace(24),
            RatingCard(),
            verticalSpace(40),
            Text(
              'Rate the service',
              style: TextStyle(
                fontSize: 18.sp,
                fontWeight: FontWeight.bold,
                color: Colors.grey[800],
              ),
            ),
            verticalSpace(16),
            RatingBar.builder(
              initialRating: _rating,
              minRating: 1,
              direction: Axis.horizontal,
              allowHalfRating: true,
              itemCount: 5,
              itemPadding: EdgeInsets.symmetric(horizontal: 2.0.w),
              itemBuilder: (context, _) =>
                  Icon(Icons.star, color: Colors.amber),
              onRatingUpdate: (rating) {
                setState(() {
                  _rating = rating;
                });
              },
            ),
            verticalSpace(12),
            Text(
              _rating == 0
                  ? 'No rating yet'
                  : 'Your Rate: ${_rating.toStringAsFixed(1)} stars',
              style: TextStyle(
                fontSize: 16.sp,
                color: _rating == 0 ? Colors.grey : Colors.amber[700],
                fontWeight: FontWeight.bold,
              ),
            ),
            verticalSpace(40),
            Text(
              'Enter your comment',
              style: TextStyle(
                fontSize: 18.sp,
                fontWeight: FontWeight.bold,
                color: Colors.grey[800],
              ),
            ),
            verticalSpace(16),
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12.r),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 6,
                    offset: Offset(0, 2),
                  ),
                ],
              ),
              child: TextField(
                controller: _commentController,
                focusNode: _commentFocusNode,
                maxLines: 5,
                decoration: InputDecoration(
                  hintText: 'Enter your comment here ...',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide.none,
                  ),
                  filled: true,
                  fillColor: Colors.white,
                  contentPadding: EdgeInsets.all(16),
                ),
              ),
            ),
            verticalSpace(40),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: _submitRating,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.amber[700],
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  elevation: 2,
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 16),
                  child: Text(
                    'Send Review',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
