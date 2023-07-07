import 'package:cinema_pedia/presentation/screens/screen.dart';
import 'package:go_router/go_router.dart';

final appRouter = GoRouter(initialLocation: '/', routes: [
  GoRoute(
    path: '/',
    name: HomaScreen.name,
    builder: (context, state) => const HomaScreen(),
    )
]);
