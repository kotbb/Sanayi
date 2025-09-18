import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ImageWidget extends StatelessWidget {
  Function()? onTap;
  final String? networkImageUrl;
  ImageWidget({
    super.key,
    required this.onTap,
    required this.networkImageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: MediaQuery.of(context).size.height * 0.33,
      decoration: const BoxDecoration(
        color: Color(0xfffebf0f4),
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(100),
          bottomRight: Radius.circular(100),
        ),
      ),
      child: Center(
        child: Stack(
          children: [
            CircleAvatar(
              radius: 70,
              backgroundImage: NetworkImage(
                networkImageUrl == null ? 'https://static.vecteezy.com/system/resources/previews/009/292/244/non_2x/default-avatar-icon-of-social-media-user-vector.jpg' : networkImageUrl!,
              ),
            ),
            Positioned(
              bottom: 7,
              right: 0,
              child: GestureDetector(
                onTap: onTap,
                child: Transform.translate(
                  offset: Offset(10, 10),
                  child: Container(
                    width: 32.w,
                    height: 32.w,
                    decoration: BoxDecoration(
                      color: const Color(0xff102144),
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      Icons.camera_alt,
                      color: Colors.white,
                      size: 18.w,
                    ),
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
