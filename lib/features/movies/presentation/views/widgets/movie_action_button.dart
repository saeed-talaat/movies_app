import 'package:flutter/material.dart';
import 'package:movies_app/core/utils/app_styles.dart';

class MovieActionButton extends StatelessWidget {
  const MovieActionButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        minimumSize: Size(0, 36),
        backgroundColor: Color(0xffE50914),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
      onPressed: () {},
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Icon(Icons.play_arrow_rounded, color: Colors.white),
          SizedBox(width: 8),
          Text(
            'Watch Trailer',
            style: AppStyles.meduim13.copyWith(
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}

