// ignore_for_file: depend_on_referenced_packages

import 'package:example/entry.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';

import 'package:mephisto_ui/providers/theme_provider.dart';
import 'package:mephisto_ui/utils/color_extension.dart';
import 'package:mephisto_ui/utils/typography_extension.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await MephistoPersistent.init();

  runApp(
    const ProviderScope(
      child: OnboardingAppWrapper(),
    ),
  );
}

class OnboardingAppWrapper extends ConsumerStatefulWidget {
  const OnboardingAppWrapper({super.key});

  @override
  ConsumerState<OnboardingAppWrapper> createState() =>
      _OnboardingAppWrapperState();
}

class _OnboardingAppWrapperState extends ConsumerState<OnboardingAppWrapper> {
  @override
  initState() {
    super.initState();
    Future.delayed(const Duration(milliseconds: 100), () {
      if (kIsWeb) {
        var location = Uri.base.toString();
        if (location.contains("theme")) {
          var theme = location.split("theme=")[1].split('&')[0];
          if (theme == 'dark') {
            ref.read(isDarkThemeProvider.notifier).update((state) => true);
            setState(() {});
          } else {
            ref.read(isDarkThemeProvider.notifier).update((state) => false);
            setState(() {});
          }
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return MephistoThemeProvider(
      primaryColor: const Color(0xFF844FC7),
      fontFamily: 'Lato',
      borderRadius: 8,
      borderWidth: 1,
      isDarkTheme: true,
      darkFillColor: black,
      lightFillColor: white,
      darkLineColor: lineColorDark,
      lightLineColor: lineColorLight,
      child: GetMaterialApp(
        localizationsDelegates: const [DefaultMaterialLocalizations.delegate],
        theme: ref.watch(themeProvider).copyWith(
          extensions: <ThemeExtension<dynamic>>[
            typoGraphyExtension,
            colorExtension
          ],
        ),
        darkTheme: ref.watch(themeProvider).copyWith(
          extensions: <ThemeExtension<dynamic>>[
            typoGraphyExtension,
            colorExtension
          ],
        ),
        home: const OnboardingEntryPoint(),
      ),
    );
  }
}

class OnboardingEntryPoint extends ConsumerStatefulWidget {
  const OnboardingEntryPoint({super.key});

  @override
  ConsumerState<OnboardingEntryPoint> createState() =>
      _OnboardingEntryPointState();
}

class _OnboardingEntryPointState extends ConsumerState<OnboardingEntryPoint> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: OnboardingApp(),
    );
  }
}
