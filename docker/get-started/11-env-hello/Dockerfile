FROM alpine

ENV FOO hello
ENV BAR world

RUN touch $FOO.txt

# ENV variables are case-sensitive, so the following instruction ends up
# creating a file named .txt (not world.txt)
RUN touch $Bar.txt
