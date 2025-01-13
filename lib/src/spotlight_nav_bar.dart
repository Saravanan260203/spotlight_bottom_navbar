import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

/// A customizable bottom navigation widget with a spotlight effect.
///
/// The `SpotlightBottomNav` widget allows you to create a bottom navigation bar
/// with a spotlight effect for the active icon.
///
/// - `spotlightColor`: The highlight color for the active icon.
/// - `bottomNavCount`: The number of navigation items (must be 3, 4, or 5).
/// - `icons`: A list of icons for the navigation bar (length must match `bottomNavCount`).
/// - `onPageChanged`: A callback function triggered when the page changes.
/// - `pages`: A list of widgets corresponding to each navigation item.
class SpotlightBottomNav extends StatefulWidget {
  /// The highlight color for the active icon.
  final Color spotlightColor;

  /// The number of navigation items. Must be 3, 4, or 5.
  final int bottomNavCount;

  /// A list of icons for the navigation bar. Length must match `bottomNavCount`.
  final List<IconData> icons;

  /// A callback function triggered when the page changes.
  final Function(int)? onPageChanged;

  /// A list of widgets corresponding to each navigation item.
  final List<Widget> pages;

  /// Creates a `SpotlightBottomNav` widget.
  ///
  /// Throws an [AssertionError] if:
  /// - `bottomNavCount` is not 3, 4, or 5.
  /// - The length of `icons` does not match `bottomNavCount`.
  const SpotlightBottomNav({
    super.key,
    required this.spotlightColor,
    required this.bottomNavCount,
    required this.icons,
    this.onPageChanged,
    required this.pages,
  });

  @override
  SpotlightBottomNavState createState() => SpotlightBottomNavState();
}

class SpotlightBottomNavState extends State<SpotlightBottomNav> {
  int _currentIndex = 0;
  final PageController _pageController = PageController();
  @override
  void initState() {
    super.initState();
    // Restrict to portrait mode
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  }

  @override
  Widget build(BuildContext context) {
    AppSizes().init(context);

    return Scaffold(
      backgroundColor: Colors.black,
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          Positioned.fill(
            child: PageView(
              onPageChanged: (value) {
                setState(() {
                  _currentIndex = value;
                });
              },
              controller: _pageController,
              children: widget.pages,
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: _buildBottomNav(),
          ),
        ],
      ),
    );
  }

  Widget _buildBottomNav() {
    return Padding(
      padding: EdgeInsets.fromLTRB(
        AppSizes.blockSizeHorizontal * 1,
        0,
        AppSizes.blockSizeHorizontal * 1,
        15,
      ),
      child: Material(
        borderRadius: BorderRadius.circular(30),
        color: Colors.transparent,
        elevation: 6,
        child: Container(
          height: AppSizes.blockSizeHorizontal * 15,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            color: Colors.grey[900],
            borderRadius: BorderRadius.circular(30),
          ),
          child: Stack(
            children: [
              Positioned(
                top: 0,
                bottom: 0,
                left: AppSizes.blockSizeHorizontal * 3,
                right: AppSizes.blockSizeHorizontal * 3,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: List.generate(widget.bottomNavCount, (index) {
                    return BottomNavButton(
                      icon: widget.icons[index],
                      index: index,
                      currentIndex: _currentIndex,
                      onPressed: (val) {
                        _pageController.jumpToPage(val);
                        setState(() {
                          _currentIndex = val;
                        });
                      },
                    );
                  }),
                ),
              ),
              AnimatedPositioned(
                duration: const Duration(milliseconds: 300),
                curve: Curves.decelerate,
                top: 0,
                left: animatedPositionedLeftValue(_currentIndex),
                child: Column(
                  children: [
                    Container(
                      height: AppSizes.blockSizeHorizontal * 1.0,
                      width: AppSizes.blockSizeHorizontal * 12,
                      decoration: BoxDecoration(
                        color: widget.spotlightColor,
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    ClipPath(
                      clipper: MyCustomClipper(),
                      child: Container(
                        height: AppSizes.blockSizeHorizontal * 15,
                        width: AppSizes.blockSizeHorizontal * 12,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                              widget.spotlightColor
                                  .withAlpha((0.6 * 255).toInt()),
                              widget.spotlightColor
                                  .withAlpha((0.3 * 255).toInt()),
                              widget.spotlightColor
                                  .withAlpha((0.1 * 255).toInt()),
                              Colors.transparent,
                            ],
                          ),
                        ),
                      ),
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

  double animatedPositionedLeftValue(int currentIndex) {
    List<double> positions = [];

    if (widget.bottomNavCount == 5) {
      positions = [
        AppSizes.blockSizeHorizontal * 6.5,
        AppSizes.blockSizeHorizontal * 24.5,
        AppSizes.blockSizeHorizontal * 43.25,
        AppSizes.blockSizeHorizontal * 61.5,
        AppSizes.blockSizeHorizontal * 80.5,
      ];
    } else if (widget.bottomNavCount == 4) {
      positions = [
        AppSizes.blockSizeHorizontal * 8.7,
        AppSizes.blockSizeHorizontal * 31.3,
        AppSizes.blockSizeHorizontal * 54.6,
        AppSizes.blockSizeHorizontal * 77.5,
      ];
    } else if (widget.bottomNavCount == 3) {
      positions = [
        AppSizes.blockSizeHorizontal * 12.5,
        AppSizes.blockSizeHorizontal * 43.0,
        AppSizes.blockSizeHorizontal * 73.5,
      ];
    } else {
      throw Exception("Unsupported bottomNavCount: ${widget.bottomNavCount}");
    }

    return positions[currentIndex];
  }
}

class BottomNavButton extends StatelessWidget {
  final IconData icon;
  final int index;
  final int currentIndex;
  final Function(int) onPressed;

  const BottomNavButton({
    super.key,
    required this.icon,
    required this.index,
    required this.currentIndex,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onPressed(index),
      child: AnimatedOpacity(
        opacity: currentIndex == index ? 1.0 : 0.5,
        duration: const Duration(milliseconds: 300),
        child: Icon(
          icon,
          color: Colors.white,
          size: 30,
        ),
      ),
    );
  }
}

class AppSizes {
  static late MediaQueryData _mediaQueryData;
  static late double screenWidth;
  static late double screenHeight;
  static late double blockSizeHorizontal;
  static late double blockSizeVertical;

  void init(BuildContext context) {
    _mediaQueryData = MediaQuery.of(context);
    screenWidth = _mediaQueryData.size.width;
    screenHeight = _mediaQueryData.size.height;
    blockSizeHorizontal = screenWidth / 100;
    blockSizeVertical = screenHeight / 100;
  }
}

class MyCustomClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.moveTo(AppSizes.blockSizeHorizontal * 3, 0);
    path.lineTo(0, size.height);
    path.lineTo(size.width, size.height);
    path.lineTo(size.width - AppSizes.blockSizeHorizontal * 3, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => true;
}
