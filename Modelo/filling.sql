-- PRIORIDAD

INSERT INTO tv.prioridad
(
	prioridad_id,
	descripcion,
	abreviacion,
	estilo,
	activo
)
VALUES
(
	1,
	'ALTA',
	'ALTA',
	'color: red',
	1
);

INSERT INTO tv.prioridad
(
	prioridad_id,
	descripcion,
	abreviacion,
	estilo,
	activo
)
VALUES
(
	2,
	'MEDIANA',
	'MED',
	'color: violet',
	1
);

INSERT INTO tv.prioridad
(
	prioridad_id,
	descripcion,
	abreviacion,
	estilo,
	activo
)
VALUES
(
	3,
	'BAJA',
	'BAJA',
	'color: blue',
	1
);

---- estado

INSERT INTO tv.estado
(
	estado_id
	descripcion,
	abreviacion,
	activo
)
VALUES
(
	1,
	'CREADA',
	'CRE',
	1
);

INSERT INTO tv.estado
(
	estado_id
	descripcion,
	abreviacion,
	activo
)
VALUES
(
	2,
	'ASIGNADA',
	'ASIG',
	1
);

INSERT INTO tv.estado
(
	estado_id
	descripcion,
	abreviacion,
	activo
)
VALUES
(
	3,
	'EN PROCESO',
	'PRO',
	1
);

INSERT INTO tv.estado
(
	estado_id
	descripcion,
	abreviacion,
	activo
)
VALUES
(
	4,
	'EN PRUEBA',
	'PRU',
	1
);


INSERT INTO tv.estado
(
	estado_id
	descripcion,
	abreviacion,
	activo
)
VALUES
(
	5,
	'FINALIZADA',
	'FIN',
	1
);

INSERT INTO tv.estado
(
	estado_id
	descripcion,
	abreviacion,
	activo
)
VALUES
(
	6,
	'ANULADA',
	'ANU',
	1
);

-- ACCION

INSERT INTO tv.accion
(
	accion_id,
	descripcion,
	abreviacion,
	activo
)
VALUES
(
	1,
	'CREAR TAREA',
	'CREAR',
	1
);

INSERT INTO tv.accion
(
	accion_id,
	descripcion,
	abreviacion,
	activo
)
VALUES
(
	2,
	'ASIGNAR TAREA',
	'ASIG',
	1
);


-- tipo de usuario

INSERT INTO tv.tipo_usuario
(
	tipo_usuario_id,
	descripcion,
	abreviacion,
	activo
)
VALUES
(
	1,
	'ENCARGADO',
	'ENC',
	1
);

INSERT INTO tv.tipo_usuario
(
	tipo_usuario_id,
	descripcion,
	abreviacion,
	activo
)
VALUES
(
	2,
	'AYUDANTE',
	'AYU',
	1
);








