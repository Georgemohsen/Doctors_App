import 'package:flutter/material.dart';
import 'package:flutter_doctors_app/colors.dart';
import 'package:flutter_doctors_app/pages/home_page.dart';

class DoctorPage extends StatefulWidget {
  const DoctorPage({super.key});

  @override
  State<DoctorPage> createState() => _DoctorPageState();
}

class _DoctorPageState extends State<DoctorPage> {
  bool clicked = false;
  int? selectedIndex;
  int? selectedDate;
  int? selectedDate2;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primaryColor,
        leading: IconButton(
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => HomePage()),
            );
          },
          icon: Icon(Icons.arrow_back, size: 30),
          color: Colors.white,
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Icon(
              Icons.notifications_outlined,
              size: 30,
              color: Colors.white,
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          doctorHeader(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'April 2021',
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
                SizedBox(height: 10),
                dayAppointment(),
                SizedBox(height: 20),
                morningAppointment(),
                SizedBox(height: 20),
                eveningAppointment(),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.all(16),
        child: Row(
          children: [
            Container(
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5), // Grey shadow color
                    spreadRadius: 2, // How far the shadow spreads
                    blurRadius: 5, // How soft the shadow is
                    offset: Offset(2, 3), // Shadow position (x, y)
                  ),
                ],
              ),
              child: Icon(
                Icons.favorite,
                size: 30,
                color: AppColors.primaryColor,
              ),
            ),
            SizedBox(width: 10),
            Expanded(
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primaryColor,
                  shape: RoundedRectangleBorder(
                    borderRadius:
                        BorderRadius.zero, // Sharp corners (fully rectangular)
                  ),
                  padding: EdgeInsets.symmetric(vertical: 8),
                ),
                child: Text(
                  'Book Appointment',
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  SizedBox dayAppointment() {
    return SizedBox(
      height: 80,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              setState(() {
                selectedIndex = (selectedIndex == index) ? null : index;
              });
            },
            child: Container(
              decoration: BoxDecoration(
                color:
                    selectedIndex == index
                        ? AppColors.primaryColor
                        : Colors.white,
                shape: BoxShape.rectangle,
              ),

              padding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Sat',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color:
                          selectedIndex == index ? Colors.white : Colors.black,
                    ),
                  ),
                  Text(
                    '16',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color:
                          selectedIndex == index ? Colors.white : Colors.black,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
        separatorBuilder: (context, index) {
          return SizedBox(width: 20);
        },
        itemCount: 7,
      ),
    );
  }

  Column eveningAppointment() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Evening',
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 10),
        SizedBox(
          height: 70,
          child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3, // 3 columns
              mainAxisSpacing: 5, // Vertical spacing between rows
              crossAxisSpacing: 5, // Horizontal spacing between columns
              childAspectRatio: 4, // Width/height ratio (adjust as needed)
            ),
            itemCount: 6, // 3 columns × 2 rows = 6 items
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  setState(() {
                    selectedDate2 = index;
                  });
                },
                child: Container(
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color:
                        selectedDate2 == index
                            ? AppColors.primaryColor
                            : Colors.white,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(
                    '${9 + index}:00 AM', // Dynamic time (9AM, 10AM, etc.)
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color:
                          selectedDate2 == index ? Colors.white : Colors.black,
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  Column morningAppointment() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Morning',
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 10),
        SizedBox(
          height: 70,
          child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3, // 3 columns
              mainAxisSpacing: 5, // Vertical spacing between rows
              crossAxisSpacing: 5, // Horizontal spacing between columns
              childAspectRatio: 4, // Width/height ratio (adjust as needed)
            ),
            itemCount: 6, // 3 columns × 2 rows = 6 items
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  setState(() {
                    selectedDate = index;
                  });
                },
                child: Container(
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color:
                        selectedDate == index
                            ? AppColors.primaryColor
                            : Colors.white,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(
                    '${9 + index}:00 AM', // Dynamic time (9AM, 10AM, etc.)
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color:
                          selectedDate == index ? Colors.white : Colors.black,
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  SizedBox doctorHeader() {
    return SizedBox(
      child: Column(
        children: [
          Stack(
            //alignment: AlignmentDirectional.bottomEnd,
            clipBehavior: Clip.none,
            children: [
              Container(
                height: 160,
                decoration: BoxDecoration(
                  color: AppColors.primaryColor,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(30),
                    bottomRight: Radius.circular(30),
                  ),
                ),
                child: Row(
                  children: [
                    SizedBox(width: 30),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.asset(
                        'assets/images/doctor.jpg',
                        width: 120,
                        height: 120,
                        fit: BoxFit.cover,
                      ),
                    ),
                    SizedBox(width: 15),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Dr Evan Lwis',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 25,
                            color: Colors.white,
                          ),
                        ),
                        Text(
                          'Heart Surgeon',
                          style: TextStyle(color: Colors.white, fontSize: 18),
                        ),
                        SizedBox(height: 8),
                        Row(
                          children: [
                            Container(
                              padding: EdgeInsets.all(5),
                              color: Colors.white,
                              child: Icon(Icons.facebook, color: Colors.blue),
                            ),
                            SizedBox(width: 8),
                            Container(
                              padding: EdgeInsets.all(5),
                              color: Colors.white,
                              child: Icon(
                                Icons.video_call,
                                color: Colors.redAccent,
                              ),
                            ),
                            SizedBox(width: 8),
                            Container(
                              padding: EdgeInsets.all(5),
                              color: Colors.white,
                              child: Icon(
                                Icons.chat,
                                color: Colors.deepOrangeAccent,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Positioned(
                bottom:
                    -10, // Important to allow the rectangle to extend beyond
                right: 10,
                child: Container(
                  color: AppColors.secondaryColor,
                  height: 30,
                  width: 70,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Icon(Icons.star, color: Colors.white),
                      Text(
                        '4.9',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),

          SizedBox(height: 20),
        ],
      ),
    );
  }
}
