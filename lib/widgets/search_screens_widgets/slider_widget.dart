import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wineapp/constants.dart';

class SliderWidget extends StatefulWidget {
  const SliderWidget({Key? key}) : super(key: key);

  @override
  _SliderWidgetState createState() => _SliderWidgetState();
}

class _SliderWidgetState extends State<SliderWidget> {
  double startValue = 30;
  double endValue = 100;
  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 85,
      left: 10,
      child: SizedBox(
        height: 10,
        width: 370,
        child: SliderTheme(
          data: SliderTheme.of(context).copyWith(
            trackHeight: 3,
            trackShape: RoundedRectSliderTrackShape(),
            thumbColor: Theme.of(context).primaryColorLight,
            activeTrackColor: Theme.of(context).primaryColorLight,
            inactiveTrackColor: Theme.of(context).scaffoldBackgroundColor,
            overlayColor: Colors.transparent,
            activeTickMarkColor: Theme.of(context).primaryColorLight,
            inactiveTickMarkColor: Theme.of(context).scaffoldBackgroundColor,
            valueIndicatorColor: Theme.of(context).scaffoldBackgroundColor,
            valueIndicatorTextStyle: GoogleFonts.poppins(
              textStyle: TextStyle(
                color: Theme.of(context).indicatorColor,
                fontSize: 12,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          child: RangeSlider(
              activeColor: Theme.of(context).primaryColorLight,
              inactiveColor: Theme.of(context).scaffoldBackgroundColor,
              min: 5.0,
              max: 120.0,
              divisions: 10,
              values: RangeValues(
                startValue,
                endValue,
              ),
              onChanged: (values) {
                setState(() {
                  startValue = values.start;
                  endValue = values.end;
                });
              }),
        ),
      ),
    );
  }
}
