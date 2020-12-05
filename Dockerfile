FROM gcc:4.9 AS build
COPY . /usr/src/myapp
WORKDIR /usr/src/myapp
RUN gcc -o hello -static chello.c


FROM scratch
COPY --from=build /usr/src/myapp/hello .
CMD ["./hello"]
