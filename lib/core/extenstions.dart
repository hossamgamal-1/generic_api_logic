import 'package:flutter/material.dart';

import 'widgets/loading_alert_dialog.dart';

extension Navigation on BuildContext {
  Future<void> push({
    VoidCallback? toExcuteAfterPop,
    required Widget widget,
  }) async {
    Navigator.push(
      this,
      MaterialPageRoute(builder: (_) => widget),
    ).then(
      (value) {
        if (toExcuteAfterPop != null) toExcuteAfterPop();
      },
    );
  }

  void pushAndRemoveUntil({required Widget widget}) {
    Navigator.pushAndRemoveUntil(
      this,
      MaterialPageRoute(builder: (_) => widget),
      (route) => false,
    );
  }

  void pushReplacement({required Widget widget}) {
    Navigator.pushReplacement(
      this,
      MaterialPageRoute(builder: (_) => widget),
    );
  }

  void pop() {
    if (Navigator.canPop(this)) Navigator.pop(this);
  }
}

extension SnackBarHelper on BuildContext {
  void showErrorSnackBar({required String content}) {
    final snackBar = SnackBar(
      content: Text(
        content,
        style: const TextStyle(fontSize: 14, color: Colors.white),
      ),
      backgroundColor: Colors.red,
      behavior: SnackBarBehavior.floating,
    );

    ScaffoldMessenger.of(this).showSnackBar(snackBar);
  }
}

extension LoadingDialogExtension on BuildContext {
  void showLoadingAlertDialog() {
    showDialog(
      context: this,
      builder: (_) => const LoadingAlertDialog(),
      barrierDismissible: false,
    );
  }
}
