import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Thực Hành 1',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // Biến lưu trạng thái hiện tại (0: trang 1, 1: trang 2, 2: trang 3)
  int _currentState = 0;

  void _onButtonPressed() {
    setState(() {
      // Mỗi lần bấm sẽ tăng trạng thái lên, nếu đến trang 3 thì quay lại trang 1
      _currentState = (_currentState + 1) % 3;
    });
  }

  @override
  Widget build(BuildContext context) {
    // Xác định nội dung văn bản dựa trên trạng thái hiện tại
    String topText = '';
    String middleText = '';
    String buttonText = '';

    if (_currentState == 0) {
      topText = 'TextView';
      middleText = 'TextView';
      buttonText = 'Button';
    } else if (_currentState == 1) {
      topText = 'My First App';
      middleText = 'Hello';
      buttonText = 'Say Hi!';
    } else if (_currentState == 2) {
      topText = 'My First App';
      middleText = 'I\'m\Nguyễn Xuân Sang';
      buttonText = 'Say Hi!';
    }

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SizedBox(
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // TextView trên cùng
              Text(
                topText,
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              
              // TextView ở giữa
              Text(
                middleText,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 20,
                  color: Colors.black,
                ),
              ),
              
              // Nút Button ở dưới cùng
              ElevatedButton(
                onPressed: _onButtonPressed,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue[700], // Màu nền của nút
                  foregroundColor: Colors.white, // Màu chữ của nút
                  padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: Text(
                  buttonText,
                  style: const TextStyle(fontSize: 18),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
