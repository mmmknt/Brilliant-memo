# Quantum Teleportation
量子テレポーテーションをQ#で実装する

## memo
no-clonig theorem
* ∣ψ⟩⊗∣0⟩ -> ∣ψ⟩⊗∣ψ⟩になるようなgateは理論上存在しない

quantum teleportation
* ∣ψ⟩⊗∣0⟩ -> ∣0⟩⊗∣ψ⟩になるようなgateはあるか？
* 制約
  * 転送先にテキストデータは送信できる
  * テキストデータだけではqubitの状態を表現できない（無限の情報量が必要になるので）

requirement
* 送信元と送信先のqubitを紐づけるため、それらをbridgeする3つ目のqubitが必要になる
* ∣ψfrom⟩⊗∣ψbridge⟩⊗∣ψto⟩
* 送信元は任意の状態から開始。∣ψfrom⟩ = α∣0⟩+β∣1⟩
* bridgeと送信先はBell stateから開始。∣ψbridgeψto⟩ = ∣00⟩+∣11⟩
* そのため、初期状態は ∣ψjoint⟩ = α∣000⟩ + α∣011⟩ + β∣100⟩ + β∣111⟩
* ∣ψfrom⟩と∣ψbridge⟩に何らかの操作を行う

送信元の計測結果がどの状態でも送信先にαとβを送信したい
* ∣ψjoint⟩ = H1CNOT12(α∣000⟩+β∣100⟩+α∣011⟩+β∣111⟩)
  = H1(α∣000⟩+β∣110⟩+α∣011⟩+β∣101⟩) = ∣00⟩⊗(α∣0⟩+β∣1⟩) + ∣10⟩⊗(α∣0⟩−β∣1⟩) + ∣01⟩⊗(β∣0⟩+α∣1⟩) + ∣11⟩⊗(−β∣0⟩+α∣1⟩)
* 送信先のqubitを送信元のqubitと同じ状態にするには
  * 送信元での計測結果が∣00⟩
    * 送信先ではI(α∣0⟩+β∣1⟩) = ∣ψfrom⟩
  * 送信元での計測結果が∣01⟩
    * 送信先ではX(β∣0⟩+α∣1⟩) = ∣ψfrom⟩
  * 送信元での計測結果が∣10⟩
    * 送信先ではZ(α∣0⟩-β∣1⟩) = ∣ψfrom⟩
  * 送信元での計測結果が∣11⟩
    * 送信先ではXZ(-β∣0⟩+α∣1⟩) = ∣ψfrom⟩

性質
* quantum teleportationは送信元のqubitの状態を測定する必要はない
* teleportationが完了すると、送信元の状態は送信前と異なる
* 送信元での測定結果を送信先に伝える必要があるため、その情報の送信速度よりも速くteleportaionはできない