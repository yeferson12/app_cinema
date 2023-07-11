import 'package:cinema_pedia/presentation/screens/screen.dart';
import 'package:go_router/go_router.dart';

final appRouter = GoRouter(initialLocation: '/', routes: [
  GoRoute(
      path: '/',
      name: HomaScreen.name,
      builder: (context, state) => const HomaScreen(),
      routes: [
        GoRoute(
            path: 'movie/:id',
            name: MovieScreen.name,
            builder: (context, state) =>
                MovieScreen(movieId: state.pathParameters['id'] ?? 'no-id')
            ),
      ]),
]);
