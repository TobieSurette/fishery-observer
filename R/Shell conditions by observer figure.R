
years <- c(2017:2019, 2021:2024)
years <- c(2023:2024)
r <- NULL
for (i in 1:length(years)){
   x <- read.scobs(years[i], source = "csv", type = "sea")
   x <- x[which(x$zone == "12"), ]
   x <- x[which(month(date(x)) %in% 4:5), ]
   x$longitude <- as.numeric(x$longitude)
   x$latitude  <- as.numeric(x$latitude)
   x <- x[!is.na(x$longitude), ]
   t <- table(x$observer, x$shell.condition)
  
   t <- cbind(data.frame(year = years[i], observer = rownames(t)), "1" = t[,1], "2" = t[,2], "3" = t[,3], "4" = t[,4], "5" = t[,5])

   r <- rbind(r, t)
}
rownames(r) <- NULL
r$observer <- observer(r$observer)
r <- aggregate(r[c(as.character(1:5))], by = r[c("year", "observer")], sum)

png(file = paste0("C:/Users/SuretteTJ/Desktop/github/fishery-observer/figures/Shell conditions by observers.png"), 
    units = "in", res = 400, height = 11, width = 8.5)
vars <- as.character(1:5)
p <- r[vars] / repvec(apply(r[vars], 1, sum), ncol = length(vars))

par(mar = c(5, 14, 4, 2) + 0.1)

image(1:5, 1:nrow(p), z = t(p)[, rev(1:nrow(p))], xaxt = "n", yaxt = "n", xlab = "", ylab = "")

res <- aggregate(1:nrow(r), by = r["observer"], mean)
res$n <- aggregate(list(n = 1:nrow(r)), by = r["observer"], length)$n

ix <- which(res$n >=1)
axis(2, at = res$x[ix], labels = rev(res$observer[ix]), las = 1, cex = 0.8)
axis(1, at = 1:5, labels = 1:5)
mtext("Shell condition", 1, 2.5, font = 2, cex = 1.5)
#mtext("Observer", 2, 2.5, font = 2, cex = 1.5)
box(col = "grey50")
dev.off()
