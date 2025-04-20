Feature: Json Feature Testing

  Scenario: validating json data
    * def employees =
    """
    [
    {
    name: 'Jay',
    city: 'Rajkot',
    age: 21
    },
    {
    name: 'Joy',
    city: 'LA',
    age: 25
    }
    ]
    """
    * print employees
    * print employees[0].name + " " + employees[0].city + " " +  employees[0].age
    * print employees[1].name + " " + employees[1].city + " " +  employees[1].age

  Scenario: complex json example
    * def complexJsonObject =
    """
    {
  "libraryName": "Fictional Library",
  "address": {
    "street": "123 Main Street",
    "city": "Cityville",
    "state": "State",
    "postalCode": "12345"
  },
  "catalog": [
    {
      "bookId": "978-0451524935",
      "title": "1984",
      "author": {
        "firstName": "George",
        "lastName": "Orwell"
      },
      "publicationYear": 1949,
      "genres": ["Dystopian", "Political Fiction"],
      "copiesAvailable": 10
    },
    {
      "bookId": "978-0061120084",
      "title": "To Kill a Mockingbird",
      "author": {
        "firstName": "Harper",
        "lastName": "Lee"
      },
      "publicationYear": 1960,
      "genres": ["Novel", "Southern Gothic"],
      "copiesAvailable": 8
    },
    {
      "bookId": "978-0062692826",
      "title": "Becoming",
      "author": {
        "firstName": "Michelle",
        "lastName": "Obama"
      },
      "publicationYear": 2018,
      "genres": ["Autobiography", "Memoir"],
      "copiesAvailable": 12
    }
  ]
}
    """
    * print complexJsonObject.libraryName
    * print complexJsonObject.address
    * print complexJsonObject.catalog
    * print complexJsonObject.catalog[0].bookId + " " + complexJsonObject.catalog[0].author.firstName + " " + complexJsonObject.catalog[0].publicationYear + " " + complexJsonObject.catalog[0].genres