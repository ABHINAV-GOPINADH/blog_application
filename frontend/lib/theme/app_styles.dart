import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppColors {
  static const primary = Color(0xFF4B39EF);
  static const background = Color(0xFFF4F4F4);
  static const cardBackground = Colors.white;
  static const textPrimary = Colors.black87;
  static const textSecondary = Colors.grey;
  static const tagEntertainment = Color(0xFFF44336);
  static const tagGames = Color(0xFF2196F3);
  static const tagSociety = Color(0xFF4CAF50);
}

class AppTextStyles {
  static const heading_login = TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: AppColors.textPrimary);
  static const bodyText = TextStyle(fontSize: 16, color: AppColors.textPrimary);

  static final heading = GoogleFonts.poppins(
    fontSize: 24,
    fontWeight: FontWeight.bold,
    color: AppColors.textPrimary,
  );

  static final subheading = GoogleFonts.poppins(
    fontSize: 16,
    fontWeight: FontWeight.w500,
    color: AppColors.textSecondary,
  );

  static final body = GoogleFonts.poppins(
    fontSize: 14,
    color: AppColors.textPrimary,
  );

  static final tag = GoogleFonts.poppins(
    fontSize: 12,
    fontWeight: FontWeight.w600,
    color: Colors.white,
  );
    static final cardTitle = GoogleFonts.poppins(
    fontSize: 16,
    fontWeight: FontWeight.w600,
    color: AppColors.textPrimary,
  );

  static final cardSubtitle = GoogleFonts.poppins(
    fontSize: 13,
    color: AppColors.textSecondary,
  );
  static const title = TextStyle(
    fontSize: 28,
    fontWeight: FontWeight.bold,
    color: Colors.black87,
  );

  static const subtitle = TextStyle(
    fontSize: 16,
    color: Colors.black54,
  );

  static const buttonText = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w600,
    color: Colors.white,
  );
}
