FROM alpine

# WORKDIR sets the working directory for any RUN, CMD, ENTRYPOINT, COPY
# and ADD instructions that follow it. It creates the directory if it
# does not exist.
WORKDIR a
RUN touch a.txt

# Change WORKDIR with relative path.
WORKDIR ../b
ADD b.txt .

# Change WORKDIR with absolute path.
WORKDIR /c

# If we run this image with docker run -it <image>, the default shell
# will have /c as the working directory.
