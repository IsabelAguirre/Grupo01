-- Grupo 01 -- Proyecto Final - 1ra Entrega (P1)
-- Kisttopher Cruz - Isabel Aguirre

create table P1_tb_region
(
		id_region				int				not null,
		nombre_region			varchar(100)	not null
)
go

alter table P1_tb_region add constraint pk_P1_tb_region primary key (id_region)
go
exec sp_helpconstraint P1_tb_region
go


create table P1_tb_zona
(
		id_zona					int				not null,
		nombre_zona				varchar(50)		not null,
		id_region				int				not null
)
go

alter table P1_tb_zona add constraint pk_P1_tb_zona primary key (id_zona)
alter table P1_tb_zona add constraint fk_P1_tb_zona_P1_tb_region foreign key (id_region) references P1_tb_region (id_region)
go
exec sp_helpconstraint P1_tb_zona
go


create table P1_tb_tipo_credito
(
		id_tipo_credito			int				not null,
		tipo_credito_nombre		varchar(10)		not null,
		rango_credito			varchar(50)		not null
)
go

alter table P1_tb_tipo_credito add constraint pk_P1_tb_tipo_credito primary key (id_tipo_credito)
go
exec sp_helpconstraint P1_tb_tipo_credito
go


create table P1_tb_linea_credito
(
		id_linea_credito		int				not null,
		linea_credito_monto		decimal(8,2)	not null,
		id_tipo_credito			int				not null
)
go

alter table P1_tb_linea_credito add constraint pk_P1_tb_linea_credito primary key (id_linea_credito)
alter table P1_tb_linea_credito add constraint fk_P1_tb_linea_credito_P1_tb_tipo_credito foreign key (id_tipo_credito) references P1_tb_tipo_credito (id_tipo_credito)
go
exec sp_helpconstraint P1_tb_linea_credito
go


create table P1_tb_agricultor
(
		id_agricultor			int				not null,
		nombres_agricultor		varchar(150)	not null,
		apellidos_agricultor	varchar(150)	not null,
		dni_agricultor			char(8)			not null,
		id_zona					int				not null,
		garantia_agricultor		varchar(20)		not null,		
		valor_garantia_agric	decimal(8,2)	not null,
		id_linea_credito		int				not null
)
go

alter table P1_tb_agricultor add constraint pk_P1_tb_agricultor primary key (id_agricultor)
alter table P1_tb_agricultor add constraint fk_P1_tb_agricultor_P1_tb_zona foreign key (id_zona) references P1_tb_zona (id_zona)
alter table P1_tb_agricultor add constraint fk_P1_tb_agricultor_P1_tb_linea_credito foreign key (id_linea_credito) references P1_tb_linea_credito (id_linea_credito)
alter table P1_tb_agricultor add constraint ck_P1_tb_agricultor_dni check (dni_agricultor like '[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]')
alter table P1_tb_agricultor add constraint uq_P1_tb_agricultor_nombres_apellidos unique (nombres_agricultor, apellidos_agricultor)
go
exec sp_helpconstraint P1_tb_agricultor
go


create table P1_tb_intermediario
(
		id_intermediario		int				not null,
		nombres_intermediario	varchar(150)	not null,
		apellidos_intermediario	varchar(150)	not null,
		dni_intermediario		char(8)			not null,
		id_agricultor			int				not null
)
go

alter table P1_tb_intermediario add constraint pk_P1_tb_intermediario primary key (id_intermediario)
alter table P1_tb_intermediario add constraint fk_P1_tb_intermediario_P1_tb_agricultor foreign key (id_agricultor) references P1_tb_agricultor (id_agricultor)
alter table P1_tb_intermediario add constraint ck_P1_tb_intermediario_dni check (dni_intermediario like '[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]')
alter table P1_tb_intermediario add constraint uq_P1_tb_intermediario_nombres_apellidos unique (nombres_intermediario, apellidos_intermediario)
go
exec sp_helpconstraint P1_tb_intermediario
go


Create table P1_tb_pago_por_anticipo
(
		id_anticipo				int				not null,
		anticipo_numero			int				not null,
		anticipo_importe		decimal(9,2)	not null,
		anticipo_fecha			date			not null,
		anticipo_estado			varchar(20)		not null,
		id_intermediario		int				not null,
		id_agricultor			int				not null,
		id_zona					int				not null,
		id_linea_credito		int				not null
)
go

alter table P1_tb_pago_por_anticipo add constraint pk_P1_tb_pago_por_anticipo primary key (id_anticipo)
alter table P1_tb_pago_por_anticipo add constraint fk_P1_tb_pago_por_anticipo_P1_tb_intermediario foreign key (id_intermediario) references P1_tb_intermediario (id_intermediario)
alter table P1_tb_pago_por_anticipo add constraint fk_P1_tb_pago_por_anticipo_P1_tb_agricultor foreign key (id_agricultor) references P1_tb_agricultor (id_agricultor)
alter table P1_tb_pago_por_anticipo add constraint fk_P1_tb_pago_por_anticipo_P1_tb_zona foreign key (id_zona) references P1_tb_zona (id_zona)
alter table P1_tb_pago_por_anticipo add constraint fk_P1_tb_pago_por_anticipo_P1_tb_linea_credito foreign key (id_linea_credito) references P1_tb_linea_credito (id_linea_credito)
go
exec sp_helpconstraint P1_tb_pago_por_anticipo
go









