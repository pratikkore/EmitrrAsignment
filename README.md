# EmitrrAsignment

This repository contains the code for a Quiz Application built with Angular for the frontend and Node.js with Express for the backend. The application allows users to log in, select a language for the quiz, answer questions, and submit the quiz.

Features
User Authentication: Users can log in to the application with a username and password.

Language Selection: After logging in, users can select a language for the quiz from a dropdown menu.

Quiz Interface: Users can answer a set of questions presented in a clean and user-friendly interface.

Quiz Submission: Once the user completes the quiz, they can submit their answers, and the application will provide feedback on the correctness of each answer and the total marks obtained.

Technologies Used
Frontend: Angular with TypeScript
Backend: Node.js, Express, MySQL
Database: MySQL
Setup Instructions
Clone the repository.

bash
Copy code
git clone https://github.com/pratikkore/quiz-app.git
Navigate to the frontend folder and install dependencies.

bash
Copy code
cd quiz-app/frontend
npm install
Navigate to the backend folder and install dependencies.

bash
Copy code
cd quiz-app/backend
npm install
Set up the database by creating a .env file in the backend folder with your MySQL credentials and other configuration details.

env
Copy code
DB_HOST=localhost
DB_NAME=emitrrdb
DB_USER=root
DB_PASSWORD=ROOT
PORT=8080
Start the backend server.

bash
Copy code
npm start
Start the frontend development server.

bash
Copy code
ng serve
Access the application at http://localhost:4200 in your web browser.

Usage
Log in with your username and password.

Select a language for the quiz.

Answer the quiz questions.

Submit the quiz to see the results.

Feel free to explore and customize the code according to your needs. If you encounter any issues or have questions, please refer to the documentation or reach out to the repository owner. Happy quizzing!






