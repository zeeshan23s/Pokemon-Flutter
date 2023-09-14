import 'package:provider/provider.dart';

import '../../exports.dart';

class PokemonCard extends StatefulWidget {
  final Color color;
  final Pokemon pokemon;
  const PokemonCard({
    super.key,
    required this.color,
    required this.pokemon,
  });

  @override
  State<PokemonCard> createState() => _PokemonCardState();
}

class _PokemonCardState extends State<PokemonCard> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: Responsive.screenHeight(context) * 0.33,
      width: Responsive.screenWidth(context) * 0.45,
      child: Stack(
        children: [
          Positioned(
            bottom: 0,
            child: Container(
              height: Responsive.screenHeight(context) * 0.25,
              width: Responsive.screenWidth(context) * 0.45,
              decoration: BoxDecoration(
                color: widget.color,
                borderRadius: BorderRadius.circular(
                    Responsive.screenWidth(context) * 0.08),
              ),
              child: Column(
                children: [
                  SizedBox(height: Responsive.screenHeight(context) * 0.1),
                  Text(
                    widget.pokemon.name!.replaceFirst(widget.pokemon.name![0],
                        widget.pokemon.name![0].toUpperCase()),
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        fontWeight: FontWeight.w600,
                        color: AppColors.kScaffoldColor),
                  ),
                  SizedBox(height: Responsive.screenHeight(context) * 0.015),
                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: Responsive.screenWidth(context) * 0.02),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        RichText(
                          text: TextSpan(
                            text: 'h: ',
                            style: Theme.of(context)
                                .textTheme
                                .bodySmall
                                ?.copyWith(color: AppColors.kScaffoldColor),
                            children: <TextSpan>[
                              TextSpan(
                                text: widget.pokemon.height,
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyMedium
                                    ?.copyWith(
                                        fontWeight: FontWeight.w600,
                                        color: AppColors.kScaffoldColor),
                              )
                            ],
                          ),
                        ),
                        RichText(
                          text: TextSpan(
                            text: 'w: ',
                            style: Theme.of(context)
                                .textTheme
                                .bodySmall
                                ?.copyWith(color: AppColors.kScaffoldColor),
                            children: <TextSpan>[
                              TextSpan(
                                text: widget.pokemon.width,
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyMedium
                                    ?.copyWith(
                                        fontWeight: FontWeight.w600,
                                        color: AppColors.kScaffoldColor),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: Responsive.screenHeight(context) * 0.01),
                  Consumer<PokemonController>(
                    builder: (context, pokemon, child) {
                      return IconButton(
                        onPressed: () {
                          setState(() {
                            if (pokemon.favorite.contains(widget.pokemon)) {
                              pokemon.removeFavoritePokemon(widget.pokemon);
                            } else {
                              pokemon.addFavoritePokemon(widget.pokemon);
                            }
                          });
                        },
                        icon: Icon(
                            pokemon.favorite.contains(widget.pokemon)
                                ? Icons.favorite
                                : Icons.favorite_border,
                            color: Colors.red),
                      );
                    },
                  )
                ],
              ),
            ),
          ),
          Positioned(
            top: 0,
            left: 5,
            right: 5,
            child: SizedBox(
              height: Responsive.screenWidth(context) * 0.35,
              width: Responsive.screenWidth(context) * 0.35,
              child: SvgPicture.asset(AppAssets.splashSVG),
            ),
          ),
        ],
      ),
    );
  }
}
