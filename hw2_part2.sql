/*==============================================================*/
/* Table: departments                                           */
/*==============================================================*/
create table departments (
	department_id serial not null,
	department_name varchar(100) not null,
	constraint pk_departments primary key (department_id)
);

/*==============================================================*/
/* Table: employees                                             */
/*==============================================================*/
create table employees (
	employee_id serial not null,
	employee_name varchar(100) not null,
	manager_id int4 null,
	department_id int4 not null,
	constraint pk_employees primary key (employee_id)
);

alter table employees
	add constraint fk_employees_employees foreign key (manager_id)
		references employees (employee_id);

alter table employees
	add constraint fk_employees_departments foreign key (department_id)
		references departments (department_id);