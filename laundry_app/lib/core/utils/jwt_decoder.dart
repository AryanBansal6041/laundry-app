import 'dart:convert';
import '../constants/enums.dart';

class DecodedToken {
  const DecodedToken({
    required this.userId,
    required this.role,
    this.hotelId,
    required this.expiry,
  });

  final String userId;
  final UserRole role;
  final String? hotelId;
  final DateTime expiry;

  bool get isExpired => DateTime.now().isAfter(expiry);
}

abstract final class JwtDecoder {
  static DecodedToken? decode(String token) {
    try {
      final parts = token.split('.');
      if (parts.length != 3) return null;

      final payload = _decodeBase64(parts[1]);
      final map = json.decode(payload) as Map<String, dynamic>;

      return DecodedToken(
        userId: map['sub'] as String,
        role: UserRole.fromJson(map['role'] as String),
        hotelId: map['hotel_id'] as String?,
        expiry: DateTime.fromMillisecondsSinceEpoch(
          (map['exp'] as int) * 1000,
        ),
      );
    } catch (_) {
      return null;
    }
  }

  static String _decodeBase64(String str) {
    String normalized = str.replaceAll('-', '+').replaceAll('_', '/');
    switch (normalized.length % 4) {
      case 0:
        break;
      case 2:
        normalized += '==';
        break;
      case 3:
        normalized += '=';
        break;
      default:
        throw const FormatException('Invalid base64 string');
    }
    return utf8.decode(base64.decode(normalized));
  }
}
