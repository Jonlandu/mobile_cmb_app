import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../utils/Routes.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;
  @override
  void initState(){
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 4),
    );
    _animation = CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeInOut,
    );
    _animationController.repeat(reverse: true);
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Future.delayed(Duration(seconds:4),(){
        Navigator.popAndPushNamed(context, Routes.BienvenuePageRoutes);

        // if(userCtrl.isFirstTimeBienvenue){
        //   _naviguerVersPreferencePage();
        // }
      });
    });

  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF40BFFF),
      body: Stack(
        children: [
          Center(
            child: AnimatedBuilder(
              animation: _animation,
              builder: (BuildContext context, index) {
                return Container(
                  width: _animation.value * 100,
                  height: _animation.value * 100,
                  decoration: BoxDecoration(
                    color: Color(0xFF40BFFF),
                    shape: BoxShape.circle,
                  ),
                  child: Center(
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Image.asset("assets/cmblogo.jpg")
                    ),
                  ),
                );
              },
            ),
          ),

        ],
      ),
    );
  }
}
