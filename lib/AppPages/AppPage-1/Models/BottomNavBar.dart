import 'package:flutter/material.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
       boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.4),
                   spreadRadius: 4,
                  blurRadius: 4,
                  // changes position of shadow
                ),
              ],
      ),
      child: SizedBox(
        height:50 ,
              child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.white,
          selectedItemColor: Color(	0xff0667f9),
          unselectedItemColor: Colors.black,
          selectedFontSize: 14,
          unselectedFontSize: 12,
          iconSize: 20,
          onTap: (value) {
            // Respond to item press.
          },
          items: [
            BottomNavigationBarItem(
              label: 'Book Now',
              icon: Icon(Icons.home,),
              
            ),
            BottomNavigationBarItem(
              label: 'Music',
              icon: Icon(Icons.music_note),
            ),
            BottomNavigationBarItem(
              label:'Places',
              icon: Icon(Icons.location_on),
            ),
            BottomNavigationBarItem(
              label: 'Profile',
              icon: Icon(Icons.library_books),
            ),
          ],
        ),
      ),
    );
  }
}
