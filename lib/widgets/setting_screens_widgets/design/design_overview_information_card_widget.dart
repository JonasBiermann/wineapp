import 'package:flutter/material.dart';
import 'package:wineapp/constants.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wineapp/widgets/setting_screens_widgets/design/design_overview_category_widget.dart';
import 'package:wineapp/widgets/setting_screens_widgets/design/design_overview_color_code.dart';
import 'package:wineapp/widgets/setting_screens_widgets/design/design_overview_color_container.dart';

import 'design_overview_widget.dart';

class DesignOverviewInformationCardWidget extends StatelessWidget {
  const DesignOverviewInformationCardWidget({
    Key? key,
    required this.widget,
  }) : super(key: key);

  final DesignOverview widget;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 225,
          width: 320,
          decoration: BoxDecoration(
            color: Theme.of(context).scaffoldBackgroundColor,
            borderRadius: BorderRadius.circular(25),
            border: Border.all(
              width: 2,
              color: Theme.of(context).primaryColor,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(
            left: 15,
            top: 15,
          ),
          child: Text(
            'Design',
            style: GoogleFonts.poppins(
              textStyle: TextStyle(
                color: Theme.of(context).indicatorColor,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        const DesignOverviewCategoryWidget(
          designCategory: 'Design Name',
          topPadding: 52,
        ),
        const DesignOverviewCategoryWidget(
          designCategory: 'Primary Color',
          topPadding: 80,
        ),
        const DesignOverviewCategoryWidget(
          designCategory: 'Background Color',
          topPadding: 108,
        ),
        const DesignOverviewCategoryWidget(
          designCategory: 'Main-Text-Color',
          topPadding: 136,
        ),
        const DesignOverviewCategoryWidget(
          designCategory: 'Secondary-Text-Color',
          topPadding: 164,
        ),
        const DesignOverviewCategoryWidget(
          designCategory: 'Tertiary-Text-Color',
          topPadding: 192,
        ),
        Padding(
          padding: const EdgeInsets.only(
            left: 155,
            top: 52,
          ),
          child: SizedBox(
            height: 18,
            width: 150,
            child: Text(
              widget.designName,
              style: GoogleFonts.poppins(
                textStyle: TextStyle(
                  color: Theme.of(context).indicatorColor,
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                ),
              ),
              textAlign: TextAlign.right,
            ),
          ),
        ),
        DesignOverviewColorContainer(
          color: Theme.of(context).primaryColor,
          topPadding: 80,
        ),
        DesignOverviewColorContainer(
          color: Theme.of(context).scaffoldBackgroundColor,
          topPadding: 108,
        ),
        DesignOverviewColorContainer(
          color: Theme.of(context).indicatorColor,
          topPadding: 136,
        ),
        DesignOverviewColorContainer(
          color: Theme.of(context).primaryColorLight,
          topPadding: 164,
        ),
        DesignOverviewColorContainer(
          color: Theme.of(context).hintColor,
          topPadding: 192,
        ),
        DesignOverviewColorCode(
          colorCode: '9A81D5',
          topPadding: 80,
        ),
        DesignOverviewColorCode(
          colorCode: '6F00CF',
          topPadding: 108,
        ),
        DesignOverviewColorCode(
          colorCode: 'FFFFFF',
          topPadding: 136,
        ),
        DesignOverviewColorCode(
          colorCode: 'D3C1FF',
          topPadding: 164,
        ),
        DesignOverviewColorCode(
          colorCode: '6F00CF',
          topPadding: 192,
        ),
      ],
    );
  }
}
