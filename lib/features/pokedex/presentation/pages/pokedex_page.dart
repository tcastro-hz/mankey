
import 'package:flutter/material.dart';
import 'package:hello_world/core/injection_container.dart';
import 'package:hello_world/features/pokedex/domain/usecases/get_pokemon_list.dart'; 
import 'package:hello_world/features/pokedex/presentation/bloc/bloc.dart';
import 'package:hello_world/features/pokedex/presentation/bloc/pokedex_bloc.dart';
import 'package:hello_world/features/pokedex/presentation/widgets/loading_widget.dart';
import 'package:hello_world/features/pokedex/presentation/widgets/message_display.dart';
import 'package:hello_world/features/pokedex/presentation/widgets/pokedex_display.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PokedexPage extends StatelessWidget {

   @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pokedex'),
      ),
      body: Container(
      decoration: BoxDecoration(
        color: Colors.white,
      ),
        child: buildBody(context),
      ),
    );
  }



 BlocProvider<PokedexBloc> buildBody(BuildContext context) {
    return BlocProvider(
      create: (_) => sl<PokedexBloc>(),
      
      child: Center(
         
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: <Widget>[
              SizedBox(height: 10),
              // Top half
              BlocBuilder<PokedexBloc, PokedexState>(
                builder: (context, state) {
                  if (state is Empty) {
                    dispatchGetList(context);
                    return MessageDisplay(
                      message: 'Start searching!',
                    );
                  } else if (state is Loading) {
                    return LoadingWidget();
                  } else if (state is Loaded) {
                    return PokedexDisplay(pokemons: state.pokemons);
                  } else if (state is Error) {
                    return MessageDisplay(
                      message: state.message,
                    );
                  } else{
                    return MessageDisplay(
                      message: 'else',
                    );
                  }
                },
              )
               
              // Bottom half
               
            ],
          ),
        ),
      ),
    );
  }
}


  void dispatchGetList(context) {
    
    BlocProvider.of<PokedexBloc>(context).add(GetPokemonListEvent());
  }