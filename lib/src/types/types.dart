// ignore_for_file: constant_identifier_names

enum Types {
  motion,
  session,
  lap_data,
  event,
  participants,
  car_setups,
  car_telemetry,
  car_status,
  final_classification,
  lobby_info,
  car_damage,
  session_history,
  unknown
}

/* 
Penalty types
0	Drive through
1	Stop Go
2	Grid penalty
3	Penalty reminder
4	Time penalty
5	Warning
6	Disqualified
7	Removed from formation lap
8	Parked too long timer
9	Tyre regulations
10	This lap invalidated
11	This and next lap invalidated
12	This lap invalidated without reason
13	This and next lap invalidated without reason
14	This and previous lap invalidated
15	This and previous lap invalidated without reason
16	Retired
17	Black flag timer
*/

enum PenaltyTypes {
  driveThrough,
  stopGo,
  gridPenalty,
  penaltyReminder,
  timePenalty,
  warning,
  disqualified,
  removedFromFormationLap,
  parkedTooLongTimer,
  tyreRegulations,
  thisLapInvalidated,
  thisAndNextLapInvalidated,
  thisLapInvalidatedWithoutReason,
  thisAndNextLapInvalidatedWithoutReason,
  thisAndPreviousLapInvalidated,
  thisAndPreviousLapInvalidatedWithoutReason,
  retired,
  blackFlagTimer,
}
/*
 Infringement types
 0	Blocking by slow driving
1	Blocking by wrong way driving
2	Reversing off the start line
3	Big Collision
4	Small Collision
5	Collision failed to hand back position single
6	Collision failed to hand back position multiple
7	Corner cutting gained time
8	Corner cutting overtake single
9	Corner cutting overtake multiple
10	Crossed pit exit lane
11	Ignoring blue flags
12	Ignoring yellow flags
13	Ignoring drive through
14	Too many drive throughs
15	Drive through reminder serve within n laps
16	Drive through reminder serve this lap
17	Pit lane speeding
18	Parked for too long
19	Ignoring tyre regulations
20	Too many penalties
21	Multiple warnings
22	Approaching disqualification
23	Tyre regulations select single
24	Tyre regulations select multiple
25	Lap invalidated corner cutting
26	Lap invalidated running wide
27	Corner cutting ran wide gained time minor
28	Corner cutting ran wide gained time significant
29	Corner cutting ran wide gained time extreme
30	Lap invalidated wall riding
31	Lap invalidated flashback used
32	Lap invalidated reset to track
33	Blocking the pitlane
34	Jump start
35	Safety car to car collision
36	Safety car illegal overtake
37	Safety car exceeding allowed pace
38	Virtual safety car exceeding allowed pace
39	Formation lap below allowed speed
40	Retired mechanical failure
41	Retired terminally damaged
42	Safety car falling too far back
43	Black flag timer
44	Unserved stop go penalty
45	Unserved drive through penalty
46	Engine component change
47	Gearbox change
48	League grid penalty
49	Retry penalty
50	Illegal time gain
51	Mandatory pitstop
 */

enum InfringementTypes {
  blockingBySlowDriving,
  blockingByWrongWayDriving,
  reversingOffTheStartLine,
  bigCollision,
  smallCollision,
  collisionFailedToHandBackPositionSingle,
  collisionFailedToHandBackPositionMultiple,
  cornerCuttingGainedTime,
  cornerCuttingOvertakeSingle,
  cornerCuttingOvertakeMultiple,
  crossedPitExitLane,
  ignoringBlueFlags,
  ignoringYellowFlags,
  ignoringDriveThrough,
  tooManyDriveThroughs,
  driveThroughReminderServeWithinNLaps,
  driveThroughReminderServeThisLap,
  pitLaneSpeeding,
  parkedForTooLong,
  ignoringTyreRegulations,
  tooManyPenalties,
  multipleWarnings,
  approachingDisqualification,
  tyreRegulationsSelectSingle,
  tyreRegulationsSelectMultiple,
  lapInvalidatedCornerCutting,
  lapInvalidatedRunningWide,
  cornerCuttingRanWideGainedTimeMinor,
  cornerCuttingRanWideGainedTimeSignificant,
  cornerCuttingRanWideGainedTimeExtreme,
  lapInvalidatedWallRiding,
  lapInvalidatedFlashbackUsed,
  lapInvalidatedResetToTrack,
  blockingThePitlane,
  jumpStart,
  safetyCarToCarCollision,
  safetyCarIllegalOvertake,
  safetyCarExceedingAllowedPace,
  virtualSafetyCarExceedingAllowedPace,
  formationLapBelowAllowedSpeed,
  retiredMechanicalFailure,
  retiredTerminallyDamaged,
  safetyCarFallingTooFarBack,
  blackFlagTimer,
  unservedStopGoPenalty,
  unservedDriveThroughPenalty,
  engineComponentChange,
  gearboxChange,
  leagueGridPenalty,
  retryPenalty,
  illegalTimeGain,
  mandatoryPitstop,
}

/*
Surface types
These types are from physics data and show what type of contact each wheel is experiencing.

ID	Surface
0	Tarmac
1	Rumble strip
2	Concrete
3	Rock
4	Gravel
5	Mud
6	Sand
7	Grass
8	Water
9	Cobblestone
10	Metal
11	Ridged
*/

enum SurfaceTypes {
  tarmac,
  rumbleStrip,
  concrete,
  rock,
  gravel,
  mud,
  sand,
  grass,
  water,
  cobblestone,
  metal,
  ridged,
}

/*
Session Started	“SSTA”	Sent when the session starts
Session Ended	“SEND”	Sent when the session ends
Fastest Lap	“FTLP”	When a driver achieves the fastest lap
Retirement	“RTMT”	When a driver retires
DRS enabled	“DRSE”	Race control have enabled DRS
DRS disabled	“DRSD”	Race control have disabled DRS
Team mate in pits	“TMPT”	Your team mate has entered the pits
Chequered flag	“CHQF”	The chequered flag has been waved
Race Winner	“RCWN”	The race winner is announced
Penalty Issued	“PENA”	A penalty has been issued – details in event
Speed Trap Triggered	“SPTP”	Speed trap has been triggered by fastest speed
Start lights	“STLG”	Start lights – number shown
Lights out	“LGOT”	Lights out
Drive through served	“DTSV”	Drive through penalty served
Stop go served	“SGSV”	Stop go penalty served
Flashback	“FLBK”	Flashback activated
Button status	“BUTN”	Button status changed
*/
const Map<String, String> EVENT_TYPES = {
  "SSTA": "Session Started",
  "SEND": "Session Ended",
  "FTLP": "Fastest Lap",
  "RTMT": "Retirement",
  "DRSE": "DRS enabled",
  "DRSD": "DRS disabled",
  "TMPT": "Team mate in pits",
  "CHQF": "Chequered flag",
  "RCWN": "Race Winner",
  "PENA": "Penalty",
  "SPTP": "Speed Trap Triggered",
  "STLG": "Star lights",
  "LGOT": "Lights out",
  "DTSV": "Drive through served",
  "SGSV": "Stop go served",
  "FLBK": "Flashback",
  "BUTN": "Button",
};
