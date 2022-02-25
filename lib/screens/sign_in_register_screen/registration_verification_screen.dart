import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wineapp/constants.dart';
import 'package:wineapp/screens/sign_in_register_screen/registration_done_screen.dart';

class RegVerificationScreen extends StatefulWidget {
  const RegVerificationScreen({Key? key}) : super(key: key);

  @override
  _RegVerificationScreenState createState() => _RegVerificationScreenState();
}

class _RegVerificationScreenState extends State<RegVerificationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Scaffold(
        backgroundColor: backgroundColor,
        body: Stack(
          children: [
            Positioned(
              left: 45,
              top: 146,
              child: SizedBox(
                width: 300,
                height: 246.26,
                child:
                    SvgPicture.asset('assets/icons/icons_purple/code_sent.svg'),
              ),
            ),
            Positioned(
              left: 37,
              top: 451,
              child: SizedBox(
                width: 316,
                height: 42,
                child: Text(
                  'Enter Code',
                  style: GoogleFonts.poppins(
                    textStyle: const TextStyle(
                      color: mainTextColor,
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            Positioned(
              left: 77,
              top: 499,
              child: SizedBox(
                width: 235,
                height: 42,
                child: Text(
                  'A 4 digit Code has been sent to +49 1577 1677 857',
                  style: GoogleFonts.poppins(
                    textStyle: const TextStyle(
                      color: quartiaryTextColor,
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            const Positioned(
              left: 71,
              top: 600,
              child: SizedBox(
                width: 248,
                height: 57,
                child: RegVerificationTextField(),
              ),
            ),
            Positioned(
              top: 755,
              left: 40,
              child: InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (BuildContext context) => const RegDoneScreen(),
                    ),
                  );
                },
                child: Stack(
                  children: [
                    Ink(
                      height: 50,
                      width: 315,
                      decoration: BoxDecoration(
                        color: primaryColor,
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                    ),
                    Positioned(
                      top: 768 - 755,
                      left: 161 - 40,
                      child: SizedBox(
                        height: 24,
                        width: 140,
                        child: Text(
                          'Confirm',
                          style: GoogleFonts.poppins(
                            textStyle: const TextStyle(
                                color: mainTextColor,
                                fontSize: 16,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

const zwsp = '\u200b';

// the selection is at offset 1 so any character is inserted after it.
const zwspEditingValue = TextEditingValue(
    text: zwsp, selection: TextSelection(baseOffset: 1, extentOffset: 1));

class RegVerificationTextField extends StatefulWidget {
  const RegVerificationTextField({Key? key}) : super(key: key);

  @override
  _RegVerificationTextFieldState createState() =>
      _RegVerificationTextFieldState();
}

class _RegVerificationTextFieldState extends State<RegVerificationTextField> {
  List<String> code = ['', '', '', ''];

  late List<TextEditingController> controllers;
  late List<FocusNode> focusNodes;

  @override
  void initState() {
    super.initState();
    focusNodes = List.generate(4, (index) => FocusNode());
    controllers = List.generate(4, (index) {
      final ctrl = TextEditingController();
      ctrl.value = zwspEditingValue;
      return ctrl;
    });

    WidgetsBinding.instance!.addPostFrameCallback((timeStamp) {
      // give the focus to the first node.
      focusNodes[0].requestFocus();
    });
  }

  void printValues() {
    print(code);
  }

  @override
  void dispose() {
    super.dispose();
    focusNodes.forEach((focusNode) {
      focusNode.dispose();
    });
    controllers.forEach((controller) {
      controller.dispose();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        4,
        (index) => Padding(
          padding: const EdgeInsets.only(
            top: 5,
            right: 12,
          ),
          child: Container(
            width: 50,
            height: 57,
            decoration: BoxDecoration(
              color: primaryColor,
              borderRadius: BorderRadius.circular(11),
            ),
            child: Padding(
              padding: const EdgeInsets.only(left: 1, bottom: 6),
              child: TextField(
                textAlign: TextAlign.center,
                style: GoogleFonts.poppins(
                  textStyle: const TextStyle(
                    color: mainTextColor,
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                controller: controllers[index],
                focusNode: focusNodes[index],
                maxLength: 2,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  border: InputBorder.none,
                  counterText: "",
                ),
                onChanged: (value) {
                  if (value.length > 1) {
                    // this is a new character event
                    if (index + 1 == focusNodes.length) {
                      // do something after the last character was inserted
                      FocusScope.of(context).unfocus();
                    } else {
                      // move to the next field
                      focusNodes[index + 1].requestFocus();
                    }
                  } else {
                    // this is backspace event

                    // reset the controller
                    controllers[index].value = zwspEditingValue;
                    if (index == 0) {
                      // do something if backspace was pressed at the first field

                    } else {
                      // go back to previous field
                      controllers[index - 1].value = zwspEditingValue;
                      focusNodes[index - 1].requestFocus();
                    }
                  }
                  // make sure to remove the zwsp character
                  code[index] = value.replaceAll(zwsp, '');
                  print('current code = $code');
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
