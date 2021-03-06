
CREATE SCHEMA tv;

CREATE TABLE tv.prioridad(
  prioridad_id INTEGER NOT NULL,
  descripcion VARCHAR(30) NOT NULL,
  abreviacion VARCHAR(5) NOT NULL,
  estilo VARCHAR(100),
  activo INTEGER NOT NULL
);
COMMENT ON TABLE tv.prioridad IS 'Prioridad';
COMMENT ON COLUMN tv.prioridad.prioridad_id IS 'ID de prioridad';
COMMENT ON COLUMN tv.prioridad.descripcion IS 'Descripción';
COMMENT ON COLUMN tv.prioridad.abreviacion IS 'Abreviación';
COMMENT ON COLUMN tv.prioridad.estilo IS 'Estilo';
COMMENT ON COLUMN tv.prioridad.activo IS 'Activo@{1=Si|0=No}';

CREATE TABLE tv.tarea(
  tarea_id BIGINT NOT NULL,
  descripcion VARCHAR(100) NOT NULL,
  detalle TEXT NOT NULL,
  fecha_registro DATE NOT NULL,
  hora_registro VARCHAR(8) NOT NULL,
  fecha_acordada_fin DATE,
  hora_acordada_fin CHARACTER(8),
  activo INTEGER NOT NULL,
  prioridad_id INTEGER NOT NULL
);
COMMENT ON TABLE tv.tarea IS 'Tarea';
COMMENT ON COLUMN tv.tarea.tarea_id IS 'ID Tarea';
COMMENT ON COLUMN tv.tarea.descripcion IS 'Descripción';
COMMENT ON COLUMN tv.tarea.detalle IS 'Detalle';
COMMENT ON COLUMN tv.tarea.fecha_registro IS 'Fecha de registro';
COMMENT ON COLUMN tv.tarea.hora_registro IS 'Hora de registro';
COMMENT ON COLUMN tv.tarea.fecha_acordada_fin IS 'Fecha acordada de fin de tarea';
COMMENT ON COLUMN tv.tarea.hora_acordada_fin IS 'Hora acordada de fin de tarea';
COMMENT ON COLUMN tv.tarea.activo IS 'Activo@{1=Si|0=No}';
COMMENT ON COLUMN tv.tarea.prioridad_id IS 'Prioridad@{select prioridad_id as id, descripcion as item from prioridad where activo = 1}';

CREATE SEQUENCE tv.seq_tarea;


CREATE TABLE tv.estado(
  estado_id INTEGER NOT NULL,
  descripcion VARCHAR(30) NOT NULL,
  abreviacion VARCHAR(5) NOT NULL,
  activo INTEGER NOT NULL
);
COMMENT ON TABLE tv.estado IS 'Estado';
COMMENT ON COLUMN tv.estado.estado_id IS 'ID de estado';
COMMENT ON COLUMN tv.estado.activo IS 'Activo@{1=Si|0=No}';

CREATE TABLE tv.tipo_usuario(
  tipo_usuario_id INTEGER NOT NULL,
  descripcion VARCHAR(30) NOT NULL,
  abreviacion VARCHAR(5) NOT NULL,
  activo INTEGER NOT NULL
);
COMMENT ON TABLE tv.tipo_usuario IS 'Tipo de usuario';
COMMENT ON COLUMN tv.tipo_usuario.tipo_usuario_id IS 'ID Tipo de Usuario';
COMMENT ON COLUMN tv.tipo_usuario.activo IS 'Activo@{1=Si|0=No}';

CREATE TABLE tv.tarea_usuario(
  tarea_usuario_id BIGINT NOT NULL,
  tarea_id BIGINT NOT NULL,
  user_id BIGINT NOT NULL,
  tipo_usuario_id BIGINT NOT NULL
);
COMMENT ON TABLE tv.tarea_usuario IS 'Tareas de usuario';
COMMENT ON COLUMN tv.tarea_usuario.tarea_usuario_id IS 'ID de tarea de usuario';
COMMENT ON COLUMN tv.tarea_usuario.tarea_id IS 'Tarea@{select tarea_id as id, descripcion as item from tv.tarea where activo=1}';
COMMENT ON COLUMN tv.tarea_usuario.user_id IS 'Usuario@{select user_id as id, userlogin as item from security.s_user where enabled=1}';
COMMENT ON COLUMN tv.tarea_usuario.tipo_usuario_id IS 'TipoUsuario@{select tipo_usuario_id as id, descripcion as item from tv.tipo_usuario where activo=1}';
COMMENT ON COLUMN tv.tarea.activo IS 'Activo@{1=Si|0=No}';
CREATE SEQUENCE tv.seq_tarea_usuario;


CREATE TABLE tv.branch(
  branch_id INTEGER NOT NULL,
  descripcion VARCHAR(30) NOT NULL,
  abreviacion VARCHAR(5) NOT NULL,
  activo INTEGER NOT NULL
);
COMMENT ON TABLE tv.branch IS 'Branch';
COMMENT ON COLUMN tv.branch.branch_id IS 'ID de branch';
COMMENT ON COLUMN tv.branch.descripcion IS 'Descripción';
COMMENT ON COLUMN tv.branch.abreviacion IS 'Abreviación';
COMMENT ON COLUMN tv.branch.activo IS 'Activo@{1=Si|0=No}';

CREATE SEQUENCE tv.seq_branch;


CREATE TABLE tv.historico_estado(
  historico_estado_id BIGINT NOT NULL,
  estado_id BIGINT NOT NULL,
  tarea_id BIGINT NOT NULL,
  user_id BIGINT NOT NULL,
  branch_id BIGINT NOT NULL,
  fecha_desde DATE NOT NULL,
  hora_desde VARCHAR(8) NOT NULL,
  fecha_hasta DATE,
  hora_hasta VARCHAR(8),
  fecha DATE NOT NULL,
  hora VARCHAR(8),
  ultimo INTEGER NOT NULL
);
COMMENT ON TABLE tv.historico_estado IS 'Historico de estado';
COMMENT ON COLUMN tv.historico_estado.historico_estado_id IS 'ID de historico de estado';
COMMENT ON COLUMN tv.historico_estado.estado_id IS 'ID de estado';
COMMENT ON COLUMN tv.historico_estado.tarea_id IS 'ID de tarea';
COMMENT ON COLUMN tv.historico_estado.user_id IS 'ID de usuario';
COMMENT ON COLUMN tv.historico_estado.branch_id IS 'ID de branch';
COMMENT ON COLUMN tv.historico_estado.fecha_desde IS 'Fecha desde';
COMMENT ON COLUMN tv.historico_estado.hora_desde IS 'Hora desde';
COMMENT ON COLUMN tv.historico_estado.fecha_hasta IS 'Fecha hasta';
COMMENT ON COLUMN tv.historico_estado.hora_hasta IS 'Hora hasta';
COMMENT ON COLUMN tv.historico_estado.fecha IS 'Fecha';
COMMENT ON COLUMN tv.historico_estado.hora IS 'Hora';
COMMENT ON COLUMN tv.historico_estado.ultimo IS 'Ultimo';

CREATE SEQUENCE tv.seq_historico_estado;


CREATE TABLE tv.sector(
  sector_id INTEGER NOT NULL,
  descripcion VARCHAR(30) NOT NULL,
  abreviacion VARCHAR(5) NOT NULL,
  activo INTEGER NOT NULL
);
COMMENT ON TABLE tv.sector IS 'Sector';
COMMENT ON COLUMN tv.sector.sector_id IS 'ID de sector';
COMMENT ON COLUMN tv.sector.activo IS 'Activo@{1=Si|0=No}';

CREATE TABLE tv.sector_tarea(
  sector_tarea_id BIGINT NOT NULL,
  tarea_id BIGINT NOT NULL,
  sector_id BIGINT NOT NULL
);
COMMENT ON TABLE tv.sector_tarea IS 'Sector tarea';
COMMENT ON COLUMN tv.sector_tarea.sector_tarea_id IS 'ID Sector tarea';
COMMENT ON COLUMN tv.sector_tarea.tarea_id IS 'Tarea@{select tarea_id as id, descripcion as item from tv.tarea where activo=1}';
	
CREATE SEQUENCE tv.seq_sector_tarea;

CREATE TABLE tv.sector_usuario(
  sector_usuario_id BIGINT NOT NULL,
  sector_id BIGINT NOT NULL,
  user_id BIGINT NOT NULL,
  tipo_usuario_id INTEGER NOT NULL
);
COMMENT ON TABLE tv.sector_usuario IS 'Sector usuario';
COMMENT ON COLUMN tv.sector_usuario.sector_usuario_id IS 'ID sector usuario';

COMMENT ON COLUMN tv.sector_usuario.user_id IS 'Usuario@{select user_id as id, userlogin as item from security.s_user where enabled=1}';
COMMENT ON COLUMN tv.sector_usuario.tipo_usuario_id IS 'TipoUsuario@{select tipo_usuario_id as id, descripcion as item from tv.tipo_usuario where activo=1}';

CREATE SEQUENCE tv.seq_sector_usuario;


CREATE TABLE tv.accion(
  accion_id INTEGER NOT NULL,
  descripcion VARCHAR(30) NOT NULL,
  abreviacion VARCHAR(5) NOT NULL,
  activo INTEGER NOT NULL
);
COMMENT ON TABLE tv.accion IS 'Acción';
COMMENT ON COLUMN tv.accion.accion_id IS 'ID de acción';
COMMENT ON COLUMN tv.accion.activo IS 'Activo@{1=Si|0=No}';

CREATE TABLE tv.accion_usuario(
  accion_usuario_id INTEGER NOT NULL,
  sector_usuario_id BIGINT NOT NULL,
  accion_id BIGINT NOT NULL
);
COMMENT ON TABLE tv.accion_usuario IS 'Acciones de usuarios';
COMMENT ON COLUMN tv.accion_usuario.accion_usuario_id IS 'ID de Acción de Usuario';

COMMENT ON COLUMN tv.accion_usuario.accion_id IS 'Acción@{select accion_id as id, descripcion as item from tv.accion where activo=1}';

CREATE SEQUENCE tv.seq_accion_usuario;


CREATE TABLE tv.area(
  area_id INTEGER NOT NULL,
  descripcion VARCHAR(30) NOT NULL,
  abreviacion VARCHAR(5) NOT NULL,
  activo INTEGER NOT NULL
);
COMMENT ON TABLE tv.area IS 'Area';
COMMENT ON COLUMN tv.area.area_id IS 'ID de area';
COMMENT ON COLUMN tv.area.activo IS 'Activo@{1=Si|0=No}';

CREATE SEQUENCE tv.seq_area;

CREATE TABLE tv.encargado_area(
  encargado_area_id SERIAL,
  area_id INTEGER NOT NULL,
  user_id BIGINT
);
COMMENT ON TABLE tv.encargado_area IS 'Usuario/s encargado/s de area';
COMMENT ON COLUMN tv.encargado_area.encargado_area_id IS 'ID encargado de area';
COMMENT ON COLUMN tv.encargado_area.area_id IS 'Area@{select area_id as id, descripcion as item from tv.area where activo=1}';
COMMENT ON COLUMN tv.encargado_area.user_id IS 'Usuario@{select user_id as id, userlogin as item from security.s_user where enabled=1}';



CREATE TABLE tv.area_sector(
  area_sector_id INTEGER NOT NULL,
  sector_id INTEGER NOT NULL,
  area_id INTEGER NOT NULL
);
COMMENT ON TABLE tv.area_sector IS 'Area Sector';
COMMENT ON COLUMN tv.area_sector.area_sector_id IS 'ID de area sector';
COMMENT ON COLUMN tv.area_sector.sector_id IS 'Sector@{select sector_id as id, descripcion as item from tv.sector where activo=1}';
COMMENT ON COLUMN tv.area_sector.area_id IS 'Area@{select area_id as id, descripcion as item from tv.area where activo=1}';

CREATE SEQUENCE tv.seq_area_sector;



ALTER TABLE tv.prioridad ADD PRIMARY KEY (prioridad_id);

ALTER TABLE tv.tarea ADD PRIMARY KEY (tarea_id);
ALTER TABLE tv.tarea ADD CONSTRAINT FK_tarea_0 FOREIGN KEY (prioridad_id) REFERENCES tv.prioridad (prioridad_id) ON DELETE CASCADE;
CREATE INDEX IDX_tareas_id ON tv.tarea (tarea_id, fecha_registro);

ALTER TABLE tv.estado ADD PRIMARY KEY (estado_id);

ALTER TABLE tv.tipo_usuario ADD PRIMARY KEY (tipo_usuario_id);

ALTER TABLE tv.tarea_usuario ADD PRIMARY KEY (tarea_usuario_id);
ALTER TABLE tv.tarea_usuario ADD CONSTRAINT FK_tarea_usuario_0 FOREIGN KEY (tarea_id) REFERENCES tv.tarea (tarea_id) ON DELETE CASCADE;
ALTER TABLE tv.tarea_usuario ADD CONSTRAINT FK_tarea_usuario_1 FOREIGN KEY (user_id) REFERENCES security.s_user (user_id) ON DELETE CASCADE;
ALTER TABLE tv.tarea_usuario ADD CONSTRAINT FK_tarea_usuario_2 FOREIGN KEY (tipo_usuario_id) REFERENCES tv.tipo_usuario (tipo_usuario_id) ON DELETE CASCADE;
ALTER TABLE tv.tarea_usuario ADD CONSTRAINT IDX_tareas_usuario_1 UNIQUE (tipo_usuario_id, tarea_id, user_id);

ALTER TABLE tv.branch ADD PRIMARY KEY (branch_id);

ALTER TABLE tv.historico_estado ADD PRIMARY KEY (historico_estado_id);
ALTER TABLE tv.historico_estado ADD CONSTRAINT FK_historico_estado_0 FOREIGN KEY (estado_id) REFERENCES tv.estado (estado_id) ON DELETE CASCADE;
ALTER TABLE tv.historico_estado ADD CONSTRAINT FK_historico_estado_1 FOREIGN KEY (tarea_id) REFERENCES tv.tarea (tarea_id) ON DELETE CASCADE;
ALTER TABLE tv.historico_estado ADD CONSTRAINT FK_historico_estado_2 FOREIGN KEY (user_id) REFERENCES security.s_user (user_id) ON DELETE CASCADE;
ALTER TABLE tv.historico_estado ADD CONSTRAINT FK_historico_estado_3 FOREIGN KEY (branch_id) REFERENCES tv.branch (branch_id) ON DELETE CASCADE;
CREATE INDEX IDX_historico_estados_1 ON tv.historico_estado (estado_id, user_id, fecha_desde);
CREATE INDEX IDX_historico_estados_2 ON tv.historico_estado (tarea_id);
CREATE INDEX IDX_historico_estados_3 ON tv.historico_estado (user_id, estado_id, fecha_desde);
CREATE INDEX IDX_historico_estados_4 ON tv.historico_estado (estado_id, tarea_id);
CREATE INDEX IDX_historico_estados_5 ON tv.historico_estado (branch_id);

ALTER TABLE tv.sector ADD PRIMARY KEY (sector_id);

ALTER TABLE tv.sector_tarea ADD PRIMARY KEY (sector_tarea_id);
ALTER TABLE tv.sector_tarea ADD CONSTRAINT FK_sector_tarea_0 FOREIGN KEY (tarea_id) REFERENCES tv.tarea (tarea_id) ON DELETE CASCADE;
ALTER TABLE tv.sector_tarea ADD CONSTRAINT FK_sector_tarea_1 FOREIGN KEY (sector_id) REFERENCES tv.sector (sector_id) ON DELETE CASCADE;

ALTER TABLE tv.sector_usuario ADD PRIMARY KEY (sector_usuario_id);
ALTER TABLE tv.sector_usuario ADD CONSTRAINT FK_sector_usuario_0 FOREIGN KEY (sector_id) REFERENCES tv.sector (sector_id) ON DELETE CASCADE;
ALTER TABLE tv.sector_usuario ADD CONSTRAINT FK_sector_usuario_1 FOREIGN KEY (user_id) REFERENCES security.s_user (user_id) ON DELETE CASCADE;
ALTER TABLE tv.sector_usuario ADD CONSTRAINT FK_sector_usuario_2 FOREIGN KEY (tipo_usuario_id) REFERENCES tv.tipo_usuario (tipo_usuario_id) ON DELETE CASCADE;
ALTER TABLE tv.sector_usuario ADD CONSTRAINT IDX_sector_usuario_1 UNIQUE (sector_id, user_id);

ALTER TABLE tv.accion ADD PRIMARY KEY (accion_id);

ALTER TABLE tv.accion_usuario ADD PRIMARY KEY (accion_usuario_id);
ALTER TABLE tv.accion_usuario ADD CONSTRAINT FK_accion_usuario_0 FOREIGN KEY (sector_usuario_id) REFERENCES tv.sector_usuario (sector_usuario_id) ON DELETE CASCADE;
ALTER TABLE tv.accion_usuario ADD CONSTRAINT FK_accion_usuario_1 FOREIGN KEY (accion_id) REFERENCES tv.accion (accion_id) ON DELETE CASCADE;

ALTER TABLE tv.area ADD PRIMARY KEY (area_id);

ALTER TABLE tv.area_sector ADD PRIMARY KEY (area_sector_id);
ALTER TABLE tv.area_sector ADD CONSTRAINT FK_area_sector_0 FOREIGN KEY (sector_id) REFERENCES tv.sector (sector_id) ON DELETE CASCADE;
ALTER TABLE tv.area_sector ADD CONSTRAINT FK_area_sector_1 FOREIGN KEY (area_id) REFERENCES tv.area (area_id) ON DELETE CASCADE;

ALTER TABLE tv.encargado_area ADD PRIMARY KEY (encargado_area_id);
ALTER TABLE tv.encargado_area ADD CONSTRAINT FK_encargado_area_0 FOREIGN KEY (area_id) REFERENCES tv.area (area_id) ON DELETE CASCADE;
ALTER TABLE tv.encargado_area ADD CONSTRAINT FK_encargado_area_1 FOREIGN KEY (user_id) REFERENCES security.s_user (user_id) ON DELETE CASCADE;
ALTER TABLE tv.encargado_area ADD CONSTRAINT IDX_encargado_area_1 UNIQUE (area_id, user_id);

