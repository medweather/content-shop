create table content (
    id bigserial,
    is_bought boolean not null default false,
    name varchar(255),
    text varchar(2048),
    person_id int8,
    primary key (id)
);

create table person (
    id bigserial,
    active boolean not null default false,
    first_name varchar(255),
    last_name varchar(255),
    password varchar(255) not null,
    username varchar(255) not null,
    primary key (id)
);

create table person_role (
    person_id int8 not null,
    roles varchar(255)
);

alter table if exists content
    add constraint content_person_fk
    foreign key (person_id) references person;

alter table if exists person_role
    add constraint person_role_person_fk
    foreign key (person_id) references person;

insert into content (name, text) values
('Bleeding me (Metallica)', 'I''m diggin'' my way
I''m diggin'' my way to something
I''m diggin'' my way to somethin'' better

I''m pushin'' to stay
I''m pushin'' to stay with something
I''m pushin'' to stay with something better...'),

('Until it sleeps (Metallica)', 'Where do I take this pain of mine
I run, but it stays right by my side

So tear me open, pour me out
There''s things inside that scream and shout
And the pain still hates me
So hold me, until it sleeps...'),

('One (Metallica)', 'I can''t remember anything
Can''t tell if this is true or dream
Deep down inside I feel to scream
This terrible silence stops me
Now that the war is through with me
I''m waking up, I cannot see
That there''s not much left of me
Nothing is real but pain now...'),

('Nothing else matters (Metallica)', 'So close no matter how far
Couldn''t be much more from the heart
Forever trusting who we are
And nothing else matters

Never opened myself this way
Life is ours, we live it our way
All these words I don''t just say
And nothing else matters...'),

('Harvester of sorrow (Metallica)', 'My life suffocates
Planting seeds of hate
I''ve loved, turned to hate
Trapped far beyond my fate

I give, you take
This life that I forsake
Been cheated of my youth
You turned this lie to truth...'),

('Master of puppets (Metallica)', 'End of passion play, crumbling away
I''m your source of self-destruction
Veins that pump with fear, sucking darkest clear
Leading on your deaths construction

Taste me you will see
More is all you need
Dedicated to
How I''m killing yo...'),

('Creeping death (Metallica)', 'Slaves
Hebrews born to serve to the pharaoh
Heed
To his every word, live in fear
Faith
Of the unknown one, the deliverer
Wait
Something must be done, four hundred years...');