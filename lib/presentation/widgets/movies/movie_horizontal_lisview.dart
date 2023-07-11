import 'package:cinema_pedia/config/helpers/human_format.dart';
import 'package:cinema_pedia/domain/entities/movie.dart';
import 'package:flutter/material.dart';


class MovieHorizontalLisview extends StatefulWidget {

  final List<Movie> movies;
  final String? label;
  final String? subLabel;
  final VoidCallback? loadNextpage;

  const MovieHorizontalLisview({
    super.key, 
    required this.movies, 
    this.label, 
    this.subLabel, 
    this.loadNextpage
    });

  @override
  State<MovieHorizontalLisview> createState() => _MovieHorizontalLisviewState();
}

class _MovieHorizontalLisviewState extends State<MovieHorizontalLisview> {

  final scrollController = ScrollController();

  @override
  void initState() {
    super.initState();

//? con este scroll estamos haciendo que cuando llegue al final de la lista de peliculas horizontales
//? se carguelas las que siguen 
    scrollController.addListener(() {
      if (widget.loadNextpage == null) return;

      if ( (scrollController.position.pixels + 200) >= scrollController.position.maxScrollExtent){
        print('load next moovies ');
        widget.loadNextpage!();
      }
    });
  }

  @override
  void dispose() {
    
    super.dispose();
  }



  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 400,
        child: Column(
          children: [
            if( widget.label != null || widget.subLabel != null )
            _Title(title: widget.label, subTitle: widget.subLabel),

            Expanded(
              child: ListView.builder(
                controller: scrollController,
                itemCount: widget.movies.length,
                scrollDirection: Axis.horizontal,
                physics: const BouncingScrollPhysics(),
                itemBuilder: (context, index){
                  return _Slide(movie: widget.movies[index],);
                }
                )
              ),

          ],
        ),
     );
  }
}

class _Slide extends StatelessWidget {
  final Movie movie;
  const _Slide({
     required this.movie,
  });

  @override
  Widget build(BuildContext context) {
    final textStyle = Theme.of(context).textTheme;

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 8),
      child:  Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 150,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.network(
                movie.posterPath,
                fit: BoxFit.cover,
                width: 150,
                loadingBuilder: (context, child, loadingProgress) {
                  return child;
                },
                ),
            ),
          ),

          const SizedBox(height: 5,),

          SizedBox(
            width: 150,
            child: Text(
              movie.title, 
              maxLines: 2,
              style: textStyle.titleSmall
              ),
          ),

          Row(
            children: [
              Icon(Icons.star_half_outlined, color: Colors.yellow.shade800),
              const SizedBox(width: 3,),
              Text('${ movie.voteAverage }', style: textStyle.bodyMedium?.copyWith(color: Colors.yellow.shade800)),
              const SizedBox(width: 10),
              Text(HumanFormats.number(movie.popularity), style:textStyle.bodySmall,)
            ],
          )
        ],
      ),
    );
  }
}

class _Title extends StatelessWidget {

  final String? title;
  final String? subTitle;

  const _Title({
    this.title, this.subTitle,
  });

  @override
  Widget build(BuildContext context) {
    final titleStyle = Theme.of(context).textTheme.titleLarge;
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: Row(
        children: [

          if( title != null )
          Text(title!, style:titleStyle),

          const Spacer(),

          if( subTitle != null )
          FilledButton.tonal(
            style: const ButtonStyle(visualDensity: VisualDensity.compact),
            onPressed: (){}, 
            child: Text( subTitle! )
            )

        ],
      ),
    );
  }
}