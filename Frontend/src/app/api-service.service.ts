import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Observable } from 'rxjs';

@Injectable({
  providedIn: 'root'
})
export class ApiServiceService {
  private apiUrl = 'http://localhost:8080/lang';

  constructor(private http: HttpClient) {}

  login(credentials: { UserName: string, Password: string }): Observable<any> {
    
    return this.http.post(`${this.apiUrl}/login`, credentials);
  }

  getLanguage(): Observable<any>{
    return this.http.get(`${this.apiUrl}/language-list`);
  }

  getQuestionList(id:number): Observable<any>{
    return this.http.get(`${this.apiUrl}/question-list/${id}`);
  }

  submitQuiz(data:any): Observable<any>{
    return this.http.get(`${this.apiUrl}/question-ans?data=${data}`);
  }
}
