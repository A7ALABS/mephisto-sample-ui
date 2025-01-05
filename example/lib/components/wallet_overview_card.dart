import 'package:example/components/quick_action_card.dart';
import 'package:flutter/material.dart';
import 'package:mephisto_ui/components/card/mephisto_card.dart';
import 'package:mephisto_ui/components/texts/mephisto_text_body_light.dart';
import 'package:mephisto_ui/components/texts/mephisto_text_heading_bold.dart';
import 'package:mephisto_ui/components/texts/mephisto_text_title_bold.dart';
import 'package:flutter_svg/flutter_svg.dart';

class WalletOverviewCard extends StatefulWidget {
  const WalletOverviewCard({super.key});

  @override
  State<WalletOverviewCard> createState() => _WalletOverviewCardState();
}

class _WalletOverviewCardState extends State<WalletOverviewCard> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 328,
      width: double.infinity,
      child: MephistoCard(
        color: Theme.of(context).primaryColor,
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      MephistoTextTitleBold(
                        text: 'Jost Utz',
                        textColor: Colors.white,
                      ),
                      MephistoTextBodyLight(
                        text: '•••• •••• •••• 1234',
                        textColor: Colors.white,
                      )
                    ],
                  ),
                  const Spacer(),
                  SvgPicture.asset('assets/svgs/visa.svg')
                ],
              ),
              const SizedBox(
                height: 24,
              ),
              const Divider(
                height: 0,
              ),
              const SizedBox(
                height: 24,
              ),
              const MephistoTextBodyLight(
                text: 'Your balance',
                textColor: Colors.white,
              ),
              const MephistoTextHeadingBold(
                text: '\$15,000',
                textColor: Colors.white,
              ),
              const SizedBox(
                height: 16,
              ),
              const QuickActionCard()
            ],
          ),
        ),
      ),
    );
  }
}
