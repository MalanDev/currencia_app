import 'package:currencia_app/core/constants/app_constants.dart';
import 'package:currencia_app/presentation/views/main_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'core/theme/app_theme.dart';
import 'presentation/providers/theme_provider.dart';
import 'presentation/views/currency_view.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = ref.watch(themeProvider);
    return MaterialApp(
      title: AppConstants.APP_NAME,
      theme: theme,
      darkTheme: AppTheme.darkTheme,
      themeMode: ref.watch(themeModeProvider),
      debugShowCheckedModeBanner: false,
      home: const MainScreen(),
    );
  }
}
