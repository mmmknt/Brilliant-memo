# Entanglemnet Circuit

量子もつれをQ#で実装する

## memo

Bell state
* ∣ψBell⟩ = 1/√2(∣00⟩ + ∣11⟩)

Controlled NOT
* CNOT∣00⟩ = |00⟩
* CNOT∣01⟩ = |01⟩
* CNOT∣10⟩ = |11⟩
* CNOT∣11⟩ = |10⟩

How to modify to Bell state
* CNOT(H|00⟩) = CNOT(1/√2(|00⟩ + |10⟩) = 1/√2(|00⟩ + |11⟩)