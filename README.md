# DreamHomeFinder

- [DreamHomeFinder](http://dreamhomefinder.herokuapp.com/api/v3/listings?page=8&size=8)


### About

This is an application that allows users to search for a home with a query.

Data from the application was sourced from [listings.csv](https://s3.amazonaws.com/opendoor-problems/listings.csv)

### Technology Used

* Ruby on Rails was used for the Backend of the application.
..* Arel was used to organize queries
..* JSON/JBuilder was used to organize the output

#### Search Method

Search by narrowing the output can be done on the `api/v2/listings`. Search by `min_price, max_price, min_bed, max_bed, min_bath, max_bath` are implemented. For example, `/listings?min_price=100000&max_price=200000&min_bed=2&max_bed=2&min_bath=2&max_bath=2`, [accessible here](http://dreamhomefinder.herokuapp.com/api/v2/listings?min_price=100000&max_price=200000&min_bed=2&max_bed=2&min_bath=2&max_bath=2)

#### Pagination

With `api/v3/listings`, the amount of search result returned can be controlled by search query of `page` and `size`. Page begins at 1, as it is semantic for people. As pages now matter, the order is by id. The default displays page 1 with a size of 10.

#### Expected Output Format

```javascript
{
  "type": "FeatureCollection",
  "features": [
    {
      "type": "Feature",
      "geometry": {"type": "Point", "coordinates": [-112.1,33.4]},
      "properties": {
        "id": "123ABC", /*# CSV id */
        "price": 200000, /*# Price in Dollars */
        "street": "123 Walnut St",
        "bedrooms": 3, /*# Bedrooms */
        "bathrooms": 2, /*# Bathrooms */
        "sq_ft": 1500 /*# Square Footage */
      },
    /*...*/
  ]
}
```

#### Potential Future Features

* Search by coordinates would be intuitively useful, as people are likely searching for listing by location. As the saying goes for real estate: "Location, Location, Location."
* Search or filter by status. People may be more concerned about active listings only, for example.
* Order by attributes. People may be interested in ordering by price or other features (sq_ft), or a combination of these two attributes.
* A front-end to make entries of these queries easier.
