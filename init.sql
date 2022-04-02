create schema kv_store;

create table kv_store.values
(
    key   varchar
        constraint values_pk
            primary key,
    value varchar
);

create unique index values_key_uindex
    on kv_store.values (key);

insert into kv_store.values (key, value)
values
    ('Homer', 'Simpson'),
    ('Jeffrey', 'Lebowski'),
    ('Stan', 'Smith');

create user kv_store_user;

grant usage on schema kv_store to kv_store_user;

grant connect on database postgres to kv_store_user;

grant select, insert, update, delete on all tables in schema kv_store to kv_store_user;
