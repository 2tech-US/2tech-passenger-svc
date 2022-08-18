-- name: CreatePassenger :one
INSERT INTO passenger (
  phone,
  name
) VALUES (
  $1, $2
)
RETURNING *;

-- name: GetPassenger :one
SELECT * FROM passenger
WHERE id = $1 LIMIT 1;

-- name: GetPassengerForUpdate :one
SELECT * FROM passenger
WHERE id = $1 LIMIT 1
FOR NO KEY UPDATE;

-- name: GetPassengerByPhone :one
SELECT * FROM passenger
WHERE phone = $1 LIMIT 1;

-- name: ListPassengers :many
SELECT * FROM passenger
ORDER BY id
LIMIT $1
OFFSET $2; 

-- name: UpdatePassenger :one
UPDATE passenger
SET name = $2,
  date_of_birth = $3
WHERE phone = $1
RETURNING *;

-- name: DeletePassenger :exec
DELETE FROM passenger
WHERE phone = $1;