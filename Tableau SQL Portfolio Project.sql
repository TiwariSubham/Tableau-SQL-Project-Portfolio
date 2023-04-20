-- Tableau SQL Query

-- 1. write a query to fetch death percentage based on total new deaths and total new cases during covid 19

SELECT SUM(new_cases)as total_cases,SUM(CAST(new_deaths as int))as total_deaths,
SUM(CAST(new_deaths as int))/SUM(new_cases)*100 as DeathPercentage
FROM dbo.CovidDeaths
WHERE continent IS NOT NULL
ORDER BY 1,2

-- 2.write a query to find location with totaldeathcount having null continent and where location is not (World,European Union or International) and then order by totaldeathcount in descending order.

SELECT location,SUM(CAST(total_deaths as int))as totaldeathscount
FROM dbo.CovidDeaths
WHERE continent IS NULL
AND location NOT IN('World','European Union','International')
GROUP BY location
ORDER BY totaldeathscount DESC;

-- 3.write a query to find location with highestinfectioncount and percentage of population who are infected.Then group by population  and location and order by percentage of population in desc.

SELECT location,population,MAX(total_cases)as highest_infection_count,max(total_cases)/population *100 as percentage_population_infected
FROM dbo.CovidDeaths
GROUP BY location,population
ORDER BY percentage_population_infected DESC;

-- 4.write a query to find location with highestinfectioncount based on date,population and percentage of population who are infected.Then group by population,date and location then order by percentage of population in desc.

SELECT location,population,date,MAX(total_cases)as highest_infection_count,max(total_cases)/population *100 as percentage_population_infected
FROM dbo.CovidDeaths
GROUP BY location,population,date
ORDER BY percentage_population_infected DESC;