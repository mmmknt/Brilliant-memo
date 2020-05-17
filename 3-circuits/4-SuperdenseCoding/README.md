# Superdense Coding
超密符号化をQ#で実装

## memo
Quantum Communicationでは、もつれだけを利用して情報を伝えることはできないことが分かった。

もつれを利用してqubitの数より多くのbit数の情報を送ることができるか？

1qubitの持つ情報量
* 1bitは0と1の二つの状態のみを離散的に表現できる
* 1qubitは∣0⟩と∣1⟩の間を連続して表現できるため、符号化していない状態では無限の情報量を持つ

2つのqubitの状態で表現できる情報量
* 以下の4つの状態を取り得る
  * ∣00⟩
  * ∣01⟩
  * ∣10⟩
  * ∣11⟩
* 2bitしか表現できない

送信元でBell stateに符号化を行い、送信先でCNOT gateを適用することでqubitを分離して4つの状態の組み合わせに分離できる
* I∣ψBell⟩ = ∣00⟩ + ∣11⟩
  * CNOT(I∣ψBell⟩) = ∣+⟩⊗∣0⟩
* X∣ψBell⟩ = ∣10⟩ + ∣01⟩
  * CNOT(X∣ψBell⟩) = ∣+⟩⊗∣1⟩
* Z∣ψBell⟩ = ∣00⟩ - ∣11⟩
  * CNOT(Z∣ψBell⟩) = ∣-⟩⊗∣0⟩
* XZ∣ψBell⟩ = ∣10⟩ - ∣01⟩
  * CNOT(XZ∣ψBell⟩) = ∣-⟩⊗∣1⟩
* 一つ目のqubitの測定結果が二つ目のqubitの測定結果に影響を与えていない

以下の流れで、1つのqubitで2bit分の情報を送信できる
* Bell stateの1つのqubitに以下のいずれかの操作を行う
  * I gate（何もしない）
  * X gate
  * Z gate
  * X gate and Z gate
* 操作したqubitを送信先に渡す
* 送信先で受信したqubitとBell stateのもう一つのqubitにCNOT gateを適用

