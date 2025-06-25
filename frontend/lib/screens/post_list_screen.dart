import 'package:flutter/material.dart';
import 'package:frontend/theme/app_styles.dart';
import '../api/api_services.dart';
import 'post_detail_screen.dart';

class PostListScreen extends StatefulWidget {
  @override
  _PostListScreenState createState() => _PostListScreenState();
}

class _PostListScreenState extends State<PostListScreen> {
  List posts = [];

  Future<void> fetchPosts() async {
    final result = await ApiService.getPosts();
    setState(() => posts = result);
  }

  @override
  void initState() {
    super.initState();
    fetchPosts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: Text('Articles', style: AppTextStyles.heading),
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: AppColors.textPrimary,
        actions: [
          IconButton(
            icon: Icon(Icons.logout, color: AppColors.textPrimary),
            tooltip: 'Logout',
            onPressed: () async {
              await ApiService.storage.delete(key: 'token'); // Clear token
              Navigator.pushReplacementNamed(context, '/login'); // Navigate to login
            },
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: posts.length,
        padding: EdgeInsets.all(16),
        itemBuilder: (context, index) {
          final post = posts[index];
          return GestureDetector(
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => PostDetailScreen(postId: post['id']),
              ),
            ),
            child: Card(
              color: AppColors.cardBackground,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              elevation: 2,
              margin: EdgeInsets.only(bottom: 16),
              child: Padding(
                padding: const EdgeInsets.all(16),
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
                    SizedBox(height: 8),
                    Text(post['title'], style: AppTextStyles.cardTitle),
                    SizedBox(height: 4),
                    Text(post['summary'] ?? '', style: AppTextStyles.cardSubtitle),
                  ],
                ),
              ),
            ),
          );
        },
      ),
      bottomNavigationBar: FutureBuilder(
        future: ApiService.getToken(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  onPressed: () async {
                    final result = await Navigator.pushNamed(context, '/create');
                    if (result == true) {
                      fetchPosts(); // Refresh on return
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primary,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: Text(
                    'Create',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold,color: Colors.white),
                  ),
                ),
              ),
            );
          }
          return SizedBox.shrink(); // No button if not logged in
        },
      ),
    );
  }
}
