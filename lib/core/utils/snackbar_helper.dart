import 'package:flutter/material.dart';

class SnackbarHelper {
  static final GlobalKey<ScaffoldMessengerState> scaffoldMessengerKey = GlobalKey<ScaffoldMessengerState>();

  static void showSuccess({
    required String title,
    required String message,
    Duration? duration,
  }) {
    _showSnackbar(
      title: title,
      message: message,
      backgroundColor: Colors.green[600],
      textColor: Colors.white,
      icon: Icons.check_circle,
      duration: duration,
    );
  }

  static void showError({
    required String title,
    required String message,
    Duration duration = const Duration(seconds: 3),
  }) {
    _showSnackbar(
      title: title,
      message: message,
      backgroundColor: Colors.red[600],
      textColor: Colors.white,
      icon: Icons.error,
      duration: duration,
    );
  }

  static void showWarning({
    required String title,
    required String message,
    Duration? duration,
  }) {
    _showSnackbar(
      title: title,
      message: message,
      backgroundColor: Colors.orange[600],
      textColor: Colors.white,
      icon: Icons.warning,
      duration: duration,
    );
  }

  static void showInfo({
    required String title,
    required String message,
    Duration? duration,
  }) {
    _showSnackbar(
      title: title,
      message: message,
      backgroundColor: Colors.blue[600],
      textColor: Colors.white,
      icon: Icons.info,
      duration: duration,
    );
  }

  static void showCustom({
    required String title,
    required String message,
    Color? backgroundColor,
    Color? textColor,
    IconData? icon,
    Duration? duration,
  }) {
    _showSnackbar(
      title: title,
      message: message,
      backgroundColor: backgroundColor,
      textColor: textColor,
      icon: icon,
      duration: duration,
    );
  }

  static void _showSnackbar({
    required String title,
    required String message,
    Color? backgroundColor,
    Color? textColor,
    IconData? icon,
    Duration? duration,
  }) {
    final durationValue = duration ?? const Duration(seconds: 2);
    final bgColor = backgroundColor ?? Colors.black87;
    final txtColor = textColor ?? Colors.white;

    final messengerState = scaffoldMessengerKey.currentState;
    if (messengerState == null) return;

    messengerState
      ..clearSnackBars()
      ..showSnackBar(
        SnackBar(
          content: Row(
            children: [
              if (icon != null) ...[
                Icon(icon, color: txtColor, size: 24),
                const SizedBox(width: 10),
              ],
              Expanded(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                        color: txtColor,
                      ),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      message,
                      style: TextStyle(
                        fontSize: 13,
                        color: txtColor,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          backgroundColor: bgColor,
          duration: durationValue,
          dismissDirection: DismissDirection.horizontal,
          behavior: SnackBarBehavior.floating,
          margin: const EdgeInsets.all(14),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      );
  }
}
