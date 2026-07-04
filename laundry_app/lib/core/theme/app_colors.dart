import 'package:flutter/material.dart';

abstract final class AppColors {
  // Primary
  static const Color primary = Color(0xFF1A237E);
  static const Color primaryLight = Color(0xFF3949AB);
  static const Color accent = Color(0xFF00897B);

  // Challan types
  static const Color pickupBlue = Color(0xFF1565C0);
  static const Color deliveryGreen = Color(0xFF2E7D32);

  // Billing badges
  static const Color weightChip = Color(0xFF1565C0);
  static const Color pieceChip = Color(0xFF2E7D32);

  // Weight source badges
  static const Color soiledChip = Color(0xFF00897B);
  static const Color calculatedChip = Color(0xFF7B1FA2);
  static const Color freshChip = Color(0xFF0277BD);

  // Damage indicators
  static const Color damageRed = Color(0xFFC62828);
  static const Color damageYellow = Color(0xFFF9A825);
  static const Color damageGreen = Color(0xFF43A047);

  // Status
  static const Color offlineRed = Color(0xFFE53935);
  static const Color onlineGreen = Color(0xFF43A047);
  static const Color syncBlue = Color(0xFF1976D2);
  static const Color pendingYellow = Color(0xFFF9A825);

  // Surfaces
  static const Color bgLight = Color(0xFFF5F5F5);
  static const Color cardBg = Color(0xFFFFFFFF);
  static const Color textPrimary = Color(0xFF212121);
  static const Color textSecondary = Color(0xFF757575);
  static const Color border = Color(0xFFE0E0E0);

  // Dark theme surfaces
  static const Color bgDark = Color(0xFF121212);
  static const Color cardBgDark = Color(0xFF1E1E1E);
  static const Color textPrimaryDark = Color(0xFFE0E0E0);
  static const Color textSecondaryDark = Color(0xFF9E9E9E);
  static const Color borderDark = Color(0xFF424242);
}
