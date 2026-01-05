import 'package:flutter/material.dart';

class StackWidget extends StatelessWidget {
  const StackWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        // alignment: Alignment.center, vị trí nằm cho các child của stack
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(
                  'https://i.pinimg.com/originals/14/19/ba/1419baf80bd5b25e7bd999379105e257.jpg',
                ),
                fit: BoxFit.fitHeight,
              ),
            ),
          ),
          Container(
            color: Colors.black.withValues(alpha: 0.3)
          ),
          Positioned(
            bottom: 50.0,
            left: 10.0,
            right: 10.0,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Text(
                  "Stack: Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.",
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
