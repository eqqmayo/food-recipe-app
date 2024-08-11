import 'package:flutter/services.dart';

class CopyLinkUseCase {
  Future<void> execute(String url) async {
    await Clipboard.setData(ClipboardData(text: url));
  }
}
