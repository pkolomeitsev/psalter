import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:orth_psalter/helpers/utils_helper.dart';
import 'package:orth_psalter/ui/components/buttons/copy_email_button.dart';

class SendEmailListTile extends StatelessWidget {
  final String email;
  final String subject;
  final String body;

  const SendEmailListTile({
    super.key,
    required this.email,
    required this.subject,
    required this.body,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(context.tr('contact')),
      subtitle: Text(context.tr('contactSubTitle')),
      trailing: Icon(Icons.mail),
      onTap: () async {
        bool hasSent = await UtilsHelper.sendEmail(
            this.email,
            this.subject,
            this.body
        );
        if (!hasSent) {
          showDialog(
            context: context,
            builder: (_) => AlertDialog(
              scrollable: true,
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [Text(context.tr('sendEmailNoticeMessageTitle')), const CloseButton()],
              ),
              content: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(context.tr('sendEmailNoticeMessage')),
                  CopyEmailButton(email: this.email),
                  Text(context.tr('contactBody')),
                ],
              ),
            ),
          );
        }
      },
    );
  }
}
