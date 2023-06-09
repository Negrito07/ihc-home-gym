import 'package:flutter/material.dart';
import 'package:gym_home/pages/exercise.dart';
import 'package:gym_home/pages/home.dart';
import 'package:gym_home/pages/bottom_bar.dart';
import 'package:gym_home/pages/shop.dart';
import 'package:gym_home/pages/tracking.dart';

class WorkoutsPage extends StatefulWidget {
  const WorkoutsPage({super.key});

  @override
  State<WorkoutsPage> createState() => _WorkoutsPageState();
}

class _WorkoutsPageState extends State<WorkoutsPage> {
  int _index = 2;

  final List<Widget> _pages = [
    const HomePage(),
    const TrackingPage(),
    const WorkoutsPage(),
    const ShopPage(),
  ];

  void _submit() {
    if (_index != 2) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => _pages[_index]),
      );
    }
  }

  Widget _buildPopupDialog(BuildContext context, int workout) {
    return AlertDialog(
      title: Text('Workout #$workout\n'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          if (workout == 1) ...[//15min
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Colors.orange.shade300, // background
                onPrimary: Colors.black, // foreground
              ),
              child: const Text("Pullups"),
              onPressed: () {
                Navigator.of(context).pop();
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const ExercisePage("Pullups")),
                );
              },
            ),
            const Text("2 sets of 8-10 reps"),
            const Text(""),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Colors.orange.shade300, // background
                onPrimary: Colors.black, // foreground
              ),
              child: const Text("Bench Dip"),
              onPressed: () {
                Navigator.of(context).pop();
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const ExercisePage("Bench Dip")),
                );
              },
            ),
            const Text("3 sets of 10-12 reps"),
            const Text(""),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Colors.orange.shade300, // background
                onPrimary: Colors.black, // foreground
              ),
              child: const Text("Lateral Raise"),
              onPressed: () {
                Navigator.of(context).pop();
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const ExercisePage("Lateral Raise")),
                );
              },
            ),
            const Text("5 sets of 8-10 reps"),
            const Text("\n"),
          ],
          if (workout == 2) ...[//20min
            const Text("Pulley Row"),
            const Text("4 sets of 10-12 reps"),
            const Text(""),
            const Text("Fixed Barbell Curl"),
            const Text("3 sets of 8-10 reps"),
            const Text(""),
            const Text("Kettlebell Swings"),
            const Text("5 sets of 5-7 reps"),
            const Text("\n"),
          ],
          if (workout == 3) ...[//30min
            const Text("Squat"),
            const Text("4 sets of 12-15 reps"),
            const Text(""),
            const Text("Leg Press"),
            const Text("3 sets of 6-8 reps"),
            const Text(""),
            const Text("Calf raises"),
            const Text("5 sets of 14-16 reps"),
            const Text("\n"),
          ],
        ],
      ),
      actions: <Widget>[
        ElevatedButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Text('Start')),
        ElevatedButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: const Text('Close'),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Workouts"),
        automaticallyImplyLeading: false,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ListTile(
              leading: const Icon(Icons.fitness_center),
              title: const Text('Workout #1\nChest, triceps and shoulders'),
              onTap: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) =>
                      _buildPopupDialog(context, 1),
                );
              },
            ),
            const SizedBox(
              height: 20,
            ),
            ListTile(
              leading: const Icon(Icons.fitness_center),
              title: const Text('Workout #2\nBack and biceps'),
              onTap: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) =>
                      _buildPopupDialog(context, 2),
                );
              },
            ),
            const SizedBox(
              height: 20,
            ),
            ListTile(
              leading: const Icon(Icons.fitness_center),
              title: const Text('Workout #3\nHip and calves'),
              onTap: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) =>
                      _buildPopupDialog(context, 3),
                );
              },
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavBar(
        // Use the BottomNavBar widget
        currentIndex: _index,
        onTap: (int value) {
          setState(() {
            _index = value;
          });
          _submit();
        },
      ),
    );
  }
}
