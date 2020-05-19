namespace QuauntumTeleportation {

    open Microsoft.Quantum.Canon;
    open Microsoft.Quantum.Intrinsic;
    open Microsoft.Quantum.Convert;
    

    @EntryPoint()
    operation HelloQ() : Unit {
        for (i in 0..9) {
            using ((qf, qb, qt) = (Qubit(), Qubit(), Qubit())) {
                // Prepare
                H(qb);
                CNOT(qb, qt);

                // Create original qubit
                if (i % 2 == 0) {
                    X(qf);
                    Message("original is One");
                } else {
                    Message("original is Zero");
                }

                let encoded = Encode(qf, qb);
                Message($"encoded: {encoded}");

                Decode(qt, encoded);

                Reset(qf);
                Reset(qb);
                Reset(qt);
            }
        }
    }

    operation Encode(qf : Qubit, qb : Qubit) : Int[] {
        CNOT(qf, qb);
        H(qf);
        
        let resultf = M(qf);
        let resultb = M(qb);
        return [ResultArrayAsInt([resultf]), ResultArrayAsInt([resultb])];
    }

    operation Decode(qt : Qubit, encoded : Int[]) : Unit {
        if (encoded[0] == 0 and encoded[1] == 0) {
            // Do nothing
        } elif (encoded[0] == 0 and encoded[1] == 1) {
            X(qt);
        } elif (encoded[0] == 1 and encoded[1] == 0) {
            Z(qt);
        } else {
            Z(qt);
            X(qt);
        }
        let result = M(qt);
        Message($"Result: {result}");
    }
}

