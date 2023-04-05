import matplotlib.pyplot as plt
import numpy as np
import sys

for corner in ("TT", "SS", "SF", "FS", "FF"):
    Q, QB, Q_R, QB_R = np.loadtxt(f"{sys.argv[1]}_{corner}.csv", delimiter=',', skiprows=1, unpack=True)
    plt.figure()
    plt.plot(Q, QB)
    plt.plot(QB, Q)
    plt.grid()
    plt.xlabel("Q (V)")
    plt.ylabel("QB (V)")
    plt.title("Hold Butterfly Plot")
    plt.savefig(f"hold_{corner}.png", dpi=300)

    plt.figure()
    plt.plot(Q_R, QB_R)
    plt.plot(QB_R, Q_R)
    plt.grid()
    plt.xlabel("Q (V)")
    plt.ylabel("QB (V)")
    plt.title("Read Butterfly Plot")
    plt.savefig(f"read_{corner}.png", dpi=300)
