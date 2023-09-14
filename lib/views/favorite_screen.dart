import '../exports.dart';

class MyFavorite extends StatelessWidget {
  const MyFavorite({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
              vertical: Responsive.screenHeight(context) * 0.04,
              horizontal: Responsive.screenWidth(context) * 0.04),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(Icons.arrow_back_ios,
                        color: AppColors.kSecondaryColor),
                  ),
                  SizedBox(width: Responsive.screenWidth(context) * 0.02),
                  Text(
                    'Favorite Pokemons',
                    style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                        color: AppColors.kPrimaryColor,
                        fontWeight: FontWeight.w700),
                  ),
                ],
              ),
              SizedBox(height: Responsive.screenHeight(context) * 0.03),
              Expanded(
                child: GridView(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: Responsive.screenWidth(context) * 0.015,
                      mainAxisExtent: Responsive.screenWidth(context) * 0.70,
                      mainAxisSpacing: Responsive.screenHeight(context) * 0.05),
                  children: PokemonController.favorite
                      .asMap()
                      .entries
                      .map((pokemon) => PokemonCard(
                          color: PokemonController.favorite
                                          .indexOf(pokemon.value) %
                                      2 ==
                                  0
                              ? AppColors.evenPokemonColor
                              : AppColors.oddPokemonColor,
                          pokemon: pokemon.value))
                      .toList(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
