# This dockerfile is used to build a docker image for the builds website.
FROM mcr.microsoft.com/dotnet/sdk:8.0 as build

# Clone and build the website.
RUN git clone --depth 1 https://github.com/APSIMInitiative/APSIM.Builds /APSIM.Builds
RUN cd /APSIM.Builds/src/APSIM.Builds && dotnet publish -c Release -f net8.0 -r linux-x64 --no-self-contained

# Actual container is based on dotnet/aspnet, and doesn't include build tools.
FROM mcr.microsoft.com/dotnet/aspnet:8.0
RUN mkdir -p /opt/APSIM.Builds
COPY --from=build /APSIM.Builds/src/APSIM.Builds/bin/Release/net8.0/linux-x64/publish/ /opt/APSIM.Builds/
ENV ASPNETCORE_ENVIRONMENT=Production
SHELL ["/bin/bash"]
WORKDIR "/opt/APSIM.Builds"
ENTRYPOINT ["/opt/APSIM.Builds/APSIM.Builds"]
