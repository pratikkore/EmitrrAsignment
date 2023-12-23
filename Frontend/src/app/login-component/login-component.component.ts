import { Component } from '@angular/core';

import { Router } from '@angular/router';
import { ApiServiceService } from '../api-service.service';
import { FormsModule } from '@angular/forms';

@Component({
  selector: 'app-login-component',
  standalone: true,
  imports: [FormsModule],
  templateUrl: './login-component.component.html',
  styleUrl: './login-component.component.scss'
})
export class LoginComponentComponent {

  username: string ="";
  password: string ="";

  constructor(private apiService: ApiServiceService, private router: Router) {}

  onSubmit() {
   
    this.apiService.login({ UserName: this.username, Password: this.password })
      .subscribe((response) => {
        
        this.router.navigate(['/quiz']);
        console.log(response);
        
      }, (error) => {
       
        console.error('Login failed:', error);
      });
  }
}
