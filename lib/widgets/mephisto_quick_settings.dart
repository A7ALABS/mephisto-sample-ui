import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:mephisto_ui/components/buttons/mephisto_button.dart';
import 'package:mephisto_ui/components/buttons/mephisto_center_icon_button.dart';
import 'package:mephisto_ui/components/popup/mephisto_popup.dart';
import 'package:mephisto_ui/components/popup/mephisto_popup_title.dart';
import 'package:mephisto_ui/objects/theme.dart';
import 'package:mephisto_ui/providers/theme_provider.dart';
import 'package:mephisto_ui/widgets/buttons/mephisto_switch_widget.dart';

class MephistoQuickSettings extends ConsumerStatefulWidget {
  const MephistoQuickSettings({super.key});

  @override
  ConsumerState<MephistoQuickSettings> createState() =>
      _MephistoQuickSettingsState();
}

class _MephistoQuickSettingsState extends ConsumerState<MephistoQuickSettings> {
  handleUpdateTheme(isDarkTheme) async {
    final themeBox = await Hive.openBox('theme');
    MephistoPersistentTheme? theme = themeBox.getAt(0);

    if (theme != null) {
      theme.isDarkTheme = isDarkTheme;
      themeBox.putAt(0, theme);
    }
  }

  bool isLightTheme = false;

  @override
  Widget build(BuildContext context) {
    isLightTheme = !ref.read(isDarkThemeProvider);
    return StatefulBuilder(
      builder: (context, setState) {
        return MephistoPopup(
          defaultPadding: true,
          showElevation: false,
          onClose: () {
            Get.back();
          },
          modal: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              MephistoPopupTitle(
                title: "Adjust settings",
                fillColor:
                    Theme.of(context).scaffoldBackgroundColor.withOpacity(0.3),
                onClose: () {
                  Get.back();
                },
              ),
              Padding(
                padding: const EdgeInsets.all(0),
                child: Column(
                  children: [
                    MephistoSwitchWidget(
                      text: "Dark theme",
                      prefixIcon: SizedBox(
                        height: 24,
                        width: 24,
                        child: Icon(
                          CupertinoIcons.moon,
                          color: Theme.of(context).primaryColor,
                        ),
                      ),
                      isDefaultSelected: !isLightTheme,
                      isSelected: !isLightTheme,
                      onClick: () {
                        setState(
                          () {
                            isLightTheme = !isLightTheme;
                          },
                        );
                        ref
                            .read(isDarkThemeProvider.notifier)
                            .update((state) => state == true ? false : true);
                        handleUpdateTheme(!isLightTheme);
                      },
                    ),
                    const SizedBox(height: 32),
                    SizedBox(
                      height: 50,
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Expanded(
                            child: MephistoButton(
                                textColor: ref
                                    .watch(accentColorProvider.notifier)
                                    .state,
                                opacity: 0.3,
                                text: "Cancel",
                                onClick: () {
                                  Get.back();
                                }),
                          ),
                          const SizedBox(
                            width: 16,
                          ),
                          Expanded(
                            child: MephistoCenterIconButton(
                                icon: const Icon(CupertinoIcons.checkmark_alt),
                                text: "Apply",
                                onClick: () {
                                  Get.back();
                                }),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
