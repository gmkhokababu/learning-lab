import { ComponentFixture, TestBed } from '@angular/core/testing';

import { ShowalldataComponent } from './showalldata.component';

describe('ShowalldataComponent', () => {
  let component: ShowalldataComponent;
  let fixture: ComponentFixture<ShowalldataComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ ShowalldataComponent ]
    })
    .compileComponents();

    fixture = TestBed.createComponent(ShowalldataComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
