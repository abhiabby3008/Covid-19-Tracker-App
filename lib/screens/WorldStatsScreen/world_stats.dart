import 'package:flutter/material.dart';
import 'components/world_stats_body.dart';

class WorldStats extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('WorldStats'),
      ),
      body: WorldStatsBody(),
    );
  }
}
