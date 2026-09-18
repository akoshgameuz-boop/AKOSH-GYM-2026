
import 'package:flutter/material.dart';

void main() => runApp(const AkoshGym());

class Day {
  final int n;
  final String title, emoji;
  final List<String> exercises;
  const Day(this.n, this.title, this.emoji, this.exercises);
}

final days = List.generate(30, (i) {
  final n = i + 1;
  if ([7,14,21,28].contains(n)) return Day(n, 'Dam olish', '😴', ['Yengil yurish • 20–30 min']);
  if ([3,8,12,17,22,26].contains(n)) return Day(n, 'Oyoq', '🟠', ['Squat 4×8','Leg Press 4×10','Romanian Deadlift 3×10','Leg Extension 3×12','Calf Raise 4×15']);
  if ([4,9,13,18,23,27].contains(n)) return Day(n, 'Yelka + Qorin', '🟣', ['Shoulder Press 4×10','Lateral Raise 3×12','Face Pull 3×12','Plank 3×40s']);
  if ([2,6,11,16,20,25].contains(n)) return Day(n, 'Orqa + Biceps', '🔵', ['Lat Pulldown 4×10','Seated Cable Row 3×12','Dumbbell Row 3×10','Hammer Curl 3×12']);
  if ([29,30].contains(n)) return Day(n, 'Full Body', '🔥', ['Squat 3×10','Bench Press 3×10','Lat Pulldown 3×10','Shoulder Press 3×10','Plank 3×40s']);
  return Day(n, 'Ko‘krak + Triceps', '🟢', ['Bench Press 4×10','Incline Dumbbell Press 3×12','Cable Fly 3×12','Triceps Pushdown 3×12']);
});

class AkoshGym extends StatelessWidget {
  const AkoshGym({super.key});
  @override
  Widget build(BuildContext c) => MaterialApp(
    debugShowCheckedModeBanner: false,
    title: 'AKOSH GYM',
    theme: ThemeData(
      brightness: Brightness.dark,
      scaffoldBackgroundColor: const Color(0xFF080B09),
      colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF39FF88), brightness: Brightness.dark),
      useMaterial3: true,
    ),
    home: const Home(),
  );
}

class Home extends StatefulWidget {
  const Home({super.key});
  @override State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int tab = 0;
  final done = <int>{};

  @override
  Widget build(BuildContext c) => Scaffold(
    body: SafeArea(child: [home(), program(), progress()][tab]),
    bottomNavigationBar: NavigationBar(
      selectedIndex: tab,
      onDestinationSelected: (i) => setState(() => tab = i),
      destinations: const [
        NavigationDestination(icon: Icon(Icons.home_outlined), selectedIcon: Icon(Icons.home), label: 'Bosh sahifa'),
        NavigationDestination(icon: Icon(Icons.calendar_month_outlined), selectedIcon: Icon(Icons.calendar_month), label: '30 kun'),
        NavigationDestination(icon: Icon(Icons.insights_outlined), selectedIcon: Icon(Icons.insights), label: 'Progress'),
      ],
    ),
  );

  Widget header() => Row(children: [
    Container(width: 50, height: 50, decoration: BoxDecoration(color: const Color(0xFF39FF88), borderRadius: BorderRadius.circular(16)),
      child: const Icon(Icons.fitness_center, color: Colors.black, size: 27)),
    const SizedBox(width: 12),
    const Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text('AKOSH GYM', style: TextStyle(fontSize: 23, fontWeight: FontWeight.w900)),
      Text('TRAIN • PROGRESS • REPEAT', style: TextStyle(fontSize: 10, color: Color(0xFF39FF88), fontWeight: FontWeight.bold)),
    ]),
    const Spacer(), const Icon(Icons.notifications_none)
  ]);

  Widget home() => SingleChildScrollView(
    padding: const EdgeInsets.all(18),
    child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      header(), const SizedBox(height: 24),
      Container(width: double.infinity, padding: const EdgeInsets.all(22),
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(28),
          gradient: const LinearGradient(begin: Alignment.topLeft, end: Alignment.bottomRight,
            colors: [Color(0xFF17522E), Color(0xFF0D1510)])),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          const Text('30 KUNLIK CHALLENGE', style: TextStyle(color: Color(0xFF9BFFBD), fontWeight: FontWeight.bold)),
          const SizedBox(height: 8),
          Text('${days.first.emoji}  ${days.first.title}', style: const TextStyle(fontSize: 27, fontWeight: FontWeight.w900)),
          const SizedBox(height: 7),
          Text('${days.first.exercises.length} ta mashq • 45–60 daqiqa', style: TextStyle(color: Colors.grey[300])),
          const SizedBox(height: 18),
          SizedBox(width: double.infinity, child: FilledButton(
            onPressed: () => openDay(days.first),
            child: const Padding(padding: EdgeInsets.all(11), child: Text('MASHQNI BOSHLASH')),
          ))
        ])),
      const SizedBox(height: 24),
      const Text('Bugungi progress', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w800)),
      const SizedBox(height: 12),
      Row(children: [
        stat('${done.length}', 'Bajarildi'), const SizedBox(width: 10),
        stat('${30-done.length}', 'Qoldi'), const SizedBox(width: 10),
        stat('${(done.length/30*100).round()}%', 'Foiz'),
      ]),
      const SizedBox(height: 24),
      const Text('Tezkor menyu', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w800)),
      const SizedBox(height: 10),
      quick(Icons.calendar_month, '30 kunlik dastur', () => setState(() => tab = 1)),
      quick(Icons.timer_outlined, 'Dam olish taymeri', () => timer()),
      quick(Icons.insights, 'Mening progressim', () => setState(() => tab = 2)),
    ]),
  );

  Widget stat(String a, String b) => Expanded(child: Container(padding: const EdgeInsets.symmetric(vertical: 17),
    decoration: BoxDecoration(color: const Color(0xFF141916), borderRadius: BorderRadius.circular(18)),
    child: Column(children: [Text(a, style: const TextStyle(fontSize: 23, fontWeight: FontWeight.w900, color: Color(0xFF39FF88))), const SizedBox(height: 3), Text(b, style: TextStyle(color: Colors.grey[400], fontSize: 12))])));

  Widget quick(IconData icon, String text, VoidCallback fn) => Card(color: const Color(0xFF121613), child: ListTile(
    leading: const CircleAvatar(backgroundColor: Color(0xFF1C2921), child: Icon(Icons.fitness_center, color: Color(0xFF39FF88))),
    title: Text(text, style: const TextStyle(fontWeight: FontWeight.bold)), trailing: const Icon(Icons.chevron_right), onTap: fn));

  Widget program() => ListView(padding: const EdgeInsets.fromLTRB(14,18,14,20), children: [
    const Text('30 KUNLIK DASTUR', style: TextStyle(fontSize: 25, fontWeight: FontWeight.w900)),
    Text('Har kuni bir qadam oldinga.', style: TextStyle(color: Colors.grey[400])),
    const SizedBox(height: 15),
    ...days.map((d) => Card(color: const Color(0xFF121613), margin: const EdgeInsets.only(bottom: 8), child: ListTile(
      leading: CircleAvatar(backgroundColor: const Color(0xFF1C2921), child: Text(d.emoji)),
      title: Text('${d.n}-kun • ${d.title}', style: const TextStyle(fontWeight: FontWeight.bold)),
      subtitle: Text('${d.exercises.length} ta mashq'),
      trailing: done.contains(d.n) ? const Icon(Icons.check_circle, color: Color(0xFF39FF88)) : const Icon(Icons.chevron_right),
      onTap: () => openDay(d),
    )))
  ]);

  Widget progress() => Center(child: Padding(padding: const EdgeInsets.all(25), child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
    const Icon(Icons.emoji_events, size: 85, color: Color(0xFF39FF88)),
    const SizedBox(height: 18),
    const Text('SIZNING PROGRESSINGIZ', textAlign: TextAlign.center, style: TextStyle(fontSize: 23, fontWeight: FontWeight.w900)),
    const SizedBox(height: 10), Text('${done.length} / 30 kun', style: const TextStyle(fontSize: 18)),
    const SizedBox(height: 20),
    ClipRRect(borderRadius: BorderRadius.circular(20), child: LinearProgressIndicator(value: done.length/30, minHeight: 12)),
  ])));

  void openDay(Day d) async {
    final result = await Navigator.push<int>(context, MaterialPageRoute(builder: (_) => DayPage(day: d)));
    if (result == d.n) setState(() => done.add(d.n));
  }

  void timer() => showDialog(context: context, builder: (_) => AlertDialog(
    title: const Text('Dam olish taymeri'), content: const Text('Setlar orasida odatda 60–90 soniya dam oling.'),
    actions: [TextButton(onPressed: () => Navigator.pop(context), child: const Text('Yopish'))],
  ));
}

class DayPage extends StatefulWidget {
  final Day day;
  const DayPage({super.key, required this.day});
  @override State<DayPage> createState() => _DayPageState();
}

class _DayPageState extends State<DayPage> {
  final checked = <int>{};

  @override
  Widget build(BuildContext c) => Scaffold(
    appBar: AppBar(title: Text('${widget.day.n}-kun')),
    body: ListView(padding: const EdgeInsets.all(16), children: [
      Text('${widget.day.emoji}  ${widget.day.title}', style: const TextStyle(fontSize: 27, fontWeight: FontWeight.w900)),
      const SizedBox(height: 15),
      ...widget.day.exercises.asMap().entries.map((e) => Card(
        color: const Color(0xFF121613), margin: const EdgeInsets.only(bottom: 13),
        clipBehavior: Clip.antiAlias,
        child: Column(children: [
          Container(height: 155, width: double.infinity,
            decoration: const BoxDecoration(gradient: LinearGradient(colors: [Color(0xFF17211B), Color(0xFF0D120F)])),
            child: const Center(child: Icon(Icons.fitness_center, size: 58, color: Color(0xFF39FF88)))),
          ListTile(
            title: Text(e.value, style: const TextStyle(fontWeight: FontWeight.bold)),
            subtitle: const Text('Mashq rasmi shu joyda ko‘rsatiladi'),
            trailing: Checkbox(value: checked.contains(e.key), onChanged: (v) => setState(() => v == true ? checked.add(e.key) : checked.remove(e.key))),
          )
        ]))),
      const SizedBox(height: 5),
      FilledButton.icon(onPressed: () => Navigator.pop(context, widget.day.n), icon: const Icon(Icons.check_circle),
        label: const Padding(padding: EdgeInsets.all(13), child: Text('MASHG‘ULOTNI YAKUNLASH')))
    ]),
  );
}
