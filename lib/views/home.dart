import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/home_controller.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:dtgoldsmith_web/globals.dart' as globals;
import 'package:go_router/go_router.dart';
import 'package:web_smooth_scroll/web_smooth_scroll.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final HomeController _controller = Get.put(HomeController());
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

    OverlayEntry? _overlayEntry;
    final GlobalKey _menuKey = GlobalKey();

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
            children: [
              Container(
                height: globals.height * 0.6,
                width: globals.width,
                child: Image.asset(
                  'Header.jpg',
                  fit: BoxFit.fill,
                ),
              ),
              SizedBox(height: globals.height * 0.025),
              Text(
                "Your Journey, Our Expertise.",
                style: GoogleFonts.montserrat(
                  textStyle: TextStyle(
                    color: Color.fromARGB(255, 255, 255, 255),
                    fontSize: globals.height * 0.045,
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ),
              SizedBox(height: globals.height * 0.025),
              Container(
                width: globals.width * 0.5,
                child: Text(
                  "At DT Goldsmiths LLC, we turn precious moments into timeless treasures.\n\nStep into a world of craftsmanship and creativity, where your dreams come to life in the sparkle of a diamond or the glow of a gemstone. Our passion for perfection is matched only by our commitment to excellence. \n\nWith a rich history of crafting exquisite jewelry, our team of skilled artisans brings your visions to reality.",
                  style: GoogleFonts.montserrat(
                    textStyle: TextStyle(
                      color: Color.fromARGB(255, 255, 255, 255),
                      fontSize: globals.height * 0.02,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(height: globals.height * 0.025),
              TextButton(
                onPressed: () {
                  GoRouter.of(context).go('/');
                },
                style: TextButton.styleFrom(
                  padding: EdgeInsets.zero,
                ),
                child: Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('PlatinumBacking.jpg'),
                      fit: BoxFit.cover,
                    ),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: Container(
                    padding: EdgeInsets.all(16.0),
                    child: Text(
                      "Our Services",
                      style: TextStyle(
                        color: const Color.fromARGB(255, 0, 0, 0),
                        fontSize: globals.height * 0.021,
                        fontWeight: FontWeight.w300,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ),
              SizedBox(height: globals.height * 0.025),
              Stack(
                children: [
                  AnimatedBuilder(
                    animation: _scrollController,
                    builder: (context, child) {
                      // The top position is calculated using the current scroll offset.
                      double topPosition = calculateTopPosition(
                          _scrollController.offset, containerHeight);

                      return SizedBox(
                        width: globals.width,
                        height: containerHeight,
                        child: Stack(
                          children: [
                            Positioned(
                              top: topPosition,
                              child: Image.asset(
                                "JewelBlackBackground2.jpg",
                                width: globals.width,
                                // The image height is the same as the container height, no scaling needed.
                                height: globals.width * 1.25,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                  Container(
                    height: globals.height,
                    width: globals.width,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Container(
                              height: globals.height * 0.35,
                              width: globals.width * 0.35,
                              decoration: BoxDecoration(
                                color: Colors.black, // Black background
                                border: Border.all(
                                  color: Colors.grey, // Gray border color
                                  width:
                                      2.0, // Adjust the border width as needed
                                ),
                                borderRadius: BorderRadius.circular(
                                    5.0), // Adjust the radius as needed
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Container(
                                    width: globals.width * 0.175,
                                    height: globals.height * 0.35,
                                    child: Image.asset(
                                      'Custom.jpg',
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                  SizedBox(width: globals.width * 0.005),
                                  Container(
                                    width: globals.width * 0.165,
                                    height: globals.height * 0.35,
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Text(
                                          "Custom Jewelry Creations",
                                          style: GoogleFonts.montserrat(
                                            textStyle: TextStyle(
                                              color: Color.fromARGB(
                                                  255, 255, 255, 255),
                                              fontSize: globals.height * 0.025,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                        Text(
                                          "Experience the joy of owning a unique masterpiece that reflects your style and personality. Our custom jewelry creations are designed to turn your dreams into reality. From engagement rings that symbolize your love story to one-of-a-kind accessories, we work closely with you to craft pieces that are as special as you are.",
                                          style: GoogleFonts.montserrat(
                                            textStyle: TextStyle(
                                              color: Color.fromARGB(
                                                  255, 255, 255, 255),
                                              fontSize: globals.height * 0.0175,
                                              fontWeight: FontWeight.w300,
                                            ),
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              height: globals.height * 0.35,
                              width: globals.width * 0.35,
                              decoration: BoxDecoration(
                                color: Colors.black, // Black background
                                border: Border.all(
                                  color: Colors.grey, // Gray border color
                                  width:
                                      2.0, // Adjust the border width as needed
                                ),
                                borderRadius: BorderRadius.circular(
                                    5.0), // Adjust the radius as needed
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Container(
                                    width: globals.width * 0.175,
                                    height: globals.height * 0.35,
                                    child: Image.asset(
                                      'Repair.jpg',
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                  SizedBox(width: globals.width * 0.005),
                                  Container(
                                    width: globals.width * 0.165,
                                    height: globals.height * 0.35,
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Text(
                                          "Jewelry Restoration & Repair",
                                          style: GoogleFonts.montserrat(
                                            textStyle: TextStyle(
                                              color: Color.fromARGB(
                                                  255, 255, 255, 255),
                                              fontSize: globals.height * 0.025,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                        Text(
                                          "Rediscover the beauty of your treasured jewelry with our expert restoration and repair services. Our skilled artisans are dedicated to breathing new life into your beloved pieces, whether it's a family heirloom or a sentimental gift. Trust us to handle everything from fixing broken chains and clasps to restoring gemstones to their former glory.",
                                          style: GoogleFonts.montserrat(
                                            textStyle: TextStyle(
                                              color: Color.fromARGB(
                                                  255, 255, 255, 255),
                                              fontSize: globals.height * 0.0175,
                                              fontWeight: FontWeight.w300,
                                            ),
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Container(
                              height: globals.height * 0.35,
                              width: globals.width * 0.35,
                              decoration: BoxDecoration(
                                color: Colors.black, // Black background
                                border: Border.all(
                                  color: Colors.grey, // Gray border color
                                  width:
                                      2.0, // Adjust the border width as needed
                                ),
                                borderRadius: BorderRadius.circular(
                                    5.0), // Adjust the radius as needed
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Container(
                                    width: globals.width * 0.175,
                                    height: globals.height * 0.35,
                                    child: Image.asset(
                                      'GemSetting.jpg',
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                  SizedBox(width: globals.width * 0.005),
                                  Container(
                                    width: globals.width * 0.165,
                                    height: globals.height * 0.35,
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Text(
                                          "Gemstone Transformation Studio",
                                          style: GoogleFonts.montserrat(
                                            textStyle: TextStyle(
                                              color: Color.fromARGB(
                                                  255, 255, 255, 255),
                                              fontSize: globals.height * 0.025,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                        Text(
                                          "Unleash the true brilliance of your gemstones with our expert setting and resetting services. At our Gemstone Transformation Studio, we take pride in enhancing the allure of your precious stones. Whether you want to reset a family gem or create a stunning custom piece, our skilled artisans are here to make your vision shine.",
                                          style: GoogleFonts.montserrat(
                                            textStyle: TextStyle(
                                              color: Color.fromARGB(
                                                  255, 255, 255, 255),
                                              fontSize: globals.height * 0.0175,
                                              fontWeight: FontWeight.w300,
                                            ),
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              height: globals.height * 0.35,
                              width: globals.width * 0.35,
                              decoration: BoxDecoration(
                                color: Colors.black, // Black background
                                border: Border.all(
                                  color: Colors.grey, // Gray border color
                                  width:
                                      2.0, // Adjust the border width as needed
                                ),
                                borderRadius: BorderRadius.circular(
                                    5.0), // Adjust the radius as needed
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Container(
                                    width: globals.width * 0.175,
                                    height: globals.height * 0.35,
                                    child: Image.asset(
                                      'Redesign.jpg',
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                  SizedBox(width: globals.width * 0.005),
                                  Container(
                                    width: globals.width * 0.165,
                                    height: globals.height * 0.35,
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Text(
                                          "Luxury Jewelry Redesign",
                                          style: GoogleFonts.montserrat(
                                            textStyle: TextStyle(
                                              color: Color.fromARGB(
                                                  255, 255, 255, 255),
                                              fontSize: globals.height * 0.025,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                        Text(
                                          "Elevate your jewelry collection with our Luxury Jewelry Redesign service. We specialize in transforming existing pieces into refined and contemporary works of art. Let us breathe new life into your jewelry, making it both timeless and on-trend. Rediscover the luxury and elegance of your jewelry, redesigned to perfection.",
                                          style: GoogleFonts.montserrat(
                                            textStyle: TextStyle(
                                              color: Color.fromARGB(
                                                  255, 255, 255, 255),
                                              fontSize: globals.height * 0.0175,
                                              fontWeight: FontWeight.w300,
                                            ),
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: globals.height * 0.03),
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "ABOUT",
                          style: GoogleFonts.montserrat(
                            textStyle: TextStyle(
                              color: Color.fromARGB(255, 255, 255, 255),
                              fontSize: globals.height * 0.015,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(height: globals.height * 0.01),
                        TextButton(
                          onPressed: () {
                            GoRouter.of(context).go('/');
                          },
                          child: Text(
                            "Our Story",
                            style: GoogleFonts.montserrat(
                              textStyle: TextStyle(
                                color: Color.fromARGB(255, 255, 255, 255),
                                fontSize: globals.height * 0.015,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        SizedBox(height: globals.height * 0.005),
                        TextButton(
                          onPressed: () {
                            GoRouter.of(context).go('/');
                          },
                          child: Text(
                            "Gallery",
                            style: GoogleFonts.montserrat(
                              textStyle: TextStyle(
                                color: Color.fromARGB(255, 255, 255, 255),
                                fontSize: globals.height * 0.015,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "CUSTOMER SERVICE",
                          style: GoogleFonts.montserrat(
                            textStyle: TextStyle(
                              color: Color.fromARGB(255, 255, 255, 255),
                              fontSize: globals.height * 0.015,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(height: globals.height * 0.01),
                        TextButton(
                          onPressed: () {
                            GoRouter.of(context).go('/');
                          },
                          child: Text(
                            "FAQs",
                            style: GoogleFonts.montserrat(
                              textStyle: TextStyle(
                                color: Color.fromARGB(255, 255, 255, 255),
                                fontSize: globals.height * 0.015,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        SizedBox(height: globals.height * 0.005),
                        TextButton(
                          onPressed: () {
                            GoRouter.of(context).go('/');
                          },
                          child: Text(
                            "Ring Size Chart",
                            style: GoogleFonts.montserrat(
                              textStyle: TextStyle(
                                color: Color.fromARGB(255, 255, 255, 255),
                                fontSize: globals.height * 0.015,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "CONTACT US",
                          style: GoogleFonts.montserrat(
                            textStyle: TextStyle(
                              color: Color.fromARGB(255, 255, 255, 255),
                              fontSize: globals.height * 0.015,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(height: globals.height * 0.01),
                        Text(
                          "(267)242-7605",
                          style: GoogleFonts.montserrat(
                            textStyle: TextStyle(
                              color: Color.fromARGB(255, 255, 255, 255),
                              fontSize: globals.height * 0.015,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(height: globals.height * 0.005),
                        Text(
                          "740 Sansom St.\n   Suite 310A\n   Philidelphia, PA 19106",
                          style: GoogleFonts.montserrat(
                            textStyle: TextStyle(
                              color: Color.fromARGB(255, 255, 255, 255),
                              fontSize: globals.height * 0.015,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          textAlign: TextAlign.center,
                        ),
                        Row(
                          children: [
                            IconButton(
                              onPressed: () {},
                              icon: Image.asset("InstaLogo.png"),
                            ),
                          ],
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
