namespace SuperdenseCoding {

    open Microsoft.Quantum.Canon;
    open Microsoft.Quantum.Intrinsic;
    open Microsoft.Quantum.Math;
    

    @EntryPoint()
    operation HelloQ() : Unit {
        for (i in 0..9) {
            using ((q1, q2) = (Qubit(), Qubit())) {
                Message("Start...");
                let message = [RandomInt(2), RandomInt(2)];
                Message($"Message is: {message}");

                // Prepaired
                H(q1);
                CNOT(q1, q2);

                Encode(q1, message);

                Decode(q1, q2);

                // post-process
                Reset(q1);
                Reset(q2);
            }
        }
    }

    operation Encode(q : Qubit, message : Int[]) : Unit {

        if (message[0] == 0 and message[1] == 0) {
            Message("operation: I");
        } elif (message[0] == 0 and message[1] == 1) {
            Message("operation: X");
            X(q);
        } elif (message[0] == 1 and message[1] == 0) {
            Message("xperation: Z");
            Z(q);
        } else {
            Message("operation: XZ");
            Z(q);
            X(q);
        }
    }

    operation Decode(controlQ : Qubit, targetQ : Qubit) : Unit {
        CNOT(controlQ, targetQ);
        H(controlQ);

        let result1 = M(controlQ);
        let result2 = M(targetQ);
        Message($"Result: {result1} {result2}");
    }
}

