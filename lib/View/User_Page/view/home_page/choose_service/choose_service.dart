import 'package:auton/View/User_Page/view/home_page/choose_service/widgets/car_service_item.dart';
import 'package:auton/View/User_Page/view/home_page/choose_service/widgets/service_view_container.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

class ChooseService extends StatelessWidget {
  const ChooseService({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 930.sp,
      width: double.infinity,
      color: const Color.fromARGB(255, 1, 28, 50),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(height: 6.sp),
          Align(
            alignment: Alignment.center,
            child: Padding(
              padding: const EdgeInsets.only(left: 30),
              child: Text(
                "Choose",
                style: GoogleFonts.markoOne(
                  textStyle: const TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 255, 255, 255),
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 2,
          ),
          Align(
            alignment: Alignment.center,
            child: Padding(
              padding: const EdgeInsets.only(left: 30),
              child: Text(
                "Your Service !",
                style: GoogleFonts.markoOne(
                  textStyle: const TextStyle(
                    fontSize: 38,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 255, 255, 255),
                  ),
                ),
              ),
            ),
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CarServiceItem(
                icon: Icons.oil_barrel_sharp,
                serviceName: 'Oil Change',
                description:
                    'Maintain your engine\'s health with our  oil change service.',
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const ServiceView(
                        imageUrl: "assets/serviceimages/oil.jpg",
                        appbarname: "Oil Services",
                        servicename: "Oil Services",
                        servicedescription:
                            "A car oil service, often referred to as an oil change service, is a routine maintenance procedure performed on a vehicle's engine to ensure its proper functioning and longevity. This service primarily involves replacing the engine oil and the oil filter. ",
                      ),
                    ),
                  );
                },
              ),
              CarServiceItem(
                icon: Icons.build,
                serviceName: 'Brake Service',
                description:
                    'We ensure  to keep your vehicle stopping smoothly and securely.',
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => ServiceView(
                        imageUrl: "assets/serviceimages/brake.jpg",
                        appbarname: "Brake Service",
                        servicename: "Brake Service",
                        servicedescription:
                            "A car brake service is a critical maintenance procedure designed to ensure the safety and optimal performance of a vehicle's braking system. The braking system is one of the most important safety features in a car. Regular brake service helps prevent brake system failures, maintains braking efficiency, and extends the lifespan of brake components.",
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
          Row(
            children: [
              CarServiceItem(
                icon: Icons.local_car_wash,
                serviceName: 'Car Wash',
                description:
                    'Treat your vehicle to a sparkling clean with our hygenic wash service',
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => ServiceView(
                        imageUrl: "assets/serviceimages/carwash.jpg",
                        appbarname: "Car Wash",
                        servicename: "Car Wash Services",
                        servicedescription:
                            "Our Premium Car Wash Service is here to restore your vehicle's shine and give it the pampering it deserves. Whether you have a compact car, a rugged SUV, or a luxury sedan, our professional team is dedicated to providing top-notch car cleaning and detailing services that will leave your vehicle looking as good as new."),
                  ));
                },
              ),
              CarServiceItem(
                icon: Icons.tire_repair,
                serviceName: 'Tyre Service',
                description:
                    'Ensure safety and nice performance with our efficient tire service.',
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => ServiceView(
                        imageUrl: "assets/serviceimages/tyre.jpg",
                        appbarname: "Tyre Services",
                        servicename: "Tyre Services",
                        servicedescription:
                            "Proper tire maintenance is essential for vehicle safety, performance, and fuel efficiency. Car tire maintenance and repair services encompass a variety of tasks aimed at ensuring the safety and optimal performance of your vehicle's tires. These services are typically provided by automotive service centers, tire shops, and mechanics. "),
                  ));
                },
              ),
            ],
          ),
          Row(
            children: [
              CarServiceItem(
                icon: Icons.car_crash_sharp,
                serviceName: 'Engine Service',
                description:
                    'Keep your engine running smoothly with our  engine service.',
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => ServiceView(
                        imageUrl: "assets/serviceimages/enginee.jpg",
                        appbarname: "Engine Services",
                        servicename: "Engine Services",
                        servicedescription:
                            "A car engine service is a crucial maintenance procedure designed to ensure the optimal performance, reliability, and longevity of a vehicle's engine. The engine is the heart of a car, and regular servicing helps prevent costly repairs and breakdowns while also improving fuel efficiency and reducing emissions. "),
                  ));
                },
              ),
              CarServiceItem(
                icon: Icons.engineering,
                serviceName: 'Regular Service',
                description:
                    'Service performed at regular intervals, such as every 6 months ',
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => ServiceView(
                        imageUrl: "assets/serviceimages/regular.jpg",
                        appbarname: "Regular Service",
                        servicename: "Regular Service",
                        servicedescription:
                            "A car regular service  is a scheduled maintenance procedure performed on a vehicle to ensure its continued safe and efficient operation. The specific tasks and checks performed during a regular car service may vary depending on the make and model of the vehicle, as well as the manufacturer's recommended service intervals"),
                  ));
                },
              ),
            ],
          ),
          Row(
            children: [
              CarServiceItem(
                icon: Icons.cloud,
                serviceName: 'AC Services',
                description:
                    'We keep your car cool and comfortable with  AC maintanence',
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => ServiceView(
                          imageUrl: "assets/serviceimages/ac.jpg",
                          appbarname: "AC Services",
                          servicename: "AC Services",
                          servicedescription:
                              "Car AC (air conditioning) service is a maintenance procedure that involves inspecting, cleaning, and repairing various components of a vehicle's air conditioning system to ensure it operates efficiently and provides comfortable cabin cooling. Proper maintenance of your car's AC system is essential for comfort, safety, and longevity."),
                    ),
                  );
                },
              ),
              CarServiceItem(
                icon: Icons.battery_charging_full,
                serviceName: 'Battery Service',
                description:
                    'Replacement of old or failing batteries with high-quality replacements.',
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => ServiceView(
                          imageUrl: "assets/serviceimages/battery.jpg",
                          appbarname: "Battery Services",
                          servicename: "Battery Services",
                          servicedescription:
                              "A car battery is crucial for the proper functioning of your vehicle. Over time, batteries can degrade, lose their capacity, or fail altogether, leading to starting problems and other electrical issues. Regular inspection and maintenance of your car's battery are essential to ensure reliable performance and prevent unexpected breakdowns."),
                    ),
                  );
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
