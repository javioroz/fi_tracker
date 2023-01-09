import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../utils/eth.dart';

class Locations extends ConsumerStatefulWidget {
  const Locations({Key? key}) : super(key: key);

  @override
  _LocationsState createState() => _LocationsState();
}

class _LocationsState extends ConsumerState<Locations> {
  final TextEditingController _locToSeeMatController = TextEditingController();
  final TextEditingController _matToSeeQtyController = TextEditingController();
  final TextEditingController _locToSeeQtyController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    ref.watch(ethUtilsProviders);
    final ethUtils = ref.watch(ethUtilsProviders.notifier);

    return Scaffold(
      body: Container(
        child: ethUtils.isLoading
            ? const Center(child: CircularProgressIndicator())
            : ListView(children: <Widget>[
                const ListTile(
                  title: Text('Here you can view stock data in locations:'),
                ),
                const Divider(), //----------------------------------------------------
                ListTile(
                  leading: const Icon(Icons.auto_awesome_mosaic),
                  title: const Text('View materials in a location'),
                  trailing: ElevatedButton(
                      child: const Text('view'),
                      onPressed: () {
                        if (_locToSeeMatController.text.isEmpty) return;
                        ethUtils.getMaterialsInLoc(_locToSeeMatController.text);
                        _locToSeeMatController.clear();
                      }),
                ),
                ListTile(
                  contentPadding: const EdgeInsets.symmetric(horizontal: 60.0),
                  leading: const Icon(Icons.abc),
                  subtitle: TextField(
                    controller: _locToSeeMatController,
                    maxLines: 1,
                    decoration:
                        const InputDecoration(hintText: 'Enter location name'),
                  ),
                ),
                ListTile(
                  contentPadding: const EdgeInsets.symmetric(horizontal: 60.0),
                  leading: const Icon(Icons.arrow_forward),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                          'That location contains the following materials: '),
                      Text(ethUtils.matsInLoc!),
                    ],
                  ),
                ),
                const Divider(), //----------------------------------------------------
                ListTile(
                  leading: const Icon(Icons.countertops),
                  title:
                      const Text('View quantity of a material in a location'),
                  trailing: ElevatedButton(
                      child: const Text('view'),
                      onPressed: () {
                        if (_matToSeeQtyController.text.isEmpty) return;
                        ethUtils.getQuantityOfMatInLoc(
                            _matToSeeQtyController.text,
                            _locToSeeQtyController.text);
                        _matToSeeQtyController.clear();
                        _locToSeeQtyController.clear();
                      }),
                ),
                ListTile(
                  contentPadding: const EdgeInsets.symmetric(horizontal: 60.0),
                  leading: const Icon(Icons.abc),
                  subtitle: TextField(
                    controller: _matToSeeQtyController,
                    maxLines: 1,
                    decoration:
                        const InputDecoration(hintText: 'Enter material name'),
                  ),
                ),
                ListTile(
                  contentPadding: const EdgeInsets.symmetric(horizontal: 60.0),
                  leading: const Icon(Icons.abc),
                  subtitle: TextField(
                    controller: _locToSeeQtyController,
                    maxLines: 1,
                    decoration:
                        const InputDecoration(hintText: 'Enter location name'),
                  ),
                ),
                ListTile(
                  contentPadding: const EdgeInsets.symmetric(horizontal: 60.0),
                  leading: const Icon(Icons.arrow_forward),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                          'The quantity of that material in that location is: '),
                      Text(ethUtils.matQtyInLoc!),
                    ],
                  ),
                ),
                const Divider(), //----------------------------------------------------
                ListTile(
                  leading: const Icon(Icons.warehouse),
                  title: const Text('View a list of all locations'),
                  trailing: ElevatedButton(
                      child: const Text('view'),
                      onPressed: () {
                        ethUtils.getAllLocations();
                      }),
                ),
                ListTile(
                  contentPadding: const EdgeInsets.symmetric(horizontal: 60.0),
                  leading: const Icon(Icons.arrow_forward),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text('List of all locations: '),
                      Text(ethUtils.allLocs!),
                    ],
                  ),
                ),
                const Divider(), //----------------------------------------------------
              ]),
      ),
    );
  }
}
