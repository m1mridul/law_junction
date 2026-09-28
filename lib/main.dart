import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'screens/auth/login_screen.dart';
import 'providers/auth_provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Supabase.initialize(
    url: 'https://ddamioauqmolrbmwsvih.supabase.co',
    publishableKey: 'sb_publishable_3vLUP6YB1V91PPZgAGCMgw_DZ3BX2Hv',
  );

  runApp(const LawJunctionApp());
}

class LawJunctionApp extends StatelessWidget {
  const LawJunctionApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => AuthProvider())],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Law Junction',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF0F4C4C)),
          useMaterial3: true,
        ),
        home: const LoginScreen(),
      ),
    );
  }
}
