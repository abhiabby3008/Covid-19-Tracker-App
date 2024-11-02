import 'package:flutter/material.dart';

class CountryDetailsBody extends StatefulWidget {
  String name;
  String image;
  int totalcases, todaydeaths, totalrecovered, active, critical, test;

  CountryDetailsBody(
      {required this.name,
      required this.active,
      required this.critical,
      required this.image,
      required this.test,
      required this.totalcases,
      required this.todaydeaths,
      required this.totalrecovered});
  @override
  State<CountryDetailsBody> createState() => _CountryDetailsBodyState();
}

class _CountryDetailsBodyState extends State<CountryDetailsBody> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.name),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Stack(
              children: [
                Padding(
                  padding: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height * .067),
                  child: Card(
                    child: Column(
                      children: [
                        SizedBox(
                            height: MediaQuery.of(context).size.height * .067),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("Total cases :"),
                              Text(widget.totalcases.toString())
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("Active cases :"),
                              Text(widget.active.toString())
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("Critical cases :"),
                              Text(widget.critical.toString())
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("Today deaths :"),
                              Text(widget.todaydeaths.toString())
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("Total recovered :"),
                              Text(widget.totalrecovered.toString())
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("Under tests :"),
                              Text(widget.test.toString())
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        )
                        // reusablerow(
                        //   title: 'Cases',
                        //   cases: widget.totalcases.toString(),
                        // )
                      ],
                    ),
                  ),
                ),
                Center(
                  child: CircleAvatar(
                    radius: 50,
                    backgroundImage: NetworkImage(widget.image),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
