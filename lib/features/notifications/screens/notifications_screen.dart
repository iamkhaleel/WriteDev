import 'package:flutter/material.dart';

class NotificationsScreen extends StatefulWidget {
  @override
  _NotificationsScreenState createState() => _NotificationsScreenState();
}

class _NotificationsScreenState extends State<NotificationsScreen> {
  int _selectedTab = 0;
  final List<String> _tabs = ['All', 'Mentions', 'Likes', 'Comments'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF0E1A2B),
      appBar: AppBar(
        backgroundColor: Color(0xFF1A1A2E),
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          'Notifications',
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
            fontFamily: 'SpaceGrotesk',
          ),
        ),
        centerTitle: true,
        actions: [
          TextButton(
            onPressed: () {},
            child: Text(
              'Clear All',
              style: TextStyle(
                color: Color(0xFF00f5d4),
                fontSize: 16,
                fontFamily: 'SpaceGrotesk',
              ),
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          // Tab Navigation
          Container(
            height: 60,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: _tabs.length,
              itemBuilder: (context, index) {
                bool isSelected = index == _selectedTab;
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      _selectedTab = index;
                    });
                  },
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SizedBox(height: 8),
                        Text(
                          _tabs[index],
                          style: TextStyle(
                            color: isSelected ? Colors.white : Colors.grey[400],
                            fontSize: 16,
                            fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                            fontFamily: 'SpaceGrotesk',
                          ),
                        ),
                        SizedBox(height: 8),
                        if (isSelected)
                          Container(
                            width: 20,
                            height: 2,
                            decoration: BoxDecoration(
                              color: Color(0xFF00f5d4),
                              borderRadius: BorderRadius.circular(1),
                            ),
                          )
                        else
                          SizedBox(height: 2),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
          // Notifications List
          Expanded(
            child: ListView(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              children: [
                _buildNotificationCard(
                  icon: Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      color: Color(0xFF1A1A2E),
                      shape: BoxShape.circle,
                      border: Border.all(color: Color(0xFF3d4652), width: 1),
                    ),
                    child: Icon(Icons.trending_up, color: Colors.white, size: 20),
                  ),
                  isUnread: true,
                  title: "You've leveled up! You are now a ",
                  highlightedText: "Level 5 Developer.",
                  time: "2m ago",
                ),
                _buildNotificationCard(
                  avatar: CircleAvatar(
                    radius: 20,
                    backgroundColor: Colors.grey[300],
                    child: Icon(Icons.person, color: Colors.grey[600], size: 20),
                  ),
                  overlayIcon: Container(
                    width: 16,
                    height: 16,
                    decoration: BoxDecoration(
                      color: Color(0xFF9c27b0),
                      shape: BoxShape.circle,
                    ),
                    child: Icon(Icons.alternate_email, color: Colors.white, size: 10),
                  ),
                  isUnread: true,
                  title: "@ada_lovelace mentioned you in a post: 'Great point on state management! What do you think, @dev_master?'",
                  time: "5m ago",
                ),
                _buildNotificationCard(
                  avatar: CircleAvatar(
                    radius: 20,
                    backgroundColor: Colors.grey[300],
                    child: Icon(Icons.person, color: Colors.grey[600], size: 20),
                  ),
                  overlayIcon: Container(
                    width: 16,
                    height: 16,
                    decoration: BoxDecoration(
                      color: Colors.pink,
                      shape: BoxShape.circle,
                    ),
                    child: Icon(Icons.favorite, color: Colors.white, size: 10),
                  ),
                  isUnread: true,
                  title: "@grace_hopper and 2 others liked your post: 'My new open-source project...'",
                  time: "15m ago",
                ),
                _buildNotificationCard(
                  avatar: CircleAvatar(
                    radius: 20,
                    backgroundColor: Colors.grey[300],
                    child: Icon(Icons.person, color: Colors.grey[600], size: 20),
                  ),
                  overlayIcon: Container(
                    width: 16,
                    height: 16,
                    decoration: BoxDecoration(
                      color: Colors.green,
                      shape: BoxShape.circle,
                    ),
                    child: Icon(Icons.chat_bubble, color: Colors.white, size: 10),
                  ),
                  isUnread: false,
                  title: "@alan_turing commented on your post: 'This is brilliant! Have you considered...'",
                  time: "1h ago",
                ),
                _buildNotificationCard(
                  avatar: CircleAvatar(
                    radius: 20,
                    backgroundColor: Colors.grey[300],
                    child: Icon(Icons.person, color: Colors.grey[600], size: 20),
                  ),
                  overlayIcon: Container(
                    width: 16,
                    height: 16,
                    decoration: BoxDecoration(
                      color: Colors.pink,
                      shape: BoxShape.circle,
                    ),
                    child: Icon(Icons.favorite, color: Colors.white, size: 10),
                  ),
                  isUnread: false,
                  title: "@margaret_h liked your post: 'Refactoring legacy code...'",
                  time: "3h ago",
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildNotificationCard({
    Widget? icon,
    Widget? avatar,
    Widget? overlayIcon,
    required bool isUnread,
    required String title,
    String? highlightedText,
    required String time,
  }) {
    return Container(
      margin: EdgeInsets.only(bottom: 12),
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Color(0xFF1A1A2E),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Color(0xFF3d4652), width: 1),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Unread indicator
          if (isUnread)
            Container(
              width: 8,
              height: 8,
              margin: EdgeInsets.only(right: 8, top: 6),
              decoration: BoxDecoration(
                color: Color(0xFF00f5d4),
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: Color(0xFF00f5d4).withOpacity(0.5),
                    blurRadius: 4,
                    spreadRadius: 1,
                  ),
                ],
              ),
            )
          else
            SizedBox(width: 16),
          
          // Icon or Avatar
          if (icon != null)
            icon
          else if (avatar != null)
            Stack(
              children: [
                avatar,
                if (overlayIcon != null)
                  Positioned(
                    right: 0,
                    bottom: 0,
                    child: overlayIcon,
                  ),
              ],
            ),
          
          SizedBox(width: 12),
          
          // Content
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                RichText(
                  text: TextSpan(
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      fontFamily: 'SpaceGrotesk',
                    ),
                    children: [
                      TextSpan(text: title),
                      if (highlightedText != null)
                        TextSpan(
                          text: highlightedText,
                          style: TextStyle(
                            color: Color(0xFF00f5d4),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                    ],
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  time,
                  style: TextStyle(
                    color: Colors.grey[400],
                    fontSize: 12,
                    fontFamily: 'SpaceGrotesk',
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
