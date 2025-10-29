import 'package:flutter/material.dart';
import '../../../core/widgets/logo_painter.dart';

class HomeFeedScreen extends StatelessWidget {
  const HomeFeedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF0E1A2B),
      appBar: AppBar(
        backgroundColor: Color(0xFF1A1A2E),
        elevation: 0,
        leading: Container(
          height: 80,
          width: 80,
          margin: const EdgeInsets.only(bottom: 16.0),
          child: CustomPaint(painter: LogoPainter()),
        ),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Text(
                'WriteDev',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'SpaceGrotesk',
                ),
              ),
            ),
          ],
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(Icons.search, color: Colors.white, size: 28),
            onPressed: () {},
          ),
        ],
      ),
      body: ListView(
        children: [
          _buildPostCard(
            name: 'John Doe',
            level: 'Level 8 Coder',
            daysJoined: 365,
            content:
                'This is a sample post on WriteDev. Every post gets visibility, no followers or algorithm bias. #developers #productowners',
            impressions: '12.5k',
            likes: '1.2k',
            levelColor: Color(0xFF1b63bb),
          ),
          _buildPostCard(
            name: 'Jane Smith',
            level: 'Level 3 PM',
            daysJoined: 120,
            content:
                'Just discovered WriteDev! Loving the clean interface and the focus on content. #writedev #socialmedia',
            impressions: '8.9k',
            likes: '856',
            levelColor: Color(0xFF9c27b0),
          ),
        ],
      ),
    );
  }

  Widget _buildPostCard({
    required String name,
    required String level,
    required int daysJoined,
    required String content,
    required String impressions,
    required String likes,
    required Color levelColor,
  }) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: Color(0xFF1A1A2E),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Color(0xFF3d4652), width: 1),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // User Info Section
          Padding(
            padding: EdgeInsets.all(16),
            child: Row(
              children: [
                CircleAvatar(
                  radius: 24,
                  backgroundColor: Colors.grey[300],
                  child: Icon(Icons.person, color: Colors.grey[600], size: 24),
                ),
                SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            name,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'SpaceGrotesk',
                            ),
                          ),
                          SizedBox(width: 8),
                          Container(
                            padding: EdgeInsets.symmetric(
                              horizontal: 8,
                              vertical: 4,
                            ),
                            decoration: BoxDecoration(
                              color: levelColor,
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Text(
                              level,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                                fontFamily: 'SpaceGrotesk',
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 4),
                      Text(
                        'Joined $daysJoined days ago',
                        style: TextStyle(
                          color: Colors.grey[400],
                          fontSize: 14,
                          fontFamily: 'SpaceGrotesk',
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          // Post Content
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Text(
              content,
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                height: 1.5,
                fontFamily: 'SpaceGrotesk',
              ),
            ),
          ),
          SizedBox(height: 16),
          // Interaction Buttons
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildInteractionButton(Icons.favorite_outline, 'Like'),
                _buildInteractionButton(Icons.chat_bubble_outline, 'Comment'),
                _buildInteractionButton(Icons.share_outlined, 'Share'),
              ],
            ),
          ),
          SizedBox(height: 16),
          // Engagement Metrics
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'Impressions',
                        style: TextStyle(
                          color: Colors.grey[400],
                          fontSize: 12,
                          fontFamily: 'SpaceGrotesk',
                        ),
                      ),
                      SizedBox(height: 4),
                      Text(
                        impressions,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'SpaceGrotesk',
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'Likes',
                        style: TextStyle(
                          color: Colors.grey[400],
                          fontSize: 12,
                          fontFamily: 'SpaceGrotesk',
                        ),
                      ),
                      SizedBox(height: 4),
                      Text(
                        likes,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'SpaceGrotesk',
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 16),
        ],
      ),
    );
  }

  Widget _buildInteractionButton(IconData icon, String label) {
    return InkWell(
      onTap: () {},
      borderRadius: BorderRadius.circular(8),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, color: Colors.grey[400], size: 20),
            SizedBox(width: 6),
            Text(
              label,
              style: TextStyle(
                color: Colors.grey[400],
                fontSize: 14,
                fontFamily: 'SpaceGrotesk',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
