import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class RecommendedPage extends StatefulWidget {
  const RecommendedPage({super.key});

  @override
  State<RecommendedPage> createState() => _RecommendedPageState();
}

class _RecommendedPageState extends State<RecommendedPage> {
  String _selectedCategory = 'All';
  List<Map<String, String>> _allCourses = [];
  List<Map<String, String>> _filteredCourses = [];

  @override
  void initState() {
    super.initState();
    _fetchCourses();
  }

  void _fetchCourses() {
    setState(() {
      _allCourses = [
        {'title': 'Data Science', 'university': 'Johns Hopkins University', 'courses': '17 courses', 'color': '0xFF42A5F5', 'category': 'Data Science'},
        {'title': 'Machine Learning', 'university': 'University of Washington', 'courses': '8 courses', 'color': '0xFFFFA726', 'category': 'Machine Learning'},
        {'title': 'Big Data', 'university': 'University of California', 'courses': '10 courses', 'color': '0xFFEC407A', 'category': 'Big Data'},
        {'title': 'Cyber Security', 'university': 'Stanford University', 'courses': '12 courses', 'color': '0xFF66BB6A', 'category': 'Cyber Security'},
        {'title': 'Artificial Intelligence', 'university': 'MIT', 'courses': '9 courses', 'color': '0xFFAB47BC', 'category': 'Artificial Intelligence'},
        {'title': 'Software Development', 'university': 'Harvard University', 'courses': '15 courses', 'color': '0xFFFF7043', 'category': 'Software Development'},
        {'title': 'Digital Marketing', 'university': 'University of Illinois', 'courses': '7 courses', 'color': '0xFFFFEB3B', 'category': 'Digital Marketing'},
        {'title': 'Project Management', 'university': 'University of California, Irvine', 'courses': '5 courses', 'color': '0xFF29B6F6', 'category': 'Project Management'},
        {'title': 'Business Analytics', 'university': 'Wharton School', 'courses': '6 courses', 'color': '0xFFEF5350', 'category': 'Business Analytics'},
        {'title': 'Finance', 'university': 'New York University', 'courses': '11 courses', 'color': '0xFF8D6E63', 'category': 'Finance'},
        // Add more courses as needed
      ];
      _filteredCourses = List.from(_allCourses);
    });
  }

  void _filterCourses(String category) {
    setState(() {
      _selectedCategory = category;
      if (category == 'All') {
        _filteredCourses = List.from(_allCourses);
      } else {
        _filteredCourses = _allCourses.where((course) => course['category'] == category).toList();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              height: 150,
              decoration: BoxDecoration(
                color: Colors.red[300],
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(30),
                  bottomRight: Radius.circular(30),
                ),
              ),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    'Recommended',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
                  ).animate().fadeIn(duration: 500.ms),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 16),
                  Text(
                    'Start a new career',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ).animate().fadeIn(duration: 300.ms),
                  SizedBox(height: 8),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        _buildCareerCategoryChip('Data Scientist'),
                        _buildCareerCategoryChip('Data Analyst'),
                        _buildCareerCategoryChip('Machine Learning'),
                        _buildCareerCategoryChip('Big Data'),
                        _buildCareerCategoryChip('Cyber Security'),
                        _buildCareerCategoryChip('Artificial Intelligence'),
                        _buildCareerCategoryChip('Software Development'),
                        _buildCareerCategoryChip('Digital Marketing'),
                        _buildCareerCategoryChip('Project Management'),
                        _buildCareerCategoryChip('Business Analytics'),
                        _buildCareerCategoryChip('Finance'),
                      ],
                    ),
                  ).animate().fadeIn(duration: 300.ms),
                  SizedBox(height: 16),
                  ..._filteredCourses.map((course) => _buildRecommendedCourseCard(course)).toList(),
                ],
              ),
            ).animate().fadeIn(duration: 300.ms),
          ],
        ),
      ),
    );
  }

  Widget _buildCareerCategoryChip(String label) {
    return Container(
      margin: EdgeInsets.only(right: 8),
      child: Chip(
        label: Text(label),
        backgroundColor: Colors.grey[200],
      ),
    ).animate().fadeIn(duration: 300.ms);
  }

  Widget _buildRecommendedCourseCard(Map<String, String> course) {
    return Container(
      margin: EdgeInsets.only(bottom: 16),
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            blurRadius: 10,
            offset: Offset(0, 5),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            width: 60,
            height: 60,
            decoration: BoxDecoration(
              color: Color(int.parse(course['color']!)),
              borderRadius: BorderRadius.circular(15),
            ),
            child: Icon(Icons.book, size: 30, color: Colors.white),
          ),
          SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  course['title']!,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
                SizedBox(height: 4),
                Text(
                  course['university']!,
                  style: TextStyle(color: Colors.grey),
                ),
                SizedBox(height: 8),
                Text(
                  course['courses']!,
                  style: TextStyle(color: Colors.grey),
                ),
              ],
            ),
          ),
        ],
      ),
    ).animate().fadeIn(duration: 300.ms).scale(duration: 300.ms);
  }
}