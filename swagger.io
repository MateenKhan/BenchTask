openapi: 3.0.0
info:
  title: Sample API
  description: Optional multiline or single-line description in [CommonMark](http://commonmark.org/help/) or HTML.
  version: 0.1.9
servers:
  - url: http://localhost:8080
    description: Optional server description, e.g. Main (production) server
paths:
  /customers:
    get:
      summary: get list of all customers
      description: return list of all customers only via pagination
      parameters:
        - in: query
          name: pageNumber
          schema:
            type: integer
            default: 1
          required: true
          description: Current Page number
        - in: query
          name: pageSize
          schema:
            type: integer
            default: 10
          required: true
          description: Current Page size
      responses:
        '200':    # status code
          description: list of customers
          content:
            application/json:
              schema:
                type: object
                properties:
                  pageNumber:
                    type: integer
                  pageSize:
                    type: integer
                  total:
                    type: integer
                  data: 
                    type: array
                    items:
                      $ref: '#/components/schemas/Customer'
                    
  /customers/{name}:
    get:
      summary: get a single customers
      description: return list of all customers only via pagination
      parameters:
        - in: path
          name: name
          schema:
            type: string
            default: mateen
          required: true
          description: name of the customer
      responses:
        '200':
          description: get single customer
          content:
            application/json:
              schema:
                $ref: '#/components/schemas/Customer'


components:
  schemas:
    Customer:
      type: object
      required:
        - number
        - firstName
        - lastName
        - birthdate
        - country
        - countryCode
        - mobileNumber
        - email
        - customerStatus
        - address
      properties:
        number:
          type: integer
        firstName:
          type: string
        lastName:
          type: string
        birthdate:
          type: string
        country:
          type: string
        countryCode:
          type: string
        mobileNumber:
          type: string
        email:
          type: string
        customerStatus:
          type: string
        address:
          type: object
          required:
            - addressLine1
            - postalCode
          properties:
            addressLine1:
              type: string
            addressLine2:
              type: string
            street:
              type: string
            postalCode:
              type: integer
