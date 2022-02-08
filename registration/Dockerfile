# This dockerfile is used to build a docker image for the registration website.
FROM mcr.microsoft.com/dotnet/sdk:5.0 as build

# Clone and build the website.
RUN git clone --depth 1 https://github.com/APSIMInitiative/APSIM.Registration /APSIM.Registration
RUN cd /APSIM.Registration/source && dotnet publish -c Release -f net5.0 -r linux-x64 --no-self-contained

# Actual container is based on dotnet/aspnet, and doesn't include build tools.
FROM mcr.microsoft.com/dotnet/aspnet:5.0
RUN mkdir -p /opt/APSIM.Registration
COPY --from=build /APSIM.Registration/source/bin/Release/net5.0/linux-x64/publish/ /opt/APSIM.Registration/
ENV ASPNETCORE_ENVIRONMENT=Production
SHELL ["/bin/bash"]
WORKDIR "/opt/APSIM.Registration"
ENTRYPOINT ["/opt/APSIM.Registration/APSIM.Registration"]
