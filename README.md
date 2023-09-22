# Pokedex App
The Pokedex App is a mobile application developed using Flutter, Firebase, Bloc (with Cubit), and other libraries. This app allows users to explore and manage their favorite Pokémon. It integrates with the Pokedex API to fetch Pokémon data and Firebase for user authentication and data storage.

## Features
- **Splash Screen**: A creative splash screen is displayed upon app launch. Users are directed to either the home screen or login screen based on their authentication status.
- **Login and Signup**: Users can create new accounts or log in using their email and password. Flutter Form Builder is used to validate user data, ensuring that only alphabets are accepted in the name field. Bloc is employed for the login/signup process.
- **Home Screen**: The home screen displays a list of Pokémon retrieved from the Pokedex API. Users can mark Pokémon as their favorites, and this information is stored locally.
- **Favorites Screen**: The favorites screen showcases all the favorite Pokémon of the logged-in user.

## Prerequisites
Before you begin, ensure you have met the following requirements:
- Flutter and Dart are installed on your development machine.

## Getting Started
Follow these steps to set up and run the Pokedex app:

- Clone the repository:<br>
***git clone https://github.com/zeeshan564/Pokemon-Flutter.git***

- Change the directory to the project folder:<br>
***cd Pokemon-Flutter***

- Install dependencies:
***flutter pub get***

- Run the app:
***flutter run***

## Configuration
To configure Firebase authentication and storage, follow these steps:

- Create a Firebase project on the Firebase Console.
- Set up Firebase Authentication with email and password.
- Add your Firebase configuration to android/app/google-services.json (for Android) and ios/Runner/GoogleService-Info.plist (for iOS).
- Configure Firebase in your Flutter app by adding the necessary plugins and dependencies. Refer to the official documentation for guidance.

## Libraries and Dependencies

- Flutter
- Firebase
- Bloc and Cubit
- Flutter Form Builder
- Shared Preference (for local data storage)
- Pokedex API

## Screenshots
<img src="https://github.com/zeeshan564/Pokemon-Flutter/assets/97142240/10ee9747-aa56-4bc0-a818-d6544b20a893" width="200" height="400" /> <nbsp>
<img src="https://github.com/zeeshan564/Pokemon-Flutter/assets/97142240/e127310b-7f3f-43d1-83f9-c696a3ec87ea" width="200" height="400" /> <nbsp>
<img src="https://github.com/zeeshan564/Pokemon-Flutter/assets/97142240/5bbc3fc9-01b6-4fd4-9c53-c115cf99e6bc" width="200" height="400" /> <nbsp>
<img src="https://github.com/zeeshan564/Pokemon-Flutter/assets/97142240/5f5f9b2f-32d0-4e02-866a-a5149838cb42" width="200" height="400" /> <nbsp>
<img src="https://github.com/zeeshan564/Pokemon-Flutter/assets/97142240/10c4db1e-ca1c-49a7-80f2-b591b30e6b12" width="200" height="400" /> <nbsp>
<img src="https://github.com/zeeshan564/Pokemon-Flutter/assets/97142240/15bb1a73-0915-472c-bb26-b29a513669be" width="200" height="400" /> <nbsp>
<img src="https://github.com/zeeshan564/Pokemon-Flutter/assets/97142240/8a01bc73-8db3-483e-8fbc-2936f786a07a" width="200" height="400" /> <nbsp>
<img src="https://github.com/zeeshan564/Pokemon-Flutter/assets/97142240/c1b5b93d-248f-4c37-8c17-71841d709e20" width="200" height="400" /> <nbsp>

## Contributing
Contributions are welcome! Feel free to open issues or submit pull requests to help improve this project.

## License
This project is licensed under the MIT License.

## Contact
If you have any questions or feedback, please contact ***shanirajput20092000@gmail.com***.

## Acknowledgments
- Pokedex API for providing Pokémon data.
- The Flutter and Firebase communities for their excellent resources and documentation.
