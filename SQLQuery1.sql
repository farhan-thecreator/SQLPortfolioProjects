--SELECT *
--FROM PortfolioProject..CovidDeaths
--order by 3,4

--SELECT *
--FROM PortfolioProject..CovidVaccinations
--order by 3,4

SELECT Location, date, total_cases, new_cases, total_deaths, population
FROM PortfolioProject..CovidDeaths
order by 1,2

-- Total cases vs Total deaths

SELECT Location, date, total_cases, total_deaths, (total_deaths/total_cases)*100 as Percentage
FROM PortfolioProject..CovidDeaths
where location like '%india%'
order by 1,2

-- country with highest infection rate

SELECT Location, date, MAX(total_cases) as highest, total_deaths, MAX(total_deaths/total_cases)*100 as PopulationPerc
FROM PortfolioProject..CovidDeaths
--where location like '%india%'
Group by Location, population
order by PopulationPerc desc

-- highest death count

SELECT Location, MAX(cast(Total_deaths as int)) as TotalDeathCount
FROM PortfolioProject..CovidDeaths
where continent is not NULL
GROUP BY Location
order by TotalDeathCount desc

-- Joining

Select *
FROM PortfolioProject..CovidDeaths da
Join PortfolioProject..CovidVaccinations vac
	on da.date = vac.date