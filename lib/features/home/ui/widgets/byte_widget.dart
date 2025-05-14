import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ByteWidget extends StatelessWidget {
  const ByteWidget({
    super.key,
    required this.status,
    required this.text,
  });

  final String? status;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        RichText(
          text: TextSpan(
            children: [
              TextSpan(
                text: "${status} ",
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      fontSize: 60.sp,
                      fontWeight: FontWeight.bold,
                    ),
              ),
              TextSpan(
                text: 'Mbp/s',
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      fontSize: 60.sp,
                      color: Colors.grey.shade500,
                      // fontWeight: FontWeight.bold,
                    ),
              ),
            ],
          ),
        ),
        Text(
          "$text",
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                fontSize: 40.sp,
                color: Colors.grey.shade500,
                // fontWeight: FontWeight.bold,
              ),
        )
      ],
    );
  }
}
