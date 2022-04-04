import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SubmitSettingChangesButton extends StatelessWidget {
  const SubmitSettingChangesButton(
      {Key? key,
      required this.cancelOnTap,
      required this.continueOnTap,
      required this.buttonText,
      required this.cancelText})
      : super(key: key);
  final VoidCallback cancelOnTap;
  final VoidCallback continueOnTap;
  final String buttonText;
  final String cancelText;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      width: 320,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: cancelOnTap,
            child: Container(
              height: 40,
              width: 153,
              decoration: BoxDecoration(
                color: Theme.of(context).scaffoldBackgroundColor,
                borderRadius: BorderRadius.circular(35),
                border: Border.all(
                  color: Theme.of(context).primaryColorLight,
                  width: 1,
                ),
              ),
              child: Center(
                child: Text(
                  cancelText,
                  style: GoogleFonts.poppins(
                    textStyle: TextStyle(
                      color: Theme.of(context).primaryColorLight,
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: continueOnTap,
            child: Container(
              height: 40,
              width: 153,
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
                borderRadius: BorderRadius.circular(35),
              ),
              child: Center(
                child: Text(
                  buttonText,
                  style: GoogleFonts.poppins(
                    textStyle: TextStyle(
                      color: Theme.of(context).indicatorColor,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
