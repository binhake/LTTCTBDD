import 'package:flutter/material.dart';
import 'widgets/profile_card.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  // Quản lý chế độ sáng/tối
  ThemeMode _themeMode = ThemeMode.light;

  // Hàm chuyển đổi sáng/tối
  void _toggleTheme() {
    setState(() {
      _themeMode = (_themeMode == ThemeMode.light)
          ? ThemeMode.dark
          : ThemeMode.light;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      themeMode: _themeMode,
      home: ProfileScreen(
        onToggleTheme: _toggleTheme,
        isDarkMode: _themeMode == ThemeMode.dark,
      ),
    );
  }
}

class ProfileScreen extends StatefulWidget {
  final VoidCallback onToggleTheme;
  final bool isDarkMode;

  const ProfileScreen({
    super.key,
    required this.onToggleTheme,
    required this.isDarkMode,
  });

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  int _likeCount = 3;

  void _decrementLike() {
    setState(() {
      if (_likeCount > 0) {
        _likeCount--;
      }
    });
  }

  void _incrementLike() {
    setState(() {
      _likeCount++;
    });
  }

  void _resetLike() {
    setState(() {
      _likeCount = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lab F1 – Hồ sơ của tôi'),
        actions: [
          // Nút chuyển đổi giao diện sáng/tối trên AppBar
          IconButton(
            onPressed: widget.onToggleTheme,
            icon: Icon(
              widget.isDarkMode ? Icons.light_mode : Icons.dark_mode,
            ),
            tooltip: widget.isDarkMode ? 'Chuyển sang nền sáng' : 'Chuyển sang nền tối',
          ),
        ],
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Sử dụng ProfileCard đã tách sang file riêng
              const ProfileCard(
                name: 'Nguyễn Trọng Bình',
                studentId: '231A010044',
                className: 'Khoa CNTT – Lập trình trên các thiết bị di động',
              ),
              const SizedBox(height: 25),
              // Đổi màu chữ khi lượt thích >= 10 để đạt điểm barem
              Text(
                'Lượt thích: $_likeCount',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: _likeCount >= 10 ? Colors.red : Colors.blue,
                ),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    onPressed: _decrementLike,
                    icon: const Icon(Icons.remove_circle_outline),
                    iconSize: 36,
                  ),
                  const SizedBox(width: 15),
                  ElevatedButton.icon(
                    onPressed: _incrementLike,
                    icon: const Icon(Icons.favorite),
                    label: const Text('Thích'),
                  ),
                  const SizedBox(width: 15),
                  IconButton(
                    onPressed: _resetLike,
                    icon: const Icon(Icons.refresh),
                    iconSize: 36,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
