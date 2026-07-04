import 'dart:convert';

import 'package:crypto/crypto.dart';

/// Debug-only helper that mints valid HS256 JWTs matching the backend schema.
/// Uses the same secret as the local dev backend so every API call succeeds.
abstract final class DevJwt {
  static const _secret = 'dev-secret-key-change-in-production';

  static String mint({
    required String sub,
    required String role,
    String? hotelId,
    Duration ttl = const Duration(hours: 24),
  }) {
    final header = _b64({
      'alg': 'HS256',
      'typ': 'JWT',
    });

    final now = DateTime.now().millisecondsSinceEpoch ~/ 1000;
    final payload = <String, dynamic>{
      'sub': sub,
      'role': role,
      'exp': now + ttl.inSeconds,
    };
    if (hotelId != null) payload['hotel_id'] = hotelId;

    final body = _b64(payload);
    final signature = _sign('$header.$body');

    return '$header.$body.$signature';
  }

  static String _b64(Map<String, dynamic> map) {
    final jsonStr = json.encode(map);
    return base64Url.encode(utf8.encode(jsonStr)).replaceAll('=', '');
  }

  static String _sign(String input) {
    final hmac = Hmac(sha256, utf8.encode(_secret));
    final digest = hmac.convert(utf8.encode(input));
    return base64Url.encode(digest.bytes).replaceAll('=', '');
  }
}
