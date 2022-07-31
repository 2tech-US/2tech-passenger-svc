# E2TechEcommerce API document
This is a documentation guide for the Passenger Service.

## Database
- note: `createdAt` `updatedAt` is auto generate in everys table

### passenger
| Column        | Type           |   |
| ------------- |:-------------:| -----:|
| phone     | String | Primary key, auto generate | 
| name | String      |   |
| dob  | Date     |   |
| image  | String      |   |



## API (V1)

### passenger

#### Get Passenger info:
```
GET /api/v1/passenger/{phone}
```
Authorization token: `passenger` , `admin`

#### Get Passenger :
```
GET /api/v1/passenger/
```
Authorization token: `admin`

Query parameters available (Pagination):
- `limit`: `optional` `integer`  `min=1`, limit the result
- `page`: `optional` `integer` `min=1`, page requested, need `limit` to work
- `sort`: `optional` `string`  name of the field to sort results with `default is 'createdAt`
- `order_by`: `optional` `must be either asc or desc`, only work it `sort` is specified, default to `desc`
- `query`: `optional` `string`, search by phone's number

#### Update Passenger info:
```
PUT /api/v1/passenger/{phone}
```
Authorization token: `passenger`

Body parameters available (`Json`):
- `name`: `optinal` `string` 
- `dob`: `optinal` `date`
- `image`: `optinal` `string`

