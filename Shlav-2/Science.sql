CREATE TABLE scientist
(
  scientistId INT NOT NULL,
  scientistName VARCHAR(20) NOT NULL,
  age INT NOT NULL,
  salary FLOAT NOT NULL,
  specialization VARCHAR(25) NOT NULL,
  phoneNr VARCHAR(10) NOT NULL,
  PRIMARY KEY (scientistId)
);

CREATE TABLE medicament
(
  medName VARCHAR(20) NOT NULL,
  medType VARCHAR(20) NOT NULL,
  medId INT NOT NULL,
  quantity INT NOT NULL,
  factCompany VARCHAR(25) NOT NULL,
  PRIMARY KEY (medId)
);

CREATE TABLE virus
(
  virusName VARCHAR(20) NOT NULL,
  virusId INT NOT NULL,
  source VARCHAR(25) NOT NULL,
  dangerLevel INT NOT NULL,
  PRIMARY KEY (virusId)
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

CREATE TABLE laboratory
(
  labLocation VARCHAR(25) NOT NULL,
  protectionLevel INT NOT NULL,
  labName VARCHAR(20) NOT NULL,
  labId INT NOT NULL,
  scientistId INT NOT NULL,
  PRIMARY KEY (labId),
  FOREIGN KEY (scientistId) REFERENCES scientist(scientistId)
);

CREATE TABLE analyzes
(
  labId INT NOT NULL,
  virusId INT NOT NULL,
  PRIMARY KEY (labId, virusId),
  FOREIGN KEY (labId) REFERENCES laboratory(labId),
  FOREIGN KEY (virusId) REFERENCES virus(virusId)
);

CREATE TABLE create
(
  medId INT NOT NULL,
  labId INT NOT NULL,
  PRIMARY KEY (medId, labId),
  FOREIGN KEY (medId) REFERENCES medicament(medId),
  FOREIGN KEY (labId) REFERENCES laboratory(labId)
);
