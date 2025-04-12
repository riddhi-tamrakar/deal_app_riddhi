import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:deal_app/core/utils/colors.dart';
import 'package:deal_app/core/utils/date_utils.dart';
import '../../data/models/deal_model.dart';

class DealCard extends StatelessWidget {
  final DealModel deal;

  const DealCard({super.key, required this.deal});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.r)),
      elevation: 2,
      child: Padding(
        padding: EdgeInsets.all(12.r),
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CachedNetworkImage(
                  imageUrl: deal.imageUrl,
                  width: 60.w,
                  height: 60.w,
                  fit: BoxFit.contain,
                  placeholder: (_, __) => const CircularProgressIndicator(strokeWidth: 2),
                  errorWidget: (_, __, ___) => const Icon(Icons.broken_image),
                ),
                SizedBox(width: 12.w),
                Expanded(
                  child: Text(
                    deal.title,
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 14.sp,
                      color: AppColors.textPrimary,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 8.h),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Icon(Icons.thumb_up_alt_outlined, size: 16.sp, color: AppColors.iconGrey),
                        SizedBox(width: 4.w),
                        Text(
                          "5", // Placeholder static like count
                          style: TextStyle(fontSize: 12.sp, color: AppColors.textSecondary),
                        ),
                        SizedBox(width: 12.w),
                        Icon(Icons.comment_outlined, size: 16.sp, color: AppColors.iconGrey),
                        SizedBox(width: 4.w),
                        Text(
                          '${deal.commentsCount}',
                          style: TextStyle(fontSize: 12.sp, color: AppColors.textSecondary),
                        ),
                        SizedBox(width: 12.w),
                        Icon(Icons.access_time, size: 16.sp, color: AppColors.iconGrey),
                        SizedBox(width: 4.w),
                        Text(
                          formatDate(deal.createdAt),
                          style: TextStyle(fontSize: 12.sp, color: AppColors.textSecondary),
                        ),
                      ],
                    ),
                    Text(
                      "At ${deal.storeName.isEmpty ? 'Other' : deal.storeName}",
                      style: TextStyle(
                        color: AppColors.primaryBlue,
                        fontSize: 13.sp,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 4.h),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
