import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'RecommendedPage.dart';

class animation extends StatefulWidget {
  const animation({super.key});

  @override
  State<animation> createState() => _animationState();
}

class _animationState extends State<animation> {
  int _selectedIndex = 0;
  bool _isExpanded = false;

  final List<Widget> _pages = [
    HomePage(),
    RecommendedPage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _selectedIndex,
        children: _pages,
      ),
      bottomNavigationBar: CurvedNavigationBar(
        index: _selectedIndex,
        color: Colors.blue,
        backgroundColor: Colors.transparent,
        onTap: _onItemTapped,
        items: const <Widget>[
          Icon(Icons.home, size: 30, color: Colors.white),
          Icon(Icons.star, size: 30, color: Colors.white),
          Icon(Icons.person, size: 30, color: Colors.white),
        ],
      ),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Purple Box
            Container(
              width: double.infinity,
              height: 200,
              decoration: BoxDecoration(
                color: Colors.purple[300],
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(30),
                  bottomRight: Radius.circular(30),
                ),
              ),
              child: Center(
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  decoration: BoxDecoration(
                    color: Colors.purple[300],
                    borderRadius: BorderRadius.circular(25),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.search, color: Colors.white),
                      SizedBox(width: 10),
                      Expanded(
                        child: TextField(
                          decoration: InputDecoration(
                            hintText: 'Type Something...',
                            hintStyle: TextStyle(color: Colors.white, fontSize: 25),
                            border: InputBorder.none,
                          ),
                          style: TextStyle(color: Colors.white, fontSize: 18),
                        ),
                      ),
                    ],
                  ),
                ),
              ).animate().fadeIn(duration: 300.ms),
            ),
            SizedBox(height: 20),
            // Featured Section
            _buildSectionHeader('Featured'),
            SizedBox(height: 8),
            _buildHorizontalCourseList([
              _buildFeaturedCourseCard('Find The Right Degree for You', '8 courses', Colors.orange),
              _buildFeaturedCourseCard('Become a Data Scientist', '12 courses', Colors.lightBlue),
              _buildFeaturedCourseCard('Become a Digital Marketer', '6 courses', Colors.pinkAccent),
            ]),
            // Business Section
            _buildSectionHeader('Business'),
            SizedBox(height: 8),
            _buildHorizontalCourseList([
              _buildFeaturedCourseCard('English for Career Development', '5 courses', Colors.teal),
              _buildFeaturedCourseCard('Business Foundation', '7 courses', Colors.lightBlueAccent),
              _buildFeaturedCourseCard('Excel Skill for Business', '4 courses', Colors.pinkAccent),
            ]),
            // Technology Section
            _buildSectionHeader('Technology'),
            SizedBox(height: 8),
            _buildHorizontalCourseList([
              _buildFeaturedCourseCard('Introduction to Programming', '9 courses', Colors.green),
              _buildFeaturedCourseCard('Web Development', '10 courses', Colors.deepPurple),
              _buildFeaturedCourseCard('Mobile App Development', '8 courses', Colors.redAccent),
            ]),

          ],
        ),
      ),
    );
  }

  Widget _buildSectionHeader(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          Text(
            'See all',
            style: TextStyle(color: Colors.blue),
          ),
        ],
      ),
    ).animate().fadeIn(duration: 300.ms);
  }

  Widget _buildHorizontalCourseList(List<Widget> courseCards) {
    return Container(
      height: 150,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: courseCards,
      ),
    ).animate().fadeIn(duration: 300.ms);
  }

  Widget _buildFeaturedCourseCard(String title, String subtitle, Color color) {
    return Container(
      width: 160,
      margin: EdgeInsets.only(right: 16),
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            blurRadius: 10,
            offset: Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16),
          ),
          SizedBox(height: 8),
          Text(
            subtitle,
            style: TextStyle(color: Colors.white70),
          ),
        ],
      ),
    ).animate().fadeIn(duration: 300.ms).scale(duration: 300.ms);
  }
}