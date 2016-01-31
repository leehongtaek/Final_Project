insert into room values(
room_seq.nextVal, '제1회의실', '1F', 30
);
insert into room values(
room_seq.nextVal, '제2회의실', '2F', 40
);
insert into room values(
room_seq.nextVal, '제3회의실', '3F', 30
);
insert into room values(
room_seq.nextVal, '제4회의실', '4F', 50
);
insert into room values(
room_seq.nextVal, '제5회의실', '5F', 30
);


insert into Rent values(
Rent_seq.nextVal, '환경프로젝트', '2015-12-16T15:00:00', '2015-12-16T16:00:00', 1, '15111311131'
);

insert into Rent values(
Rent_seq.nextVal, '불우이웃돕기캠페인', '2015-12-17T15:00:00', '2015-12-17T16:00:00', 2, '15111311131'
);

insert into Rent values(
Rent_seq.nextVal, '노인정후원캠페인', '2015-12-12T15:00:00', '2015-12-12T16:00:00', 3, '15111311131'
);

insert into Rent values(
Rent_seq.nextVal, '연말정산회의', '2015-12-13T15:00:00', '2015-12-13T16:00:00', 4, '15111311131'
);

insert into Rent values(
Rent_seq.nextVal, '신입사원 채용 안건 회의', '2015-11-13T15:00:00', '2015-11-13T16:00:00', 5, '15111311131'
);

insert into Rent values(
Rent_seq.nextVal, '생산팀 회의', '2015-11-07T11:00:00', '2015-11-07T12:00:00', 3, '15111311131'
);

insert into Rent values(
Rent_seq.nextVal, '정기총회의', '2015-11-21T13:00:00', '2015-11-21T15:00:00', 1, '15111311131'
);

insert into Rent values(
Rent_seq.nextVal, '해외봉사활동캠페인', '2016-01-05T14:00:00', '2016-01-05T16:00:00', 2, '15111311131'
);

insert into Rent values(
Rent_seq.nextVal, '제50회 임원진회의', '2016-01-21T13:00:00', '2016-01-21T15:00:00', 1, '15111311131'
);

commit;