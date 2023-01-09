import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../utils/eth.dart';

class Tests extends ConsumerStatefulWidget {
  const Tests({Key? key}) : super(key: key);

  @override
  _TestsState createState() => _TestsState();
}

class _TestsState extends ConsumerState<Tests> {
  @override
  Widget build(BuildContext context) {
    ref.watch(ethUtilsProviders);
    final ethUtils = ref.watch(ethUtilsProviders.notifier);

    return Scaffold(
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: ethUtils.isLoading
            ? const Center(child: CircularProgressIndicator())
            : ListView(
                children: <Widget>[
                  const ListTile(title: Text('Click the tests in order.')),
                  const Divider(), //----------------------------------------------------
                  ListTile(
                    contentPadding:
                        const EdgeInsets.symmetric(horizontal: 60.0),
                    title: const Text('Test 1: Create Stock'),
                    trailing: ElevatedButton(
                        child: const Text('Test 1'),
                        onPressed: () {
                          ethUtils.test1CreateStock();
                        }),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text("createStock(Secadoras_A, 200)"),
                        Text("createStock(Lavadoras_B, 200)"),
                        Text("createStock(Lavavajillas_A, 200);"),
                      ],
                    ),
                  ),
                  const Divider(), //----------------------------------------------------
                  ListTile(
                    contentPadding:
                        const EdgeInsets.symmetric(horizontal: 60.0),
                    title: const Text('Test 2: Set Container Data'),
                    trailing: ElevatedButton(
                        child: const Text('Test 2'),
                        onPressed: () {
                          ethUtils.test2SetCont();
                        }),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                            "setContData(1231, Secadoras_A, 50, Manufacturer, Warehouse_ES)"),
                        Text(
                            "setContData(1232, Lavadoras_B, 50, Manufacturer, Warehouse_FR)"),
                        Text(
                            "setContData(1233, Lavavajillas_A, 100, Manufacturer, Warehouse_FR)"),
                        Text(
                            "setContData(1234, Secadoras_A, 20, Warehouse_ES, Warehouse_FR)"),
                        Text(
                            "setContData(1235, Lavavajillas_A, 20, Warehouse_FR, Warehouse_DE)"),
                        Text(
                            "setContData(1236, Lavavajillas_A, 20, Warehouse_FR, Warehouse_ES)"),
                        Text(
                            "setContData(1237, Lavadoras_B, 30, Warehouse_FR, Warehouse_ES)"),
                      ],
                    ),
                  ),
                  const Divider(), //----------------------------------------------------
                  ListTile(
                    contentPadding:
                        const EdgeInsets.symmetric(horizontal: 60.0),
                    title: const Text('Test 3: Send Containers'),
                    trailing: ElevatedButton(
                        child: const Text('Test 3'),
                        onPressed: () {
                          ethUtils.test3Send();
                        }),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text("sendContainer(1231) & receiveContainer(1231)"),
                        Text("sendContainer(1232) & receiveContainer(1232)"),
                        Text("sendContainer(1233) & receiveContainer(1233)"),
                        Text("sendContainer(1234) & receiveContainer(1234)"),
                        Text("sendContainer(1235) & receiveContainer(1235)"),
                        Text("sendContainer(1236) & receiveContainer(1236)"),
                        Text("sendContainer(1237) & receiveContainer(1237)"),
                      ],
                    ),
                  ),
                ],
              ),
      ),
    );
  }
}
