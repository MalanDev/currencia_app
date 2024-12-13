import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../core/theme/app_theme.dart';

final themeModeProvider = StateProvider<ThemeMode>((ref) => ThemeMode.light);

final themeProvider = Provider<ThemeData>((ref) {
  final themeMode = ref.watch(themeModeProvider);
  return themeMode == ThemeMode.light
      ? AppTheme.lightTheme
      : AppTheme.darkTheme;
});
