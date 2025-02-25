
year <- 2021
x <- read.scobs(year, source = "csv")
x$longitude <- as.numeric(x$longitude)
x$latitude  <- as.numeric(x$latitude)
x <- x[!is.na(x$longitude), ]

vars <- c("longitude", "latitude")

r <- unique(x[vars])

clg()
png(file = paste0("C:/Users/SuretteTJ/Desktop/github/fishery-observer/figures/At-sea observer map ", year, ".png"), units = "in", res = 400, height = 7.5, width = 8.5)
map.new()
rect(par("usr")[1], par("usr")[3], par("usr")[2], par("usr")[4], col = "lightblue")
bathymetry()

points(r$longitude, r$latitude, pch = 21, cex = 0.5, bg = "red", lwd = 0.2)

# Fishing zones:
v <- read.gulf.spatial("fishing zone vertices shp", species = 2526, region = "gulf", label = c("12", "12E", "12F", "19"))
v <- subset(v, label %in% c("12", "12E", "12F", "19"))
plot(v, col = "grey20", lwd = 1.5, add = TRUE)

map("coast", col = "antiquewhite")

mtext(year, 3, 0.5, font = 2, cex = 1.5)
map.axis(1:2)

box(col = "grey50")
dev.off()

