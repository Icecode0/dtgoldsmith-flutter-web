import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/home_controller.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:dtgoldsmith_web/globals.dart' as globals;
import 'package:go_router/go_router.dart';
import 'package:web_smooth_scroll/web_smooth_scroll.dart';

class Contact extends StatefulWidget {
  @override
  _ContactState createState() => _ContactState();
}

class _ContactState extends State<Contact> {
  final ScrollController _scrollController = ScrollController();

  // Starting and ending heights for the AppBar and logo width
  final double appBarStartHeight = globals.height * 0.08;
  final double appBarEndHeight = globals.height * 0.05;
  final double logoStartWidth = globals.width * 0.2;
  final double logoEndWidth = globals.width * 0.1;

  // Listener for scroll controller
  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    globals.getScreenSize(context);

    // Calculate AppBar height and logo width based on scroll position
    double offset =
        _scrollController.hasClients ? _scrollController.offset : 0.0;
    double appBarHeight = offset > 50 ? appBarEndHeight : appBarStartHeight;
    double logoWidth = offset > 50 ? logoEndWidth : logoStartWidth;

    // Ensure we don't go below minimum values
    appBarHeight =
        appBarHeight < appBarEndHeight ? appBarEndHeight : appBarHeight;
    logoWidth = logoWidth < logoEndWidth ? logoEndWidth : logoWidth;

    // Container height is 65% of the screen height.
    double containerHeight = globals.height;

    double calculateTopPosition(double scrollOffset, double containerHeight) {
      // The image is 125% of the container height, meaning there is 25% hidden area when fully scrolled.
      double imageHeight = containerHeight * 1.25;
      double hiddenArea = imageHeight - containerHeight;

      // When the scrollOffset is 0, the image should be aligned to the top.
      // When the scrollOffset equals the height of the container, the image should be aligned to the bottom.
      // This means the image position needs to move from 0 to -hiddenArea as we scroll through containerHeight.
      double position =
          (scrollOffset / containerHeight).clamp(0.0, 1.0) * -hiddenArea;

      return position;
    }

    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: globals.appDarkGrey,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(appBarStartHeight),
        child: AnimatedContainer(
          duration: Duration(milliseconds: 300),
          height: appBarHeight,
          child: AppBar(
            elevation: 0,
            toolbarHeight: appBarHeight,
            backgroundColor:
                offset > 50 ? globals.appDarkGrey : Colors.transparent,
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                TextButton(
                  onPressed: () {
                    GoRouter.of(context).go('/About');
                  },
                  child: Text(
                    "About Us",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: globals.height * 0.021,
                      fontWeight: FontWeight.w300,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                TextButton(
                  onPressed: () {
                    GoRouter.of(context).go('/Services');
                  },
                  child: Text(
                    "Services",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: globals.height * 0.021,
                      fontWeight: FontWeight.w300,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                TextButton(
                  onPressed: () {
                    GoRouter.of(context).go('/');
                  },
                  child: AnimatedContainer(
                    duration: Duration(milliseconds: 300),
                    curve: Curves.easeOut,
                    width: logoWidth,
                    height:
                        appBarHeight, // Adjust height accordingly to maintain aspect ratio
                    child:
                        Image.asset("LogoWhiteLong.png", fit: BoxFit.contain),
                  ),
                  style: TextButton.styleFrom(
                    padding: EdgeInsets.all(0),
                    shape: CircleBorder(),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    GoRouter.of(context).go('/FAQ');
                  },
                  child: Text(
                    "FAQ",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: globals.height * 0.021,
                      fontWeight: FontWeight.w300,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                TextButton(
                  onPressed: () {
                    GoRouter.of(context).go('/Contact');
                  },
                  child: Text(
                    "Contact Us",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: globals.height * 0.021,
                      fontWeight: FontWeight.w300,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      body: WebSmoothScroll(
        controller: _scrollController,
        scrollOffset: 0, // additional offset to users scroll input
        animationDuration:
            100, // duration of animation of scroll in milliseconds
        curve: Curves.easeInOutCirc,
        child: SingleChildScrollView(
          controller: _scrollController,
          physics: const NeverScrollableScrollPhysics(),
          child: Column(
            children: [],
          ),
        ),
      ),
    );
  }
}
