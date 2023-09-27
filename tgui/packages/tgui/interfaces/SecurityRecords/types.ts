import { BooleanLike } from 'common/react';

export type SecurityRecordsData = {
  assigned_view: string;
  authenticated: BooleanLike;
  station_z: BooleanLike;
  available_statuses: string[];
  current_user: string;
  higher_access: BooleanLike;
  records: SecurityRecord[];
  min_age: number;
  max_age: number;
};

export type SecurityRecord = {
  age: number;
  citations: Crime[];
  crew_ref: string;
  crimes: Crime[];
  fingerprint: string;
  gender: string;
  name: string;
  note: string;
  rank: string;
  species: string;
  wanted_status: string;
<<<<<<< HEAD
  // NON-MODULAR CHANGES: Adds sec records to TGUI
  old_security_records: string;
=======
  voice: string;
>>>>>>> dd87788877896 (TTS: Gas Mask muffling, Hailer Mask voice effects, support for more filters that use samplerate, voice effects for lizards, ethereals, and xenomorphs. (#78567))
};

export type Crime = {
  author: string;
  crime_ref: string;
  details: string;
  fine: number;
  name: string;
  paid: number;
  time: number;
  valid: BooleanLike;
};

export enum SECURETAB {
  Crimes,
  Citations,
  Add,
}

export enum PRINTOUT {
  Missing = 'missing',
  Rapsheet = 'rapsheet',
  Wanted = 'wanted',
}
