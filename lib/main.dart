import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'WriteDev Onboarding',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        fontFamily: 'SpaceGrotesk',
        colorScheme: const ColorScheme.light(
          primary: Color(0xFF1b63bb),
          surface: Color(0xFFf6f7f8),
          onPrimary: Colors.white,
          onSurface: Colors.black,
        ),
      ),
      darkTheme: ThemeData(
        useMaterial3: true,
        fontFamily: 'SpaceGrotesk',
        colorScheme: const ColorScheme.dark(
          primary: Color(0xFF1b63bb),
          surface: Color(0xFF0E1A2B),
          onPrimary: Colors.white,
          onSurface: Colors.white,
        ),
      ),
      themeMode: ThemeMode.dark, // Force dark mode for now
      home: const OnboardingScreen(),
    );
  }
}

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colors = theme.colorScheme;

    return Scaffold(
      backgroundColor: colors.background,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height: 80,
                        width: 80,
                        margin: const EdgeInsets.only(bottom: 16.0),
                        child: CustomPaint(painter: LogoPainter()),
                      ),
                      Text(
                        'WriteDev',
                        style: TextStyle(
                          color: colors.onSurface,
                          fontSize: 42,
                          fontWeight: FontWeight.bold,
                          letterSpacing: -0.5,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 32),
                      Text(
                        'Share code. Get reach. No followers needed.',
                        style: TextStyle(
                          color: colors.onSurface.withOpacity(0.9),
                          fontSize: 22,
                          fontWeight: FontWeight.w700,
                          letterSpacing: -0.2,
                          height: 1.3,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 40),
                      Container(
                        constraints: const BoxConstraints(maxWidth: 320),
                        child: Column(
                          children: [
                            _buildButton(context, 'Sign up with GitHub'),
                            const SizedBox(height: 16),
                            _buildButton(context, 'Sign up with Google'),
                            const SizedBox(height: 16),
                            _buildButton(context, 'Sign up with Email'),
                            const SizedBox(height: 24),
                            TextButton(
                              onPressed: () {},
                              child: Text(
                                'Continue as Guest',
                                style: TextStyle(
                                  color: Colors.grey[400],
                                  fontSize: 14,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 24),
            _buildPageIndicators(),
          ],
        ),
      ),
    );
  }

  Widget _buildButton(BuildContext context, String text) {
    final colors = Theme.of(context).colorScheme;
    return ElevatedButton(
      onPressed: () {},
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.white.withOpacity(0.08),
        foregroundColor: colors.onSurface,
        minimumSize: const Size(double.infinity, 56),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
          side: BorderSide(color: Colors.white.withOpacity(0.15)),
        ),
        elevation: 0,
      ),
      child: Text(
        text,
        style: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
          letterSpacing: 0.2,
        ),
        overflow: TextOverflow.ellipsis,
      ),
    );
  }

  Widget _buildPageIndicators() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [_indicator(true), _indicator(false), _indicator(false)],
      ),
    );
  }

  Widget _indicator(bool isActive) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 250),
      width: isActive ? 32 : 8,
      height: 8,
      margin: const EdgeInsets.symmetric(horizontal: 6),
      decoration: BoxDecoration(
        color: isActive ? const Color(0xFF00f5d4) : const Color(0xFF3d4652),
        borderRadius: BorderRadius.circular(9999),
      ),
    );
  }
}

class LogoPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = const Color(0xFF00f5d4)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2
      ..strokeCap = StrokeCap.round
      ..strokeJoin = StrokeJoin.round;

    final scale = size.width / 24;
    canvas.scale(scale, scale);

    final path1 = Path()
      ..moveTo(16, 18)
      ..lineTo(22, 12)
      ..lineTo(16, 6)
      ..moveTo(8, 6)
      ..lineTo(2, 12)
      ..lineTo(8, 18);
    canvas.drawPath(path1, paint);

    final path2 = Path()
      ..moveTo(14.5, 4)
      ..lineTo(9.5, 20);
    canvas.drawPath(path2, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
