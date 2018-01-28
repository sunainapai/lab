# Build our image with debian as base.
FROM debian

# Execute command in a new layer and commit the result.
RUN apt-get update
rUn apt-get install tree

# Set default command for an executing container.
CMD tree /var/log
