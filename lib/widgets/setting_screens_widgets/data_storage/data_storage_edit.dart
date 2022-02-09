import 'package:flutter/material.dart';
import 'package:wineapp/widgets/setting_screens_widgets/data_storage/data_storage_edit_info_widget.dart';
import 'package:wineapp/widgets/setting_screens_widgets/data_storage/train_somellier_widget.dart';
import 'package:wineapp/widgets/setting_screens_widgets/submit_changes_button.dart';

class DataStorageEdit extends StatelessWidget {
  DataStorageEdit({
    Key? key,
    required this.settingName,
  }) : super(key: key);
  String settingName;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        DataStorageEditInfoWidget(),
        Padding(
          padding: EdgeInsets.only(
            top: 15,
          ),
          child: TrainSomellierWidget(),
        ),
        Padding(
          padding: EdgeInsets.only(
            top: 111,
          ),
          child: SubmitSettingChangesButton(),
        ),
      ],
    );
  }
}
