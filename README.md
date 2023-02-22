 https://github.com/lijsamuael/flutter-health-monitoring-app 
Flutter Health Monitoring App
Flutter Health Monitoring App is a mobile application developed using the Flutter framework to help patients contact their doctors and other available doctors. This app provides several features to help patients get in touch with doctors, schedule appointments, and chat with them. It also offers a symptom prediction feature based on the symptoms shared by the patient.

This documentation is a comprehensive guide for understanding the working of the Flutter Health Monitoring App. The application is designed to help patients connect with their doctors and find other available doctors as well. The app provides features such as doctor profiles, video call, voice call, chat, appointment booking, and symptom prediction based on input. This guide will take you through the features and functionality of the application in detail.

The Flutter Health Monitoring App is developed using the Flutter framework. The app has a clean and user-friendly interface that provides easy navigation to its users. It is a responsive app that can run on multiple devices such as mobile phones and tablets. The application has various pages such as the home page, doctors page, appointment page, profile page, message page, doctor's profile page, login page, and signup page. In this documentation, we will discuss each page and its functionality in detail.

Functionality
The Flutter Health Monitoring App is designed to provide patients with an easy-to-use platform to contact their doctors, schedule appointments, and chat with them. The app offers several features that make it possible for users to access a wide range of doctors from different specialties. The following are some of the app's essential features:

Registration and login
Available doctors listing by category
Doctor's profile page
Contact a doctor using voice or video call
Chat with a doctor
Make an appointment to visit a doctor
Symptom prediction
Registration and Login
The registration feature allows new users to create an account on the app by entering their name, email, phone number, and password. Once registered, the user can log in using their email and password.

Available Doctors Listing by Category
The available doctors are listed by category on the home page. The different categories include radiographers, heart specialists, dentists, and general doctors. The user can click on a specific category to view the available doctors in that category.

Doctor's Profile Page
Each doctor has a profile page that provides detailed information about the doctor, including their name, picture, specialty, and qualifications. The user can also see the doctor's availability schedule and contact information.

Contact a Doctor Using Voice or Video Call
The user can contact a doctor using voice or video call through the app. This feature allows the user to get in touch with the doctor without having to physically visit the clinic.

Chat with a Doctor
The chat feature allows the user to communicate with a doctor through text messages. This feature can be useful for asking questions or getting medical advice from the doctor.

Make an Appointment to Visit a Doctor
The appointment feature allows the user to schedule an appointment to visit the doctor. The user can view the doctor's availability schedule and select a suitable time and date for the appointment.

Symptom Prediction
The symptom prediction feature allows the user to input their symptoms and get a possible disease prediction based on the symptoms. This feature can be helpful for users who are not sure what kind of medical attention they require.

Pages
The Flutter Health Monitoring App has several screens, each with a unique purpose. The following are the different screens available in the app:

Home Page
The home page is the first page that the user sees when they open the app. It lists the available doctors by category, allowing the user to select the category they are interested in. The user can also search for doctors using the search bar.

Doctor's Page
The doctor's page displays all the available doctors in the selected category. The user can view a doctor's profile by clicking on the doctor's card.

Appointment Page
The appointment page allows the user to schedule an appointment with the doctor. The user can select a date and time from the calendar and add a note if necessary. The user can also view their scheduled appointments and delete them if required.

Profile Page
The profile page displays the user's information, including their name, email, phone number, and profile picture. The user can edit their information by clicking on the edit button.

The Profile page displays the user's profile information. The user can edit their profile by clicking on the Edit button. The user can change their name, phone number, and password.

Message Page

The Message page shows a list of messages that the user has with each doctor. When the user clicks on a card, they will be taken to the Chatting page.

Chatting Page

The Chatting page shows the conversation between the user and the doctor. The user can send messages and receive responses from the doctor.

Doctor Profile

The Doctor Profile page shows the detailed information about a specific doctor. It displays their name, photo, specialty, and contact information. The user can call the doctor or send them a message from this page.

Login and Signup Pages

The Login and Signup pages are used to register and login to the application. Users can create an account by entering their name, email, phone number, and password.

Use Cases
Here are some use cases for the Health Monitoring app:

Example 1: User wants to book an appointment with a dentist

User opens the application and navigates to the home page.
User filters the doctors by the dentist's category.
User selects the desired dentist from the list and navigates to the doctor's profile page.
User clicks on the "Book Appointment" button and selects the date and time for the appointment.
User adds any necessary notes and confirms the appointment.


Example 2: User wants to communicate with a doctor through chat messaging

User logs in to the application and navigates to the message page.
User selects the desired doctor from the list and navigates to the chatting page.
User sends a message to the doctor and waits for a response.
User can communicate with the doctor through chat messaging and ask any questions.

A patient wants to find a dentist. They open the application and navigate to the home page. They click on the dentist category and view available dentists. They select a dentist and navigate to their profile page. They can make a voice or video call to the dentist or send them a message.

A patient wants to book an appointment with a radiographer. They navigate to the appointment page and select a date and time. They can view their appointment in the calendar table and delete it if necessary.

A patient is experiencing symptoms and wants to know what disease they might have. They navigate to the machine learning page and enter their symptoms. The application predicts the disease based on the symptoms provided.

Other Examples:

User wants to find a dentist in their area. They open the app and go to the Home page. They select the Dentist category and see a list of available dentists. They select a dentist from the list and view their profile. They can make an appointment, call, or message the dentist from the profile page.

User has a cough and wants to know what it could be. They open the app and go to the Home page. They select the Symptoms category and enter their symptoms. The app predicts a potential disease based on the symptoms.

User wants to make an appointment with their heart specialist. They open the app and go to the Appointment page. They select a date and time for the appointment and confirm it. They can view their upcoming appointments on the Appointment page.

User has a question for their doctor. They open the app and go to the Message page. They select the doctor they want to message and send their question. The doctor responds and they can continue the conversation on the Chatting page.

Widget Tree

The Flutter Health Monitoring App has the following widget tree:

MaterialApp(
home: HomePage(),
)

HomePage(
// Contains doctor's categories and search bar
body: ListView(),
// Contains drawer with user's profile and logout button
drawer: Drawer(),
)

DoctorPage(
// Contains a list of doctors in a particular category
body: ListView(),
)

AppointmentPage(
// Contains a calendar to book appointments and a list of current appointments
body: ListView(),
)

ProfilePage(
// Contains user's information and ability to edit it
body: ListView(),
)

MessagePage(
// Contains a list of user's conversations with doctors
body: ListView(),
)

ChatPage(
// Contains messages between the user and a particular doctor
body: ListView(),
)

DoctorProfilePage(
// Contains the information about a particular doctor and a button to contact the doctor
body: ListView(),
)

LoginPage(
// Contains a form to login with email and password
body: ListView(),
)

SignupPage(
// Contains a form to signup with name, email, phone number, and password
body: ListView(),
)

 MaterialApp
  |-SplashPage
  |-LoginPage
  |-SignupPage
  |-HomePage
     |-AppBar
     |-Drawer
     |-CategoryList
     |-DoctorList
     |-SearchBar
     |-FAB
  |-DoctorPage
     |-AppBar
     |-DoctorList
  |-AppointmentPage
     |-AppBar
     |-Calendar
     |-AppointmentList
  |-ProfilePage
     |-AppBar
     |-ProfileForm
  |-MessagePage
     |-AppBar
     |-MessageList
  |-ChatPage
     |-AppBar
     |-ChatList
     |-ChatInput
  |-DoctorProfilePage
     |-AppBar
     |-DoctorInfo
     |-CallButton
     |-MessageButton


Conclusion

The Health Monitoring app is a useful tool for patients to connect with doctors and manage their health. The app allows users to find available doctors in different specialties, make appointments, and communicate with doctors through voice call, video call, and messaging. Users can also enter their symptoms and get a prediction of potential diseases. The app provides a user-friendly interface and easy navigation.

References:

Flutter. Retrieved from https://flutter.dev/
Dart. Retrieved from https://dart.dev/
Firebase. Retrieved from https://firebase.google.com/
