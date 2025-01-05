import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mephisto_ui/components/avatar/mephisto_avatar.dart';
import 'package:mephisto_ui/components/texts/mephisto_text_caption_light.dart';
import 'package:mephisto_ui/components/texts/mephisto_text_heading_bold_1.dart';
import 'package:mephisto_ui/components/texts/mephisto_text_title_bold.dart';

class MephistoTransactionCard extends StatefulWidget {
  const MephistoTransactionCard({
    super.key,
    required this.image,
    required this.name,
    required this.date,
    required this.type,
    required this.amount,
    required this.currency,
  });

  final String image;
  final String name;
  final DateTime date;
  final int type;
  final double amount;
  final String currency;

  @override
  State<MephistoTransactionCard> createState() =>
      _MephistoTransactionCardState();
}

class _MephistoTransactionCardState extends State<MephistoTransactionCard> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 8),
      child: Row(
        children: [
          Row(
            children: [
              SizedBox(
                height: 50,
                width: 50,
                child: MephistoAvatar(
                  image: widget.image,
                ),
              ),
              const SizedBox(
                width: 12,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  MephistoTextTitleBold(
                    text: widget.name,
                  ),
                  Row(
                    children: [
                      MephistoTextCaptionLight(
                        text: DateFormat.yMMMd().format(widget.date),
                      ),
                      const SizedBox(
                        width: 4,
                      ),
                      Container(
                        height: 4,
                        width: 4,
                        decoration: BoxDecoration(
                            color: Theme.of(context).dividerColor,
                            borderRadius: BorderRadius.circular(4)),
                      ),
                      const SizedBox(
                        width: 4,
                      ),
                      MephistoTextCaptionLight(
                          text: DateFormat.Hm().format(widget.date))
                    ],
                  )
                ],
              ),
            ],
          ),
          const Spacer(),
          MephistoTextHeadingBold1(
            text:
                '${widget.type == 0 ? '+' : '-'}${widget.currency}${widget.amount}',
            textColor: Theme.of(context).primaryColor,
          )
        ],
      ),
    );
  }
}
