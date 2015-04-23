#!/usr/bin/Rscript
##
## Script to run tests against cacheSolve & makeCacheMatrix() for assignment 2
##

cat( "----------------------------------------------------------------------\n")
cat( "-----> Testing cacheSolve()...\n")
cat( "sourcing cachematrix.R...\n")
source('cachematrix.R')

cat( "----------------------------------------------------------------------\n")
cat( "--> Test 1: 3x3 matrix...\n" )

m1 = matrix( c(1, 1, 1, 3, 4, 3, 3, 3, 4), nrow=3, ncol=3)

cat("Original matrix:\n")
m1

x1 = makeCacheMatrix(m1)

y1 = cacheSolve(x1)

cat("Inverted matrix:\n")
y1

cat("testing multiplication to get identity matrix:\n")
m1 %*% y1

cat( "----------------------------------------------------------------------\n")
cat( "--> Test 2: same matrix, should get message about cache\n")
y2 = cacheSolve(x1)

y2


cat( "----------------------------------------------------------------------\n")
cat( "--> Test 3: 2x2 matrix\n");

m3 = matrix( c(4, 3, 3, 2), nrow=2, ncol=2)
cat("Original matrix:\n")
m3

x3 = makeCacheMatrix(m3)

y3 = cacheSolve(x3)

cat("Inverted matrix:\n")
y3

cat("testing multiplication to get identity matrix:\n")
m3 %*% y3


cat( "----------------------------------------------------------------------\n")
cat( "--> Test 4: same matrix as test 3, should get message about cache\n")
y4 = cacheSolve(x3)

y4

cat( "----------------------------------------------------------------------\n")
cat( "--> Test 5: same matrix as test 1, should get message about cache\n")
y5 = cacheSolve(x1)

y5

