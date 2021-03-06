@testset "Basic Functionality" begin

    A = rand(100,100)
    img = DirectImage(A)
    img[1,1]

    img = DirectImage(A, -50:50, -50:50)
    img[0,0]

    img = DirectImage(A, -25:0.5:25, -25:0.5:25)
    img[1.5,1.5]

    img = DirectImage(A, -25m:0.5m:25m, -25m:0.5m:25m)
    img[9.5m,20m]

    img = DirectImage(view(A, 1:10, 1:10), 1:10, 1:10)
    img[5,5]

    img = DirectImage(A, c=1, d=2, f=5)
    img.c == 1

    img = DirectImage(A, f = 1 => "a comment", b = 5 => "another comment")
    img.f == 1
    img[/].f == "a comment"

    # comments must be string, values must be union{number,string,}


    @testset "IO" begin
        
        img = DirectImage("test.fits")
        img = DirectImage("test.fits", 1, 1:100, 2:5)

        write("test2.fits", img)
    end

    # Need to handle multi-dimensional cubes
    # Want to also be able to stack multiple arrays or views into one thing that looks like
    # a cube.

end