import 'package:flutter/material.dart';
import 'package:wineapp/constants.dart';
import 'package:google_fonts/google_fonts.dart';

const zwsp = '\u200b';

// the selection is at offset 1 so any character is inserted after it.
const zwspEditingValue = TextEditingValue(
    text: zwsp, selection: TextSelection(baseOffset: 1, extentOffset: 1));

class CodeField extends StatefulWidget {
  CodeField({
    Key? key,
    required this.generateAmount,
  }) : super(key: key);

  int generateAmount;

  @override
  _CodeFieldState createState() => _CodeFieldState();
}

class _CodeFieldState extends State<CodeField> {
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
        widget.generateAmount,
        (index) {
          return Padding(
            padding: const EdgeInsets.only(
              top: 5,
              right: 5,
            ),
            child: Container(
              height: 40,
              width: 30,
              decoration: BoxDecoration(
                color: Theme.of(context).scaffoldBackgroundColor,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                  width: 1,
                  color: Theme.of(context).primaryColor,
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.only(left: 1, bottom: 6),
                child: TextField(
                  textAlign: TextAlign.center,
                  style: GoogleFonts.poppins(
                    textStyle: TextStyle(
                      color: Theme.of(context).indicatorColor,
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
          );
        },
      ),
    );
  }
}
