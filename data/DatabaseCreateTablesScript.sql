CREATE TABLE `student` (
  `id`       int     	 NOT NULL,
  `name`     varchar(64) NOT NULL UNIQUE,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `course` (
  `id`       int     	 NOT NULL,
  `title`    varchar(64) NOT NULL UNIQUE,
  `amount`   dec(10,2)   DEFAULT 0.0,
  `currency` varchar(3)  DEFAULT 'EUR',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `module` (
  `id`        int     NOT NULL,
  `order`     int(10) NOT NULL,
  `course_id` int     NOT NULL,
  PRIMARY KEY (`id`),
  FOREIGN KEY (`course_id`) REFERENCES course(`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `lesson` (
  `id`       int(10)      NOT NULL,
  `order`    int(10)	  NOT NULL,
  `title`    varchar(64)  DEFAULT '',
  `content`  varchar(512) DEFAULT '',
  `module_id` int(10)     NOT NULL,
  PRIMARY KEY (`id`),
  FOREIGN KEY (`module_id`) REFERENCES module(`id`) ON UPDATE CASCADE
  
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `enrolments` (
  `student_id` int(10)      NOT NULL,
  `course_id`  int(10)      NOT NULL,
  PRIMARY KEY (`student_id`, `course_id`),
  FOREIGN KEY (`student_id`) REFERENCES student(`id`) ON UPDATE CASCADE,
  FOREIGN KEY (`course_id`) REFERENCES course(`id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
