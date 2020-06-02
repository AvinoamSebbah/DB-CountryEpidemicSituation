CREATE TABLE laboratory
(
  labLocation VARCHAR(60) NOT NULL,
  protectionLevel INT NOT NULL,
  labName VARCHAR(60) NOT NULL,
  labId INT NOT NULL,
  PRIMARY KEY (labId)
);

CREATE TABLE scientist
(
  scientistId INT NOT NULL,
  scientistName VARCHAR(60) NOT NULL,
  age INT NOT NULL,
  salary INT NOT NULL,
  specialization VARCHAR(60) NOT NULL,
  phoneNr VARCHAR(10) NOT NULL,
  labId INT NOT NULL,
  PRIMARY KEY (scientistId),
  FOREIGN KEY (labId) REFERENCES laboratory(labId)
);

CREATE TABLE medicament
(
  medName VARCHAR(60) NOT NULL,
  medType VARCHAR(60) NOT NULL,
  medId INT NOT NULL,
  quantity INT NOT NULL,
  factCompany VARCHAR(60) NOT NULL,
  PRIMARY KEY (medId)
);

CREATE TABLE virus
(
  virusName VARCHAR(60) NOT NULL,
  virusId INT NOT NULL,
  sources VARCHAR(60) NOT NULL,
  dangerLevel INT NOT NULL,
  PRIMARY KEY (virusId)
);

CREATE TABLE analyzes
(
  labId INT NOT NULL,
  virusId INT NOT NULL,
  PRIMARY KEY (labId, virusId),
  FOREIGN KEY (labId) REFERENCES laboratory(labId),
  FOREIGN KEY (virusId) REFERENCES virus(virusId)
);

CREATE TABLE creates
(
  medId INT NOT NULL,
  labId INT NOT NULL,
  PRIMARY KEY (medId, labId),
  FOREIGN KEY (medId) REFERENCES medicament(medId),
  FOREIGN KEY (labId) REFERENCES laboratory(labId)
);

CREATE TABLE cure
(
  medId INT NOT NULL,
  virusId INT NOT NULL,
  PRIMARY KEY (medId, virusId),
  FOREIGN KEY (medId) REFERENCES medicament(medId),
  FOREIGN KEY (virusId) REFERENCES virus(virusId)
);

CREATE TABLE work_on
(
  scientistId INT NOT NULL,
  medId INT NOT NULL,
  PRIMARY KEY (scientistId, medId),
  FOREIGN KEY (scientistId) REFERENCES scientist(scientistId),
  FOREIGN KEY (medId) REFERENCES medicament(medId)
);
