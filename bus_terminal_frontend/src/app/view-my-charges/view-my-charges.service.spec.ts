import { TestBed, inject } from '@angular/core/testing';

import { ViewMyChargesService } from './view-my-charges.service';

describe('ViewMyChargesService', () => {
  beforeEach(() => {
    TestBed.configureTestingModule({
      providers: [ViewMyChargesService]
    });
  });

  it('should be created', inject([ViewMyChargesService], (service: ViewMyChargesService) => {
    expect(service).toBeTruthy();
  }));
});
