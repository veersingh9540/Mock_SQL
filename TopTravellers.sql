WITH CTE AS (
    SELECT DISTINCT user_id, sum(distance) over(partition by user_id) as travelled_distance
    from Rides
)

SELECT U.name, ifNULL(C.travelled_distance, 0) as travelled_distance from USERS U
left join CTE C
on U.id = C.user_id
order by C.travelled_distance DESC, U.name ASC