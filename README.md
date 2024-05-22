# Coding Challenges

A repository of coding challenges solved using Ruby

Each example is supported by test cases written with RSpec

## How to run

Prerequisite, [Docker](https://docs.docker.com/get-docker/)

```bash
docker build . -t coding-challenges
docker run --rm coding-challenges
```

Execute in watch mode with [Guard gem](https://github.com/guard/guard)
and `docker compose`

```bash
docker compose up

# or with rebuilding the Docker image
docker compose up --build

# or to force recreation
docker compose up --build --force-recreate
```

## Code coverage

Code coverage is supported by [simplecov gem](https://github.com/simplecov-ruby/simplecov)
and can be found in [coverage](coverage/index.html) folder after executing specs

## Exercises

* Factorial
* Caesar Cipher
    * A simple implementation of the basic encryption technique
    * Supports alphanumeric and special characters in the range a..z, A..Z, 0..9, !..?, µ..ö
* Longest word calculator
    * Find longest word in a sentence with a choice of separator, default is a whitespace
    * Find longest work in a collection (array of words)
* Hash
    * Flatten a deeply nested hash with composed keys
* Number
    * Round up or down a number to the nearest multiple of given number
        * For simplicity only tested with integer numbers
        * Supports both positive and negative number
        * Separately round up, down or auto
* Find max consecutive 1's in binary array
* Count numbers with even number of digits in an array
* Create sorted array of squares of all integers in given sorted array
* Duplicate 0's in given array without changing it's size
* Merge two sorted arrays into a new combined sorted array
* Delete all instances of given number from an array

