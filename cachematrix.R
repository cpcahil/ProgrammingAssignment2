#!/usr/bin/Rscript
##
## Assignment:      R Programming Assignment 2
##
## Author:          Conor P. Cahill
##
## Description:     Write a caching matrix inversion function that will 
##                  solve a matrix and return the inverse, remembering the
##                  solution and using that solution if the same operation
##                  is repeated (rather than solving it again).

##
## Function:        makeCacheMatrix
##
## Parameters:      m - a matrix (which defaults to an empty matrix)
##
## Description:     Creates a cached inverse matrix structure used by cacheSolve() to 
##                  record the value of a solved matrix inversion so that it is available
##                  for subsequent invocations
##
makeCacheMatrix <- function(m = matrix()) {
    #
    # local storage of the inversed matrix
    #
    inv <- NULL

    #
    # set(y) - operation to set the initial values of the cached matrix to y
    #
    set <- function(y) {
        m <<- y
        inv <<- NULL
    }

    #
    # get() -  operation to get the original matrix
    #
    get <- function() {
        m
    }

    #
    # setinverse(new_inv) - operation to set the inverse of the matrix to new_inv
    #
    setinverse <- function(new_inv) {
        inv <<- new_inv
    }

    #
    # getinverse() - operation to get the cached inverse of the matrix
    #
    getinverse <- function() {
        inv
    }

    #
    # return a vector that includes all of the operations we just defined
    #
    list(set = set, get = get, setinverse = setinverse, getinverse = getinverse)

}

##
## Function:        casheSolve()
##
## Parameters:      m - a cached matrix created using makeCacheMatrix()
##                  ... - extra parameters for the solve() function
##
## Description:     Checks to see if we've already solved this matrix and
##                  if so, returns the cached solution.  Otherwise solve 
##                  the matrix, store the solution in the cache and return
##                  the calculated value.
##
cacheSolve <- function(m, ...) {

    #
    # check to see if we've already solved this matrix and if so,
    # return the cached value
    #
    inv <- m$getinverse()
    if(!is.null(inv)) {
        message("getting cached data")
        return(inv)
    }
    #
    # Ok, we didn't have the cached value, so we have to calculate 
    # the value ourselves, so get the data and use solve to invert
    # the matrix
    #
    data <- m$get()
    inv <- solve(data, ...)

    #
    # store the results in the cache so we can use that next time
    #
    m$setinverse(inv)

    #
    # return the calculated inverse
    #
    inv
}
