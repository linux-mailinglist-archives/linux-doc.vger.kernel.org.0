Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 09B972A66EB
	for <lists+linux-doc@lfdr.de>; Wed,  4 Nov 2020 15:57:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730672AbgKDO5I (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Wed, 4 Nov 2020 09:57:08 -0500
Received: from mail.kernel.org ([198.145.29.99]:51128 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729980AbgKDO5G (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Wed, 4 Nov 2020 09:57:06 -0500
Received: from suppilovahvero.lan (83-245-197-237.elisa-laajakaista.fi [83.245.197.237])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 64FA52074B;
        Wed,  4 Nov 2020 14:56:59 +0000 (UTC)
From:   Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>
To:     x86@kernel.org, linux-sgx@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org,
        Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>,
        linux-doc@vger.kernel.org, Randy Dunlap <rdunlap@infradead.org>,
        Sean Christopherson <sean.j.christopherson@intel.com>,
        akpm@linux-foundation.org, andriy.shevchenko@linux.intel.com,
        asapek@google.com, bp@alien8.de, cedric.xing@intel.com,
        chenalexchen@google.com, conradparker@google.com,
        cyhanish@google.com, dave.hansen@intel.com, haitao.huang@intel.com,
        kai.huang@intel.com, kai.svahn@intel.com, kmoy@google.com,
        ludloff@google.com, luto@kernel.org, nhorman@redhat.com,
        npmccallum@redhat.com, puiterwijk@redhat.com, rientjes@google.com,
        tglx@linutronix.de, yaozhangx@google.com, mikko.ylinen@intel.com
Subject: [PATCH v40 23/24] docs: x86/sgx: Document SGX kernel architecture
Date:   Wed,  4 Nov 2020 16:54:29 +0200
Message-Id: <20201104145430.300542-24-jarkko.sakkinen@linux.intel.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20201104145430.300542-1-jarkko.sakkinen@linux.intel.com>
References: <20201104145430.300542-1-jarkko.sakkinen@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=y
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Document the Intel SGX kernel architecture. The fine-grained architecture
details can be looked up from Intel SDM Volume 3D.

Cc: linux-doc@vger.kernel.org
Acked-by: Randy Dunlap <rdunlap@infradead.org>
Co-developed-by: Sean Christopherson <sean.j.christopherson@intel.com>
Signed-off-by: Sean Christopherson <sean.j.christopherson@intel.com>
Signed-off-by: Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>
---
 Documentation/x86/index.rst |   1 +
 Documentation/x86/sgx.rst   | 211 ++++++++++++++++++++++++++++++++++++
 2 files changed, 212 insertions(+)
 create mode 100644 Documentation/x86/sgx.rst

diff --git a/Documentation/x86/index.rst b/Documentation/x86/index.rst
index 9c6ebf355f81..e7eb84484ddc 100644
--- a/Documentation/x86/index.rst
+++ b/Documentation/x86/index.rst
@@ -33,3 +33,4 @@ x86-specific Documentation
    i386/index
    x86_64/index
    sva
+   sgx
diff --git a/Documentation/x86/sgx.rst b/Documentation/x86/sgx.rst
new file mode 100644
index 000000000000..b172b133b3ea
--- /dev/null
+++ b/Documentation/x86/sgx.rst
@@ -0,0 +1,211 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+===============================
+Software Guard eXtensions (SGX)
+===============================
+
+Overview
+========
+
+Software Guard eXtensions (SGX) hardware enables for user space applications
+to set aside private memory regions of code and data:
+
+* Privileged (ring-0) ENCLS functions orchestrate the construction of the.
+  regions.
+* Unprivileged (ring-3) ENCLU functions allow an application to enter and
+  execute inside the regions.
+
+These memory regions are called enclaves. An enclave can be only entered at a
+fixed set of entry points. Each entry point can hold a single hardware thread
+at a time.  While the enclave is loaded from a regular binary file by using
+ENCLS functions, only the threads inside the enclave can access its memory. The
+region is denied from outside access by the CPU, and encrypted before it leaves
+from LLC.
+
+The support can be determined by
+
+	``grep sgx /proc/cpuinfo``
+
+SGX must both be supported in the processor and enabled by the BIOS.  If SGX
+appears to be unsupported on a system which has hardware support, ensure
+support is enabled in the BIOS.  If a BIOS presents a choice between "Enabled"
+and "Software Enabled" modes for SGX, choose "Enabled".
+
+Enclave Page Cache
+==================
+
+SGX utilizes an *Enclave Page Cache (EPC)* to store pages that are associated
+with an enclave. It is contained in a BIOS-reserved region of physical memory.
+Unlike pages used for regular memory, pages can only be accessed from outside of
+the enclave during enclave construction with special, limited SGX instructions.
+
+Only a CPU executing inside an enclave can directly access enclave memory.
+However, a CPU executing inside an enclave may access normal memory outside the
+enclave.
+
+The kernel manages enclave memory similar to how it treats device memory.
+
+Enclave Page Types
+------------------
+
+**SGX Enclave Control Structure (SECS)**
+   Enclave's address range, attributes and other global data are defined
+   by this structure.
+
+**Regular (REG)**
+   Regular EPC pages contain the code and data of an enclave.
+
+**Thread Control Structure (TCS)**
+   Thread Control Structure pages define the entry points to an enclave and
+   track the execution state of an enclave thread.
+
+**Version Array (VA)**
+   Version Array pages contain 512 slots, each of which can contain a version
+   number for a page evicted from the EPC.
+
+Enclave Page Cache Map
+----------------------
+
+The processor tracks EPC pages in a hardware metadata structure called the
+*Enclave Page Cache Map (EPCM)*.  The EPCM contains an entry for each EPC page
+which describes the owning enclave, access rights and page type among the other
+things.
+
+EPCM permissions are separate from the normal page tables.  This prevents the
+kernel from, for instance, allowing writes to data which an enclave wishes to
+remain read-only.  EPCM permissions may only impose additional restrictions on
+top of normal x86 page permissions.
+
+For all intents and purposes, the SGX architecture allows the processor to
+invalidate all EPCM entries at will.  This requires that software be prepared to
+handle an EPCM fault at any time.  In practice, this can happen on events like
+power transitions when the ephemeral key that encrypts enclave memory is lost.
+
+Application interface
+=====================
+
+Enclave build functions
+-----------------------
+
+In addition to the traditional compiler and linker build process, SGX has a
+separate enclave “build” process.  Enclaves must be built before they can be
+executed (entered). The first step in building an enclave is opening the
+**/dev/sgx_enclave** device.  Since enclave memory is protected from direct
+access, special privileged instructions are Then used to copy data into enclave
+pages and establish enclave page permissions.
+
+.. kernel-doc:: arch/x86/kernel/cpu/sgx/ioctl.c
+   :functions: sgx_ioc_enclave_create
+               sgx_ioc_enclave_add_pages
+               sgx_ioc_enclave_init
+               sgx_ioc_enclave_provision
+
+Enclave vDSO
+------------
+
+Entering an enclave can only be done through SGX-specific EENTER and ERESUME
+functions, and is a non-trivial process.  Because of the complexity of
+transitioning to and from an enclave, enclaves typically utilize a library to
+handle the actual transitions.  This is roughly analogous to how glibc
+implementations are used by most applications to wrap system calls.
+
+Another crucial characteristic of enclaves is that they can generate exceptions
+as part of their normal operation that need to be handled in the enclave or are
+unique to SGX.
+
+Instead of the traditional signal mechanism to handle these exceptions, SGX
+can leverage special exception fixup provided by the vDSO.  The kernel-provided
+vDSO function wraps low-level transitions to/from the enclave like EENTER and
+ERESUME.  The vDSO function intercepts exceptions that would otherwise generate
+a signal and return the fault information directly to its caller.  This avoids
+the need to juggle signal handlers.
+
+.. kernel-doc:: arch/x86/include/uapi/asm/sgx.h
+   :functions: vdso_sgx_enter_enclave_t
+
+ksgxswapd
+=========
+
+SGX support includes a kernel thread called *ksgxwapd*.
+
+EPC sanitization
+----------------
+
+ksgxswapd is started when SGX initializes.  Enclave memory is typically ready
+For use when the processor powers on or resets.  However, if SGX has been in
+use since the reset, enclave pages may be in an inconsistent state.  This might
+occur after a crash and kexec() cycle, for instance.  At boot, ksgxswapd
+reinitializes all enclave pages so that they can be allocated and re-used.
+
+The sanitization is done by going through EPC address space and applying the
+EREMOVE function to each physical page. Some enclave pages like SECS pages have
+hardware dependencies on other pages which prevents EREMOVE from functioning.
+Executing two EREMOVE passes removes the dependencies.
+
+Page reclaimer
+--------------
+
+Similar to the core kswapd, ksgxswapd, is responsible for managing the
+overcommitment of enclave memory.  If the system runs out of enclave memory,
+*ksgxwapd* “swaps” enclave memory to normal memory.
+
+Launch Control
+==============
+
+SGX provides a launch control mechanism. After all enclave pages have been
+copied, kernel executes EINIT function, which initializes the enclave. Only after
+this the CPU can execute inside the enclave.
+
+ENIT function takes an RSA-3072 signature of the enclave measurement.  The function
+checks that the measurement is correct and signature is signed with the key
+hashed to the four **IA32_SGXLEPUBKEYHASH{0, 1, 2, 3}** MSRs representing the
+SHA256 of a public key.
+
+Those MSRs can be configured by the BIOS to be either readable or writable.
+Linux supports only writable configuration in order to give full control to the
+kernel on launch control policy. Before calling EINIT function, the driver sets
+the MSRs to match the enclave's signing key.
+
+Encryption engines
+==================
+
+In order to conceal the enclave data while it is out of the CPU package, the
+memory controller has an encryption engine to transparently encrypt and decrypt
+enclave memory.
+
+In CPUs prior to Ice Lake, the Memory Encryption Engine (MEE) is used to
+encrypt pages leaving the CPU caches. MEE uses a n-ary Merkle tree with root in
+SRAM to maintain integrity of the encrypted data. This provides integrity and
+anti-replay protection but does not scale to large memory sizes because the time
+required to update the Merkle tree grows logarithmically in relation to the
+memory size.
+
+CPUs starting from Icelake use Total Memory Encryption (TME) in the place of
+MEE. TME-based SGX implementations do not have an integrity Merkle tree, which
+means integrity and replay-attacks are not mitigated.  B, it includes
+additional changes to prevent cipher text from being returned and SW memory
+aliases from being Created.
+
+DMA to enclave memory is blocked by range registers on both MEE and TME systems
+(SDM section 41.10).
+
+Usage Models
+============
+
+Shared Library
+--------------
+
+Sensitive data and the code that acts on it is partitioned from the application
+into a separate library. The library is then linked as a DSO which can be loaded
+into an enclave. The application can then make individual function calls into
+the enclave through special SGX instructions. A run-time within the enclave is
+configured to marshal function parameters into and out of the enclave and to
+call the correct library function.
+
+Application Container
+---------------------
+
+An application may be loaded into a container enclave which is specially
+configured with a library OS and run-time which permits the application to run.
+The enclave run-time and library OS work together to execute the application
+when a thread enters the enclave.
-- 
2.27.0

