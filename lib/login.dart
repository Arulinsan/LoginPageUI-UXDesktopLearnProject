import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:login_page/view/login_view.dart';
import 'package:login_page/view/register_view.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  CarouselSliderController controller = CarouselSliderController();
  bool isLogin = true;
  int currentIndex = 0;
  @override
  void initState() {
    isLogin = true;
    // TODO: implement initState
    super.initState();
  }

  final List<String> imgList = [
    'lib/assets/image/purple1.jpeg',
    'lib/assets/image/purple2.jpeg',
    'lib/assets/image/purple3.jpeg',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 87, 76, 100),
      body: Center(
        child: Container(
          width: 1000,
          height: 600,

          padding: const EdgeInsets.all(20.0),
          decoration: BoxDecoration(
            color: Colors.grey[800],

            borderRadius: BorderRadius.circular(8.0),
          ),
          child: Center(
            child: Row(
              children: [
                Expanded(
                  child: Stack(
                    children: [
                      Column(
                        children: [
                          Expanded(
                            child: CarouselSlider(
                              items: imgList
                                  .map(
                                    (item) => Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(
                                          8.0,
                                        ),
                                        image: DecorationImage(
                                          image: AssetImage(item),
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                  )
                                  .toList(),
                              carouselController: controller,
                              options: CarouselOptions(
                                onPageChanged: (index, reason) =>
                                    setState(() => currentIndex = index),
                                enlargeCenterPage: true,
                                autoPlay: true,
                                height: double.infinity,
                                aspectRatio: 16 / 9,
                                scrollPhysics: BouncingScrollPhysics(),
                                enableInfiniteScroll: true,
                                autoPlayCurve: Curves.fastOutSlowIn,
                                autoPlayAnimationDuration: Duration(
                                  milliseconds: 800,
                                ),
                                viewportFraction: 1,
                              ),
                            ),
                          ),
                        ],
                      ),

                      Container(
                        padding: const EdgeInsets.all(20.0),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey[700]!),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Zeka",
                                  style: TextStyle(
                                    fontSize: 24,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                                ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    elevation: 0,
                                    shadowColor: Colors.transparent,
                                    backgroundColor: isLogin
                                        ? Colors.white.withOpacity(0.2)
                                        : Colors.white.withOpacity(0.2),
                                  ),
                                  onPressed: () {
                                    setState(() {
                                      isLogin = !isLogin;
                                    });
                                  },
                                  child: Text(
                                    isLogin ? 'Register' : 'Login',
                                    style: TextStyle(
                                      color: isLogin
                                          ? Colors.white
                                          : Colors.white,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Container(
                        alignment: Alignment.bottomCenter,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: imgList.asMap().entries.map((entry) {
                            return GestureDetector(
                              onTap: () => controller.animateToPage(entry.key),
                              child: Container(
                                width: 12.0,
                                height: 12.0,
                                margin: EdgeInsets.symmetric(
                                  vertical: 8.0,
                                  horizontal: 4.0,
                                ),
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,

                                  color:
                                      (Theme.of(context).brightness ==
                                                  Brightness.dark
                                              ? Colors.white
                                              : Colors.white)
                                          .withOpacity(
                                            currentIndex == entry.key
                                                ? 0.9
                                                : 0.4,
                                          ),
                                ),
                              ),
                            );
                          }).toList(),
                        ),
                      ),
                    ],
                  ),
                ), // Placeholder for image
                const SizedBox(width: 20),
                Expanded(
                  child: Column(
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 60),
                        child: isLogin
                            ? const LoginView()
                            : const RegisterView(),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
