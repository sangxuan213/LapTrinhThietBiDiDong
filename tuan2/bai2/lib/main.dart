import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: GradeScreen(),
    );
  }
}

class GradeScreen extends StatelessWidget {
  const GradeScreen({super.key});

  String getGrade(double score) {
    if (score < 0 || score > 10) {
      return 'Không hợp lệ';
    } else if (score >= 8.0) {
      return 'Giỏi';
    } else if (score >= 6.5) {
      return 'Khá';
    } else if (score >= 5.0) {
      return 'Trung bình';
    } else {
      return 'Yếu';
    }
  }

  Color getTextColor(double score) {
    if (score < 0 || score > 10) {
      return Colors.grey[700]!;
    } else if (score >= 8.0) {
      return Colors.green[800]!;
    } else if (score >= 6.5) {
      return Colors.blue[800]!;
    } else if (score >= 5.0) {
      return Colors.orange[800]!;
    } else {
      return Colors.red[800]!;
    }
  }

  Color getBgColor(double score) {
    if (score < 0 || score > 10) {
      return Colors.grey[200]!;
    } else if (score >= 8.0) {
      return Colors.green[100]!;
    } else if (score >= 6.5) {
      return Colors.blue[100]!;
    } else if (score >= 5.0) {
      return Colors.orange[100]!;
    } else {
      return Colors.red[100]!;
    }
  }

  Widget buildGradeBadge(double score, {double width = double.infinity, double height = 48}) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: getBgColor(score),
        borderRadius: BorderRadius.circular(8),
      ),
      alignment: Alignment.center,
      child: Text(
        getGrade(score),
        style: TextStyle(
          color: getTextColor(score),
          fontWeight: FontWeight.w600,
          fontSize: 16,
        ),
      ),
    );
  }

  Widget buildExtraCheckRow(double score, {bool showDivider = true}) {
    return Column(
      children: [
        Container(
          height: 64,
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Điểm ${score % 1 == 0 ? score.toInt() : score}',
                style: const TextStyle(fontSize: 16, color: Colors.black87),
              ),
              buildGradeBadge(score, width: 120, height: 36),
            ],
          ),
        ),
        if (showDivider)
          Container(
            height: 1,
            color: Colors.grey[200],
            margin: const EdgeInsets.symmetric(horizontal: 16),
          ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    // 1. Khai báo một biến điểm có giá trị 8.5
    double mainScore = 8.5;

    return Scaffold(
      backgroundColor: const Color(0xFFF3F4F6),
      appBar: AppBar(
        title: const Text(
          'Xếp loại học lực',
          style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.w500),
        ),
        backgroundColor: const Color(0xFF223B68),
        elevation: 0,
        centerTitle: false,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Main score card
          Container(
            margin: const EdgeInsets.all(16),
            padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: Colors.grey[300]!, width: 0.5),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Text(
                      'Điểm trung bình',
                      style: TextStyle(fontSize: 14, color: Colors.black54),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Text(
                  mainScore.toString(),
                  style: const TextStyle(
                    fontSize: 56, 
                    fontWeight: FontWeight.bold, 
                    height: 1.1,
                    color: Colors.black87,
                  ),
                ),
                const SizedBox(height: 24),
                // Hiển thị xếp loại cho điểm 8.5
                buildGradeBadge(mainScore),
              ],
            ),
          ),
          
          // Extra checks section
          const SizedBox(height: 8),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: const Text(
              'KIỂM TRA THÊM',
              style: TextStyle(fontSize: 12, color: Colors.black54, fontWeight: FontWeight.w600),
            ),
          ),
          const SizedBox(height: 8),
          
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: Colors.grey[300]!, width: 0.5),
            ),
            child: Column(
              children: [
                // Gọi hàm với các điểm 9, 7, 5.5, 3 và 11
                buildExtraCheckRow(9),
                buildExtraCheckRow(7),
                buildExtraCheckRow(5.5),
                buildExtraCheckRow(3),
                buildExtraCheckRow(11, showDivider: false),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
