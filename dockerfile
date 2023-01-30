FROM mcr.microsoft.com/dotnet/sdk:6.0 AS build

COPY ./src .

RUN dotnet restore
RUN dotnet publish "GeoPet" - Realease -o /dist

FROM mcr.microsoft.com/dotnet/aspnet:6.0

COPY --from=build /dist .

ENTRYPOINT ["dotnet", "GeoPet.dll"]