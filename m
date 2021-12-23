Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7903E47E142
	for <lists+linux-doc@lfdr.de>; Thu, 23 Dec 2021 11:19:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347660AbhLWKT2 (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Thu, 23 Dec 2021 05:19:28 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46372 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1347655AbhLWKT2 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 23 Dec 2021 05:19:28 -0500
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 483ECC061401;
        Thu, 23 Dec 2021 02:19:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
        MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
        :Reply-To:Content-Type:Content-ID:Content-Description;
        bh=jw66wCrS2DrPyoyS13r3mLKvoV8vE024tGsLBolnxQc=; b=KUmy4Rpj7eY6YWLV1XvoRlKu1l
        /GjLih/AQ9QmpGInpA0uBiv1/Lt0B3pSXeFi0fjfKowracA5jlpd2B3d2uMV9EmI9KauIGo8PKl6e
        ODGGEBA4t/b1LjlPzf4zE9+b8XMSVJzFtuhtEHTUmxc98H50QRzFa1/Zxf1EHXQeFBGaj6fBbrwAh
        dfWIPET87iM2xUT1/KkrESztH0xWJVi/t9IQBar127G8I1Uzy1OTxioqxB7Eevg2L6HZ+uaa8UZ/i
        oGui/OdX/z9y85idfl8dl6Eu7Z4SBroFtW2wh2/O/V78XSjduV3L9ehCZ+n32d/rlgFGs8ep14MAB
        gRqLwcWQ==;
Received: from [46.183.103.8] (helo=localhost)
        by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
        id 1n0LBw-00CTll-JC; Thu, 23 Dec 2021 10:19:21 +0000
From:   Christoph Hellwig <hch@lst.de>
To:     Jonathan Corbet <corbet@lwn.net>,
        Alexei Starovoitov <ast@kernel.org>,
        Daniel Borkmann <daniel@iogearbox.net>,
        Andrii Nakryiko <andrii@kernel.org>
Cc:     Martin KaFai Lau <kafai@fb.com>, Song Liu <songliubraving@fb.com>,
        Yonghong Song <yhs@fb.com>,
        John Fastabend <john.fastabend@gmail.com>,
        KP Singh <kpsingh@kernel.org>, linux-doc@vger.kernel.org,
        netdev@vger.kernel.org, bpf@vger.kernel.org
Subject: [PATCH 2/4] bpf, docs: Split the comparism to classic BPF from instruction-set.rst
Date:   Thu, 23 Dec 2021 11:19:04 +0100
Message-Id: <20211223101906.977624-3-hch@lst.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211223101906.977624-1-hch@lst.de>
References: <20211223101906.977624-1-hch@lst.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by bombadil.infradead.org. See http://www.infradead.org/rpr.html
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Split the introductory that explain eBPF vs classic BPF and how it maps
to hardware from the instruction set specification into a standalone
document.  This duplicates a little bit of information but gives us a
useful reference for the eBPF instrution set that is not encumbered by
classic BPF.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 Documentation/bpf/classic_vs_extended.rst | 376 +++++++++++++++++++++
 Documentation/bpf/index.rst               |   1 +
 Documentation/bpf/instruction-set.rst     | 380 ++++------------------
 3 files changed, 446 insertions(+), 311 deletions(-)
 create mode 100644 Documentation/bpf/classic_vs_extended.rst

diff --git a/Documentation/bpf/classic_vs_extended.rst b/Documentation/bpf/classic_vs_extended.rst
new file mode 100644
index 0000000000000..2f81a81f5267f
--- /dev/null
+++ b/Documentation/bpf/classic_vs_extended.rst
@@ -0,0 +1,376 @@
+
+===================
+Classic BPF vs eBPF
+===================
+
+eBPF is designed to be JITed with one to one mapping, which can also open up
+the possibility for GCC/LLVM compilers to generate optimized eBPF code through
+an eBPF backend that performs almost as fast as natively compiled code.
+
+Some core changes of the eBPF format from classic BPF:
+
+- Number of registers increase from 2 to 10:
+
+  The old format had two registers A and X, and a hidden frame pointer. The
+  new layout extends this to be 10 internal registers and a read-only frame
+  pointer. Since 64-bit CPUs are passing arguments to functions via registers
+  the number of args from eBPF program to in-kernel function is restricted
+  to 5 and one register is used to accept return value from an in-kernel
+  function. Natively, x86_64 passes first 6 arguments in registers, aarch64/
+  sparcv9/mips64 have 7 - 8 registers for arguments; x86_64 has 6 callee saved
+  registers, and aarch64/sparcv9/mips64 have 11 or more callee saved registers.
+
+  Thus, all eBPF registers map one to one to HW registers on x86_64, aarch64,
+  etc, and eBPF calling convention maps directly to ABIs used by the kernel on
+  64-bit architectures.
+
+  On 32-bit architectures JIT may map programs that use only 32-bit arithmetic
+  and may let more complex programs to be interpreted.
+
+  R0 - R5 are scratch registers and eBPF program needs spill/fill them if
+  necessary across calls. Note that there is only one eBPF program (== one
+  eBPF main routine) and it cannot call other eBPF functions, it can only
+  call predefined in-kernel functions, though.
+
+- Register width increases from 32-bit to 64-bit:
+
+  Still, the semantics of the original 32-bit ALU operations are preserved
+  via 32-bit subregisters. All eBPF registers are 64-bit with 32-bit lower
+  subregisters that zero-extend into 64-bit if they are being written to.
+  That behavior maps directly to x86_64 and arm64 subregister definition, but
+  makes other JITs more difficult.
+
+  32-bit architectures run 64-bit eBPF programs via interpreter.
+  Their JITs may convert BPF programs that only use 32-bit subregisters into
+  native instruction set and let the rest being interpreted.
+
+  Operation is 64-bit, because on 64-bit architectures, pointers are also
+  64-bit wide, and we want to pass 64-bit values in/out of kernel functions,
+  so 32-bit eBPF registers would otherwise require to define register-pair
+  ABI, thus, there won't be able to use a direct eBPF register to HW register
+  mapping and JIT would need to do combine/split/move operations for every
+  register in and out of the function, which is complex, bug prone and slow.
+  Another reason is the use of atomic 64-bit counters.
+
+- Conditional jt/jf targets replaced with jt/fall-through:
+
+  While the original design has constructs such as ``if (cond) jump_true;
+  else jump_false;``, they are being replaced into alternative constructs like
+  ``if (cond) jump_true; /* else fall-through */``.
+
+- Introduces bpf_call insn and register passing convention for zero overhead
+  calls from/to other kernel functions:
+
+  Before an in-kernel function call, the eBPF program needs to
+  place function arguments into R1 to R5 registers to satisfy calling
+  convention, then the interpreter will take them from registers and pass
+  to in-kernel function. If R1 - R5 registers are mapped to CPU registers
+  that are used for argument passing on given architecture, the JIT compiler
+  doesn't need to emit extra moves. Function arguments will be in the correct
+  registers and BPF_CALL instruction will be JITed as single 'call' HW
+  instruction. This calling convention was picked to cover common call
+  situations without performance penalty.
+
+  After an in-kernel function call, R1 - R5 are reset to unreadable and R0 has
+  a return value of the function. Since R6 - R9 are callee saved, their state
+  is preserved across the call.
+
+  For example, consider three C functions::
+
+    u64 f1() { return (*_f2)(1); }
+    u64 f2(u64 a) { return f3(a + 1, a); }
+    u64 f3(u64 a, u64 b) { return a - b; }
+
+  GCC can compile f1, f3 into x86_64::
+
+    f1:
+	movl $1, %edi
+	movq _f2(%rip), %rax
+	jmp  *%rax
+    f3:
+	movq %rdi, %rax
+	subq %rsi, %rax
+	ret
+
+  Function f2 in eBPF may look like::
+
+    f2:
+	bpf_mov R2, R1
+	bpf_add R1, 1
+	bpf_call f3
+	bpf_exit
+
+  If f2 is JITed and the pointer stored to ``_f2``. The calls f1 -> f2 -> f3 and
+  returns will be seamless. Without JIT, __bpf_prog_run() interpreter needs to
+  be used to call into f2.
+
+  For practical reasons all eBPF programs have only one argument 'ctx' which is
+  already placed into R1 (e.g. on __bpf_prog_run() startup) and the programs
+  can call kernel functions with up to 5 arguments. Calls with 6 or more arguments
+  are currently not supported, but these restrictions can be lifted if necessary
+  in the future.
+
+  On 64-bit architectures all register map to HW registers one to one. For
+  example, x86_64 JIT compiler can map them as ...
+
+  ::
+
+    R0 - rax
+    R1 - rdi
+    R2 - rsi
+    R3 - rdx
+    R4 - rcx
+    R5 - r8
+    R6 - rbx
+    R7 - r13
+    R8 - r14
+    R9 - r15
+    R10 - rbp
+
+  ... since x86_64 ABI mandates rdi, rsi, rdx, rcx, r8, r9 for argument passing
+  and rbx, r12 - r15 are callee saved.
+
+  Then the following eBPF pseudo-program::
+
+    bpf_mov R6, R1 /* save ctx */
+    bpf_mov R2, 2
+    bpf_mov R3, 3
+    bpf_mov R4, 4
+    bpf_mov R5, 5
+    bpf_call foo
+    bpf_mov R7, R0 /* save foo() return value */
+    bpf_mov R1, R6 /* restore ctx for next call */
+    bpf_mov R2, 6
+    bpf_mov R3, 7
+    bpf_mov R4, 8
+    bpf_mov R5, 9
+    bpf_call bar
+    bpf_add R0, R7
+    bpf_exit
+
+  After JIT to x86_64 may look like::
+
+    push %rbp
+    mov %rsp,%rbp
+    sub $0x228,%rsp
+    mov %rbx,-0x228(%rbp)
+    mov %r13,-0x220(%rbp)
+    mov %rdi,%rbx
+    mov $0x2,%esi
+    mov $0x3,%edx
+    mov $0x4,%ecx
+    mov $0x5,%r8d
+    callq foo
+    mov %rax,%r13
+    mov %rbx,%rdi
+    mov $0x6,%esi
+    mov $0x7,%edx
+    mov $0x8,%ecx
+    mov $0x9,%r8d
+    callq bar
+    add %r13,%rax
+    mov -0x228(%rbp),%rbx
+    mov -0x220(%rbp),%r13
+    leaveq
+    retq
+
+  Which is in this example equivalent in C to::
+
+    u64 bpf_filter(u64 ctx)
+    {
+	return foo(ctx, 2, 3, 4, 5) + bar(ctx, 6, 7, 8, 9);
+    }
+
+  In-kernel functions foo() and bar() with prototype: u64 (*)(u64 arg1, u64
+  arg2, u64 arg3, u64 arg4, u64 arg5); will receive arguments in proper
+  registers and place their return value into ``%rax`` which is R0 in eBPF.
+  Prologue and epilogue are emitted by JIT and are implicit in the
+  interpreter. R0-R5 are scratch registers, so eBPF program needs to preserve
+  them across the calls as defined by calling convention.
+
+  For example the following program is invalid::
+
+    bpf_mov R1, 1
+    bpf_call foo
+    bpf_mov R0, R1
+    bpf_exit
+
+  After the call the registers R1-R5 contain junk values and cannot be read.
+  An in-kernel verifier.rst is used to validate eBPF programs.
+
+Also in the new design, eBPF is limited to 4096 insns, which means that any
+program will terminate quickly and will only call a fixed number of kernel
+functions. Original BPF and eBPF are two operand instructions,
+which helps to do one-to-one mapping between eBPF insn and x86 insn during JIT.
+
+The input context pointer for invoking the interpreter function is generic,
+its content is defined by a specific use case. For seccomp register R1 points
+to seccomp_data, for converted BPF filters R1 points to a skb.
+
+A program, that is translated internally consists of the following elements::
+
+  op:16, jt:8, jf:8, k:32    ==>    op:8, dst_reg:4, src_reg:4, off:16, imm:32
+
+So far 87 eBPF instructions were implemented. 8-bit 'op' opcode field
+has room for new instructions. Some of them may use 16/24/32 byte encoding. New
+instructions must be multiple of 8 bytes to preserve backward compatibility.
+
+eBPF is a general purpose RISC instruction set. Not every register and
+every instruction are used during translation from original BPF to eBPF.
+For example, socket filters are not using ``exclusive add`` instruction, but
+tracing filters may do to maintain counters of events, for example. Register R9
+is not used by socket filters either, but more complex filters may be running
+out of registers and would have to resort to spill/fill to stack.
+
+eBPF can be used as a generic assembler for last step performance
+optimizations, socket filters and seccomp are using it as assembler. Tracing
+filters may use it as assembler to generate code from kernel. In kernel usage
+may not be bounded by security considerations, since generated eBPF code
+may be optimizing internal code path and not being exposed to the user space.
+Safety of eBPF can come from the verifier.rst. In such use cases as
+described, it may be used as safe instruction set.
+
+Just like the original BPF, eBPF runs within a controlled environment,
+is deterministic and the kernel can easily prove that. The safety of the program
+can be determined in two steps: first step does depth-first-search to disallow
+loops and other CFG validation; second step starts from the first insn and
+descends all possible paths. It simulates execution of every insn and observes
+the state change of registers and stack.
+
+opcode encoding
+===============
+
+eBPF is reusing most of the opcode encoding from classic to simplify conversion
+of classic BPF to eBPF.
+
+For arithmetic and jump instructions the 8-bit 'code' field is divided into three
+parts::
+
+  +----------------+--------+--------------------+
+  |   4 bits       |  1 bit |   3 bits           |
+  | operation code | source | instruction class  |
+  +----------------+--------+--------------------+
+  (MSB)                                      (LSB)
+
+Three LSB bits store instruction class which is one of:
+
+  ===================     ===============
+  Classic BPF classes     eBPF classes
+  ===================     ===============
+  BPF_LD    0x00          BPF_LD    0x00
+  BPF_LDX   0x01          BPF_LDX   0x01
+  BPF_ST    0x02          BPF_ST    0x02
+  BPF_STX   0x03          BPF_STX   0x03
+  BPF_ALU   0x04          BPF_ALU   0x04
+  BPF_JMP   0x05          BPF_JMP   0x05
+  BPF_RET   0x06          BPF_JMP32 0x06
+  BPF_MISC  0x07          BPF_ALU64 0x07
+  ===================     ===============
+
+The 4th bit encodes the source operand ...
+
+    ::
+
+	BPF_K     0x00
+	BPF_X     0x08
+
+ * in classic BPF, this means::
+
+	BPF_SRC(code) == BPF_X - use register X as source operand
+	BPF_SRC(code) == BPF_K - use 32-bit immediate as source operand
+
+ * in eBPF, this means::
+
+	BPF_SRC(code) == BPF_X - use 'src_reg' register as source operand
+	BPF_SRC(code) == BPF_K - use 32-bit immediate as source operand
+
+... and four MSB bits store operation code.
+
+If BPF_CLASS(code) == BPF_ALU or BPF_ALU64 [ in eBPF ], BPF_OP(code) is one of::
+
+  BPF_ADD   0x00
+  BPF_SUB   0x10
+  BPF_MUL   0x20
+  BPF_DIV   0x30
+  BPF_OR    0x40
+  BPF_AND   0x50
+  BPF_LSH   0x60
+  BPF_RSH   0x70
+  BPF_NEG   0x80
+  BPF_MOD   0x90
+  BPF_XOR   0xa0
+  BPF_MOV   0xb0  /* eBPF only: mov reg to reg */
+  BPF_ARSH  0xc0  /* eBPF only: sign extending shift right */
+  BPF_END   0xd0  /* eBPF only: endianness conversion */
+
+If BPF_CLASS(code) == BPF_JMP or BPF_JMP32 [ in eBPF ], BPF_OP(code) is one of::
+
+  BPF_JA    0x00  /* BPF_JMP only */
+  BPF_JEQ   0x10
+  BPF_JGT   0x20
+  BPF_JGE   0x30
+  BPF_JSET  0x40
+  BPF_JNE   0x50  /* eBPF only: jump != */
+  BPF_JSGT  0x60  /* eBPF only: signed '>' */
+  BPF_JSGE  0x70  /* eBPF only: signed '>=' */
+  BPF_CALL  0x80  /* eBPF BPF_JMP only: function call */
+  BPF_EXIT  0x90  /* eBPF BPF_JMP only: function return */
+  BPF_JLT   0xa0  /* eBPF only: unsigned '<' */
+  BPF_JLE   0xb0  /* eBPF only: unsigned '<=' */
+  BPF_JSLT  0xc0  /* eBPF only: signed '<' */
+  BPF_JSLE  0xd0  /* eBPF only: signed '<=' */
+
+So BPF_ADD | BPF_X | BPF_ALU means 32-bit addition in both classic BPF
+and eBPF. There are only two registers in classic BPF, so it means A += X.
+In eBPF it means dst_reg = (u32) dst_reg + (u32) src_reg; similarly,
+BPF_XOR | BPF_K | BPF_ALU means A ^= imm32 in classic BPF and analogous
+src_reg = (u32) src_reg ^ (u32) imm32 in eBPF.
+
+Classic BPF is using BPF_MISC class to represent A = X and X = A moves.
+eBPF is using BPF_MOV | BPF_X | BPF_ALU code instead. Since there are no
+BPF_MISC operations in eBPF, the class 7 is used as BPF_ALU64 to mean
+exactly the same operations as BPF_ALU, but with 64-bit wide operands
+instead. So BPF_ADD | BPF_X | BPF_ALU64 means 64-bit addition, i.e.:
+dst_reg = dst_reg + src_reg
+
+Classic BPF wastes the whole BPF_RET class to represent a single ``ret``
+operation. Classic BPF_RET | BPF_K means copy imm32 into return register
+and perform function exit. eBPF is modeled to match CPU, so BPF_JMP | BPF_EXIT
+in eBPF means function exit only. The eBPF program needs to store return
+value into register R0 before doing a BPF_EXIT. Class 6 in eBPF is used as
+BPF_JMP32 to mean exactly the same operations as BPF_JMP, but with 32-bit wide
+operands for the comparisons instead.
+
+For load and store instructions the 8-bit 'code' field is divided as::
+
+  +--------+--------+-------------------+
+  | 3 bits | 2 bits |   3 bits          |
+  |  mode  |  size  | instruction class |
+  +--------+--------+-------------------+
+  (MSB)                             (LSB)
+
+Size modifier is one of ...
+
+::
+
+  BPF_W   0x00    /* word */
+  BPF_H   0x08    /* half word */
+  BPF_B   0x10    /* byte */
+  BPF_DW  0x18    /* eBPF only, double word */
+
+... which encodes size of load/store operation::
+
+ B  - 1 byte
+ H  - 2 byte
+ W  - 4 byte
+ DW - 8 byte (eBPF only)
+
+Mode modifier is one of::
+
+  BPF_IMM     0x00  /* used for 32-bit mov in classic BPF and 64-bit in eBPF */
+  BPF_ABS     0x20
+  BPF_IND     0x40
+  BPF_MEM     0x60
+  BPF_LEN     0x80  /* classic BPF only, reserved in eBPF */
+  BPF_MSH     0xa0  /* classic BPF only, reserved in eBPF */
+  BPF_ATOMIC  0xc0  /* eBPF only, atomic operations */
diff --git a/Documentation/bpf/index.rst b/Documentation/bpf/index.rst
index 91ba5a62026ba..ef5c996547ecb 100644
--- a/Documentation/bpf/index.rst
+++ b/Documentation/bpf/index.rst
@@ -21,6 +21,7 @@ that goes into great technical depth about the BPF Architecture.
    helpers
    programs
    maps
+   classic_vs_extended.rst
    bpf_licensing
    test_debug
    other
diff --git a/Documentation/bpf/instruction-set.rst b/Documentation/bpf/instruction-set.rst
index fa469078301be..3967842e00234 100644
--- a/Documentation/bpf/instruction-set.rst
+++ b/Documentation/bpf/instruction-set.rst
@@ -3,253 +3,27 @@
 eBPF Instruction Set
 ====================
 
-eBPF is designed to be JITed with one to one mapping, which can also open up
-the possibility for GCC/LLVM compilers to generate optimized eBPF code through
-an eBPF backend that performs almost as fast as natively compiled code.
-
-Some core changes of the eBPF format from classic BPF:
-
-- Number of registers increase from 2 to 10:
-
-  The old format had two registers A and X, and a hidden frame pointer. The
-  new layout extends this to be 10 internal registers and a read-only frame
-  pointer. Since 64-bit CPUs are passing arguments to functions via registers
-  the number of args from eBPF program to in-kernel function is restricted
-  to 5 and one register is used to accept return value from an in-kernel
-  function. Natively, x86_64 passes first 6 arguments in registers, aarch64/
-  sparcv9/mips64 have 7 - 8 registers for arguments; x86_64 has 6 callee saved
-  registers, and aarch64/sparcv9/mips64 have 11 or more callee saved registers.
-
-  Therefore, eBPF calling convention is defined as:
-
-    * R0	- return value from in-kernel function, and exit value for eBPF program
-    * R1 - R5	- arguments from eBPF program to in-kernel function
-    * R6 - R9	- callee saved registers that in-kernel function will preserve
-    * R10	- read-only frame pointer to access stack
-
-  Thus, all eBPF registers map one to one to HW registers on x86_64, aarch64,
-  etc, and eBPF calling convention maps directly to ABIs used by the kernel on
-  64-bit architectures.
-
-  On 32-bit architectures JIT may map programs that use only 32-bit arithmetic
-  and may let more complex programs to be interpreted.
-
-  R0 - R5 are scratch registers and eBPF program needs spill/fill them if
-  necessary across calls. Note that there is only one eBPF program (== one
-  eBPF main routine) and it cannot call other eBPF functions, it can only
-  call predefined in-kernel functions, though.
-
-- Register width increases from 32-bit to 64-bit:
-
-  Still, the semantics of the original 32-bit ALU operations are preserved
-  via 32-bit subregisters. All eBPF registers are 64-bit with 32-bit lower
-  subregisters that zero-extend into 64-bit if they are being written to.
-  That behavior maps directly to x86_64 and arm64 subregister definition, but
-  makes other JITs more difficult.
-
-  32-bit architectures run 64-bit eBPF programs via interpreter.
-  Their JITs may convert BPF programs that only use 32-bit subregisters into
-  native instruction set and let the rest being interpreted.
-
-  Operation is 64-bit, because on 64-bit architectures, pointers are also
-  64-bit wide, and we want to pass 64-bit values in/out of kernel functions,
-  so 32-bit eBPF registers would otherwise require to define register-pair
-  ABI, thus, there won't be able to use a direct eBPF register to HW register
-  mapping and JIT would need to do combine/split/move operations for every
-  register in and out of the function, which is complex, bug prone and slow.
-  Another reason is the use of atomic 64-bit counters.
-
-- Conditional jt/jf targets replaced with jt/fall-through:
-
-  While the original design has constructs such as ``if (cond) jump_true;
-  else jump_false;``, they are being replaced into alternative constructs like
-  ``if (cond) jump_true; /* else fall-through */``.
-
-- Introduces bpf_call insn and register passing convention for zero overhead
-  calls from/to other kernel functions:
-
-  Before an in-kernel function call, the eBPF program needs to
-  place function arguments into R1 to R5 registers to satisfy calling
-  convention, then the interpreter will take them from registers and pass
-  to in-kernel function. If R1 - R5 registers are mapped to CPU registers
-  that are used for argument passing on given architecture, the JIT compiler
-  doesn't need to emit extra moves. Function arguments will be in the correct
-  registers and BPF_CALL instruction will be JITed as single 'call' HW
-  instruction. This calling convention was picked to cover common call
-  situations without performance penalty.
-
-  After an in-kernel function call, R1 - R5 are reset to unreadable and R0 has
-  a return value of the function. Since R6 - R9 are callee saved, their state
-  is preserved across the call.
-
-  For example, consider three C functions::
-
-    u64 f1() { return (*_f2)(1); }
-    u64 f2(u64 a) { return f3(a + 1, a); }
-    u64 f3(u64 a, u64 b) { return a - b; }
-
-  GCC can compile f1, f3 into x86_64::
-
-    f1:
-	movl $1, %edi
-	movq _f2(%rip), %rax
-	jmp  *%rax
-    f3:
-	movq %rdi, %rax
-	subq %rsi, %rax
-	ret
-
-  Function f2 in eBPF may look like::
-
-    f2:
-	bpf_mov R2, R1
-	bpf_add R1, 1
-	bpf_call f3
-	bpf_exit
-
-  If f2 is JITed and the pointer stored to ``_f2``. The calls f1 -> f2 -> f3 and
-  returns will be seamless. Without JIT, __bpf_prog_run() interpreter needs to
-  be used to call into f2.
-
-  For practical reasons all eBPF programs have only one argument 'ctx' which is
-  already placed into R1 (e.g. on __bpf_prog_run() startup) and the programs
-  can call kernel functions with up to 5 arguments. Calls with 6 or more arguments
-  are currently not supported, but these restrictions can be lifted if necessary
-  in the future.
-
-  On 64-bit architectures all register map to HW registers one to one. For
-  example, x86_64 JIT compiler can map them as ...
-
-  ::
-
-    R0 - rax
-    R1 - rdi
-    R2 - rsi
-    R3 - rdx
-    R4 - rcx
-    R5 - r8
-    R6 - rbx
-    R7 - r13
-    R8 - r14
-    R9 - r15
-    R10 - rbp
-
-  ... since x86_64 ABI mandates rdi, rsi, rdx, rcx, r8, r9 for argument passing
-  and rbx, r12 - r15 are callee saved.
-
-  Then the following eBPF pseudo-program::
-
-    bpf_mov R6, R1 /* save ctx */
-    bpf_mov R2, 2
-    bpf_mov R3, 3
-    bpf_mov R4, 4
-    bpf_mov R5, 5
-    bpf_call foo
-    bpf_mov R7, R0 /* save foo() return value */
-    bpf_mov R1, R6 /* restore ctx for next call */
-    bpf_mov R2, 6
-    bpf_mov R3, 7
-    bpf_mov R4, 8
-    bpf_mov R5, 9
-    bpf_call bar
-    bpf_add R0, R7
-    bpf_exit
-
-  After JIT to x86_64 may look like::
-
-    push %rbp
-    mov %rsp,%rbp
-    sub $0x228,%rsp
-    mov %rbx,-0x228(%rbp)
-    mov %r13,-0x220(%rbp)
-    mov %rdi,%rbx
-    mov $0x2,%esi
-    mov $0x3,%edx
-    mov $0x4,%ecx
-    mov $0x5,%r8d
-    callq foo
-    mov %rax,%r13
-    mov %rbx,%rdi
-    mov $0x6,%esi
-    mov $0x7,%edx
-    mov $0x8,%ecx
-    mov $0x9,%r8d
-    callq bar
-    add %r13,%rax
-    mov -0x228(%rbp),%rbx
-    mov -0x220(%rbp),%r13
-    leaveq
-    retq
-
-  Which is in this example equivalent in C to::
-
-    u64 bpf_filter(u64 ctx)
-    {
-	return foo(ctx, 2, 3, 4, 5) + bar(ctx, 6, 7, 8, 9);
-    }
-
-  In-kernel functions foo() and bar() with prototype: u64 (*)(u64 arg1, u64
-  arg2, u64 arg3, u64 arg4, u64 arg5); will receive arguments in proper
-  registers and place their return value into ``%rax`` which is R0 in eBPF.
-  Prologue and epilogue are emitted by JIT and are implicit in the
-  interpreter. R0-R5 are scratch registers, so eBPF program needs to preserve
-  them across the calls as defined by calling convention.
-
-  For example the following program is invalid::
-
-    bpf_mov R1, 1
-    bpf_call foo
-    bpf_mov R0, R1
-    bpf_exit
-
-  After the call the registers R1-R5 contain junk values and cannot be read.
-  An in-kernel verifier.rst is used to validate eBPF programs.
-
-Also in the new design, eBPF is limited to 4096 insns, which means that any
-program will terminate quickly and will only call a fixed number of kernel
-functions. Original BPF and eBPF are two operand instructions,
-which helps to do one-to-one mapping between eBPF insn and x86 insn during JIT.
-
-The input context pointer for invoking the interpreter function is generic,
-its content is defined by a specific use case. For seccomp register R1 points
-to seccomp_data, for converted BPF filters R1 points to a skb.
-
-A program, that is translated internally consists of the following elements::
-
-  op:16, jt:8, jf:8, k:32    ==>    op:8, dst_reg:4, src_reg:4, off:16, imm:32
-
-So far 87 eBPF instructions were implemented. 8-bit 'op' opcode field
-has room for new instructions. Some of them may use 16/24/32 byte encoding. New
-instructions must be multiple of 8 bytes to preserve backward compatibility.
-
-eBPF is a general purpose RISC instruction set. Not every register and
-every instruction are used during translation from original BPF to eBPF.
-For example, socket filters are not using ``exclusive add`` instruction, but
-tracing filters may do to maintain counters of events, for example. Register R9
-is not used by socket filters either, but more complex filters may be running
-out of registers and would have to resort to spill/fill to stack.
-
-eBPF can be used as a generic assembler for last step performance
-optimizations, socket filters and seccomp are using it as assembler. Tracing
-filters may use it as assembler to generate code from kernel. In kernel usage
-may not be bounded by security considerations, since generated eBPF code
-may be optimizing internal code path and not being exposed to the user space.
-Safety of eBPF can come from the verifier.rst. In such use cases as
-described, it may be used as safe instruction set.
-
-Just like the original BPF, eBPF runs within a controlled environment,
-is deterministic and the kernel can easily prove that. The safety of the program
-can be determined in two steps: first step does depth-first-search to disallow
-loops and other CFG validation; second step starts from the first insn and
-descends all possible paths. It simulates execution of every insn and observes
-the state change of registers and stack.
+Registers and calling convention
+================================
+
+eBPF has 10 general purpose registers and a read-only frame pointer register,
+all of which are 64-bits wide.
+
+The eBPF calling convention is defined as:
+
+ * R0: return value from function calls, and exit value for eBPF programs
+ * R1 - R5: arguments for function calls
+ * R6 - R9: callee saved registers that function calls will preserve
+ * R10: read-only frame pointer to access stack
+
+R0 - R5 are scratch registers and eBPF programs needs to spill/fill them if
+necessary across calls.
 
 eBPF opcode encoding
 ====================
 
-eBPF is reusing most of the opcode encoding from classic to simplify conversion
-of classic BPF to eBPF. For arithmetic and jump instructions the 8-bit 'code'
-field is divided into three parts::
+For arithmetic and jump instructions the 8-bit 'opcode' field is divided into
+three parts::
 
   +----------------+--------+--------------------+
   |   4 bits       |  1 bit |   3 bits           |
@@ -259,39 +33,29 @@ field is divided into three parts::
 
 Three LSB bits store instruction class which is one of:
 
-  ===================     ===============
-  Classic BPF classes     eBPF classes
-  ===================     ===============
-  BPF_LD    0x00          BPF_LD    0x00
-  BPF_LDX   0x01          BPF_LDX   0x01
-  BPF_ST    0x02          BPF_ST    0x02
-  BPF_STX   0x03          BPF_STX   0x03
-  BPF_ALU   0x04          BPF_ALU   0x04
-  BPF_JMP   0x05          BPF_JMP   0x05
-  BPF_RET   0x06          BPF_JMP32 0x06
-  BPF_MISC  0x07          BPF_ALU64 0x07
-  ===================     ===============
+  ========= =====
+  class     value
+  ========= =====
+  BPF_LD    0x00
+  BPF_LDX   0x01
+  BPF_ST    0x02
+  BPF_STX   0x03
+  BPF_ALU   0x04
+  BPF_JMP   0x05
+  BPF_JMP32 0x06
+  BPF_ALU64 0x07
+  ========= =====
 
 When BPF_CLASS(code) == BPF_ALU or BPF_JMP, 4th bit encodes source operand ...
 
-    ::
-
-	BPF_K     0x00
-	BPF_X     0x08
-
- * in classic BPF, this means::
-
-	BPF_SRC(code) == BPF_X - use register X as source operand
-	BPF_SRC(code) == BPF_K - use 32-bit immediate as source operand
-
- * in eBPF, this means::
+::
 
-	BPF_SRC(code) == BPF_X - use 'src_reg' register as source operand
-	BPF_SRC(code) == BPF_K - use 32-bit immediate as source operand
+  BPF_K     0x00 /* use 32-bit immediate as source operand */
+  BPF_X     0x08 /* use 'src_reg' register as source operand */
 
 ... and four MSB bits store operation code.
 
-If BPF_CLASS(code) == BPF_ALU or BPF_ALU64 [ in eBPF ], BPF_OP(code) is one of::
+If BPF_CLASS(code) == BPF_ALU or BPF_ALU64 BPF_OP(code) is one of::
 
   BPF_ADD   0x00
   BPF_SUB   0x10
@@ -304,45 +68,43 @@ If BPF_CLASS(code) == BPF_ALU or BPF_ALU64 [ in eBPF ], BPF_OP(code) is one of::
   BPF_NEG   0x80
   BPF_MOD   0x90
   BPF_XOR   0xa0
-  BPF_MOV   0xb0  /* eBPF only: mov reg to reg */
-  BPF_ARSH  0xc0  /* eBPF only: sign extending shift right */
-  BPF_END   0xd0  /* eBPF only: endianness conversion */
+  BPF_MOV   0xb0  /* mov reg to reg */
+  BPF_ARSH  0xc0  /* sign extending shift right */
+  BPF_END   0xd0  /* endianness conversion */
 
-If BPF_CLASS(code) == BPF_JMP or BPF_JMP32 [ in eBPF ], BPF_OP(code) is one of::
+If BPF_CLASS(code) == BPF_JMP or BPF_JMP32 BPF_OP(code) is one of::
 
   BPF_JA    0x00  /* BPF_JMP only */
   BPF_JEQ   0x10
   BPF_JGT   0x20
   BPF_JGE   0x30
   BPF_JSET  0x40
-  BPF_JNE   0x50  /* eBPF only: jump != */
-  BPF_JSGT  0x60  /* eBPF only: signed '>' */
-  BPF_JSGE  0x70  /* eBPF only: signed '>=' */
-  BPF_CALL  0x80  /* eBPF BPF_JMP only: function call */
-  BPF_EXIT  0x90  /* eBPF BPF_JMP only: function return */
-  BPF_JLT   0xa0  /* eBPF only: unsigned '<' */
-  BPF_JLE   0xb0  /* eBPF only: unsigned '<=' */
-  BPF_JSLT  0xc0  /* eBPF only: signed '<' */
-  BPF_JSLE  0xd0  /* eBPF only: signed '<=' */
-
-So BPF_ADD | BPF_X | BPF_ALU means 32-bit addition in both classic BPF
-and eBPF. There are only two registers in classic BPF, so it means A += X.
-In eBPF it means dst_reg = (u32) dst_reg + (u32) src_reg; similarly,
-BPF_XOR | BPF_K | BPF_ALU means A ^= imm32 in classic BPF and analogous
-src_reg = (u32) src_reg ^ (u32) imm32 in eBPF.
-
-Classic BPF is using BPF_MISC class to represent A = X and X = A moves.
-eBPF is using BPF_MOV | BPF_X | BPF_ALU code instead. Since there are no
-BPF_MISC operations in eBPF, the class 7 is used as BPF_ALU64 to mean
-exactly the same operations as BPF_ALU, but with 64-bit wide operands
-instead. So BPF_ADD | BPF_X | BPF_ALU64 means 64-bit addition, i.e.:
-dst_reg = dst_reg + src_reg
-
-Classic BPF wastes the whole BPF_RET class to represent a single ``ret``
-operation. Classic BPF_RET | BPF_K means copy imm32 into return register
-and perform function exit. eBPF is modeled to match CPU, so BPF_JMP | BPF_EXIT
-in eBPF means function exit only. The eBPF program needs to store return
-value into register R0 before doing a BPF_EXIT. Class 6 in eBPF is used as
+  BPF_JNE   0x50  /* jump != */
+  BPF_JSGT  0x60  /* signed '>' */
+  BPF_JSGE  0x70  /* signed '>=' */
+  BPF_CALL  0x80  /* function call */
+  BPF_EXIT  0x90  /*  function return */
+  BPF_JLT   0xa0  /* unsigned '<' */
+  BPF_JLE   0xb0  /* unsigned '<=' */
+  BPF_JSLT  0xc0  /* signed '<' */
+  BPF_JSLE  0xd0  /* signed '<=' */
+
+So BPF_ADD | BPF_X | BPF_ALU means::
+
+  dst_reg = (u32) dst_reg + (u32) src_reg;
+
+Similarly, BPF_XOR | BPF_K | BPF_ALU means::
+
+  src_reg = (u32) src_reg ^ (u32) imm32
+
+eBPF is using BPF_MOV | BPF_X | BPF_ALU to represent A = B moves.  BPF_ALU64
+is used to mean exactly the same operations as BPF_ALU, but with 64-bit wide
+operands instead. So BPF_ADD | BPF_X | BPF_ALU64 means 64-bit addition, i.e.::
+
+  dst_reg = dst_reg + src_reg
+
+BPF_JMP | BPF_EXIT means function exit only. The eBPF program needs to store
+the return value into register R0 before doing a BPF_EXIT. Class 6 is used as
 BPF_JMP32 to mean exactly the same operations as BPF_JMP, but with 32-bit wide
 operands for the comparisons instead.
 
@@ -361,29 +123,27 @@ Size modifier is one of ...
   BPF_W   0x00    /* word */
   BPF_H   0x08    /* half word */
   BPF_B   0x10    /* byte */
-  BPF_DW  0x18    /* eBPF only, double word */
+  BPF_DW  0x18    /* double word */
 
 ... which encodes size of load/store operation::
 
  B  - 1 byte
  H  - 2 byte
  W  - 4 byte
- DW - 8 byte (eBPF only)
+ DW - 8 byte
 
 Mode modifier is one of::
 
-  BPF_IMM     0x00  /* used for 32-bit mov in classic BPF and 64-bit in eBPF */
+  BPF_IMM     0x00  /* used for 64-bit mov */
   BPF_ABS     0x20
   BPF_IND     0x40
   BPF_MEM     0x60
-  BPF_LEN     0x80  /* classic BPF only, reserved in eBPF */
-  BPF_MSH     0xa0  /* classic BPF only, reserved in eBPF */
-  BPF_ATOMIC  0xc0  /* eBPF only, atomic operations */
+  BPF_ATOMIC  0xc0  /* atomic operations */
 
 eBPF has two non-generic instructions: (BPF_ABS | <size> | BPF_LD) and
 (BPF_IND | <size> | BPF_LD) which are used to access packet data.
 
-They had to be carried over from classic to have strong performance of
+They had to be carried over from classic BPF to have strong performance of
 socket filters running in eBPF interpreter. These instructions can only
 be used when interpreter context is a pointer to ``struct sk_buff`` and
 have seven implicit operands. Register R6 is an implicit input that must
@@ -405,7 +165,7 @@ For example::
     R0 = ntohl(*(u32 *) (((struct sk_buff *) R6)->data + src_reg + imm32))
     and R1 - R5 were scratched.
 
-Unlike classic BPF instruction set, eBPF has generic load/store operations::
+eBPF has generic load/store operations::
 
     BPF_MEM | <size> | BPF_STX:  *(size *) (dst_reg + off) = src_reg
     BPF_MEM | <size> | BPF_ST:   *(size *) (dst_reg + off) = imm32
@@ -460,5 +220,3 @@ zero.
 eBPF has one 16-byte instruction: ``BPF_LD | BPF_DW | BPF_IMM`` which consists
 of two consecutive ``struct bpf_insn`` 8-byte blocks and interpreted as single
 instruction that loads 64-bit immediate value into a dst_reg.
-Classic BPF has similar instruction: ``BPF_LD | BPF_W | BPF_IMM`` which loads
-32-bit immediate value into a register.
-- 
2.30.2

