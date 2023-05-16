import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BottomNav extends StatefulWidget {
  const BottomNav({super.key});

  @override
  State<BottomNav> createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  var currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      width: size.width,
      height: 58,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(.15),
            blurRadius: 30,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: ListView.builder(
        itemCount: 5,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) => InkWell(
          onTap: () {
            setState(
              () {
                currentIndex = index;
              },
            );
          },
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: 72,
                height: index == currentIndex ? 2 : 0,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(2),
                  color: Theme.of(context).secondaryHeaderColor,
                ),
              ),
              Image.asset(
                "images/bottom/${listOfIcons[index]}",
                color: index == currentIndex
                    ? const Color(0xff598BED)
                    : Colors.black38,
              ),
              Text(
                title[index],
                style: GoogleFonts.inter(
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                    color: index == currentIndex
                        ? const Color(0xff598BED)
                        : Colors.black38),
              ),
              const SizedBox(
                height: 0.5,
              )
            ],
          ),
        ),
      ),
    );
  }

  List<String> listOfIcons = [
    "home.png",
    "book.png",
    "hub.png",
    "chat.png",
    "Profile.png",
  ];
  List<String> title = ["Home", "Learn", "Hub", "Chat", "Profile"];
}
