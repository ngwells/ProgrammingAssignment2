## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function

## Thia function will create several operations to utilize
## including: set, get, getsolve, setsolve


makeCacheMatrix<- function(x = matrix()) {
        m <- NULL
        set <- function(y) {
                x <<- y
                m <<- NULL
        }
        get <- function() x
        setsolve <- function(solve) m <<- solve
        getsolve <- function() m
        list(set = set, get = get,
             setsolve = setsolve,
             getsolve = getsolve)
}

##this function will check to see if the result is already cached in memory.
## If it is - then it doesn't have t repeat all the calcs - esp for large matrices.


cacheSolve<- function(x, ...) {
        m <- x$getsolve()
        if(!is.null(m)) {
                message("getting cached data")
                return(m)
        }
        data <- x$get()
        m <- solve(data)
        x$setsolve(m)          ## Return a matrix that is the inverse of 'x'
        m
}


