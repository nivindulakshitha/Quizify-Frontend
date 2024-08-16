import 'package:flutter/material.dart';

class CustomBottomNavBar extends StatefulWidget {
  final Function(int) onTabSelected;

  CustomBottomNavBar({required this.onTabSelected});

  @override
  _CustomBottomNavBarState createState() => _CustomBottomNavBarState();
}

class _CustomBottomNavBarState extends State<CustomBottomNavBar> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    widget.onTabSelected(index);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
        color: Colors.blue,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
      ),
      child: SafeArea(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            _buildNavItem(Icons.home, 0),
            _buildNavItem(Icons.history, 1),
            _buildNavItem(Icons.add_circle_outline, 2, isCenter: true),
            _buildNavItem(Icons.person, 3),
            _buildNavItem(Icons.settings, 4),
          ],
        ),
      ),
    );
  }

  Widget _buildNavItem(IconData icon, int index, {bool isCenter = false}) {
    bool isSelected = _selectedIndex == index;
    return GestureDetector(
      onTap: () => _onItemTapped(index),
      child: AnimatedContainer(
        duration: Duration(milliseconds: 300),
        curve: Curves.easeInOut,
        padding: EdgeInsets.symmetric(vertical: isCenter ? 10 : 0),
        decoration: isCenter
            ? BoxDecoration(
                shape: BoxShape.circle,
                color: isSelected ? Colors.white : Colors.blue,
              )
            : BoxDecoration(
                color: Colors.transparent,
              ),
        child: Icon(
          icon,
          size: isCenter ? 40 : 30,
          color: isSelected ? Colors.white : Colors.white70,
        ),
      ),
    );
  }
}
