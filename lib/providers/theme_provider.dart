import 'package:figma_squircle/figma_squircle.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mephisto_ui/objects/theme.dart';
import 'package:mephisto_ui/utils/color_extension.dart';
import 'package:mephisto_ui/utils/typography_extension.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';

// ignore: use_full_hex_values_for_flutter_colors
const greyColorLight = Color(0xff69737A);
const greyColorDark = Color(0xffA4ADB3);
const lineColorDark = Color(0xff2B3236);
const lineColorLight = Color(0xffE2E9ED);

Color parseColor(String color) {
  return Color(int.parse(color.split('0xff')[1], radix: 16)).withOpacity(1);
}

class MephistoPersistent {
  MephistoPersistent();

  static Future<dynamic> init() async {
    if (!kIsWeb) {
      final dir = await getApplicationDocumentsDirectory();
      Hive.init(dir.path);
      Hive.registerAdapter(MephistoPersistentThemeAdapter());
    } else {
      Hive.registerAdapter(MephistoPersistentThemeAdapter());
    }
  }
}

class MephistoThemeProvider extends ConsumerStatefulWidget {
  const MephistoThemeProvider({
    super.key,
    required this.child,
    this.primaryColor = const Color(0xFF844FC7),
    this.fontFamily = 'Roboto',
    this.borderRadius = 8,
    this.borderWidth = 1,
    this.isDarkTheme = true,
    this.darkFillColor = black,
    this.lightFillColor = Colors.white,
    this.darkLineColor = lineColorDark,
    this.lightLineColor = lineColorLight,
  });

  final Color? primaryColor;
  final String? fontFamily;
  final double? borderRadius;
  final double? borderWidth;
  final bool? isDarkTheme;
  final Color? darkFillColor;
  final Color? lightFillColor;
  final Color? darkLineColor;
  final Color? lightLineColor;

  final Widget child;

  @override
  ConsumerState<MephistoThemeProvider> createState() =>
      _MephistoThemeProviderState();
}

class _MephistoThemeProviderState extends ConsumerState<MephistoThemeProvider> {
  bool initialized = false;

  initMephistoTheme() async {
    final MephistoPersistentTheme theme = MephistoPersistentTheme(
      primaryColor: widget.primaryColor!.toString().substring(6).split(')')[0],
      primaryColorString: 'purple',
      fontFamily: widget.fontFamily!,
      borderRadius: widget.borderRadius!,
      borderWidth: widget.borderWidth!,
      isDarkTheme: widget.isDarkTheme!,
      darkFillColor:
          widget.darkFillColor!.toString().substring(6).split(')')[0],
      lightFillColor:
          widget.lightFillColor!.toString().substring(6).split(')')[0],
      darkLineColor:
          widget.darkLineColor!.toString().substring(6).split(')')[0],
      lightLineColor:
          widget.lightLineColor!.toString().substring(6).split(')')[0],
    );
    var box = await Hive.openBox('theme');
    box.add(theme);

    loadMephistoTheme(theme);
  }

  loadMephistoTheme(MephistoPersistentTheme theme) async {
    ref
        .read(accentColorProvider.notifier)
        .update((state) => parseColor(theme.primaryColor!));
    ref
        .read(accentColorStringProvider.notifier)
        .update((state) => theme.primaryColorString!);
    ref.read(fontFamilyProvider.notifier).update((state) => theme.fontFamily!);
    ref
        .read(borderRadiusProvider.notifier)
        .update((state) => theme.borderRadius!);
    ref
        .read(borderWidthProvider.notifier)
        .update((state) => theme.borderWidth!);
    ref
        .read(isDarkThemeProvider.notifier)
        .update((state) => theme.isDarkTheme!);

    ref.read(darkFillColorProvider.notifier).update(
          (state) => parseColor(theme.darkFillColor!),
        );
    ref.read(lightFillColorProvider.notifier).update(
          (state) => parseColor(theme.lightFillColor!),
        );
    ref.read(darkLineColorProvider.notifier).update(
          (state) => parseColor(theme.darkLineColor!),
        );
    ref.read(lightLineColorProvider.notifier).update(
          (state) => parseColor(theme.lightLineColor!),
        );
  }

  void initTheme(_) async {
    try {
      final themeBox = await Hive.openBox('theme');
      MephistoPersistentTheme? theme = themeBox.getAt(0);

      if (theme == null) {
        initMephistoTheme();
      } else {
        loadMephistoTheme(theme);
      }
    } catch (e) {
      initMephistoTheme();
    }

    initialized = true;
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback(initTheme);
  }

  @override
  Widget build(BuildContext context) {
    return initialized == false ? const SizedBox() : widget.child;
  }
}

final isDarkThemeProvider = StateProvider<bool>((ref) => true);
final accentColorProvider = StateProvider<Color>((ref) => Colors.purple);
final accentColorStringProvider = StateProvider<String>((ref) => 'purple');

final iconColorProvider = StateProvider<Color>((ref) => black);
final fontFamilyProvider = StateProvider<String>((ref) => 'Roboto');
final borderRadiusProvider = StateProvider<double>((ref) => 8.0);
final borderWidthProvider = StateProvider<double>((ref) => 1);

final isFilledProvider = StateProvider<bool>((ref) => false);
final darkFillColorProvider = StateProvider<Color>((ref) => black);
final lightFillColorProvider = StateProvider<Color>((ref) => white);

final lightLineColorProvider = StateProvider<Color>((ref) => lineColorLight);
final darkLineColorProvider = StateProvider<Color>((ref) => lineColorDark);

final titleColorProvider = StateProvider<Color>(
    (ref) => ref.watch(isDarkThemeProvider) == true ? white : black);

final themeProvider = StateProvider<ThemeData>(
  (ref) => ThemeData(
    useMaterial3: false,
    brightness: ref.watch(isDarkThemeProvider) == true
        ? Brightness.dark
        : Brightness.light,
    primaryColor: ref.watch(accentColorProvider),
    scrollbarTheme: ScrollbarThemeData(
      thickness: WidgetStateProperty.all(0),
    ),
    fontFamily: ref.watch(fontFamilyProvider),
    scaffoldBackgroundColor:
        ref.watch(isDarkThemeProvider) == true ? black : white,

    appBarTheme: AppBarTheme(
      iconTheme: IconThemeData(
          color: ref.watch(isDarkThemeProvider) == true
              ? greyColorDark
              : greyColorLight),
      elevation: 0,
      backgroundColor: ref.watch(isDarkThemeProvider) == true
          ? ref.watch(darkFillColorProvider)
          : ref.watch(lightFillColorProvider),
      shape: Border(
        bottom: BorderSide(
          color: ref.watch(isDarkThemeProvider) == true
              ? ref.watch(darkLineColorProvider)
              : ref.watch(lightLineColorProvider),
        ),
      ),
    ),
    dividerColor: ref.watch(isDarkThemeProvider) == true
        ? ref.watch(darkLineColorProvider)
        : ref.watch(lightLineColorProvider),
    // primaryTextTheme: text,

    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        elevation: WidgetStateProperty.all<double>(0),
        textStyle: WidgetStateProperty.all<TextStyle>(
          TextStyle(
              color: ref.watch(titleColorProvider),
              fontSize: 14,
              fontWeight: FontWeight.w800),
        ),
        minimumSize: WidgetStateProperty.all<Size>(
          const Size(200, 50),
        ),
        shape: WidgetStateProperty.all<SmoothRectangleBorder>(
          SmoothRectangleBorder(
            borderRadius: SmoothBorderRadius(
              cornerRadius: ref.watch(borderRadiusProvider),
              cornerSmoothing: ref.watch(borderRadiusProvider) == 50 ? 0 : 1,
            ),
          ),
        ),
        backgroundColor: WidgetStateProperty.resolveWith<Color>(
          (Set<WidgetState> states) {
            if (states.contains(WidgetState.pressed)) {
              return ref.watch(accentColorProvider).withOpacity(0.9);
            } else if (states.contains(WidgetState.disabled)) {
              return ref.watch(accentColorProvider).withOpacity(0.8);
            }
            return ref
                .watch(accentColorProvider); // Use the component's default.
          },
        ),
      ),
    ),
    textTheme: TextTheme(
      headlineLarge: typoGraphyExtension.headingBold!.apply(
        color: ref.watch(titleColorProvider),
      ),
      headlineMedium: typoGraphyExtension.headingLight!.apply(
        color: ref.watch(titleColorProvider),
      ),
      headlineSmall: typoGraphyExtension.headingBold1!.apply(
        color: ref.watch(titleColorProvider),
      ),
      displayLarge: typoGraphyExtension.headingLight1!.apply(
        color: ref.watch(titleColorProvider),
      ),
      displayMedium: typoGraphyExtension.headingBold2!.apply(
        color: ref.watch(titleColorProvider),
      ),
      displaySmall: typoGraphyExtension.headingLight2!.apply(
        color: ref.watch(titleColorProvider),
      ),
      titleLarge: typoGraphyExtension.titleBold!.apply(
        color: ref.watch(titleColorProvider),
      ),
      titleMedium: typoGraphyExtension.titleLight!.apply(
        color: ref.watch(titleColorProvider),
      ),
      titleSmall: typoGraphyExtension.bodyBold1!.apply(
        color: ref.watch(titleColorProvider),
      ),
      bodyLarge: typoGraphyExtension.bodyLight1!.apply(
        color: ref.watch(titleColorProvider),
      ),
      bodyMedium: typoGraphyExtension.bodyBold2!.apply(
        color: ref.watch(titleColorProvider),
      ),
    ),

    chipTheme: ChipThemeData(
      backgroundColor: WidgetStateColor.resolveWith(
        (states) => ref.watch(accentColorProvider),
      ),
      elevation: 0,
      pressElevation: 0,
      color: WidgetStateColor.resolveWith((states) => Colors.transparent),
      shape: SmoothRectangleBorder(
        side: BorderSide(
          color: ref.watch(borderWidthProvider) == 0
              ? Colors.transparent
              : ref.watch(isDarkThemeProvider) == true
                  ? ref.watch(darkLineColorProvider)
                  : ref.watch(lightLineColorProvider),
          width: ref.watch(borderWidthProvider),
        ), // Use the component's default.
        borderRadius: SmoothBorderRadius(
          cornerRadius: ref.watch(borderRadiusProvider) == 50
              ? 16
              : ref.watch(borderRadiusProvider),
          cornerSmoothing: ref.watch(borderRadiusProvider) == 50 ? 0 : 1,
        ),
      ),
    ),

    cardTheme: CardTheme(
      color: ref.watch(isFilledProvider) == true
          ? ref.watch(isDarkThemeProvider) == true
              ? ref.watch(darkFillColorProvider)
              : ref.watch(lightFillColorProvider)
          : Colors.transparent,
      elevation: 0,
      margin: EdgeInsets.zero,
      shape: SmoothRectangleBorder(
        side: BorderSide(
          color: ref.watch(borderWidthProvider) == 0
              ? Colors.transparent
              : ref.watch(isDarkThemeProvider) == true
                  ? ref.watch(darkLineColorProvider)
                  : ref.watch(lightLineColorProvider),
          width: ref.watch(borderWidthProvider) + 0.5,
        ), // Use the component's default.
        borderRadius: SmoothBorderRadius(
          cornerRadius: ref.watch(borderRadiusProvider) == 50
              ? 24
              : ref.read(borderRadiusProvider),
          cornerSmoothing: ref.watch(borderRadiusProvider) == 50 ? 0 : 1,
        ),
      ),
    ),
  ),
);
