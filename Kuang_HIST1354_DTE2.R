library(ggplot2)

file <- "/Users/caitlin/Desktop/unser zeit/Schoolwork/Vanderbilt/HIST 1354/historical_trade_data.csv"
data <- read.csv(file)
data

for (i in 1:nrow(data)) {
  exportvalue <- data[i, "Exports"]
  if (exportvalue > 200000) {
    print(data[i, ])
  }
}

balancelist <- list()

for (i in 1:nrow(data)) {
  balancevalue <- data[i, "Exports"] - data[i, "Imports"]
  balancelist[[length(balancelist)+1]] = balancevalue
}

data$Balance <- c(balancelist)

data$Balance <- as.numeric(data$Balance)

data

png("/Users/caitlin/Desktop/mybalanceplot.png")
ggplot(data=data, aes(x=Year, y=Balance, group=1)) + geom_line() + geom_point()
dev.off()
