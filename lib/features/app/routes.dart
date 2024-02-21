import 'package:forestvpn_test/features/presentation/homepage/homepage.dart';
import 'package:forestvpn_test/features/presentation/homepage/news_details.dart';
import 'package:go_router/go_router.dart';

class AppRouter {
  GoRouter generateRouter() {
    return GoRouter(routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const HomePage(),
      ),
      GoRoute(
        path: '/newsdetails',
        builder: (context, state) => const NewsDetails(),
      ),
    ]);
  }
}
