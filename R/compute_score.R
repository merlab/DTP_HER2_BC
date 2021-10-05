G0sig_df <- read.table('data/G0_sig.tsv', header = T)
G0sig <- setNames(G0sig_df$x, rownames(G0sig_df))

geneExp <- read.table('data/NeoALTTO_expression.tsv', header = T)

cg <- intersect(names(G0sig), rownames(geneExp))
G0sig <- G0sig[cg]
geneExp <- geneExp[cg, ]

scrdf <- data.frame()
for (i in colnames(geneExp))
{
  score <- mean(geneExp[, i] * G0sig)
  scrdf <- rbind(scrdf, data.frame(s = i, score = score))
}

##save scores
write.table(scrdf, 'data/NeoALTTO_G0_score.tsv')
