import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';
import { ShowalldataComponent } from './showalldata/showalldata.component';
import { InsertpageComponent } from './insertpage/insertpage.component';

const routes: Routes = [
  {path:'',component:ShowalldataComponent},
  {path:'showalldata', component:ShowalldataComponent},
  {path:'insert', component:InsertpageComponent}
];

@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule]
})
export class AppRoutingModule { }
