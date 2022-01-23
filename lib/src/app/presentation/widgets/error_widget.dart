import 'package:flutter/material.dart';

Widget errorMessageWidget({required String message}) => Center(
      child: Text(message),
    );

Widget errorIconWidget() => const Center(
      child: Icon(
        Icons.wifi_off_outlined,
        size: 48,
      ),
    );
