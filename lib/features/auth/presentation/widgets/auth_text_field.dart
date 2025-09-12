import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../home/presentation/riverpod/news_provider.dart';

class AuthTextField extends ConsumerStatefulWidget {
  final TextEditingController controller;
  final String text;
  const AuthTextField({
    super.key,
    required this.controller,
    required this.text,
  });

  @override
  ConsumerState<AuthTextField> createState() => _AuthTextFieldState();
}

class _AuthTextFieldState extends ConsumerState<AuthTextField> {
  @override
  Widget build(BuildContext context) {
    final themeProvider = ref.watch(themeNotifierProvider);
    return TextField(
      controller: widget.controller,
      decoration: InputDecoration(
        focusColor: Colors.grey,
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(color: Colors.grey.shade400)
        ),
        hintText: widget.text.tr(),
        hintStyle: TextStyle(
          color: Colors.grey[600]
        ),
        filled: true,
        fillColor: themeProvider == ThemeMode.light ? Colors.white : Color(0xFF0A0D12),
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.grey,
            ),
            borderRadius: BorderRadius.circular(12)
        ),
      ),
    );
  }
}
