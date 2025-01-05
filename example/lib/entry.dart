import 'package:example/home.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mephisto_ui/components/appbar/mephisto_appbar.dart';
import 'package:mephisto_ui/components/badge/mephisto_icon_badge.dart';
import 'package:mephisto_ui/components/buttons/mephisto_center_icon_button.dart';
import 'package:mephisto_ui/components/texts/mephisto_text_heading_bold.dart';
import 'package:mephisto_ui/components/texts/mephisto_text_title_bold.dart';
import 'package:mephisto_ui/components/texts/mephisto_text_title_light.dart';
import 'package:mephisto_ui/widgets/mephisto_quick_settings.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class OnboardingApp extends ConsumerStatefulWidget {
  const OnboardingApp({super.key});

  @override
  ConsumerState<OnboardingApp> createState() => _OnboardingAppState();
}

class _OnboardingAppState extends ConsumerState<OnboardingApp> {
  int activeIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        shape: const Border(bottom: BorderSide.none),
        backgroundColor: Colors.transparent,
        title: MephistoAppBar(
          title: const MephistoTextTitleBold(
            text: '',
            textAlign: TextAlign.center,
          ),
          suffixIcon: SvgPicture.asset(
            'assets/svgs/cog.svg',
            color: Colors.white,
          ),
          onSuffixIconTap: () {
            showDialog(
              useSafeArea: false,
              context: context,
              builder: (_) {
                return const MephistoQuickSettings();
              },
            );
          },
        ),
      ),
      body: Stack(
        children: [
          Stack(
            fit: StackFit.expand,
            children: [
              Image.asset(
                'assets/images/slide1.png',
                fit: BoxFit.cover,
                height: MediaQuery.of(context).size.height,
              ),
              Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                color: Theme.of(context).primaryColor.withOpacity(0.3),
                child: SafeArea(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        MephistoIconBadge(
                          showOutline: true,
                          variant: 'md',
                          icon: SvgPicture.asset('assets/svgs/home.svg'),
                        ),
                        const SizedBox(
                          height: 24,
                        ),
                        MephistoTextHeadingBold(
                          text: "Welcome!",
                          textColor: Theme.of(context).primaryColor,
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        const MephistoTextTitleLight(
                            text: "We’re glad that that you are here!")
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
          Positioned(
            bottom: 24,
            child: SizedBox(
              height: 70,
              width: MediaQuery.of(context).size.width,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Column(
                  children: [
                    MephistoCenterIconButton(
                      text: "Let's get started",
                      isBold: true,
                      onClick: () {
                        Get.to(const HomePage());
                      },
                      suffixIcon: const Icon(CupertinoIcons.arrow_right),
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
