import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wineapp/widgets/setting_screens_widgets/data_storage/data_category_amount_widget.dart';
import 'package:wineapp/widgets/setting_screens_widgets/data_storage/data_storage_category_wdiget.dart';
import 'package:wineapp/widgets/setting_screens_widgets/design/design_overview_color_container.dart';

class DataStorageInfoCard extends StatelessWidget {
  const DataStorageInfoCard({
    Key? key,
    required this.pDataAmount,
    required this.dataAmount,
    required this.aDataAmount,
    required this.cDataAmount,
    required this.accountAge,
  }) : super(key: key);

  final int pDataAmount;
  final int dataAmount;
  final int aDataAmount;
  final int cDataAmount;
  final int accountAge;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 253,
          width: 320,
          decoration: BoxDecoration(
            color: Theme.of(context).scaffoldBackgroundColor,
            borderRadius: BorderRadius.circular(25),
            border: Border.all(
              color: Theme.of(context).primaryColor,
              width: 2,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(
            left: 15,
            top: 80,
          ),
          child: Stack(
            children: [
              Container(
                height: 30,
                width: 290,
                decoration: BoxDecoration(
                  color: Theme.of(context).scaffoldBackgroundColor,
                  border: Border.all(
                    width: 2,
                    color: Theme.of(context).indicatorColor,
                  ),
                  borderRadius: BorderRadius.circular(35),
                ),
              ),
              Container(
                height: 30,
                width: pDataAmount / dataAmount * 290 + 26,
                decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor,
                  border: Border.all(
                    width: 2,
                    color: Theme.of(context).indicatorColor,
                  ),
                  borderRadius: BorderRadius.circular(
                    35,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  left: pDataAmount / dataAmount * 290,
                ),
                child: Container(
                  height: 30,
                  width: aDataAmount / dataAmount * 290 + 26,
                  decoration: BoxDecoration(
                    color: Theme.of(context).scaffoldBackgroundColor,
                    borderRadius: BorderRadius.circular(
                      35,
                    ),
                    border: Border.all(
                      width: 2,
                      color: Theme.of(context).indicatorColor,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  left: pDataAmount / dataAmount * 290 +
                      aDataAmount / dataAmount * 290,
                ),
                child: Container(
                  height: 30,
                  width: cDataAmount / dataAmount * 290,
                  decoration: BoxDecoration(
                    color: Theme.of(context).primaryColorLight,
                    borderRadius: BorderRadius.circular(
                      35,
                    ),
                    border: Border.all(
                      color: Theme.of(context).indicatorColor,
                      width: 2,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(
            left: 15,
            top: 15,
          ),
          child: Text(
            'Data & Storage',
            style: GoogleFonts.poppins(
              textStyle: TextStyle(
                color: Theme.of(context).indicatorColor,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(
            left: 15,
            top: 52,
          ),
          child: SizedBox(
            height: 18,
            width: 82,
            child: Text(
              'Storage Used',
              style: GoogleFonts.poppins(
                textStyle: TextStyle(
                  color: Theme.of(context).indicatorColor,
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
        ),
        DataCategoryAmountWidget(
          dataAmount: '${dataAmount}MB',
          topPadding: 52,
        ),
        DataStorageCategoryWidget(
          categoryName: 'Personal Data',
          topPadding: 136,
        ),
        DataStorageCategoryWidget(
          categoryName: 'App Data',
          topPadding: 164,
        ),
        DataStorageCategoryWidget(
          categoryName: 'Cache',
          topPadding: 192,
        ),
        DataStorageCategoryWidget(
          categoryName: 'Account Age',
          topPadding: 220,
        ),
        DesignOverviewColorContainer(
          color: Theme.of(context).primaryColor,
          topPadding: 136,
        ),
        DesignOverviewColorContainer(
          color: Theme.of(context).scaffoldBackgroundColor,
          topPadding: 164,
        ),
        DesignOverviewColorContainer(
          color: Theme.of(context).primaryColorLight,
          topPadding: 192,
        ),
        DataCategoryAmountWidget(
          dataAmount: '${pDataAmount}MB',
          topPadding: 136,
        ),
        DataCategoryAmountWidget(
          dataAmount: '${aDataAmount}MB',
          topPadding: 164,
        ),
        DataCategoryAmountWidget(
          dataAmount: '${cDataAmount}MB',
          topPadding: 192,
        ),
        DataCategoryAmountWidget(
          dataAmount: '$accountAge Days',
          topPadding: 220,
        ),
      ],
    );
  }
}
