with funcionarios_detalhes as
(select
  employeeid,
  firstname||' '||lastname as name,
  (date_part(YEAR, current_date)-date_part(YEAR, birthdate::date)) as idade,
  (date_part(YEAR, current_date)-date_part(YEAR, hiredate::date)) as tempo_emprego

from {{ source('c&a', 'employees') }} 
)

select * from funcionarios_detalhes