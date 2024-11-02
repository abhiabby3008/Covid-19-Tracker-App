import 'package:covidtracker/model/world_stats_model.dart';
import 'package:covidtracker/screens/CountiresListScreen/components/countries_list_body.dart';
import 'package:covidtracker/screens/WorldStatsScreen/components/card_widget.dart';

import 'package:covidtracker/services/utilities/stats_services.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:pie_chart/pie_chart.dart';

class WorldStatsBody extends StatefulWidget {
  const WorldStatsBody({super.key});

  @override
  State<WorldStatsBody> createState() => _WorldStatsBodyState();
}

class _WorldStatsBodyState extends State<WorldStatsBody>
    with TickerProviderStateMixin {
  late final AnimationController _controller =
      AnimationController(duration: const Duration(seconds: 3), vsync: this)
        ..repeat();
  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  StatsServices statsServices = StatsServices();
  @override
  Widget build(BuildContext context) {
    StatsServices statsServices = StatsServices();
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(
              height: 20,
            ),
            FutureBuilder(
                future: statsServices.FetchWorldStatsapi(),
                builder: (context, AsyncSnapshot<WorldstatesApi> snapshot) {
                  if (!snapshot.hasData) {
                    return Expanded(
                        child: SpinKitFadingCircle(
                      color: Colors.black,
                      size: 50,
                      controller: _controller,
                    ));
                  } else {
                    return Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: PieChart(
                            chartType: ChartType.ring,
                            chartValuesOptions: ChartValuesOptions(
                                showChartValuesInPercentage: true),
                            dataMap: {
                              "Total": double.parse(
                                  snapshot.data!.cases!.toString()),
                              "Recovered": double.parse(
                                  snapshot.data!.recovered!.toString()),
                              "Deaths": double.parse(
                                  snapshot.data!.deaths!.toString()),
                              "On Treatment": double.parse(
                                  snapshot.data!.active!.toString()),
                            },
                            animationDuration: Duration(seconds: 2),
                          ),
                        ),
                        SizedBox(
                          height: 40,
                        ),
                        Card(
                          child: Column(
                            children: [
                              reusablerow(
                                title: "Total :",
                                cases: snapshot.data!.cases!.toString(),
                              ),
                              reusablerow(
                                title: "Recovered :",
                                cases: snapshot.data!.recovered!.toString(),
                              ),
                              reusablerow(
                                title: "Deaths :",
                                cases: snapshot.data!.deaths!.toString(),
                              ),
                              reusablerow(
                                title: "On treatment :",
                                cases: snapshot.data!.active!.toString(),
                              ),
                              reusablerow(
                                title: "Today Recovered :",
                                cases:
                                    snapshot.data!.todayRecovered!.toString(),
                              ),
                              reusablerow(
                                title: "Today Deaths :",
                                cases: snapshot.data!.todayDeaths!.toString(),
                              ),
                              reusablerow(
                                title: "Today Cases :",
                                cases: snapshot.data!.todayCases!.toString(),
                              )
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => CountriesListBody()));
                          },
                          child: Container(
                            height: 50,
                            width: double.infinity,
                            child: Center(
                                child: Text(
                              "Track countries",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold),
                            )),
                            decoration: BoxDecoration(
                                color: Colors.teal,
                                borderRadius: BorderRadius.circular(20)),
                          ),
                        )
                      ],
                    );
                  }
                }),
          ],
        ),
      )),
    );
  }
}
