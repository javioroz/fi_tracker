import 'dart:html';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../utils/eth.dart';

class Insert extends ConsumerStatefulWidget {
  const Insert({Key? key}) : super(key: key);

  @override
  _InsertState createState() => _InsertState();
}

class _InsertState extends ConsumerState<Insert> {
  final TextEditingController _matToSeeQtyController = TextEditingController();
  final TextEditingController _locToSeeQtyController = TextEditingController();

  final DateInputElement _DateInput = DateInputElement();
  // final OptionElement _TypeInput = OptionElement({'Buy','Sell','Trans'});
  final TextEditingController _Type = TextEditingController();
  // final TextEditingController _Type = TextEditingController();
  // final TextEditingController _Type = TextEditingController();
  // final TextEditingController _Type = TextEditingController();
  // final TextEditingController _Type = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // ref.watch(ethUtilsProviders);
    // final ethUtils = ref.watch(ethUtilsProviders.notifier);
    final isLoading = false;

    return Scaffold(
      body: Container(
        // child: ethUtils.isLoading
        child: isLoading
            ? const Center(child: CircularProgressIndicator())
            : ListView(children: <Widget>[
                const ListTile(
                  title: Text(
                      'Fill out all the information to add a new transaction:'),
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
                        /* ethUtils.getQuantityOfMatInLoc(
                            _matToSeeQtyController.text,
                            _locToSeeQtyController.text);*/
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
                    children: const [
                      Text(
                          'The quantity of that material in that location is: '),
                      // Text(ethUtils.matQtyInLoc!),
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
                        // ethUtils.getAllLocations();
                      }),
                ),
                ListTile(
                  contentPadding: const EdgeInsets.symmetric(horizontal: 60.0),
                  leading: const Icon(Icons.arrow_forward),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text('List of all locations: '),
                      // Text(ethUtils.allLocs!),
                    ],
                  ),
                ),
                const Divider(), //----------------------------------------------------
              ]),
      ),
    );
  }
}
