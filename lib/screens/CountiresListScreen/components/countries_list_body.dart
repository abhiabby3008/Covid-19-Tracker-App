import 'package:covidtracker/screens/CountryDetailsScreen/components/country_details_screen_body.dart';
import 'package:covidtracker/services/utilities/stats_services.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class CountriesListBody extends StatefulWidget {
  const CountriesListBody({super.key});

  @override
  State<CountriesListBody> createState() => _CountriesListBodyState();
}

class _CountriesListBodyState extends State<CountriesListBody> {
  TextEditingController searchcontroller = TextEditingController();
  StatsServices _statsServices = StatsServices();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Country Wise Covid-19 Cases"),
      ),
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            TextFormField(
              onChanged: (value) {
                setState(() {});
              },
              controller: searchcontroller,
              decoration: InputDecoration(
                  hintText: "Search for a Country",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20))),
            ),
            Expanded(
                child: FutureBuilder(
                    future: _statsServices.CountiresListApi(),
                    builder: (context, AsyncSnapshot<List<dynamic>> snapshot) {
                      if (!snapshot.hasData) {
                        return ListView.builder(
                            itemCount: 10,
                            itemBuilder: (context, index) {
                              return Shimmer.fromColors(
                                baseColor: Colors.grey.shade700,
                                highlightColor: Colors.grey.shade100,
                                child: Column(
                                  children: [
                                    ListTile(
                                        title: Container(
                                          height: 10,
                                          width: 80,
                                          color: Colors.white,
                                        ),
                                        subtitle: Container(
                                          height: 10,
                                          width: 80,
                                          color: Colors.white,
                                        ),
                                        leading: Container(
                                          height: 50,
                                          width: 50,
                                          color: Colors.white,
                                        ))
                                  ],
                                ),
                              );
                            });
                      } else {
                        return ListView.builder(
                            itemCount: snapshot.data!.length,
                            itemBuilder: (context, index) {
                              String name = snapshot.data![index]['country'];
                              if (searchcontroller.text.isEmpty) {
                                return Column(children: [
                                  InkWell(
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  CountryDetailsBody(
                                                    totalrecovered:
                                                        snapshot.data![index]
                                                            ['recovered'],
                                                    todaydeaths:
                                                        snapshot.data![index]
                                                            ['todayDeaths'],
                                                    totalcases: snapshot
                                                        .data![index]['cases'],
                                                    test: snapshot.data![index]
                                                        ['tests'],
                                                    critical:
                                                        snapshot.data![index]
                                                            ['critical'],
                                                    active: snapshot
                                                        .data![index]['active'],
                                                    name: snapshot.data![index]
                                                        ['country'],
                                                    image: snapshot.data![index]
                                                        ['countryInfo']['flag'],
                                                  )));
                                    },
                                    child: ListTile(
                                      title: Text(
                                        snapshot.data![index]['country'],
                                      ),
                                      subtitle: Text(
                                        snapshot.data![index]['cases']
                                            .toString(),
                                      ),
                                      leading: Image(
                                          height: 50,
                                          width: 50,
                                          image: NetworkImage(
                                              snapshot.data![index]
                                                  ['countryInfo']['flag'])),
                                    ),
                                  )
                                ]);
                              } else if (name.toLowerCase().contains(
                                  searchcontroller.text.toLowerCase())) {
                                return Column(children: [
                                  InkWell(
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  CountryDetailsBody(
                                                    totalrecovered:
                                                        snapshot.data![index]
                                                            ['recovered'],
                                                    todaydeaths:
                                                        snapshot.data![index]
                                                            ['todayDeaths'],
                                                    totalcases: snapshot
                                                        .data![index]['cases'],
                                                    test: snapshot.data![index]
                                                        ['tests'],
                                                    critical:
                                                        snapshot.data![index]
                                                            ['critical'],
                                                    active: snapshot
                                                        .data![index]['active'],
                                                    name: snapshot.data![index]
                                                        ['country'],
                                                    image: snapshot.data![index]
                                                        ['countryInfo']['flag'],
                                                  )));
                                    },
                                    child: ListTile(
                                      title: Text(
                                        snapshot.data![index]['country'],
                                      ),
                                      subtitle: Text(
                                        snapshot.data![index]['cases']
                                            .toString(),
                                      ),
                                      leading: Image(
                                          height: 50,
                                          width: 50,
                                          image: NetworkImage(
                                              snapshot.data![index]
                                                  ['countryInfo']['flag'])),
                                    ),
                                  )
                                ]);
                              } else {
                                return Container();
                              }
                            });
                      }
                    }))
          ],
        ),
      )),
    );
  }
}
