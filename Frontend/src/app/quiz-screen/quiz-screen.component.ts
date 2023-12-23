import { Component } from '@angular/core';
import { ApiServiceService } from '../api-service.service';
import { OnInit } from '@angular/core';
import { MatSelectModule } from '@angular/material/select';
import { NgClass, NgFor, NgIf } from '@angular/common';
import { MatRadioModule } from '@angular/material/radio';
import { FormsModule } from '@angular/forms';

@Component({
  selector: 'app-quiz-screen',
  standalone: true,
  imports: [MatSelectModule, NgFor, MatRadioModule, FormsModule, NgClass, NgIf],
  templateUrl: './quiz-screen.component.html',
  styleUrl: './quiz-screen.component.scss',
})
export class QuizScreenComponent implements OnInit {
  languageList: any = [];
  questionListAll: any = [];
  correctAnswerList: any = [];
  totalMarks: any = 0;
  quizSubmitted: boolean = false;
  constructor(private apiService: ApiServiceService) {}
  ngOnInit() {
    this.apiService.getLanguage().subscribe((language) => {
      console.log(language);
      this.languageList = language;
      this.quizSubmitted=false;
      this.correctAnswerList = [];
    });
  }

  onChangeLanguage(id: number) {
    this.apiService.getQuestionList(id).subscribe((questionList) => {
      console.log(questionList);
      this.questionListAll = questionList;
    });
  }

  submitQuiz() {
    console.log(this.questionListAll);
    this.apiService
      .submitQuiz(JSON.stringify(this.questionListAll))
      .subscribe((quiz) => {
        this.quizSubmitted = true;
        this.correctAnswerList = quiz.data.data;
        console.log(this.correctAnswerList, 'submit');
        this.totalMarks = quiz.data.totalMarks;
      });
  }

  onRadioChange(op: any, i: number) {
    this.questionListAll[i].optionId = op.Id;
  }
}
