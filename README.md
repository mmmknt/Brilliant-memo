# Brilliant-memo

[BrilliantのQuantum Computingコース](https://brilliant.org/courses/quantum-computing/)に出てきたトピックを実装する場所

コースが終わったら[Quantum Kata](https://github.com/Microsoft/QuantumKatas)に取り組みたい。

## チートシート
量子ビットの計算状態
* ∣0⟩
* ∣1⟩

量子状態
* a∣0⟩ + b∣1⟩
* P(∣0⟩) = (a^2)/(a^2 + b^2)
* P(∣1⟩) = (b^2)/(a^2 + b^2)

Hadamard states and Hadamard gate
* ∣+⟩ = H∣0⟩
* ∣-⟩ = H∣1⟩

Not gate
* X∣0⟩ = ∣1⟩
* X∣1⟩ = ∣0⟩

Phase gate
* Z∣0⟩ = ∣0⟩
* Z∣1⟩ = -∣1⟩
* Z = S^2
* S∣+⟩ = ∣μ⟩ = 1/√2(∣0⟩ + i∣1⟩)
* S^3∣+⟩ = ∣ν⟩ = 1/√2(∣0⟩ - i∣1⟩)

Bloch sphere
* ∣0⟩と∣1⟩、∣+⟩と∣-⟩、∣μ⟩と∣ν⟩がそれぞれ球の軸になっていて、それぞれの軸が直行している
* Bloch sphere上の配置は以下のイメージ
  * 上から下に∣0⟩->∣1⟩がZ軸。
  * 右から左に∣+⟩->∣-⟩がX軸。
  * 奥から手前に∣μ⟩->∣ν⟩がY軸。
  * Phase gateはZ軸を中心とした回転操作。
  * Not gateはX軸を中心とした回転操作。
  * Hadamard gateはX軸とZ軸の間の対角線を中心とした回転操作。
* 全てのgateはベクトルの数学的な回転で表現されるため、長さは変わらない。

Bloch sphere上の量子状態の表現
* cos(θ/2)∣0⟩ + e ^(iϕ)sin(θ/2)∣1⟩

↑の変数を用いたGateの一般表現の例
* X = Rx(θ)
* Z = Rz(ϕ)

joint state
* テンソル積
* ∣0⟩ ⊗ ∣0⟩
* H∣0⟩ ⊗ ∣0⟩ = (H∣0⟩) ⊗ ∣0⟩ = (1/√2∣0⟩ + 1/√2∣1⟩) ⊗ ∣0⟩ = 1/√2∣0⟩⊗∣0⟩ + 1/√2∣1⟩⊗∣0⟩

joint sateの簡略表記
* ∣0⟩ ⊗ ∣1⟩ = ∣01⟩

Bell state:
* ∣ψ⟩Bell = 1/√2(∣00⟩ + ∣11⟩)

量子もつれ
* 独立したn個のqubitの組み合わせは、 ∣ψ⟩n-qubit = (a1∣0⟩+a2∣1⟩) ⊗ (b1∣0⟩+b2∣1⟩) ⊗ ...
  * 独立した係数は2n個
* 一般的なn個のqubitの組み合わせは、 ∣ψ⟩n-qubit = a1∣000...000⟩ + a2∣000...001⟩ + a3∣000...010⟩ + ...
  * 独立した係数は2^n個
* この差より、n個のqubitについて考える際にn個のBloch sphereを考えるだけでは不十分であることが分かる。
  * 相互作用のある状態が存在
​	
## appendix
### online courses
* [Quantum Physics I(Spring 2013)](https://ocw.mit.edu/courses/physics/8-04-quantum-physics-i-spring-2013/)
* [Quantum Physics I(Spring 2016)](https://ocw.mit.edu/courses/physics/8-04-quantum-physics-i-spring-2016/)

それぞれでアプローチが違っているらしいので、両方見てみたい。
> This presentation of 8.04 by Barton Zwiebach (2016) differs somewhat and complements nicely the presentation of Allan Adams (2013). Adams covers a larger set of ideas; Zwiebach tends to go deeper into a smaller set of ideas, offering a systematic and detailed treatment. Adams begins with the subtleties of superpostion, while Zwiebach discusses the surprises of interaction-free measurements. While both courses overlap over a sizable amount of standard material, Adams discussed applications to condensed matter physics, while Zwiebach focused on scattering and resonances. The different perspectives of the instructors make the problem sets in the two courses rather different.