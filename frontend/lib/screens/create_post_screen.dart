import 'package:flutter/material.dart';
import '../api/api_services.dart';
import '../theme/app_colors.dart';
import '../theme/app_styles.dart' hide AppColors;

class CreatePostScreen extends StatefulWidget {
  @override
  _CreatePostScreenState createState() => _CreatePostScreenState();
}

class _CreatePostScreenState extends State<CreatePostScreen> {
  final _titleController = TextEditingController();
  final _contentController = TextEditingController();

  Future<void> _submitPost() async {
    final success = await ApiService.createPost(
      _titleController.text,
      _contentController.text,
    );
    if (success) {
      Navigator.pop(context, true); // Return success flag
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to create post')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            children: [
              const SizedBox(height: 40),
              Container(
                height: 180,
                width: double.infinity,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Colors.purple.shade100, Colors.white],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                  borderRadius: BorderRadius.vertical(bottom: Radius.circular(80)),
                ),
              ),
              const SizedBox(height: 20),
              Align(
                alignment: Alignment.centerLeft,
                child: Text("Create Post", style: AppTextStyles.heading_login),
              ),
              const SizedBox(height: 32),
              TextField(
                controller: _titleController,
                decoration: InputDecoration(
                  hintText: 'Title',
                  prefixIcon: Icon(Icons.title),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              TextField(
                controller: _contentController,
                maxLines: 8,
                decoration: InputDecoration(
                  hintText: 'Content',
                  prefixIcon: Icon(Icons.edit_note),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
              const SizedBox(height: 30),
              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton.icon(
                  onPressed: _submitPost,
                  icon: Icon(Icons.send, color: Colors.white),
                  label: Text("Submit", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white)),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primary,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }
}
