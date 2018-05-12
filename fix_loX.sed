# spank subfigure lines since they are not used anyway
s/.*subfigure.*//g
s/$/\\vspace{0.125in}/
# Mitch's Hack
s/\\.}/}/g
