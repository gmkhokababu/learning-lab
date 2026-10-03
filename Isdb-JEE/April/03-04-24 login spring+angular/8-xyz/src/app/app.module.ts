import { NgModule } from '@angular/core';
import { BrowserModule } from '@angular/platform-browser';
import { HttpClientModule } from '@angular/common/http';

import { AppRoutingModule } from './app-routing.module';
import { AppComponent } from './app.component';
import { PostService } from './service/post.service';
import { ShowpostComponent } from './showpost/showpost.component';

@NgModule({
  declarations: [
    AppComponent,
    ShowpostComponent
  ],
  imports: [
    BrowserModule,
    AppRoutingModule,
    HttpClientModule,
  ],
  providers: [PostService],
  bootstrap: [AppComponent]
})
export class AppModule { }
