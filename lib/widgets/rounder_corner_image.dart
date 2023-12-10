import 'package:flutter/material.dart';

Widget roundedCornerImage() {
  return ClipRRect(
    borderRadius: BorderRadius.circular(20.0), 
    child: const Image(
      image: NetworkImage(
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcShbGa8PTRvJGwubehdPcKB_GioSKPw2mJx7w&usqp=CAU",
      ),
      fit: BoxFit.cover,
      width: double.infinity, 
    ),
  );
}