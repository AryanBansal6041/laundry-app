import 'package:flutter/widgets.dart';
import 'package:google_sign_in_web/web_only.dart' as web;

Widget renderGoogleWebButton() {
  return web.renderButton(
    configuration: web.GSIButtonConfiguration(
      type: web.GSIButtonType.standard,
      theme: web.GSIButtonTheme.outline,
      size: web.GSIButtonSize.large,
      text: web.GSIButtonText.signinWith,
      shape: web.GSIButtonShape.rectangular,
      logoAlignment: web.GSIButtonLogoAlignment.left,
      minimumWidth: 380,
    ),
  );
}
