create table toy_robots (
  id serial primary key,
  x text,
  y text,
  facing text
);

create table movements (
  id serial primary key,
  toy_robots_id int references toy_robots(id),
  action text
);
