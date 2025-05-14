import 'package:flutter/material.dart';
import 'package:flutter_doctors_app/colors.dart';
import 'package:flutter_doctors_app/pages/doctor_page.dart';
import 'package:flutter_doctors_app/widgets/category_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: AppBar(
        backgroundColor: AppColors.primaryColor,
        leading: Icon(Icons.more_horiz, color: Colors.white, size: 30),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Stack(
              children: [
                Icon(Icons.notifications, color: Colors.white, size: 30),
                Positioned(
                  left: 15,
                  child: CircleAvatar(
                    backgroundColor: AppColors.secondaryColor,
                    radius: 6,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      body: Container(
        color: AppColors.primaryColor,
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 16),
          decoration: BoxDecoration(
            color: AppColors.backgroundColor,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30),
              topRight: Radius.circular(30),
            ),
          ),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 30),
                Text('Hi, Tuhin', style: TextStyle(fontSize: 20)),
                Text(
                  'Find Your Doctor',
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 10),
                Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(
                                0.5,
                              ), // Grey shadow color
                              spreadRadius: 2, // How far the shadow spreads
                              blurRadius: 5, // How soft the shadow is
                              offset: Offset(2, 3), // Shadow position (x, y)
                            ),
                          ],
                        ),
                        height: 50,
                        child: Icon(Icons.menu),
                      ),
                    ),
                    SizedBox(width: 15),
                    Expanded(
                      flex: 5,
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(
                                0.5,
                              ), // Grey shadow color
                              spreadRadius: 2, // How far the shadow spreads
                              blurRadius: 5, // How soft the shadow is
                              offset: Offset(2, 3), // Shadow position (x, y)
                            ),
                          ],
                        ),
                        width: double.infinity,
                        height: 50,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 8),
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              'Search doctor',
                              style: TextStyle(
                                color: Colors.grey,
                                fontSize: 18,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Container(
                        decoration: BoxDecoration(
                          color: AppColors.primaryColor,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(
                                0.5,
                              ), // Grey shadow color
                              spreadRadius: 2, // How far the shadow spreads
                              blurRadius: 5, // How soft the shadow is
                              offset: Offset(2, 3), // Shadow position (x, y)
                            ),
                          ],
                        ),
                        height: 50,
                        child: Icon(
                          Icons.search,
                          color: Colors.white,
                          size: 25,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Category',
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      "See all",
                      style: TextStyle(fontSize: 18, color: Colors.grey),
                    ),
                  ],
                ),
                SizedBox(height: 15),
                categories(),
                SizedBox(height: 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Top doctor',
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      "See all",
                      style: TextStyle(fontSize: 18, color: Colors.grey),
                    ),
                  ],
                ),
                SizedBox(height: 15),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => DoctorPage()),
                    );
                  },
                  child: doctorCard(),
                ),
                SizedBox(height: 15),
                doctorCard(),
                SizedBox(height: 15),
                doctorCard(),
                SizedBox(height: 15),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Row categories() {
    return Row(
      children: [
        CategoryWidget(
          title: "Heart",
          icon: Icons.heart_broken,
          color: AppColors.primaryColor,
        ),
        SizedBox(width: 10),
        CategoryWidget(
          title: "Brain",
          icon: Icons.memory,
          color: AppColors.secondaryColor,
        ),
        SizedBox(width: 10),
        CategoryWidget(
          title: "Dental",
          icon: Icons.medical_services,
          color: Colors.blue,
        ),
        SizedBox(width: 10),
        CategoryWidget(
          title: "Lungs",
          icon: Icons.air,
          color: Colors.orangeAccent,
        ),
      ],
    );
  }

  Container doctorCard() {
    return Container(
      height: 120,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5), // Grey shadow color
            spreadRadius: 2, // How far the shadow spreads
            blurRadius: 3, // How soft the shadow is
            offset: Offset(2, 3), // Shadow position (x, y)
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Row(
            children: [
              SizedBox(width: 10),
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.asset(
                  'assets/images/doctor2.jpg',
                  width: 100,
                  height: 100,
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(width: 10),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Dr Evan Lwis',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                  Text('Heart Surgeon'),
                  Row(
                    children: [
                      Icon(Icons.star, color: AppColors.secondaryColor),
                      Icon(Icons.star, color: AppColors.secondaryColor),
                      Icon(Icons.star, color: AppColors.secondaryColor),
                      Icon(Icons.star, color: AppColors.secondaryColor),
                      Icon(Icons.star, color: AppColors.secondaryColor),
                    ],
                  ),
                ],
              ),
            ],
          ),
          Padding(padding: const EdgeInsets.all(8.0), child: Text('4.5 Km')),
        ],
      ),
    );
  }
}
