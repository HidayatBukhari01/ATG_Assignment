import 'package:atg_assginment/models/lesson_model.dart';
import 'package:atg_assginment/models/program_model.dart';
import 'package:atg_assginment/services/item_service.dart';
import 'package:atg_assginment/widgets/card_2.dart';
import 'package:atg_assginment/widgets/nav_button.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../widgets/bottom_nav.dart';
import '../widgets/card_1.dart';
import '../widgets/card_3.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    ItemService itemService = ItemService();
    return Scaffold(
      backgroundColor: const Color(0xffF5F5F5),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: const [
          Icon(
            Icons.question_answer_outlined,
            color: Color(0xff939CA3),
          ),
          SizedBox(
            width: 20.42,
          ),
          Icon(
            Icons.notifications_none_outlined,
            color: Color(0xff939CA3),
          ),
          SizedBox(
            width: 18.42,
          )
        ],
        leading: const Icon(
          Icons.sort,
          color: Color(0xff939CA3),
        ),
        backgroundColor: Theme.of(context).primaryColor,
        elevation: 0.0,
      ),
      body: SingleChildScrollView(
          child: Column(
        children: [
          Container(
            height: 220,
            width: MediaQuery.of(context).size.width,
            color: Theme.of(context).primaryColor,
            child: Padding(
              padding: const EdgeInsets.only(top: 8, left: 16, right: 16),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Hello, Priya!",
                    style: GoogleFonts.lora(
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                        color: const Color(0xff08090A)),
                  ),
                  const SizedBox(
                    height: 2,
                  ),
                  Text(
                    "What do you wanna learn today?",
                    style: GoogleFonts.inter(
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        color: const Color(0xff6D747A)),
                  ),
                  const SizedBox(
                    height: 32,
                  ),
                  const Row(
                    children: [
                      NavButton(title: "Programs", icon: 'bookmark.png'),
                      SizedBox(
                        width: 8,
                      ),
                      NavButton(title: "Get Help", icon: "help.png")
                    ],
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  const Row(
                    children: [
                      NavButton(title: "Learn", icon: "book.png"),
                      SizedBox(
                        width: 8,
                      ),
                      NavButton(title: "DD Tracker", icon: "bar.png")
                    ],
                  )
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 24,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'Programs for you',
                      style: GoogleFonts.lora(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          color: const Color(0xff000000)),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          'View all',
                          style: GoogleFonts.inter(
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                              color: const Color(0xff6D747A)),
                        ),
                        const Icon(
                          Icons.arrow_forward_rounded,
                          color: Color(0xff6D747A),
                          size: 20,
                        )
                      ],
                    ),
                  ],
                ),
                const SizedBox(
                  height: 24,
                ),
                //Implement the Programs API endpoint provided in the assignment here.
                SizedBox(
                  height: 280,
                  child: FutureBuilder<ProgramModel>(
                      future: itemService.programsList(),
                      builder: (context, snapshot) {
                        if (!snapshot.hasData) {
                          return const Text("No Data");
                        } else {
                          return ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: snapshot.data!.items.length,
                              itemBuilder: (context, index) {
                                return Card1(
                                    category:
                                        snapshot.data!.items[index].category,
                                    title: snapshot.data!.items[index].name,
                                    lessons:
                                        snapshot.data!.items[index].lesson);
                              });
                        }
                      }),
                ),
                const SizedBox(
                  height: 32,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'Events and experiences',
                      style: GoogleFonts.lora(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          color: const Color(0xff000000)),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          'View all',
                          style: GoogleFonts.inter(
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                              color: const Color(0xff6D747A)),
                        ),
                        const Icon(
                          Icons.arrow_forward_rounded,
                          color: Color(0xff6D747A),
                          size: 20,
                        )
                      ],
                    ),
                  ],
                ),
                const SizedBox(
                  height: 24,
                ),
                const SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      Card2(
                        category: "BABYCARE",
                        title: "Understanding of human behaviour",
                        date: "13 Feb, Sunday",
                        image: 'g11.png',
                      ),
                      SizedBox(
                        width: 16,
                      ),
                      Card2(
                        category: "BABYCARE",
                        title: "Understanding of human behaviour",
                        date: "13 Feb, Sunday",
                        image: 'g11.png',
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 32,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'Lessons for you',
                      style: GoogleFonts.lora(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          color: const Color(0xff000000)),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          'View all',
                          style: GoogleFonts.inter(
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                              color: const Color(0xff6D747A)),
                        ),
                        const Icon(
                          Icons.arrow_forward_rounded,
                          color: Color(0xff6D747A),
                          size: 20,
                        )
                      ],
                    ),
                  ],
                ),
                const SizedBox(
                  height: 24,
                ),
                //Implement the lessons API endpoint provided in the assignment here.
                SizedBox(
                  height: 282,
                  child: FutureBuilder<LessonModel>(
                      future: itemService.lessonsList(),
                      builder: (context, snapshot) {
                        if (!snapshot.hasData) {
                          return const Text("No data");
                        } else {
                          return ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: snapshot.data!.items.length,
                              itemBuilder: (context, index) {
                                return Card3(
                                    category:
                                        snapshot.data!.items[index].category,
                                    title: snapshot.data!.items[index].name,
                                    length:
                                        snapshot.data!.items[index].duration,
                                    isLocked:
                                        snapshot.data!.items[index].locked);
                              });
                        }
                      }),
                ),
                const SizedBox(
                  height: 24,
                ),
              ],
            ),
          ),
        ],
      )),
      bottomNavigationBar: const BottomNav(),
    );
  }
}
