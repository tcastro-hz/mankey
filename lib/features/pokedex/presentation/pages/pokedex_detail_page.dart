import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hello_world/core/injection_container.dart';
import 'package:hello_world/features/pokedex/presentation/bloc/pokemon_detail_bloc.dart';
import 'package:hello_world/features/pokedex/presentation/widgets/loading_widget.dart';
import 'package:hello_world/features/pokedex/presentation/widgets/message_display.dart';
import 'package:hello_world/features/pokedex/presentation/widgets/pokemon_details_display.dart';

class PokedexDetailPage extends StatelessWidget {
  final String index;
  final String name;
  final String imgUrl;

  const PokedexDetailPage({this.index, this.name, this.imgUrl});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            expandedHeight: 300,
            flexibleSpace: FlexibleSpaceBar(
              title: Text("#$index $name"),
              background: Hero(
                tag: "hero-$index",
                child: CachedNetworkImage(
                  imageUrl: this.imgUrl,
                  placeholder: (context, url) => CircularProgressIndicator(),
                  errorWidget: (context, url, error) => Icon(Icons.error),
                ),
              ),
            ),
          ),
          buildBody(context, index)
        ],
      ),
    );
  }

  BlocProvider<PokemonDetailBloc> buildBody(
      BuildContext context, String number) {
    return BlocProvider(
        create: (_) => sl<PokemonDetailBloc>(),
        child: BlocBuilder<PokemonDetailBloc, PokemonDetailState>(
          builder: (context, state) {
            if (state is Empty) {
              dispatchGetData(context, number);
              return SliverToBoxAdapter(
                  child: SizedBox(
                      height: 200,
                      child: Center(
                          child: MessageDisplay(message: 'Start searching!'))));
            } else if (state is Loading) {
              return SliverToBoxAdapter(
                  child: SizedBox(
                      height: 200, child: Center(child: LoadingWidget())));
            } else if (state is Loaded) {
              return PokemonDetailsDisplay(pokemon: state.details);
            } else if (state is Error) {
              return SliverToBoxAdapter(
                  child: SizedBox(
                      height: 200,
                      child: Center(
                          child: MessageDisplay(
                        message: state.message,
                      ))));
            } else {
              return MessageDisplay(
                message: 'else',
              );
            }
          },
        ));
  }
}

void dispatchGetData(context, String number) {
  BlocProvider.of<PokemonDetailBloc>(context)
      .add(GetPokemonDetailsEvent(number));
}
