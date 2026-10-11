import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}
class Student {
  String name;
  String? email;
  String? phone;

  Student(this.name, this.email, this.phone);
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Bài 1: Vòng lặp for và kiểu nullable',
      home: StudentListScreen(),
    );
  }
}

class StudentListScreen extends StatelessWidget {
  StudentListScreen({super.key});

  final List<Student> students = [
    Student("Nguyễn Văn An", "an@sv.edu.vn", "0901 234 567"),
    Student("Trần Thị Bình", null, "0912 888 999"),
    Student("Lê Minh Chi", "chi@sv.edu.vn", null),
    Student("Phạm Quốc Dũng", null, null),
    Student("Võ Thanh Em", "em@sv.edu.vn", "0933 111 222"),
  ];

  @override
  Widget build(BuildContext context) {
    int missingEmailCount = 0;
    for (var student in students) {
      if (student.email == null) {
        missingEmailCount++;
      }
    }

    return Scaffold(
      backgroundColor: const Color(0xFFF3F4F6),
      appBar: AppBar(
        title: const Text(
          'Danh sách sinh viên',
          style: TextStyle(color: Colors.white, fontSize: 18),
        ),
        backgroundColor: const Color(0xFF2C4373),
        centerTitle: false,
      ),
      body: Container(
        width: double.infinity,
        child: Column(
          children: [
            const SizedBox(height: 16),
            for (var student in students)
              Container(
                width: double.infinity,
                margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      student.name,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      "Email: ${student.email ?? 'Chưa cập nhật'}",
                      style: const TextStyle(
                        color: Color(0xFFA89334),
                        fontSize: 14,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      "SĐT: ${student.phone ?? 'Chưa cập nhật'}",
                      style: const TextStyle(
                        color: Color(0xFF4B5563),
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ),
            const SizedBox(height: 10),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 16),
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              decoration: BoxDecoration(
                color: const Color(0xFFE5E7EB),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Tổng: ${students.length} sinh viên",
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF2C4373),
                    ),
                  ),
                  Row(
                    children: [
                      const Text(
                        "Thiếu email: ",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF676A38),
                        ),
                      ),
                      Text(
                        "$missingEmailCount",
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.red,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
