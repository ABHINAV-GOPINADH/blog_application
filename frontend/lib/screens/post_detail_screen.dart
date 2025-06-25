import 'package:flutter/material.dart';
import 'package:frontend/theme/app_styles.dart';
import '../api/api_services.dart';

class PostDetailScreen extends StatelessWidget {
  final int postId;

  PostDetailScreen({required this.postId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: Text('Post Detail', style: AppTextStyles.heading),
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: AppColors.textPrimary,
      ),
      body: FutureBuilder(
        future: ApiService.getPostDetail(postId),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error loading post', style: AppTextStyles.cardSubtitle));
          }

          final post = snapshot.data as Map;
          return SingleChildScrollView(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (post['category'] != null)
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                    decoration: BoxDecoration(
                      color: AppColors.tagEntertainment,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Text(
                      post['category'].toUpperCase(),
                      style: AppTextStyles.tag,
                    ),
                  ),
                SizedBox(height: 12),
                Text(post['title'], style: AppTextStyles.cardTitle.copyWith(fontSize: 22)),
                SizedBox(height: 8),
                Text("By ${post['author']}", style: AppTextStyles.cardSubtitle),
                SizedBox(height: 20),
                Text(
                  post['content'] ?? '',
                  style: AppTextStyles.cardSubtitle.copyWith(fontSize: 15, height: 1.5),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
