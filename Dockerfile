# Process the final output pages
FROM python:3
RUN pip install beautifulsoup4
COPY publish.py .
COPY Layers/* /out/
RUN ./publish.py /out/*.html


# Build a minimal final image
FROM abiosoft/caddy

COPY demo docs pdf /srv/

# Copy parsed files
COPY --from=0 /out/* /srv/
# Default page is the intro layer.
COPY Caddyfile /etc/