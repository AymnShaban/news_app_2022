// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../../shared/componants/componants.dart';
import '../login_and_register/login/login_screen.dart';

class BoardingModel {
  final String image;
  final String title;
  final String body;

  BoardingModel({required this.body, required this.title, required this.image});
}

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  var boardController = PageController();

  List<BoardingModel> boarding = [
    BoardingModel(
      image: 'https://scontent.xx.fbcdn.net/v/t1.15752-9/334891752_756353279162566_5169759184333069548_n.png?stp=cp0_dst-png&_nc_cat=101&ccb=1-7&_nc_sid=aee45a&_nc_ohc=t6Na_-vHFokAX_ROF5j&_nc_ad=z-m&_nc_cid=0&_nc_ht=scontent.xx&oh=03_AdRCs4yvKyCjpk-Fw3zk8gGe7cAxpDhRw0eiNpA-xka5oQ&oe=642EDD2B',
      body:
          'مرحبا بكم جميعا ',
      title: 'اهم الاخبار',
    ),
    BoardingModel(
      image: 'https://scontent.xx.fbcdn.net/v/t1.15752-9/331369715_201952312421023_2492947185665381699_n.png?_nc_cat=104&ccb=1-7&_nc_sid=aee45a&_nc_ohc=w0YQXtLEG_sAX_EHDzA&_nc_ad=z-m&_nc_cid=0&_nc_ht=scontent.xx&oh=03_AdRcyi2wqc_PzAxoxFKx7PFtxbb-6dH6po_xQnD0g7HStg&oe=642EB230',
      body: 'هنا يمكنكم الاطلاع علي اهم الاخبار بكل سهوله ',
      title: '🤷‍♂️ما الذي ستحصل عليه',
    ),
    BoardingModel(
      image: 'https://scontent.xx.fbcdn.net/v/t1.15752-9/334965093_3427857810815295_7934291906693762167_n.png?_nc_cat=110&ccb=1-7&_nc_sid=aee45a&_nc_ohc=QcZ4zdQQYewAX_ZeeKD&_nc_ad=z-m&_nc_cid=0&_nc_ht=scontent.xx&oh=03_AdRoazX0X-4bkWuKnuRV1oNwMeTdQwrO7IjjlGRB_0eSkA&oe=642EADBA',
      body:
          'بعد تسجبل الدخول يمكنك الاطلاع علي اهم الاخبار الحصريه',
      title: 'هيا قم بالتسجيل معنا ',
    ),
  ];
  bool isLast = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: defaultButton(
              width: 100,
              radius: 35,
              background: Colors.cyanAccent[100],
              function: () {
                myNavigator(context: context, Widget: LoginScreen());
              },
              text: 'تخطي',
            ),
          )
        ],
      ),
      body: Container(
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(25.0),
          child: Column(
            children: [
              Expanded(
                child: PageView.builder(
                  physics: const BouncingScrollPhysics(),
                  controller: boardController,
                  onPageChanged: (int index) {
                    if (index == boarding.length - 1) {
                      setState(() {
                        isLast = true;
                      });
                    } else {
                      setState(() {
                        isLast = false;
                      });
                    }
                  },
                  itemBuilder: (context, index) =>
                      buildBoardingItem(boarding[index]),
                  itemCount: boarding.length,
                ),
              ),
              Row(
                children: [
                  SmoothPageIndicator(
                      controller: boardController,
                      effect: const ExpandingDotsEffect(
                          dotColor: Colors.grey,
                          activeDotColor: Colors.deepOrange),
                      count: boarding.length),
                  const Spacer(),
                  FloatingActionButton(
                    onPressed: () {
                      if (isLast) {
                        Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                                builder: (context) => LoginScreen()),
                            (route) => false);
                      } else {
                        boardController.nextPage(
                            duration: const Duration(
                              milliseconds: 750,
                            ),
                            curve: Curves.fastLinearToSlowEaseIn);
                      }
                    },
                    child: const Icon(Icons.arrow_forward),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget buildBoardingItem(BoardingModel model) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 20,
          ),
          Directionality(
            textDirection: TextDirection.ltr,
            child: Text(
              model.title,
              style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                  color: Colors.black54),
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          Directionality(
            textDirection: TextDirection.rtl,
            child: Text(
              model.body,
              style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 22,
                  fontFamily: 'Aas',
                  color: Colors.black54),
            ),
          ),
          const SizedBox(
            height: 45,
          ),
          Image.network(
            model.image,
            height: 200,
            width: 200,
            fit: BoxFit.cover,
          )
        ],
      );
}
