import 'package:pokemon/exports.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: BlocConsumer<PokemonCubit, PokemonState>(
            builder: (context, state) {
              if (state is PokemonLoaded) {
                return SafeArea(
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                        vertical: Responsive.screenHeight(context) * 0.04,
                        horizontal: Responsive.screenWidth(context) * 0.04),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Home',
                          style: Theme.of(context)
                              .textTheme
                              .headlineLarge
                              ?.copyWith(
                                  color: AppColors.kPrimaryColor,
                                  fontWeight: FontWeight.w700),
                        ),
                        SizedBox(
                            height: Responsive.screenHeight(context) * 0.03),
                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal:
                                  Responsive.screenWidth(context) * 0.04),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: List.generate(
                              3,
                              (index) => Container(
                                height: Responsive.screenHeight(context) * 0.04,
                                width: Responsive.screenWidth(context) * 0.15,
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  color: index == 1
                                      ? AppColors.kPrimaryColor
                                      : AppColors.kSecondaryColor,
                                  borderRadius: index == 0
                                      ? BorderRadius.only(
                                          topLeft: Radius.circular(
                                              Responsive.screenHeight(context) *
                                                  0.025),
                                          bottomLeft: Radius.circular(
                                              Responsive.screenHeight(context) *
                                                  0.025),
                                        )
                                      : index == 2
                                          ? BorderRadius.only(
                                              topRight: Radius.circular(
                                                  Responsive.screenHeight(
                                                          context) *
                                                      0.025),
                                              bottomRight: Radius.circular(
                                                  Responsive.screenHeight(
                                                          context) *
                                                      0.025),
                                            )
                                          : BorderRadius.circular(0),
                                ),
                                child: index == 1
                                    ? Text(
                                        state.pageIndex.toString(),
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyMedium
                                            ?.copyWith(
                                                color:
                                                    AppColors.kScaffoldColor),
                                      )
                                    : IconButton(
                                        onPressed: () {
                                          final pokemonCubit =
                                              BlocProvider.of<PokemonCubit>(
                                                  context);
                                          if (index == 0 &&
                                              state.previous != null) {
                                            pokemonCubit.getPokemonList(
                                                state.previous!,
                                                state.pageIndex - 1);
                                          }
                                          if (index == 2 &&
                                              state.next != null) {
                                            pokemonCubit.getPokemonList(
                                                state.next!,
                                                state.pageIndex + 1);
                                          }
                                        },
                                        icon: Icon(
                                          index == 0
                                              ? Icons.arrow_back_ios
                                              : Icons.arrow_forward_ios,
                                          size: 15,
                                        ),
                                      ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                            height: Responsive.screenHeight(context) * 0.02),
                        Expanded(
                          child: GridView.builder(
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2,
                                    crossAxisSpacing:
                                        Responsive.screenWidth(context) * 0.015,
                                    mainAxisExtent:
                                        Responsive.screenWidth(context) * 0.70,
                                    mainAxisSpacing:
                                        Responsive.screenHeight(context) *
                                            0.05),
                            itemCount: state.pokemon.length,
                            itemBuilder: (BuildContext context, int index) =>
                                PokemonCard(
                              color: index % 2 == 0
                                  ? AppColors.evenPokemonColor
                                  : AppColors.oddPokemonColor,
                              name: state.pokemon[index].name!,
                              height: state.pokemon[index].height!,
                              width: state.pokemon[index].width!,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              } else if (state is PokemonError) {
                return SafeArea(
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                        vertical: Responsive.screenHeight(context) * 0.04,
                        horizontal: Responsive.screenWidth(context) * 0.04),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Home',
                          style: Theme.of(context)
                              .textTheme
                              .headlineLarge
                              ?.copyWith(
                                  color: AppColors.kPrimaryColor,
                                  fontWeight: FontWeight.w700),
                        ),
                        Expanded(
                            child: Center(
                          child: Text('No pokemon data available!',
                              style: Theme.of(context).textTheme.bodyMedium),
                        ))
                      ],
                    ),
                  ),
                );
              } else {
                return Center(
                    child: SizedBox(
                  height: Responsive.screenWidth(context) * 0.55,
                  width: Responsive.screenWidth(context) * 0.55,
                  child: const LoadingIndicator(
                      indicatorType: Indicator.ballScaleRippleMultiple,
                      colors: [
                        AppColors.kPrimaryColor,
                        AppColors.kSecondaryColor
                      ]),
                ));
              }
            },
            listener: (context, state) {}));
  }
}
