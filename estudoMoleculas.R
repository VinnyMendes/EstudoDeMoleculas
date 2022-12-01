#importando os dados. Tem que rever o caminho para que funcione
data <- read.csv('C:/Users/User/Downloads/moleculas.csv')

#estrutura da base de dados
str(data)

#resumo da base de dados
summary(data)

#quantidade de linhas
nrow(data)

#primeros 5 valores
head(data)

#quantidade de colunas
length(data)

#transformando a coluna que estava com o tipo errado em numeric
data$exact_mol_wt = as.numeric(data$exact_mol_wt)

#boxplot de todas as variáveis numéricas
boxplot(data$exact_mol_wt) +
legend(x = "topleft", legend = "exact_mol_wt", bty = "n")

boxplot(data$num_rotatable_bonds) +
legend(x = "topleft", legend = "num_rotatable_bonds", bty = "n")

boxplot(data$mol_log_p) +
legend(x = "topleft", legend = "mol_log_p", bty = "n")

boxplot(data$ring_count) +
legend(x = "topleft", legend = "ring_count", bty = "n")

boxplot(data$num_h_acceptors) +
legend(x = "topleft", legend = "num_h_acceptors", bty = "n")

boxplot(data$tpsa) +
legend(x = "topleft", legend = "tpsa", bty = "n")

boxplot(data$num_h_donors) +
legend(x = "topleft", legend = "num_h_donors", bty = "n")

#quantidade de vezes que o valor se repete nas variaveis
table(data$ring_count)
table(data$num_h_acceptors)
table(data$num_h_donors)

#quantidade de vezes que o valor se repete nas variaveis graficamente exibido
hist(data$ring_count)
hist(data$num_h_acceptors)
hist(data$num_h_donors)

#correlacao entre as variaveis

cor.test(data$exact_mol_wt, data$ring_count) #0.55
cor.test(data$exact_mol_wt, data$num_rotatable_bonds) #0.54
cor.test(data$exact_mol_wt, data$mol_log_p) #0.57
cor.test(data$exact_mol_wt, data$num_h_acceptors) #0.42
cor.test(data$exact_mol_wt, data$num_h_donors) #0.003
cor.test(data$exact_mol_wt, data$tpsa) #0.30

cor.test(data$ring_count, data$num_rotatable_bonds) #-0.004
cor.test(data$ring_count, data$mol_log_p) #0.43
cor.test(data$ring_count, data$num_h_acceptors) #0.15
cor.test(data$ring_count, data$num_h_donors) #-0.22
cor.test(data$ring_count, data$tpsa) #0.0009

cor.test(data$num_rotatable_bonds, data$mol_log_p) #0.18
cor.test(data$num_rotatable_bonds, data$num_h_acceptors) #0.41
cor.test(data$num_rotatable_bonds, data$num_h_donors) #0.18
cor.test(data$num_rotatable_bonds, data$tpsa) #0.18

cor.test(data$mol_log_p, data$num_h_acceptors) #-0.29
cor.test(data$mol_log_p, data$num_h_donors) #-0.27
cor.test(data$mol_log_p, data$tpsa) #-0.34

cor.test(data$num_h_acceptors, data$num_h_donors) #0.27
cor.test(data$num_h_acceptors, data$tpsa) #0.92

cor.test(data$num_h_donors, data$tpsa) #0.39


#grafico das maiores correlacoes
plot(data$exact_mol_wt, data$ring_count)
plot(data$exact_mol_wt, data$num_rotatable_bonds)
plot(data$exact_mol_wt, data$mol_log_p)

plot(data$num_h_acceptors, data$tpsa)

library(tidyverse)

ggplot(data=data) +
  geom_point(mapping= aes(x=exact_mol_wt, y=ring_count))

ggplot(data=data) +
  geom_point(mapping= aes(x=exact_mol_wt, y=num_rotatable_bonds))

ggplot(data=data) +
  geom_point(mapping= aes(x=exact_mol_wt, y=mol_log_p))

ggplot(data=data) +
  geom_point(mapping= aes(x=num_h_acceptors, y=tpsa))

#escolhendo o melhor grafico e adicionando linha de tendencia

ggplot(data = data, mapping = aes(x = exact_mol_wt, y=ring_count)) + geom_point() + geom_smooth()

ggplot(data = data, mapping = aes(x = exact_mol_wt, y=num_rotatable_bonds)) + geom_point() + geom_smooth()

ggplot(data = data, mapping = aes(x = exact_mol_wt, y=mol_log_p)) + geom_point() + geom_smooth()

ggplot(data = data, mapping = aes(x=num_h_acceptors, y=tpsa)) + geom_point() + geom_smooth()

