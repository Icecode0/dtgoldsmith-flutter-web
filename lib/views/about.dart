import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/home_controller.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:dtgoldsmith_web/globals.dart' as globals;
import 'package:go_router/go_router.dart';
import 'package:web_smooth_scroll/web_smooth_scroll.dart';

class About extends StatefulWidget {
  @override
  _AboutState createState() => _AboutState();
}

class _AboutState extends State<About> {
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
            children: [
              SizedBox(height: globals.height * 0.1, width: globals.width),
              Stack(
                children: [
                  Container(
                    width: globals.width,
                    height: globals.height * 0.6,
                    child: Image.asset(
                      "GroupPic1.jpg",
                      fit: BoxFit.fitWidth,
                      alignment: Alignment(0, -0.2),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Our Story",
                        style: GoogleFonts.montserrat(
                          textStyle: TextStyle(
                            color: Color.fromARGB(255, 255, 255, 255),
                            fontSize: globals.height * 0.045,
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: globals.height * 0.02),
              Container(
                width: globals.width * 0.8,
                padding: EdgeInsets.symmetric(horizontal: 16.0),
                child: Column(
                  children: [
                    Text(
                      "DT Goldsmiths, where tradition meets craftsmanship.",
                      style: GoogleFonts.montserrat(
                        textStyle: TextStyle(
                          color: Color.fromARGB(255, 255, 255, 255),
                          fontSize: globals.height * 0.025,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: globals.height * 0.025),
                    Text(
                      "Established in [Year], DT Goldsmiths represents a legacy of passion, dedication, and a profound appreciation for the timeless craft of goldsmithing. With a history spanning [Number] years, our brand stands as a beacon of excellence in the world of fine jewelry. We celebrate the fusion of heritage and contemporary design, creating pieces that resonate with modern elegance while paying homage to traditional craftsmanship. Each creation from DT Goldsmiths is a testament to the art that has been refined through the ages.  Our commitment is to offer you not just jewelry but a piece of history molded into wearable art.",
                      style: GoogleFonts.montserrat(
                        textStyle: TextStyle(
                          color: Color.fromARGB(255, 255, 255, 255),
                          fontSize: globals.height * 0.02,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: globals.height * 0.025),
                    Text(
                      "At DT Goldsmiths, every piece of jewelry is more than an accessory; it is a personal story forged in gold. Our artisans, with their skilled hands and an eye for detail, craft each piece to perfection, ensuring that it reflects the individuality of its wearer. From classic designs that evoke the nostalgia of a bygone era to contemporary pieces that set the trends, our collections are diverse, yet unified by the quality of craftsmanship.",
                      style: GoogleFonts.montserrat(
                        textStyle: TextStyle(
                          color: Color.fromARGB(255, 255, 255, 255),
                          fontSize: globals.height * 0.02,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: globals.height * 0.025),
                    Text(
                      "Our commitment to excellence goes beyond our creations. We believe in forging lasting relationships with our clients, providing a personalized service that makes every visit to DT Goldsmiths a memorable experience. We are not just selling jewelry; we are curating a legacy, one that is carried forward with every piece that leaves our atelier.",
                      style: GoogleFonts.montserrat(
                        textStyle: TextStyle(
                          color: Color.fromARGB(255, 255, 255, 255),
                          fontSize: globals.height * 0.02,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: globals.height * 0.025),
                    Text(
                      "Whether you are looking for the perfect engagement ring, a bespoke piece to celebrate a milestone, or a timeless addition to your collection, DT Goldsmiths is here to make your dream a reality.",
                      style: GoogleFonts.montserrat(
                        textStyle: TextStyle(
                          color: Color.fromARGB(255, 255, 255, 255),
                          fontSize: globals.height * 0.02,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: globals.height * 0.025),
                    Text(
                      "Join us on a journey of beauty and craftsmanship that sparkles as brightly as the pieces we create. Welcome to DT Goldsmiths—where every piece tells a story.",
                      style: GoogleFonts.montserrat(
                        textStyle: TextStyle(
                          color: Color.fromARGB(255, 255, 255, 255),
                          fontSize: globals.height * 0.02,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
              SizedBox(height: globals.height * 0.02),
              Container(
                width: globals.width * 0.8,
                padding: EdgeInsets.symmetric(horizontal: 16.0),
                child: Column(
                  children: [
                    Text(
                      "Our Staff",
                      style: GoogleFonts.montserrat(
                        textStyle: TextStyle(
                          color: Color.fromARGB(255, 255, 255, 255),
                          fontSize: globals.height * 0.03,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      textAlign: TextAlign.center,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          height: globals.height * 0.7,
                          width: globals.width * 0.2,
                          color: Colors.black,
                        ),
                        Container(
                          height: globals.height * 0.7,
                          width: globals.width * 0.2,
                          color: Colors.black,
                        ),
                        Container(
                          height: globals.height * 0.7,
                          width: globals.width * 0.2,
                          color: Colors.black,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: globals.height * 0.02),
            ],
          ),
        ),
      ),
    );
  }
}
