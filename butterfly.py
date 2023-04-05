import matplotlib.pyplot as plt
import numpy as np
import sys

Q, QB, Q_R, QB_R = np.loadtxt(sys.argv[1], delimiter=',', skiprows=1, unpack=True)
plt.plot(Q, QB)
plt.plot(QB, Q)
plt.grid()
plt.xlabel("Q (V)")
plt.ylabel("QB (V)")
plt.title("Hold Butterfly Plot")
plt.savefig("hold.png", dpi=300)

plt.figure()
plt.plot(Q_R, QB_R)
plt.plot(QB_R, Q_R)
plt.grid()
plt.xlabel("Q (V)")
plt.ylabel("QB (V)")
plt.title("Read Butterfly Plot")
plt.savefig("read.png", dpi=300)
