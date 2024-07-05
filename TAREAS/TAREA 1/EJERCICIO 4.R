# Datos #
redbeet <- c(18, 5, 10, 8, 16, 12, 8, 8, 11, 5, 6, 8, 9, 21, 9)
barley <- c(8, 5, 10, 19, 15, 18, 11, 8, 9, 4, 5, 13, 7, 5, 7)

wilcox.test(redbeet,barley, 
            alternative = "two.sided", conf.int = TRUE, conf.level = 0.95)
