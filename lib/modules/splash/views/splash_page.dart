import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:my_daily/modules/splash/controllers/splash_controller.dart';

class SplashPage extends GetView<SplashController> {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Container(

        width: double.infinity,
        height: double.infinity,

        decoration: const BoxDecoration(

          gradient: LinearGradient( 

            begin: Alignment.topLeft,
            end: Alignment.bottomRight,

            colors: [

              Color(0xff6C63FF),
              Color(0xff8E85FF),

            ],

          ),

        ),

        child: SafeArea(

          child: Column(

            mainAxisAlignment: MainAxisAlignment.center,

            children: [

              Container(

                width: 130,
                height: 130,

                decoration: BoxDecoration(

                  color: Colors.white,

                  borderRadius: BorderRadius.circular(35),

                  boxShadow: [

                    BoxShadow(

                      color: Colors.black.withValues(alpha: 0.2),

                      blurRadius: 25,

                      offset: const Offset(0, 10),

                    )

                  ],

                ),

                child: const Icon(

                  Icons.edit_note_rounded,
                  color: Color(0xff6C63FF),
                  size: 70,

                ),

              ),

              const SizedBox(height: 35),

              const Text(

                "MyDaily",

                style: TextStyle(

                  color: Colors.white,

                  fontSize: 36,

                  fontWeight: FontWeight.bold,

                  letterSpacing: 1,

                ),

              ),

              const SizedBox(height: 12),

              const Text(

                "Track Your Daily Mood & Activity",

                style: TextStyle(

                  color: Colors.white70,
                  fontSize: 16,

                ),

              ),

              const SizedBox(height: 60),

              const SizedBox(

                width: 35,
                height: 35,

                child: CircularProgressIndicator(

                  color: Colors.white,
                  strokeWidth: 3,

                ),

              ),

            ],

          ),

        ),

      ),

    );
  }
}