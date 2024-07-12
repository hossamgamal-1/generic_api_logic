import 'package:flutter/material.dart';

class LoadingAlertDialog extends StatelessWidget {
  const LoadingAlertDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      surfaceTintColor: Colors.transparent,
      backgroundColor: Colors.blue.withOpacity(0.75),
      insetPadding: const EdgeInsets.symmetric(horizontal: 120),
      alignment: Alignment.center,
      child: const SizedBox(
        height: 120,
        width: 20,
        child: Center(
          child: CircularProgressIndicator(color: Colors.white),
        ),
      ),
    );
  }
}
