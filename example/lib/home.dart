import 'package:example/components/wallet_overview_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mephisto_ui/components/appbar/mephisto_appbar.dart';
import 'package:mephisto_ui/components/buttons/mephisto_button.dart';
import 'package:mephisto_ui/components/card/mephisto_transaction_card.dart';
import 'package:mephisto_ui/components/texts/mephisto_text_heading_bold_1.dart';
import 'package:mephisto_ui/components/texts/mephisto_text_title_bold.dart';
import 'package:mephisto_ui/utils/color_extension.dart';
import 'package:mephisto_ui/widgets/mephisto_quick_settings.dart';
import 'package:get/get.dart';
import 'package:flutter_svg/flutter_svg.dart';

List<Map<String, String>> contacts = [
  {
    'image': 'assets/images/digital_wallet_user_1.png',
    'name': 'Alicia Waltz',
    'amount': '100.00',
    'currency': 'USD',
  },
  {
    'image': 'assets/images/digital_wallet_user_2.png',
    'name': 'Josh Ultz',
    'amount': '80.00',
    'currency': 'USD',
  },
  {
    'image': 'assets/images/digital_wallet_user_3.png',
    'name': 'Rachel Ritz',
    'amount': '120.00',
    'currency': 'USD',
  },
  {
    'image': 'assets/images/digital_wallet_user_1.png',
    'name': 'Alicia Waltz',
    'amount': '50.00',
    'currency': 'USD',
  },
];

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
        title: MephistoAppBar(
          placeholder: 'Welcome back,',
          title: const MephistoTextTitleBold(
            text: 'John Doe',
          ),
          image: 'assets/images/profile_user.png',
          suffixIcon: SvgPicture.asset(
            'assets/svgs/cog.svg',
            color: neutralIconCaption,
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
          prefixIcon: const Icon(
            CupertinoIcons.arrow_left,
            size: 18,
            color: neutralIconCaption,
          ),
          onPrefixIconTap: () {
            Get.back();
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 28,
              ),
              const MephistoTextHeadingBold1(
                text: "Overview",
                textAlign: TextAlign.left,
              ),
              const SizedBox(
                height: 24,
              ),
              const WalletOverviewCard(),
              const SizedBox(
                height: 24,
              ),
              const MephistoTextHeadingBold1(
                text: "Recent Transactions",
                textAlign: TextAlign.left,
              ),
              const SizedBox(
                height: 24,
              ),
              ListView.separated(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemBuilder: (context, index) => MephistoTransactionCard(
                      image: contacts[index]['image']!,
                      name: contacts[index]['name']!,
                      date: DateTime.now(),
                      type: 0,
                      amount: double.parse(contacts[index]['amount']!),
                      currency: '\$'),
                  separatorBuilder: (context, index) => const SizedBox(
                        height: 24,
                      ),
                  itemCount: contacts.length),
              const SizedBox(
                height: 24,
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: MephistoButton(
              text: "Go Back",
              onClick: () {
                Get.back();
              }),
        ),
      ),
    );
  }
}
