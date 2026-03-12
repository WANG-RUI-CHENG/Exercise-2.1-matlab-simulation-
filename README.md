# Exercise-2.1-matlab-simulation-
透過matlab模擬解出答案

結果在 Command Window

Estimated path loss exponent γ = -3.934

Estimated shadowing std σ_phi_dB = 0.546 dB

---

# Problem Description

已知在 **900 MHz** 的量測資料如下：

| Distance (m) | Pr/Pt (dB) |
|---------------|-----------|
| 5   | -60  |
| 30  | -80  |
| 60  | -105 |
| 110 | -115 |
| 500 | -135 |

其中：

- \(P_r\)：接收功率
- \(P_t\)：發射功率

目標是估計：

1. **Path Loss Exponent**

\[
\gamma
\]

2. **Shadowing Variance**

\[
\sigma_{\phi,dB}
\]


其中：

- \(d\)：傳輸距離
- \(d_0\)：reference distance (1 m)
- \(K\)：free-space path loss constant
- \(\phi_{dB}\)：shadowing term

---


# Computation Procedure

本實驗的計算流程如下：

1. 輸入量測距離與功率資料  
2. 計算波長

\[
\lambda = \frac{c}{f}
\]

3. 計算 free-space constant \(K\)
4. 將資料轉換為 **log-domain**
5. 使用 **least squares regression**
6. 估計 path loss exponent \(γ\)
7. 計算 residual 取得 shadowing standard deviation

---

# Expected Output

程式執行後會輸出：

```text
Estimated path loss exponent γ = ...
Estimated shadowing std σ_phi_dB = ...
```

其中：

- \(γ\) 描述訊號衰減速度
- \(σ_{\phi,dB}\) 表示 shadow fading 強度

---

# Physical Interpretation

一般環境下：

| Environment | Path Loss Exponent |
|-------------|--------------------|
| Free space | 2 |
| Urban area | 3 – 4 |
| Indoor | 2 – 3 |

若估計的 \(γ\) 大於 2，表示環境中存在：

- multipath propagation
- scattering
- obstruction

