import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wineapp/constants.dart';
import 'package:wineapp/widgets/setting_screens_widgets/design/design_overview_information_card_widget.dart';
import 'package:wineapp/widgets/uprade_plan.dart';

class DesignOverview extends StatefulWidget {
  const DesignOverview({Key? key, required this.designName}) : super(key: key);

  final String designName;
  @override
  State<DesignOverview> createState() => _DesignOverviewState();
}

class _DesignOverviewState extends State<DesignOverview> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        DesignOverviewInformationCardWidget(widget: widget),
        Padding(
          padding: const EdgeInsets.only(
            top: 55,
          ),
          child: UpgradePlan(
            upgradePhrase: 'Unlock more Designs',
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(
            top: 15,
          ),
          child: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: SizedBox(
              height: 17,
              width: 47,
              child: Center(
                child: Text(
                  'Go Back',
                  style: GoogleFonts.poppins(
                    textStyle: TextStyle(
                      color: Theme.of(context).colorScheme.primary,
                      fontSize: 11,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
