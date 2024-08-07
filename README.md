# Hume House App

![Hume House](https://cdn.sanity.io/images/qe2ul2l0/production/699d5cf41699376f80c3b6abf24f3351c5518bb1-2000x1333.jpg?w=1376&q=70&fit=max&auto=format&dpr=2)

Welcome to the Hume House App project! This application is designed to streamline the operational functions of the Rollins Hume House Child Development and Student Research Center. Our goal is to make attendance management more efficient and ensure timely notifications to parents about their children's status and activities. This app was made with Flutter and Dart. 

## App Design

The Hume House App is designed with user accessibility and security in mind. Here's an overview of the app's flow and functionality:

1. **Login Screen**:
   - The first screen that appears upon opening the app is the login screen.
   - ![Login Screen](screenshots/login_screen.png)
   - Since anyone can download the app from the app store, not everyone will be able to create a user.
   - Authorized new users who wish to create credentials must click on "Create a User," which redirects them to a new window.
   - In this window, users must enter their authorized email. If the email is in the Firebase database connected to the app, the user will be able to create a new account.
   - ![Create Account](screenshots/create_account_screen.png)
   - Users are redirected back to the login screen after setting up their credentials.

2. **Main Menu**:
   - Once logged in, users are taken to the main menu. Each section of the main menu varies depending on the type of user.
   - ![Main Menu](screenshots/main_menu_screen.png)
   - **Parents**:
     - In the notification section, parents can only view notifications sent on that same day.
     - ![Parent Notifications Screen](screenshots/parent_notifications_screen.png)
     - The attendance screen allows parents to check their child's status based on information the teacher updates.
     - ![Parent Attendance Screen](screenshots/parent_attendance_screen.png)
   - **Teachers**:
     - Teachers can view notifications from that day and also send notifications to all users.
     - ![Teacher Notifications Screen](screenshots/teacher_notifications_screen.png)
     - The attendance screen allows teachers to update each child's attendance status for the day.
     - ![Teacher Attendance Screen](screenshots/teacher_attendance_screen.png)

3. **Contacts Info**:
   - This section is the same for both parents and teachers.
   - ![Contacts Screen](screenshots/contacts_screen.png)
   - It provides a database of contact information for all app users.

4. **Settings**:
   - Users can update their login credentials or contact information.
   - ![Settings Screen](screenshots/settings_screen.png)
   - Changes made here will be updated in the contact info database.
   - At the bottom of the main menu, a logout button redirects users back to the login screen.


## Credits

This app was created by Andres Mauricio Rodriguez Grisales as a capstone project for the Computer Science Capstone class at Rollins College.

## License

This project is licensed under the [MIT License](LICENSE).

