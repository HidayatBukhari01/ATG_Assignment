import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Card3 extends StatelessWidget {
  final String category;
  final String title;
  final int length;
  final bool isLocked;
  const Card3({
    super.key,
    required this.category,
    required this.title,
    required this.length,
    required this.isLocked,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 16),
      height: 282,
      width: 247,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: const Color(0xffEBEDF0), width: 1),
          color: Colors.white,
          boxShadow: const [BoxShadow(color: Color(0xff0e443e))]),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(8), topLeft: Radius.circular(8)),
                color: Color(0xffDDE3C2)),
            child: Center(
              child: Image.asset(
                'images/g11.png',
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  category,
                  style: GoogleFonts.inter(
                      fontSize: 12,
                      fontWeight: FontWeight.w700,
                      color: Theme.of(context).secondaryHeaderColor),
                ),
                const SizedBox(
                  height: 8,
                ),
                Text(
                  title,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: GoogleFonts.inter(
                      fontSize: 17,
                      fontWeight: FontWeight.w700,
                      color: const Color(0xff000000)),
                ),
                SizedBox(
                  height:
                      title.length >= 22 ? (title.length == 22 ? 39 : 15) : 39,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "$length min",
                      style: GoogleFonts.inter(
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          color: const Color(0xff6D747A)),
                    ),
                    isLocked
                        ? Image.asset("images/icon/lock.png")
                        : const Icon(Icons.lock_open),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
