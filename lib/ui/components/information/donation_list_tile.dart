import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:orth_psalter/storage/system/locale_storage.dart';
import 'package:orth_psalter/ui/components/link_button.dart';

class DonationListTile extends StatefulWidget {
  final String privateUAH = 'https://www.privat24.ua/send/46782';
  final String monoUAH = 'https://send.monobank.ua/jar/7vPsP8gcL1';

  const DonationListTile({super.key});

  @override
  State<DonationListTile> createState() => _DonationListTileState();
}

class _DonationListTileState extends State<DonationListTile> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(context.tr('donations')),
      trailing: Icon(Icons.favorite),
      onTap: () => this.donationClick(context),
    );
  }

  void donationClick(BuildContext context) async {
    String languageCode = await LocaleStorage.getLocale();

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          scrollable: true,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [Text(context.tr('donations')), const CloseButton()],
          ),
          content: Column(
            children: [
              Text(context.tr('donationMessage')),
              LinkButton(
                link: widget.privateUAH,
                label: 'Private24',
              ),
              LinkButton(
                link: widget.privateUAH,
                label: 'Monobank',
              ),
            ],
          ),
        );
      },
    );
  }
}
