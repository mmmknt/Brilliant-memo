namespace QubitWithQsharp {

    open Microsoft.Quantum.Canon;
    open Microsoft.Quantum.Intrinsic;
    open Microsoft.Quantum.Convert;
    

    @EntryPoint()
    operation HelloQ() : Unit {
        using ((q1, q2) = (Qubit(), Qubit())) {
            // Some operations
            // X gate
            X(q1);
            // Hadamard gate
            H(q1);
            // Hadamard gate
            H(q1);
            // X gate
            X(q1);
            // Measure
            let result1 = M(q1);

            Message($"Final state: {result1}");

            // Measure Hadamard state
            H(q2);
            let result2 = M(q2);
            
            Message($"Result: {result2}");

            // post-process for de-allocate qubit
            // 割り当てたQubitはリリースする時に∣0⟩にしないといけない
            ResetQubit(q1);
            ResetQubit(q2);
        }

        // Multi measurements for observing probability state.
        mutable zeros = 0;
        mutable total = 0;
        // 1. Initialize a qubit
        // 2. Operate to a qubit
        // 3. Measure a qubit state
        // 4. Repeat
        for (i in 0 .. 99) {
            using (q = Qubit()) {
                Circuit(q);

                let result = M(q);
                // Convert Boolean to Integer
                let resultInt = ResultArrayAsInt([result]);
                set total += 1;
                if (resultInt == 0) {
                    set zeros += 1;
                }
                Message($"Result[{i}]: {resultInt}");

                ResetQubit(q);
            }
        }
        let ones = total - zeros;
        Message($"histogram: total: {total} zeros: {zeros} ones: {ones}");
    }

    operation Circuit(target : Qubit) : Unit {
        H(target);
        T(target);
        H(target);
    }

    operation ResetQubit(q : Qubit) : Unit {
        let result = M(q);
        if (result == One) {
            X(q);
        }
    }
}

