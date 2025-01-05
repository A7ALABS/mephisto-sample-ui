import 'package:flutter/material.dart';
import 'package:mephisto_ui/components/card/mephisto_card.dart';
import 'package:mephisto_ui/components/texts/mephisto_text_caption_bold.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';

class QuickActionCard extends ConsumerStatefulWidget {
  const QuickActionCard({super.key});

  @override
  ConsumerState<QuickActionCard> createState() => _QuickActionCardState();
}

class _QuickActionCardState extends ConsumerState<QuickActionCard> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 95,
      width: double.infinity,
      child: MephistoCard(
        color: Theme.of(context).scaffoldBackgroundColor,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 27),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  MephistoCard(
                    onTap: () {},
                    color: Theme.of(context).primaryColor.withOpacity(0.2),
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: SvgPicture.asset(
                        'assets/svgs/quick_actions/transfer.svg',
                        color: Theme.of(context).primaryColor,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  MephistoTextCaptionBold(
                    text: "Transfer",
                    textColor: Theme.of(context).primaryColor,
                  ),
                ],
              ),
              Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  MephistoCard(
                    color: Theme.of(context).primaryColor.withOpacity(0.2),
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: SvgPicture.asset(
                        'assets/svgs/quick_actions/request.svg',
                        color: Theme.of(context).primaryColor,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  MephistoTextCaptionBold(
                    text: "Request",
                    textColor: Theme.of(context).primaryColor,
                  ),
                ],
              ),
              Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  MephistoCard(
                    color: Theme.of(context).primaryColor.withOpacity(0.2),
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: SvgPicture.asset(
                        'assets/svgs/quick_actions/in_and_out.svg',
                        color: Theme.of(context).primaryColor,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  MephistoTextCaptionBold(
                    text: "In & out",
                    textColor: Theme.of(context).primaryColor,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
