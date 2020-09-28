-- -----------------------------------------------------
-- Eliminar base de datos mydb
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS HOSPITAL;

-- -----------------------------------------------------
-- Crear base de datos mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS HOSPITAL;
USE HOSPITAL;

-- -----------------------------------------------------
-- Tabla de paciente
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS PACIENTE (
  codigo VARCHAR(30) NOT NULL,
  nombre VARCHAR(100) NOT NULL,
  sexo VARCHAR(45) NOT NULL,
  fecha_nacimiento DATE NOT NULL,
  DPI VARCHAR(13) NOT NULL,
  telefono VARCHAR(13) NOT NULL,
  peso VARCHAR(45) NOT NULL,
  tipo_sangre VARCHAR(45) NOT NULL,
  correo VARCHAR(100) NOT NULL,
  `password` VARCHAR(100) NOT NULL,
  PRIMARY KEY (codigo)
  );
  
  -- -----------------------------------------------------
-- Tabla Medico
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS MEDICO (
  codigo VARCHAR(45) NOT NULL,
  nombre VARCHAR(100) NOT NULL,
  numero_colegiado VARCHAR(45) NOT NULL,
  DPI VARCHAR(13) NOT NULL,
  telefono VARCHAR(13) NOT NULL,
  correo VARCHAR(100) NOT NULL,
  horario_entrada TIME NOT NULL,
  horario_salida TIME NOT NULL,
  inicio_trabajo DATE NOT NULL,
  `password` VARCHAR(100) NOT NULL,
  PRIMARY KEY (codigo)
  );
  
  -- -----------------------------------------------------
-- Tabla Laboratorista`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS LABORATORISTA (
  codigo VARCHAR(45) NOT NULL,
  nombre VARCHAR(100) NOT NULL,
  numero_registro VARCHAR(45) NOT NULL,
  DPI VARCHAR(45) NOT NULL,
  telefono VARCHAR(45) NOT NULL,
  correo VARCHAR(100) NOT NULL,
  fecha_inicio DATE NOT NULL,
  `password` VARCHAR(100) NOT NULL,
  PRIMARY KEY (codigo)
  );
  
  -- -----------------------------------------------------
-- Tabla Administrador`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS ADMINISTRADOR (
  codigo VARCHAR(45) NOT NULL,
  nombre VARCHAR(100) NOT NULL,
  DPI VARCHAR(13) NOT NULL,
  `password` VARCHAR(100) NOT NULL,
  PRIMARY KEY (codigo)
  );
  
  -- -----------------------------------------------------
-- Tabla Especialidad
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS ESPECIALIDAD (
  nombre VARCHAR(100) NOT NULL,
  PRIMARY KEY (nombre)
  );
  
  -- -----------------------------------------------------
-- Tabla Consulta_Medica`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS CONSULTA_MEDICA (
  codigo INT NOT NULL AUTO_INCREMENT,
  costo DOUBLE NOT NULL,
  Especialidad_nombre VARCHAR(100) NOT NULL,
  PRIMARY KEY (codigo,Especialidad_nombre),
  FOREIGN KEY (Especialidad_nombre) REFERENCES ESPECIALIDAD(nombre)
); 


-- -----------------------------------------------------
-- Tabla Cita_Consulta_Medica
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS CITA_CONSULTA_MEDICA (
  codigo VARCHAR(45) NOT NULL,
  fecha DATE NOT NULL,
  hora TIME NOT NULL,
  Consulta_Medica_codigo INT NOT NULL,
  Paciente_codigo VARCHAR(30) NOT NULL,
  Medico_codigo VARCHAR(45) NOT NULL,
  PRIMARY KEY (codigo,fecha,hora,Medico_codigo),
  FOREIGN KEY (Consulta_Medica_codigo) REFERENCES CONSULTA_MEDICA(codigo),
  FOREIGN KEY (Paciente_codigo) REFERENCES PACIENTE(codigo),
  FOREIGN KEY (Medico_codigo)REFERENCES MEDICO(codigo)
);


-- -----------------------------------------------------
-- Tabla Examen_Laboratorio`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS EXAMEN_LABORATORIO (
  codigo VARCHAR(45) NOT NULL,
  nombre VARCHAR(100) NOT NULL,
  orden TINYINT NOT NULL,
  descripcion VARCHAR(200) NOT NULL,
  costo DOUBLE NOT NULL,
  tipo_informe VARCHAR(45) NOT NULL,
  Laboratorista_codigo VARCHAR(45) NOT NULL,
  PRIMARY KEY (codigo),
  FOREIGN KEY (Laboratorista_codigo) REFERENCES LABORATORISTA(codigo)
);


-- -----------------------------------------------------
-- Tabla Cita_Examen_Laboratorio`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS CITA_EXAMEN_LABORATORIO (
  codigo INT NOT NULL AUTO_INCREMENT,
  fecha DATE NOT NULL,
  hora TIME NOT NULL,
  Paciente_codigo VARCHAR(30) NOT NULL,
  Examen_Laboratorio_codigo VARCHAR(45) NOT NULL,
  orden LONGBLOB,
  Laboratorista_codigo VARCHAR(45) NOT NULL,
  PRIMARY KEY (codigo),
  FOREIGN KEY (Paciente_codigo) REFERENCES PACIENTE(codigo),
  FOREIGN KEY (Examen_Laboratorio_codigo) REFERENCES EXAMEN_LABORATORIO(codigo),
  FOREIGN KEY (Laboratorista_codigo) REFERENCES LABORATORISTA(codigo)
);


-- -----------------------------------------------------
-- Tabla Informe_Consulta_Medica`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS INFORME_CONSULTA_MEDICA (
  codigo VARCHAR(45) NOT NULL,
  descripcion VARCHAR(500) NOT NULL,
  fecha DATE NOT NULL,
  hora TIME NOT NULL,
  Consulta_Medica_codigo INT NOT NULL,
  Paciente_codigo VARCHAR(30) NOT NULL,
  Medico_codigo VARCHAR(45) NOT NULL,
  PRIMARY KEY (codigo),
  FOREIGN KEY (Consulta_Medica_codigo)REFERENCES CONSULTA_MEDICA(codigo),
  FOREIGN KEY (Paciente_codigo) REFERENCES PACIENTE(codigo),
  FOREIGN KEY (Medico_codigo) REFERENCES MEDICO(codigo)
);


-- -----------------------------------------------------
-- Tabla Informe_Examen_Laboratorio`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS INFORME_EXAMEN_LABORATORIO (
  codigo VARCHAR(45) NOT NULL,
  descripcion VARCHAR(500) NOT NULL,
  fecha DATE NOT NULL,
  hora TIME NOT NULL,
  Examen_Laboratorio_codigo VARCHAR(45) NOT NULL,
  Paciente_codigo VARCHAR(30) NOT NULL,
  Laboratorista_codigo VARCHAR(45) NOT NULL,
  PRIMARY KEY (codigo),
  FOREIGN KEY (Examen_Laboratorio_codigo) REFERENCES EXAMEN_LABORATORIO(codigo),
  FOREIGN KEY (Paciente_codigo) REFERENCES PACIENTE(codigo),
  FOREIGN KEY (Laboratorista_codigo) REFERENCES LABORATORISTA(codigo)
  );
  
  
  -- -----------------------------------------------------
-- Tabla Especializacion`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS ESPECIALIZACION (
  Especialidad_nombre VARCHAR(100) NOT NULL,
  Medico_codigo VARCHAR(45) NOT NULL,
  PRIMARY KEY (Especialidad_nombre,Medico_codigo),
  FOREIGN KEY (Especialidad_nombre) REFERENCES ESPECIALIDAD(nombre),
  FOREIGN KEY (Medico_codigo) REFERENCES MEDICO(codigo)
    );
    
    
    -- -----------------------------------------------------
-- Tabla Orden_Examen`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS ORDEN_EXAMEN (
  codigo INT NOT NULL AUTO_INCREMENT,
  descripcion VARCHAR(500) NOT NULL,
  Paciente_codigo VARCHAR(30) NOT NULL,
  Medico_codigo VARCHAR(45) NOT NULL,
  Examen_Laboratorio_codigo VARCHAR(45) NOT NULL,
  PRIMARY KEY (codigo),
  FOREIGN KEY (Paciente_codigo) REFERENCES PACIENTE(codigo),
  FOREIGN KEY (Medico_codigo) REFERENCES MEDICO(codigo),
  FOREIGN KEY (Examen_Laboratorio_codigo) REFERENCES EXAMEN_LABORATORIO(codigo)
  );
  
  -- -----------------------------------------------------
-- Tabla Dias_Trabajados`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS DIAS_TRABAJADOS (
  codigo INT NOT NULL AUTO_INCREMENT,
  dia VARCHAR(45) NOT NULL,
  Laboratorista_codigo VARCHAR(45) NOT NULL,
  PRIMARY KEY (codigo),
  FOREIGN KEY (Laboratorista_codigo) REFERENCES LABORATORISTA(codigo)
);

  -- -----------------------------------------------------
-- Tabla Informe PDF`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS INFORME_PDF (
  archivo LONGBLOB NOT NULL ,
  Informe_Examen_Laboratorio_codigo VARCHAR(45) NOT NULL,
  PRIMARY KEY (Informe_Examen_Laboratorio_codigo),
  FOREIGN KEY (Informe_Examen_Laboratorio_codigo) REFERENCES INFORME_EXAMEN_LABORATORIO(codigo)
);

  -- -----------------------------------------------------
-- Tabla Orden PDF`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS ORDEN_PDF (
  archivo LONGBLOB NOT NULL ,
  Orden_Examen_codigo INT NOT NULL,
  PRIMARY KEY (Orden_Examen_codigo),
  FOREIGN KEY (Orden_Examen_codigo) REFERENCES ORDEN_EXAMEN(codigo)
);




