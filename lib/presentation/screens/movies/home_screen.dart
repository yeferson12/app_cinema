import 'package:cinema_pedia/presentation/providers/movies/movies_providers.dart';
import 'package:cinema_pedia/presentation/providers/provider.dart';
import 'package:cinema_pedia/presentation/widgets/widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomaScreen extends StatelessWidget {
  static const name = 'home-screen';

  const HomaScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: _HomeView(),
      ),
      bottomNavigationBar: CustomBottomNavigation(),
    );
  }
}

class _HomeView extends ConsumerStatefulWidget {
  const _HomeView({
    super.key,
  });

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends ConsumerState<_HomeView> {
  @override
  void initState() {
    super.initState();

    ref.read(nowplayingMoviesProvider.notifier).loadNextPage();
    ref.read(popularMoviesProvider.notifier).loadNextPage();
    ref.read(topRatedMoviesProvider.notifier).loadNextPage();
    ref.read(upComingMoviesProvider.notifier).loadNextPage();
  }

  @override
  Widget build(BuildContext context) {

    final initialLoading = ref.watch(initialLoadingProvider);
    if( initialLoading ) return const FullScrennLoader(); 

    final nowPlayingMovies = ref.watch( nowplayingMoviesProvider );
    final popularMovies    = ref.watch( popularMoviesProvider );
    final topRatedMovies   = ref.watch( topRatedMoviesProvider );
    final upComingMovies   = ref.watch( upComingMoviesProvider );


    return CustomScrollView(
      slivers:[
        const SliverAppBar(
          floating: true,
          flexibleSpace: FlexibleSpaceBar(),
          title: CustomAppbar(),
        ),
        SliverList(delegate: SliverChildBuilderDelegate((context, index) {
          return Column(
        children: [
          MovieSlideShow(movie: nowPlayingMovies.isNotEmpty ? nowPlayingMovies.sublist(0,6) : []),
          MovieHorizontalLisview(
            movies: nowPlayingMovies,
            label: 'En cine', 
            subLabel: 'lunes 20', 
            loadNextpage: ()=> ref.read(nowplayingMoviesProvider.notifier).loadNextPage(),
            ),
            MovieHorizontalLisview(
            movies: topRatedMovies,
            label: 'Próximamente', 
            subLabel: 'mes 2', 
            loadNextpage: ()=> ref.read(topRatedMoviesProvider.notifier).loadNextPage(),
            ),
            MovieHorizontalLisview(
            movies: popularMovies,
            label: 'Populares', 
            // subLabel: 'lunes 20', 
            loadNextpage: ()=> ref.read(popularMoviesProvider.notifier).loadNextPage(),
            ),
            MovieHorizontalLisview(
            movies: upComingMovies,
            label: 'Coming', 
            subLabel: 'comid', 
            loadNextpage: ()=> ref.read(upComingMoviesProvider.notifier).loadNextPage(),
            ),
    
            const SizedBox(height: 10)
        ],
      );
        }, childCount: 1))
      ] 
    );
  }
}
