import 'package:flutter/material.dart';
import 'package:toastification/toastification.dart';

enum ToastIcon { noWifi, email, user }

class MyToasts {
  static const Duration _animationDuration = Duration(milliseconds: 300);
  static const bool _showProgressBar = true;

  static void showToastError({
    required String title,
    required String description,
    int? seconds,
    ToastIcon? toastIcon,
  }) {
    toastification.show(
      style: ToastificationStyle.flatColored,
      alignment: Alignment.bottomCenter,
      title: Text(
        title,
        style: const TextStyle(fontWeight: FontWeight.bold),
      ),
      description: Text(description, maxLines: 5),
      icon: _getIcon(toastIcon),
      type: ToastificationType.error,
      autoCloseDuration: Duration(seconds: seconds ?? 3),
      showProgressBar: _showProgressBar,
      animationDuration: _animationDuration,
      animationBuilder: (context, animation, alignment, child) {
        return FadeTransition(
          opacity: animation,
          child: child,
        );
      },
    );
  }

  static void showToastSuccess({
    String? title,
    required String description,
    ToastIcon? toastIcon,
    int? seconds,
  }) {
    toastification.show(
      style: ToastificationStyle.fillColored,
      alignment: Alignment.bottomCenter,
      icon: _getIcon(toastIcon),
      title: Text(
        title ?? 'Sucesso',
        style: const TextStyle(fontWeight: FontWeight.bold),
      ),
      description: Text(description, maxLines: 5),
      type: ToastificationType.success,
      autoCloseDuration: Duration(seconds: seconds ?? 5),
      showProgressBar: _showProgressBar,
      animationDuration: _animationDuration,
      animationBuilder: (context, animation, alignment, child) {
        return FadeTransition(
          opacity: animation,
          child: child,
        );
      },
    );
  }

  static Widget? _getIcon(ToastIcon? toastIcon) {
    IconData? icon;
    if (toastIcon == ToastIcon.noWifi) icon = Icons.wifi_off;
    if (toastIcon == ToastIcon.email) icon = Icons.email_outlined;
    if (toastIcon == ToastIcon.user) icon = Icons.person;
    if (toastIcon == null) return null;
    return Icon(icon);
  }
}
