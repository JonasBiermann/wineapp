import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wineapp/constants.dart';
import 'package:wineapp/services/auth_services.dart';

class AddMealButton extends StatelessWidget {
  const AddMealButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: 35,
      top: 685,
      child: GestureDetector(
        onTap: () async {
          await AuthService().logOut();
        },
        child: Stack(
          children: [
            Container(
              height: 50,
              width: 320,
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
                borderRadius: BorderRadius.circular(
                  35,
                ),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.black26,
                    offset: Offset(
                      0,
                      6,
                    ),
                    blurRadius: 3,
                  ),
                ],
              ),
            ),
            Positioned(
              left: 62 - 35,
              top: 695 - 685,
              child: SizedBox(
                height: 30,
                width: 142,
                child: Text(
                  'Ask Somellier',
                  style: GoogleFonts.poppins(
                    textStyle: TextStyle(
                        color: Theme.of(context).indicatorColor,
                        fontWeight: FontWeight.w600,
                        fontSize: 20),
                  ),
                ),
              ),
            ),
            Positioned(
              left: 287 - 35,
              top: 700 - 685,
              child: SizedBox(
                height: 20,
                width: 20,
                child: SvgPicture.asset('assets/icons/general/add-2.svg',
                    color: Theme.of(context).indicatorColor),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
