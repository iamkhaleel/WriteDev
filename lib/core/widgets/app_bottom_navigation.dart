import 'package:flutter/material.dart';

class AppBottomNavigation extends StatelessWidget {
  final int currentIndex;
  final ValueChanged<int>? onTap;

  const AppBottomNavigation({Key? key, this.currentIndex = 0, this.onTap})
    : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Color(0xFF0E1A2B),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
        border: Border(top: BorderSide(color: Color(0xFF3d4652), width: 1)),
      ),
      child: BottomNavigationBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.grey[400],
        selectedLabelStyle: TextStyle(
          fontFamily: 'SpaceGrotesk',
          fontWeight: FontWeight.w600,
        ),
        unselectedLabelStyle: TextStyle(fontFamily: 'SpaceGrotesk'),
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home, size: 24),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.mail_outline, size: 24),
            label: 'Messages',
          ),
          BottomNavigationBarItem(
            icon: Container(
              margin: EdgeInsets.only(bottom: 20),
              width: 56,
              height: 56,
              decoration: BoxDecoration(
                color: Color(0xFF00f5d4),
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: Color(0xFF1b63bb).withOpacity(0.3),
                    blurRadius: 8,
                    offset: Offset(0, 4),
                  ),
                ],
              ),
              child: Icon(Icons.add, color: Colors.black87, size: 28),
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications_outlined, size: 24),
            label: 'Notification',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline, size: 24),
            label: 'Profile',
          ),
        ],
        currentIndex: currentIndex,
        onTap: onTap,
        type: BottomNavigationBarType.fixed,
      ),
    );
  }
}
