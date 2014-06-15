source("readhospitaldata.R")

# Test the read.hospital.data
oc <- read.hospital.data("heart attack")

rank.number(oc, "best")
rank.number(oc, "worst")
rank.number(oc, 10)

class(oc)
names(oc)
head(oc)

head(read.hospital.data("cancer"))

head(read.hospital.data("heart failure"))
head(read.hospital.data("pneumonia"))

