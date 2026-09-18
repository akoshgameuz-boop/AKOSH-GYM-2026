import 'package:flutter/material.dart';

void main() => runApp(const AkoshGymApp());

class Workout {
  final int day;
  final String title;
  final String icon;
  final List<String> exercises;
  const Workout(this.day, this.title, this.icon, this.exercises);
}

const workouts = [
  Workout(1,'Ko‘krak + Triceps','🟢',['Bench Press 4×10','Incline Dumbbell Press 3×12','Cable Fly 3×12','Triceps Pushdown 3×12','Overhead Triceps Extension 3×12']),
  Workout(2,'Orqa + Biceps','🔵',['Lat Pulldown 4×10','Seated Cable Row 3×12','One Arm Dumbbell Row 3×10','Barbell Curl 3×12','Hammer Curl 3×12']),
  Workout(3,'Oyoq','🟠',['Squat 4×8','Leg Press 4×10','Romanian Deadlift 3×10','Leg Extension 3×12','Leg Curl 3×12','Calf Raise 4×15']),
  Workout(4,'Yelka + Qorin','🟣',['Shoulder Press 4×10','Lateral Raise 3×12','Front Raise 3×12','Face Pull 3×12','Plank 3×30s']),
  Workout(5,'Ko‘krak + Triceps','🟢',['Bench Press 4×10','Incline Dumbbell Press 3×12','Cable Fly 3×12','Triceps Pushdown 3×12']),
  Workout(6,'Orqa + Biceps','🔵',['Lat Pulldown 4×10','Seated Cable Row 3×12','Dumbbell Row 3×10','Barbell Curl 3×12']),
  Workout(7,'Dam olish','😴',['Yengil yurish va tiklanish']),
  Workout(8,'Oyoq','🟠',['Squat 4×8','Leg Press 4×10','Romanian Deadlift 3×10','Leg Curl 3×12','Calf Raise 4×15']),
  Workout(9,'Yelka + Qorin','🟣',['Shoulder Press 4×10','Lateral Raise 3×12','Face Pull 3×12','Plank 3×30s']),
  Workout(10,'Ko‘krak + Triceps','🟢',['Bench Press 4×10','Incline Press 3×10','Cable Fly 3×12','Triceps Pushdown 3×12']),
  Workout(11,'Orqa + Biceps','🔵',['Lat Pulldown 4×10','Cable Row 3×12','Dumbbell Row 3×10','Hammer Curl 3×12']),
  Workout(12,'Oyoq','🟠',['Squat 4×8','Leg Press 4×10','Leg Extension 3×12','Leg Curl 3×12']),
  Workout(13,'Yelka + Qorin','🟣',['Shoulder Press 4×10','Lateral Raise 3×12','Rear Delt Fly 3×12','Plank 3×30s']),
  Workout(14,'Dam olish','😴',['Yengil yurish va tiklanish']),
  Workout(15,'Ko‘krak + Triceps','🟢',['Bench Press 4×8','Incline Dumbbell Press 3×10','Cable Fly 3×12','Triceps Pushdown 3×12']),
  Workout(16,'Orqa + Biceps','🔵',['Lat Pulldown 4×10','Seated Row 3×10','Dumbbell Row 3×10','Barbell Curl 3×12']),
  Workout(17,'Oyoq','🟠',['Squat 4×8','Leg Press 4×10','Romanian Deadlift 3×10','Calf Raise 4×15']),
  Workout(18,'Yelka + Qorin','🟣',['Shoulder Press 4×10','Lateral Raise 3×12','Face Pull 3×12','Plank 3×40s']),
  Workout(19,'Ko‘krak + Triceps','🟢',['Bench Press 4×10','Incline Press 3×10','Cable Fly 3×12','Triceps Extension 3×12']),
  Workout(20,'Orqa + Biceps','🔵',['Lat Pulldown 4×10','Cable Row 3×12','Dumbbell Row 3×10','Hammer Curl 3×12']),
  Workout(21,'Dam olish','😴',['Tiklanish kuni']),
  Workout(22,'Oyoq','🟠',['Squat 4×8','Leg Press 4×10','Leg Extension 3×12','Leg Curl 3×12','Calf Raise 4×15']),
  Workout(23,'Yelka + Qorin','🟣',['Shoulder Press 4×10','Lateral Raise 3×12','Rear Delt Fly 3×12','Plank 3×40s']),
  Workout(24,'Ko‘krak + Triceps','🟢',['Bench Press 4×8','Incline Dumbbell Press 3×10','Cable Fly 3×12','Triceps Pushdown 3×12']),
  Workout(25,'Orqa + Biceps','🔵',['Lat Pulldown 4×10','Seated Row 3×12','Dumbbell Row 3×10','Barbell Curl 3×12']),
  Workout(26,'Oyoq','🟠',['Squat 4×8','Leg Press 4×10','Romanian Deadlift 3×10','Leg Curl 3×12']),
  Workout(27,'Yelka + Qorin','🟣',['Shoulder Press 4×10','Lateral Raise 3×12','Face Pull 3×12','Plank 3×45s']),
  Workout(28,'Dam olish','😴',['Tiklanish va yengil yurish']),
  Workout(29,'Full Body','🔥',['Squat 3×10','Bench Press 3×10','Lat Pulldown 3×10','Shoulder Press 3×10','Plank 3×40s']),
  Workout(30,'Challenge / Full Body','🏆',['Squat 3×10','Bench Press 3×10','Row 3×10','Shoulder Press 3×10','Plank 3×45s']),
];

class AkoshGymApp extends StatelessWidget {
  const AkoshGymApp({super.key});
  @override
  Widget build(BuildContext context) => MaterialApp(
    debugShowCheckedModeBanner:false, title:'AKOSH GYM',
    theme: ThemeData.dark().copyWith(
      scaffoldBackgroundColor: const Color(0xFF0B0D0C),
      colorScheme: ColorScheme.fromSeed(seedColor: Colors.greenAccent, brightness: Brightness.dark),
      cardTheme: const CardThemeData(color: Color(0xFF151916)),
    ),
    home: const HomePage(),
  );
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  State<HomePage> createState()=>_HomePageState();
}
class _HomePageState extends State<HomePage>{
  int selected=0;
  @override Widget build(BuildContext c){
    return Scaffold(
      appBar: AppBar(title: const Text('AKOSH GYM',style: TextStyle(fontWeight:FontWeight.bold)), centerTitle:true),
      body: selected==0 ? _home() : selected==1 ? _days() : _progress(),
      bottomNavigationBar: NavigationBar(
        selectedIndex:selected, onDestinationSelected:(i)=>setState(()=>selected=i),
        destinations: const [
          NavigationDestination(icon:Icon(Icons.home_outlined),label:'Bosh sahifa'),
          NavigationDestination(icon:Icon(Icons.calendar_month_outlined),label:'30 kun'),
          NavigationDestination(icon:Icon(Icons.bar_chart),label:'Progress'),
        ],
      ),
    );
  }
  Widget _home()=>SingleChildScrollView(padding:const EdgeInsets.all(16),child:Column(crossAxisAlignment:CrossAxisAlignment.start,children:[
    Container(width:double.infinity,padding:const EdgeInsets.all(22),decoration:BoxDecoration(
      borderRadius:BorderRadius.circular(22),gradient:const LinearGradient(colors:[Color(0xFF173A22),Color(0xFF101512)])),
      child:const Column(crossAxisAlignment:CrossAxisAlignment.start,children:[
        Text('🔥 30 KUNLIK CHALLENGE',style:TextStyle(fontSize:14,color:Colors.greenAccent)),
        SizedBox(height:8),Text('Bugun mashq qilish vaqti!',style:TextStyle(fontSize:25,fontWeight:FontWeight.bold)),
        SizedBox(height:6),Text('Har kuni ozgina progress — katta natija.')
      ])),
    const SizedBox(height:18),const Text('Bugungi mashg‘ulot',style:TextStyle(fontSize:20,fontWeight:FontWeight.bold)),
    const SizedBox(height:10),_workoutCard(workouts[0]),
  ]));
  Widget _days()=>ListView.builder(padding:const EdgeInsets.all(12),itemCount:workouts.length,itemBuilder:(c,i)=>_workoutCard(workouts[i]));
  Widget _workoutCard(Workout w)=>Card(child:ListTile(
    leading:CircleAvatar(child:Text(w.icon,style:const TextStyle(fontSize:20))),
    title:Text('${w.day}-kun • ${w.title}',style:const TextStyle(fontWeight:FontWeight.bold)),
    subtitle:Text('${w.exercises.length} ta mashq'),
    trailing:const Icon(Icons.arrow_forward_ios,size:16),
    onTap:()=>Navigator.push(context,MaterialPageRoute(builder:(_)=>WorkoutPage(workout:w))),
  ));
  Widget _progress()=>Center(child:Column(mainAxisAlignment:MainAxisAlignment.center,children:[
    const Icon(Icons.emoji_events,size:70,color:Colors.amber),const SizedBox(height:15),
    const Text('Progress',style:TextStyle(fontSize:25,fontWeight:FontWeight.bold)),
    const SizedBox(height:8),Text('0 / 30 kun bajarildi',style:TextStyle(color:Colors.grey[400])),
    const SizedBox(height:20),const SizedBox(width:280,child:LinearProgressIndicator(value:0.0,minHeight:10))
  ]));
}

class WorkoutPage extends StatefulWidget{
  final Workout workout; const WorkoutPage({super.key,required this.workout});
  State<WorkoutPage> createState()=>_WorkoutPageState();
}
class _WorkoutPageState extends State<WorkoutPage>{
  final done=<int>{};
  @override Widget build(BuildContext c)=>Scaffold(
    appBar:AppBar(title:Text('${widget.workout.day}-kun')),
    body:ListView(padding:const EdgeInsets.all(16),children:[
      Text('${widget.workout.icon}  ${widget.workout.title}',style:const TextStyle(fontSize:25,fontWeight:FontWeight.bold)),
      const SizedBox(height:15),
      ...widget.workout.exercises.asMap().entries.map((e)=>Card(child:Padding(padding:const EdgeInsets.all(12),child:Column(crossAxisAlignment:CrossAxisAlignment.start,children:[
        Container(height:150,width:double.infinity,decoration:BoxDecoration(color:const Color(0xFF202521),borderRadius:BorderRadius.circular(14)),
          child:const Center(child:Icon(Icons.fitness_center,size:55,color:Colors.greenAccent))),
        const SizedBox(height:10),
        Text(e.value,style:const TextStyle(fontSize:17,fontWeight:FontWeight.bold)),
        const SizedBox(height:6),
        Row(children:[
          OutlinedButton.icon(onPressed:()=>showDialog(context:context,builder:(_)=>AlertDialog(title:const Text('Dam olish taymeri'),content:const Text('Setlar orasida 60–90 soniya dam oling.'),actions:[TextButton(onPressed:()=>Navigator.pop(context),child:const Text('OK'))])),icon:const Icon(Icons.timer),label:const Text('Timer')),
          const Spacer(),
          Checkbox(value:done.contains(e.key),onChanged:(v)=>setState(()=>v==true?done.add(e.key):done.remove(e.key)))
        ])
      ])))),
      const SizedBox(height:10),
      FilledButton.icon(onPressed:()=>ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content:Text('Mashg‘ulot yakunlandi!'))),
        icon:const Icon(Icons.check),label:const Padding(padding:EdgeInsets.all(12),child:Text('MASHG‘ULOTNI YAKUNLASH')))
    ])
  );
}
