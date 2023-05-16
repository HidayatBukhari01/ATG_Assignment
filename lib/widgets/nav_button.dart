import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class NavButton extends StatelessWidget {
  final String title;
  final String icon;
  const NavButton({super.key, required this.title, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 48,
      width: 160,
      decoration: BoxDecoration(
        border: Border.all(color: Theme.of(context).secondaryHeaderColor),
        borderRadius: BorderRadius.circular(8),
        shape: BoxShape.rectangle,
      ),
      child: Row(
        children: [
          const SizedBox(
            width: 24,
          ),
          Image.asset('images/icons/$icon'),
          const SizedBox(
            width: 16,
          ),
          Text(title,
              style: GoogleFonts.inter(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: Theme.of(context).secondaryHeaderColor)),
        ],
      ),
    );
  }
}
