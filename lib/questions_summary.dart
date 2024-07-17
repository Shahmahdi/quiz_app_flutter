import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class QuestionsSummary extends StatelessWidget {
  const QuestionsSummary({super.key, required this.summaryData});

  final List<Map<String, Object>> summaryData;
  bool isCorrectAnswer(String userAnswer, String correctAnswer) {
    return userAnswer == correctAnswer;
  }

  @override
  Widget build(context) {
    return Padding(
      padding: const EdgeInsets.all(30),
      child: SizedBox(
        height: 400,
        child: SingleChildScrollView(
          child: Column(
            children: summaryData.map((data) {
              return Container(
                margin: const EdgeInsets.only(bottom: 12),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 4,
                      ),
                      decoration: BoxDecoration(
                        color: isCorrectAnswer(
                          data["user_answer"] as String,
                          data["correct_answer"] as String,
                        )
                            ? const Color.fromARGB(255, 114, 162, 201)
                            : const Color.fromARGB(255, 206, 126, 220),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(100)),
                      ),
                      child: Text(
                        ((data["question_index"] as int) + 1).toString(),
                      ),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    Expanded(
                      child: Container(
                        alignment: Alignment.centerLeft,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              data["question"] as String,
                              style: GoogleFonts.lato(
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                                fontSize: 16,
                              ),
                            ),
                            Text(
                              data["user_answer"] as String,
                              style: const TextStyle(
                                fontWeight: FontWeight.w500,
                                color: Color.fromARGB(255, 206, 126, 220),
                              ),
                            ),
                            Text(
                              data["correct_answer"] as String,
                              style: const TextStyle(
                                fontWeight: FontWeight.w500,
                                color: Color.fromARGB(255, 114, 162, 201),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              );
            }).toList(),
          ),
        ),
      ),
    );
  }
}
