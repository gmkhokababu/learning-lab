import { ComponentFixture, TestBed } from '@angular/core/testing';

import { InsertpageComponent } from './insertpage.component';

describe('InsertpageComponent', () => {
  let component: InsertpageComponent;
  let fixture: ComponentFixture<InsertpageComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ InsertpageComponent ]
    })
    .compileComponents();

    fixture = TestBed.createComponent(InsertpageComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
