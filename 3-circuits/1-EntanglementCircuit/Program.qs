namespace entanglementcircuit {

    open Microsoft.Quantum.Canon;
    open Microsoft.Quantum.Intrinsic;
    open Microsoft.Quantum.Convert;
    
    @EntryPoint()
    operation HelloQ() : Unit {
        mutable total = 0;
        mutable same = 0;
        for (i in 0 .. 99) {
            using ((q1, q2) = (Qubit(), Qubit())) {
                // Create Bell state
                ReflectToBellState(q1, q2);

                // Measure the states
                let result1 = M(q1);
                let result2 = M(q2);
                let result1Int = ResultArrayAsInt([result1]);
                let result2Int = ResultArrayAsInt([result2]);
                Message($"result1: {result1Int} result2: {result2Int}");

                set total += 1;
                if (result1 == result2) {
                    set same += 1;
                }

                // Post-process
                ResetQubit(q1);
                ResetQubit(q2);
            }
        }
        Message($"total: {total} same: {same}");
    }

    operation ReflectToBellState(q1 : Qubit, q2 : Qubit) : Unit {
        // Modify control bit to Hadamard
        H(q1);
        // Reflect control NOT
        CNOT(q1, q2);
    }

    operation ResetQubit(q : Qubit) : Unit {
        let result = M(q);
        if (result == One) {
            X(q);
        }
    }
}

