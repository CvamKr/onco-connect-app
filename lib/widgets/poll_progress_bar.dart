import 'package:flutter/material.dart';

Padding pollProgressBar() {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 8.0),
    child: Container(
      width: double.maxFinite,
      height: 6.0,
      decoration: BoxDecoration(
        borderRadius:
            BorderRadius.circular(2.0), 
        color: Colors.grey[300], 
      ),
      child: FractionallySizedBox(
        alignment: Alignment.centerLeft,
        widthFactor:
            0.5, 
        child: Container(
          decoration: BoxDecoration(
            borderRadius:
                BorderRadius.circular(2.0), 
            color: Colors.redAccent, 
          ),
        ),
      ),
    ),
  );
}
