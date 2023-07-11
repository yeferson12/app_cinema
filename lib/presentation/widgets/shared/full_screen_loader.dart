import 'package:flutter/material.dart';


class FullScrennLoader extends StatelessWidget {
  const FullScrennLoader({super.key});


  Stream<String> getLoaderMessages(){
    final messages = <String> [
      'Cargando peliculas',
      'Comprando palomitas de maíz',
      'Cargando populares',
      'Llamando a mi novia',
      'Ya casi...',
      'Esto esta tardando mucho :(',
    ];

    return Stream.periodic(const Duration(milliseconds: 1200), (step){
      return messages[step];
    }).take(messages.length);

  }

  @override
  Widget build(BuildContext context) {
    return  Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Esperer por favor'),
            const SizedBox(height: 10,),
            const CircularProgressIndicator(strokeWidth: 2,),
            const SizedBox(height: 10,),
            
            StreamBuilder(
              stream: getLoaderMessages(), 
              builder: ( context, snapshot ){
                if( !snapshot.hasData ) return const Text('Cargando....');

                return Text(snapshot.data!);
              }
              )
          ],
        ),
     );
  }
}