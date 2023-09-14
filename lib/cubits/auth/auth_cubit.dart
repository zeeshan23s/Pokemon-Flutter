import '../../exports.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  AuthCubit() : super(AuthInitial()) {
    _checkCurrentUser();
  }

  Future<void> _checkCurrentUser() async {
    emit(AuthLoading());
    final user = _auth.currentUser;
    if (user != null) {
      await PokemonController.getFavoritePokemon();
      emit(Authenticated(user));
    } else {
      emit(Unauthenticated());
    }
  }

  Future<void> signInWithEmailAndPassword(String email, String password) async {
    try {
      emit(AuthLoading());
      final UserCredential userCredential =
          await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      final User user = userCredential.user!;
      await PokemonController.getFavoritePokemon();
      emit(Authenticated(user));
    } on FirebaseAuthException catch (e) {
      emit(AuthError(e.message ?? 'Login Unsuccessful!'));
    } catch (e) {
      emit(AuthError(e.toString()));
    }
  }

  Future<void> signUpWithEmailAndPassword(
      String email, String password, String name) async {
    try {
      emit(AuthLoading());
      final UserCredential userCredential = await _auth
          .createUserWithEmailAndPassword(email: email, password: password);
      final User user = userCredential.user!;
      user.updateDisplayName(name);
      await PokemonController.getFavoritePokemon();
      emit(Authenticated(user));
    } on FirebaseAuthException catch (e) {
      emit(AuthError(e.message ?? 'Registration Unsuccessful!'));
    } catch (e) {
      emit(AuthError(e.toString()));
    }
  }

  Future<void> signOut() async {
    await _auth.signOut();
    emit(Unauthenticated());
  }
}
