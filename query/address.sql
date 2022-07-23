-- name: CreateAddress :one
INSERT INTO address (
  passenger_id,
  detail,
  ward,
  district,
  city,
  latitude,
  longitude
) VALUES (
  $1, $2, $3, $4, $5, $6, $7
)
RETURNING *;

-- name: GetAddress :one
SELECT * FROM address
WHERE id = $1 LIMIT 1;

-- name: GetAddressByPassengerID :many
SELECT * FROM address
WHERE passenger_id = $1;

-- name: GetAddressForUpdate :one
SELECT * FROM address
WHERE id = $1 LIMIT 1
FOR NO KEY UPDATE;

-- name: ListAddresses :many
SELECT * FROM address
ORDER BY id
LIMIT $1
OFFSET $2; 

-- name: UpdateAddress :one
UPDATE address
SET detail = $2,
  ward = $3,
  district = $4,
  city = $5,
  latitude = $6,
  longitude = $7
WHERE id = $1
RETURNING *;

-- name: DeleteAddress :exec
DELETE FROM address
WHERE id = $1;