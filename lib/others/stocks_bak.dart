import 'package:flutter/material.dart';
import '../utils/eth.dart';

//class Stocks extends ConsumerStatefulWidget
class Stocks extends StatelessWidget {
  const Stocks({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    void _showButtonPressed() => ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('button pressed'),
            duration: Duration(milliseconds: 500),
          ),
        );
    //final ethUtils = ref.watch(ethUtilsProviders.notifier);
    final listTiles = <Widget>[
      const ListTile(
        title: Text('Here you can view and edit stock data:'),
      ),
      const Divider(), //----------------------------------------------------
      const ListTile(
        leading: Icon(Icons.add_circle),
        title: Text('Create new stock'),
        trailing: ElevatedButton(onPressed: null, child: Text('create')),
      ),
      const ListTile(
        contentPadding: EdgeInsets.symmetric(horizontal: 60.0),
        leading: Icon(Icons.abc),
        subtitle: TextField(
          maxLines: 1,
          decoration: InputDecoration(hintText: 'Enter material name'),
        ),
      ),
      const ListTile(
        contentPadding: EdgeInsets.symmetric(horizontal: 60.0),
        leading: Icon(Icons.onetwothree),
        subtitle: TextField(
          maxLines: 1,
          decoration: InputDecoration(hintText: 'Enter quantity'),
        ),
      ),
      const Divider(), //----------------------------------------------------
      const ListTile(
        leading: Icon(Icons.remove_circle),
        title: Text('Delete stock'),
        trailing: ElevatedButton(onPressed: null, child: Text('delete')),
      ),
      const ListTile(
        contentPadding: EdgeInsets.symmetric(horizontal: 60.0),
        leading: Icon(Icons.abc),
        subtitle: TextField(
          maxLines: 1,
          decoration: InputDecoration(hintText: 'Enter material name'),
        ),
      ),
      const ListTile(
        contentPadding: EdgeInsets.symmetric(horizontal: 60.0),
        leading: Icon(Icons.abc),
        subtitle: TextField(
          maxLines: 1,
          decoration: InputDecoration(hintText: 'Enter location name'),
        ),
      ),
      const Divider(), //----------------------------------------------------
      const ListTile(
        leading: Icon(Icons.remove_red_eye),
        title: Text('View list of all materials'),
        trailing: ElevatedButton(onPressed: null, child: Text('show')),
      ),
      const ListTile(
        contentPadding: EdgeInsets.symmetric(horizontal: 60.0),
        leading: Icon(Icons.arrow_forward),
        subtitle: Text('resultAllMaterials'),
      ),
      const Divider(),
    ];
    // Directly returning a list of widgets is not common practice.
    // People usually use ListView.builder, c.f. "ListView.builder" example.
    // Here we mainly demostrate ListTile.
    return ListView(children: listTiles);
  }
}
/*
        Column(children: <Widget>[
          TextField(
            maxLines: 1,
            decoration: InputDecoration(hintText: 'Enter material name'),
          ),
          TextField(
            maxLines: 1,
            decoration: InputDecoration(hintText: 'Enter material name'),
          ),
         ],
        ), 
        ),*/
