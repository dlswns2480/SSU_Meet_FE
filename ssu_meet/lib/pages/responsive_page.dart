import 'package:flutter/material.dart';
import 'package:ssu_meet/pages/info_page.dart';
import 'package:ssu_meet/pages/my_page.dart';
import 'package:ssu_meet/pages/test_main_page.dart';
import 'package:ssu_meet/pages/login_page.dart';

class ResponsiveWebLayout extends StatefulWidget {
  const ResponsiveWebLayout({super.key});

  @override
  State<ResponsiveWebLayout> createState() => _ResponsiveWebLayoutState();
}

class _ResponsiveWebLayoutState extends State<ResponsiveWebLayout> {
  int _selectedIndexScreen = 1; // Main Page
  int coins = getCoin();

  final List _children = [
    const InfoPage(),
    const TestMainPage(),
    const MyPage(),
    const LoginPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: const Color.fromRGBO(239, 239, 239, 1),
        shadowColor: const Color.fromRGBO(158, 156, 156, 1),
        flexibleSpace: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                width: 110,
                height: 30,
                decoration: BoxDecoration(
                  color: const Color(0xFFD7D7D7),
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: const [
                    BoxShadow(
                      color: Color(0x3F000000),
                      blurRadius: 8,
                      offset: Offset(0, 4),
                      spreadRadius: 0,
                    )
                  ],
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      width: 25,
                      height: 25,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage("images/currency_dollar.png"),
                        ),
                      ),
                    ),
                    Text(
                      "보유 코인: $coins",
                      style: const TextStyle(
                        color: Color(0xFF1A1A1A),
                        fontFamily: "Nanum_Ogbice",
                        fontSize: 20,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      body: _children[_selectedIndexScreen],
      // body: LayoutBuilder(
      //   builder: (BuildContext context, BoxConstraints constraints) {
      //     if (constraints.maxWidth <= 600) {
      //       // Layout for iPhone-sized screens
      //       // return const HomePage();
      //       return const TestMainPage();
      //     } else {
      //       // Layout for computer screens
      //       return const DesktopLayout();
      //     }
      //   },

      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: const Color.fromRGBO(239, 239, 239, 1),
        selectedItemColor: const Color.fromRGBO(24, 24, 27, 1),
        unselectedItemColor: const Color.fromARGB(255, 114, 113, 113),
        currentIndex: _selectedIndexScreen,
        onTap: (int index) {
          setState(() {
            _selectedIndexScreen = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: ImageIcon(
              AssetImage(
                "assets/images/info_page_icon.png",
              ),
            ),
            label: "설명서",
          ),
          BottomNavigationBarItem(
            icon: ImageIcon(
              AssetImage(
                "assets/images/home_page_icon.png",
              ),
            ),
            label: "홈",
          ),
          BottomNavigationBarItem(
            icon: ImageIcon(
              AssetImage(
                "assets/images/my_page_icon.png",
              ),
            ),
            label: "마이페이지",
          ),
        ],
      ),
    );
  }
}

// 서버에서 코인 개수 가져오기 (임시)
int getCoin() {
  return 3;
}
