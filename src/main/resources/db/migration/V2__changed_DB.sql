alter table content drop constraint content_person_fk;
alter table content drop column person_id;
alter table person_role drop constraint person_role_person_fk;
alter table person_role drop column person_id;
drop table person;

create table person (
    id varchar(255) not null,
    name varchar(255),
    email varchar(255),
    gender varchar(255),
    locale varchar(255),
    primary key (id)
);

alter table content add column person_id varchar(255);
alter table person_role add column person_id varchar(255);

alter table content
    add constraint content_person_fk
        foreign key (person_id) references person;

alter table person_role
    add constraint person_role_person_fk
        foreign key (person_id) references person;
