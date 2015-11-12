#!/usr/bin/env python
import openpnl
print dir(openpnl)

model = openpnl.pnlExCreateRndArHMM()
model = openpnl.pnlExCreateKjaerulfsBNet()

openpnl.CDBN_Create(model)
