import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';
import { BlogDetailsComponent } from './blog-details/blog-details.component';
import { HomePageComponent } from './home-page/home-page.component';
import { AdminComponent } from './admin/admin.component';

const routes: Routes = [
  {
    path:"blogDetails/:blog_id",
    component:BlogDetailsComponent
  },
  {
    path:"home",
    component:HomePageComponent
  },
  {
    path:"Admin",
    component:AdminComponent
  }
];

@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule]
})
export class AppRoutingModule { }
