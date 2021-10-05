library(ggpubr)

pcr <- read.table('data/NeoALTTO_pCR.tsv')
colnames(pcr)[1] <- 'pCR'

G0.score <- read.table('data/NeoALTTO_G0_score.tsv')
pcr[, 'G0 score'] <- G0.score$score

plt <- ggboxplot(
  pcr,
  x = "pCR",
  y = 'G0 score',
  color = "pCR",
  palette = "jco",
  add = "jitter"
)
plt <- plt + stat_compare_means(method = "t.test")
plt <- plt + ggtitle('NeoALTTO\n(lapatinib arm)')
plt <-
  plt + theme(plot.title = element_text(hjust = 0.5, size = 8, face = "bold"))
plt <- plt + theme(legend.position = "right")

pdf('data/boxplots_NeoALTTO_Lapatinib.pdf',
    width = 4.5,
    height = 6)
print(plt)
dev.off()
