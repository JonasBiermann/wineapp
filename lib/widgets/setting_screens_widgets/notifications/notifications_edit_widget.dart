import 'package:flutter/material.dart';
import 'package:wineapp/widgets/setting_screens_widgets/notifications/notification_edit_card.dart';
import 'package:wineapp/widgets/setting_screens_widgets/submit_changes_button.dart';

class NotificationEdit extends StatefulWidget {
  const NotificationEdit({Key? key}) : super(key: key);

  @override
  _NotificationEditState createState() => _NotificationEditState();
}

class _NotificationEditState extends State<NotificationEdit> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const NotificationEditCard(),
        Padding(
          padding: const EdgeInsets.only(top: 188),
          child: SubmitSettingChangesButton(
            cancelOnTap: () {},
            continueOnTap: () {},
            buttonText: 'Submit',
            cancelText: 'Delete Changes',
          ),
        ),
      ],
    );
  }
}
