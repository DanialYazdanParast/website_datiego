import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:website_datiego/core/utils/responsive.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Responsive(
        desktop: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 8,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Container(
                      height: 180,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: const Color.fromARGB(255, 161, 95, 56),
                      ),
                      child: Column(
                        children: [
                          const Expanded(
                            child: Row(
                              children: [
                                Expanded(
                                  child: Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text('Danial Yazdanparast'),
                                        Text('Flutter Developer'),
                                        Text(
                                          'Flutter developer with 1+ years of experience in mobile app development, passionate about creatingexceptional applications and collaborating effectively in teams. Seeking a challenging role to contribute toinnovative projects',
                                          overflow: TextOverflow.ellipsis,
                                          softWrap: true,
                                          maxLines: 3,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                CircleAvatar(
                                  maxRadius: 50,
                                ),
                                SizedBox(
                                  width: 20,
                                )
                              ],
                            ),
                          ),
                          Container(
                            height: 50,
                            child: const Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Icon(Icons.abc),
                                Icon(Icons.abc),
                                Icon(Icons.abc),
                                Icon(Icons.abc),
                                Icon(Icons.abc),
                              ],
                            ),
                            decoration: const BoxDecoration(
                              color: Color.fromARGB(243, 60, 192, 71),
                              borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(15),
                                bottomRight: Radius.circular(15),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: const Color.fromARGB(255, 166, 164, 164),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'projects',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 25),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Expanded(
                              child: GridView.builder(
                                gridDelegate:
                                    const SliverGridDelegateWithFixedCrossAxisCount(
                                        crossAxisCount: 3),
                                itemCount: 10,
                                itemBuilder: (context, index) => Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Container(
                                    height: 50,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(15),
                                      color: const Color.fromARGB(
                                          255, 7, 255, 135),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: const Color.fromARGB(255, 166, 164, 164),
                      ),
                      width: 250,
                      child: const Column(
                        children: [
                          Text('Flutter'),
                          Text('Dart'),
                          Text('SOLID Principles'),
                          Text('Provider, Bloc, Cubit'),
                          Text('MVVM, MVC,Clean'),
                          Text('RESTful API / Postman'),
                          Text('Material and Custom Component'),
                          Text('Android / iOS / Desktop'),
                          Text('GIT / Gitflow'),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: const Color.fromARGB(255, 205, 205, 28),
                      ),
                      width: 250,
                      child: const Column(
                        children: [
                          Text('Flutter'),
                          Text('Dart'),
                          Text('SOLID Principles'),
                          Text('Provider, Bloc, Cubit'),
                          Text('MVVM, MVC,Clean'),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: const Color.fromARGB(255, 241, 202, 215),
                      ),
                      width: 250,
                      child: const Column(
                        children: [
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            'Bachelor of Software Engineering',
                          ),
                          Text('University of Torbat Heydarieh'),
                          SizedBox(
                            height: 20,
                          )
                        ],
                      )),
                ],
              ),
            ),
          ],
        ),
        tablet: const Center(
          child: Text('Home 2'),
        ),
        mobile: const Center(
          child: Text('Home 3'),
        ),
      ),
    );
  }
}
