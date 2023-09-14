import 'package:pokemon/exports.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool _isOpen = false;

  @override
  void initState() {
    super.initState();
    config();
  }

  void config() async {
    final authCubit = BlocProvider.of<AuthCubit>(context);
    final lastState = authCubit.state;
    if (lastState is Authenticated) {
      context.read<PokemonController>().getFavoritePokemon(lastState.user.uid);
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _isOpen = false;
        });
      },
      child: Scaffold(
          body: BlocConsumer<PokemonCubit, PokemonState>(
              builder: (context, state) {
                if (state is PokemonLoaded) {
                  return SafeArea(
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                          vertical: Responsive.screenHeight(context) * 0.04,
                          horizontal: Responsive.screenWidth(context) * 0.04),
                      child: Stack(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
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
                                  IconButton(
                                    onPressed: () {
                                      setState(() {
                                        _isOpen = !_isOpen;
                                      });
                                    },
                                    icon: const Icon(Icons.menu,
                                        color: AppColors.kSecondaryColor),
                                  )
                                ],
                              ),
                              SizedBox(
                                  height:
                                      Responsive.screenHeight(context) * 0.03),
                              Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal:
                                        Responsive.screenWidth(context) * 0.04),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: List.generate(
                                    3,
                                    (index) => Container(
                                      height: Responsive.screenHeight(context) *
                                          0.04,
                                      width: Responsive.screenWidth(context) *
                                          0.15,
                                      alignment: Alignment.center,
                                      decoration: BoxDecoration(
                                        color: index == 1
                                            ? AppColors.kPrimaryColor
                                            : AppColors.kSecondaryColor,
                                        borderRadius: index == 0
                                            ? BorderRadius.only(
                                                topLeft: Radius.circular(
                                                    Responsive.screenHeight(
                                                            context) *
                                                        0.025),
                                                bottomLeft: Radius.circular(
                                                    Responsive.screenHeight(
                                                            context) *
                                                        0.025),
                                              )
                                            : index == 2
                                                ? BorderRadius.only(
                                                    topRight: Radius.circular(
                                                        Responsive.screenHeight(
                                                                context) *
                                                            0.025),
                                                    bottomRight: Radius
                                                        .circular(Responsive
                                                                .screenHeight(
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
                                                      color: AppColors
                                                          .kScaffoldColor),
                                            )
                                          : IconButton(
                                              onPressed: () {
                                                final pokemonCubit =
                                                    BlocProvider.of<
                                                        PokemonCubit>(context);
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
                                                    ? state.previous == null
                                                        ? Icons.stop_circle
                                                        : Icons.arrow_back_ios
                                                    : state.next == null
                                                        ? Icons.stop_circle
                                                        : Icons
                                                            .arrow_forward_ios,
                                                size: 15,
                                              ),
                                            ),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                  height:
                                      Responsive.screenHeight(context) * 0.02),
                              Expanded(
                                child: GridView.builder(
                                  gridDelegate:
                                      SliverGridDelegateWithFixedCrossAxisCount(
                                          crossAxisCount: 2,
                                          crossAxisSpacing:
                                              Responsive.screenWidth(context) *
                                                  0.015,
                                          mainAxisExtent:
                                              Responsive.screenWidth(context) *
                                                  0.70,
                                          mainAxisSpacing:
                                              Responsive.screenHeight(context) *
                                                  0.05),
                                  itemCount: state.pokemon.length,
                                  itemBuilder:
                                      (BuildContext context, int index) =>
                                          PokemonCard(
                                    color: index % 2 == 0
                                        ? AppColors.evenPokemonColor
                                        : AppColors.oddPokemonColor,
                                    pokemon: state.pokemon[index],
                                  ),
                                ),
                              ),
                            ],
                          ),
                          _isOpen ? dropDownMenu() : const SizedBox(),
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
                      child: Stack(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
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
                                  IconButton(
                                    onPressed: () {
                                      setState(() {
                                        _isOpen = !_isOpen;
                                      });
                                    },
                                    icon: const Icon(Icons.menu,
                                        color: AppColors.kSecondaryColor),
                                  ),
                                ],
                              ),
                              Expanded(
                                  child: Center(
                                child: Text('No pokemon data available!',
                                    style:
                                        Theme.of(context).textTheme.bodyMedium),
                              ))
                            ],
                          ),
                          _isOpen ? dropDownMenu() : const SizedBox(),
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
              listener: (context, state) {})),
    );
  }

  Widget _menuItem(
      {required IconData icon,
      required String label,
      required VoidCallback onPressed}) {
    return Padding(
      padding: EdgeInsets.symmetric(
          vertical: Responsive.screenHeight(context) * 0.01),
      child: InkWell(
        splashColor: AppColors.kScaffoldColor,
        onTap: onPressed,
        child: Row(
          children: [
            Icon(icon, color: AppColors.kScaffoldColor),
            SizedBox(width: Responsive.screenWidth(context) * 0.015),
            Text(label,
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    fontWeight: FontWeight.w600,
                    color: AppColors.kScaffoldColor))
          ],
        ),
      ),
    );
  }

  Widget dropDownMenu() {
    return Positioned(
      top: Responsive.screenHeight(context) * 0.055,
      right: Responsive.screenWidth(context) * 0.034,
      child: Container(
        padding: EdgeInsets.symmetric(
            horizontal: Responsive.screenWidth(context) * 0.04,
            vertical: Responsive.screenHeight(context) * 0.01),
        decoration: BoxDecoration(
            color: AppColors.kPrimaryColor,
            borderRadius:
                BorderRadius.circular(Responsive.screenWidth(context) * 0.02)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _menuItem(
                icon: Icons.payment,
                label: 'My Favorite',
                onPressed: () {
                  setState(() {
                    _isOpen = false;
                  });
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const MyFavorite(),
                    ),
                  );
                }),
            _menuItem(
                icon: Icons.logout,
                label: 'Logout',
                onPressed: () {
                  final authCubit = BlocProvider.of<AuthCubit>(context);
                  authCubit.signOut();
                })
          ],
        ),
      ),
    );
  }
}
