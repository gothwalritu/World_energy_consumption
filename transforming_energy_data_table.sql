

CREATE TABLE coal_consmp (
    id SERIAL PRIMARY KEY,
    country VARCHAR(255),
    year INTEGER,
    energy_consumption FLOAT
);

SELECT * FROM coal_consmp;

CREATE TABLE gas_consmp (
    id SERIAL PRIMARY KEY,
    country VARCHAR(255),
    year INTEGER,
    energy_consumption FLOAT
);
SELECT * FROM gas_consmp;

CREATE TABLE geothermal_consmp (
    id SERIAL PRIMARY KEY,
    country VARCHAR(255),
    year INTEGER,
    energy_consumption FLOAT
);
SELECT * FROM geothermal_consmp

CREATE TABLE hydro_consmp (
    id SERIAL PRIMARY KEY,
    country VARCHAR(255),
    year INTEGER,
    energy_consumption FLOAT
);
SELECT * FROM hydro_consmp

CREATE TABLE nuclear_consmp (
    id SERIAL PRIMARY KEY,
    country VARCHAR(255),
    year INTEGER,
    energy_consumption FLOAT
);
SELECT * FROM nuclear_consmp

CREATE TABLE oil_consmp (
    id SERIAL PRIMARY KEY,
    country VARCHAR(255),
    year INTEGER,
    energy_consumption FLOAT
);
SELECT * FROM oil_consmp

CREATE TABLE percapita_consmp (
    id SERIAL PRIMARY KEY,
    country VARCHAR(255),
    year INTEGER,
    energy_consumption FLOAT
);
SELECT * FROM percapita_consmp

CREATE TABLE renewable_consmp (
    id SERIAL PRIMARY KEY,
    country VARCHAR(255),
    year INTEGER,
    energy_consumption FLOAT
);
SELECT * FROM renewable_consmp

CREATE TABLE wind_consmp (
    id SERIAL PRIMARY KEY,
    country VARCHAR(255),
    year INTEGER,
    energy_consumption FLOAT
);
SELECT * FROM wind_consmp

CREATE TABLE primary_energy_consmp (
    id SERIAL PRIMARY KEY,
    country VARCHAR(255),
    year INTEGER,
    energy_consumption FLOAT
);
SELECT * FROM primary_energy_consmp


CREATE TABLE CO2_emissions (
    id SERIAL PRIMARY KEY,
    country VARCHAR(255),
    year INTEGER,
    energy_consumption FLOAT
);
SELECT * FROM CO2_emissions

SELECT * FROM consolidated_energy_data


CREATE TABLE consolidated_energy_data (
    id SERIAL PRIMARY KEY,
    country VARCHAR(255),
    year INTEGER,
	primary_energy_consumption FLOAT,
    co2_emissions FLOAT,
	percapita_consumption FLOAT,
    coal_consumption FLOAT,
    gas_consumption FLOAT,
    geothermal_consumption FLOAT,
    hydro_consumption FLOAT,
    nuclear_consumption FLOAT,
    oil_consumption FLOAT,
    renewable_consumption FLOAT,
    wind_consumption FLOAT
   
);

INSERT INTO consolidated_energy_data (
    country,
    year,
    coal_consumption,
    gas_consumption,
    geothermal_consumption,
    hydro_consumption,
    nuclear_consumption,
    oil_consumption,
    percapita_consumption,
    renewable_consumption,
    wind_consumption,
    primary_energy_consumption,
    co2_emissions
)
SELECT
    COALESCE(c.country, g.country, ge.country, h.country, n.country, o.country, p.country, r.country, w.country, pe.country, co2.country) AS country,
    COALESCE(c.year, g.year, ge.year, h.year, n.year, o.year, p.year, r.year, w.year, pe.year, co2.year) AS year,
    c.energy_consumption AS coal_consumption,
    g.energy_consumption AS gas_consumption,
    ge.energy_consumption AS geothermal_consumption,
    h.energy_consumption AS hydro_consumption,
    n.energy_consumption AS nuclear_consumption,
    o.energy_consumption AS oil_consumption,
    p.energy_consumption AS percapita_consumption,
    r.energy_consumption AS renewable_consumption,
    w.energy_consumption AS wind_consumption,
    pe.energy_consumption AS primary_energy_consumption,
    co2.energy_consumption AS co2_emissions
FROM coal_consmp c
FULL OUTER JOIN gas_consmp g ON c.country = g.country AND c.year = g.year
FULL OUTER JOIN geothermal_consmp ge ON c.country = ge.country AND c.year = ge.year
FULL OUTER JOIN hydro_consmp h ON c.country = h.country AND c.year = h.year
FULL OUTER JOIN nuclear_consmp n ON c.country = n.country AND c.year = n.year
FULL OUTER JOIN oil_consmp o ON c.country = o.country AND c.year = o.year
FULL OUTER JOIN percapita_consmp p ON c.country = p.country AND c.year = p.year
FULL OUTER JOIN renewable_consmp r ON c.country = r.country AND c.year = r.year
FULL OUTER JOIN wind_consmp w ON c.country = w.country AND c.year = w.year
FULL OUTER JOIN primary_energy_consmp pe ON c.country = pe.country AND c.year = pe.year
FULL OUTER JOIN CO2_emissions co2 ON c.country = co2.country AND c.year = co2.year;
