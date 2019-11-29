Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E3C6C10DBB7
	for <lists+linux-doc@lfdr.de>; Sat, 30 Nov 2019 00:18:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727175AbfK2XS0 (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Fri, 29 Nov 2019 18:18:26 -0500
Received: from mga09.intel.com ([134.134.136.24]:60930 "EHLO mga09.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727073AbfK2XSZ (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Fri, 29 Nov 2019 18:18:25 -0500
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 29 Nov 2019 15:18:23 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,259,1571727600"; 
   d="scan'208";a="384194589"
Received: from gamanzi-mobl4.ger.corp.intel.com (HELO localhost) ([10.252.3.126])
  by orsmga005.jf.intel.com with ESMTP; 29 Nov 2019 15:18:13 -0800
From:   Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>
To:     linux-kernel@vger.kernel.org, x86@kernel.org,
        linux-sgx@vger.kernel.org
Cc:     akpm@linux-foundation.org, dave.hansen@intel.com,
        sean.j.christopherson@intel.com, nhorman@redhat.com,
        npmccallum@redhat.com, serge.ayoun@intel.com,
        shay.katz-zamir@intel.com, haitao.huang@intel.com,
        andriy.shevchenko@linux.intel.com, tglx@linutronix.de,
        kai.svahn@intel.com, bp@alien8.de, josh@joshtriplett.org,
        luto@kernel.org, kai.huang@intel.com, rientjes@google.com,
        cedric.xing@intel.com, puiterwijk@redhat.com,
        linux-doc@vger.kernel.org,
        Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>
Subject: [PATCH v24 23/24] docs: x86/sgx: Document microarchitecture
Date:   Sat, 30 Nov 2019 01:13:25 +0200
Message-Id: <20191129231326.18076-24-jarkko.sakkinen@linux.intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191129231326.18076-1-jarkko.sakkinen@linux.intel.com>
References: <20191129231326.18076-1-jarkko.sakkinen@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=a
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

From: Sean Christopherson <sean.j.christopherson@intel.com>

Document microarchitectural features of Intel SGX relevant to the
kernel.

Cc: linux-doc@vger.kernel.org
Signed-off-by: Sean Christopherson <sean.j.christopherson@intel.com>
Co-developed-by: Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>
Signed-off-by: Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>
---
 Documentation/x86/index.rst              |   1 +
 Documentation/x86/sgx/1.Architecture.rst | 431 +++++++++++++++++++++++
 Documentation/x86/sgx/index.rst          |  16 +
 3 files changed, 448 insertions(+)
 create mode 100644 Documentation/x86/sgx/1.Architecture.rst
 create mode 100644 Documentation/x86/sgx/index.rst

diff --git a/Documentation/x86/index.rst b/Documentation/x86/index.rst
index af64c4bb4447..f3f3ba45de35 100644
--- a/Documentation/x86/index.rst
+++ b/Documentation/x86/index.rst
@@ -30,3 +30,4 @@ x86-specific Documentation
    usb-legacy-support
    i386/index
    x86_64/index
+   sgx/index
diff --git a/Documentation/x86/sgx/1.Architecture.rst b/Documentation/x86/sgx/1.Architecture.rst
new file mode 100644
index 000000000000..a4de6c610231
--- /dev/null
+++ b/Documentation/x86/sgx/1.Architecture.rst
@@ -0,0 +1,431 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+============
+Architecture
+============
+
+Introduction
+============
+
+SGX is a set of instructions and mechanisms that enable ring 3 applications to
+set aside private regions of code and data for the purpose of establishing and
+running enclaves.  An enclave is a secure entity whose private memory can only
+be accessed by code running within the enclave.  Accesses from outside the
+enclave, including software running at a higher privilege level and other
+enclaves, are disallowed by hardware.
+
+SGX also provides for local and remote attestation.  `Attestation`_ allows an
+enclave to attest its identity, that it has not been tampered with, that it is
+running on a genuine platform with Intel SGX enabled, and the security
+properties of the platform on which it is running.
+
+You can determine if your CPU supports SGX by querying ``/proc/cpuinfo``:
+
+	``cat /proc/cpuinfo | grep sgx``
+
+
+Enclave Page Cache
+==================
+
+SGX utilizes an Enclave Page Cache (EPC) to store pages that are associated
+with an enclave.  The EPC is secure storage whose exact physical implementation
+is micro-architecture specific (see `EPC Implemenations`_).  Similar to normal
+system memory, the EPC is managed by privileged software using conventional
+paging mechanisms, e.g. the kernel can grant/deny access to EPC memory by
+manipulating a process' page tables, and can swap pages in/out of the EPC in
+order to oversubscribe the EPC.
+
+Unlikely regular memory, hardware prevents arbitrary insertion, eviction,
+deletion, access, etc... to/from the EPC.  Software must instead use dedicated
+`SGX instructions`_ to operate on the EPC, which enables the processor to
+provide SGX's security guarantees by enforcing various restrictions and
+behaviors, e.g. limits concurrent accesses to EPC pages and ensures proper TLB
+flushing when moving pages in/out of the EPC.
+
+Accesses to EPC pages are allowed if and only if the access is classified as an
+"enclave access".  There are two categories of allowed enclave accesses: direct
+and indirect.  Direct enclave accesses are generated if and only the processor
+is executing in Enclave Mode (see `Enclave execution`_).  Indirect enclave
+accesses are generated by various ENCL{S,U,V} functions, many of which can be
+executed outside of Enclave Mode.
+
+Non-enclave accesses to the EPC result in undefined behavior.  Conversely,
+enclave accesses to non-EPC memory result in a page fault (#PF)[1]_.  Page
+faults due to invalid enclave accesses set the PF_SGX flag (bit 15) in the page
+fault error code[2]_.
+
+Although all EPC implementations will undoubtedly encrypt the EPC itself, all
+all EPC code/data is stored unencrypted in the processor's caches.  I.e. SGX
+relies on the aforementioned mechanisms to protect an enclave's secrets while
+they are resident in the cache.
+
+Note, EPC pages are always 4KB sized and aligned.  Software can map EPC using
+using large pages, but the processor always operates on a 4KB granularity when
+working with EPC pages.
+
+
+SGX instructions
+================
+
+SGX introduces three new instructions, ENCLS, ENCLU and ENCLV, for Supervisor,
+User and Virtualization respectively.  ENCL{S,U,V} are umbrella instructions,
+using a single opcode as the front end to a variety of SGX functions.  The leaf
+function to execute is specified via %eax, with %rbx, %rcx and %rdx optionally
+used for leaf-specific purposes.
+
+Note that supervisor software, i.e. the kernel, creates and manages enclaves,
+but only user-level software can execute/enter an enclave.
+
+ENCLS Leafs
+-----------
+
+ - ECREATE: create an enclave
+ - EADD: add page to an uninitialized enclave
+ - EAUG: add page to an initialized enclave
+ - EEXTEND: extended the measurement of an (uninitialized) enclave
+ - EINIT: verify and initialize enclave
+ - EDBG{RD,WR}: read/write from/to a debug enclave’s memory
+ - EMODPR: restrict an EPC page’s permissions
+ - EMODT: modify an EPC page’s type
+ - EBLOCK: mark a page as blocked in EPCM
+ - ETRACK{C}: activate blocking tracing
+ - EWB: write back page from EPC to regular memory
+ - ELD{B,U}{C}: load page in {un}blocked state from system memory to EPC
+ - EPA: add version array (use to track evicted EPC pages)
+ - EREMOVE: remove a page from EPC
+ - ERDINFO: retrieve info about an EPC page from EPCM
+
+ENCLU Leafs
+-----------
+ - EENTER: enter an enclave
+ - ERESUME: resume execution of an interrupted enclave
+ - EEXIT: exit an enclave
+ - EGETKEY: retrieve a cryptographic key from the processor
+ - EREPORT: generate a cryptographic report describing an enclave
+ - EMODPE: extend an EPC page's permissions
+ - EACCEPT: accept changes to an EPC page
+ - EACCEPTCOPY: copy an existing EPC page to an uninitialized EPC page
+
+ENCLV Leafs
+-----------
+ - E{DEC,INC}VIRTCHILD: {dec,inc}rement SECS virtual refcount
+ - ESETCONTEXT: set SECS’ context pointer
+
+
+EPC page types
+==============
+
+All pages in the EPC have an explicit page type identifying the type of page.
+The type of page affects the page's accessibility, concurrency requirements,
+lifecycle, etc...
+
+SGX Enclave Control Structure (SECS)
+    An enclave is defined and referenced by an SGX Enclave Control Structure.
+    When creating an enclave (via ECREATE), software provides a source SECS for
+    the enclave, which is copied into a target EPC page.  The source SECS
+    contains security and measurement information, as well as attributes and
+    properties of the enclave.  Once the SECS is copied into the EPC, it's used
+    by the processor to store enclave metadata, e.g. the number of EPC pages
+    associated with the enclave, and is no longer directly accessible by
+    software.
+
+Regular (REG)
+    Regular EPC pages contain the code and data of an enclave.  Code and data
+    pages can be added to an uninitialized enclave (prior to EINIT) via EADD.
+    Post EINIT, pages can be added to an enclave via EAUG.  Pages added via
+    EAUG must be explicitly accepted by the enclave via EACCEPT or EACCEPTCOPY.
+
+Thread Control Structure (TCS)
+    Thread Control Structure pages define the entry points to an enclave and
+    track the execution state of an enclave thread.  A TCS can only be used by
+    a single logical CPU at any given time, but otherwise has no attachment to
+    any particular logical CPU.  Like regular pages, TCS pages are added to
+    enclaves via EADD and EINIT.
+
+Version Array (VA)
+   Version Array pages contain 512 slots, each of which can contain a version
+   number for a page evicted from the EPC.  A version number is a unique 8-byte
+   value that is fed into the MAC computation used to verify the contents of an
+   evicted page when reloading said page into the EPC.  VA pages are the only
+   page type not directly associated with an enclave, and are allocated in the
+   EPC via EPA.   Note that VA pages can also be evicted from the EPC, but
+   doing so requires another VA page/slot to hold the version number of the VA
+   page being evicted.
+
+Trim (TRIM)
+   The Trim page type indicates that a page has been trimmed from the enclave’s
+   address space and is no longer accessible to enclave software, i.e. is about
+   to be removed from the enclave (via EREMOVE).  Removing pages from a running
+   enclaves requires the enclave to explicit accept the removal (via EACCEPT).
+   The intermediate Trim type allows software to batch deallocation operations
+   to improve efficiency, e.g. minimize transitions between userspace, enclave
+   and kernel.
+
+
+Enclave Page Cache Map
+======================
+
+The processor tracks EPC pages via the Enclave Page Cache Map (EPCM).  The EPCM
+is a processor-managed structure that enforces access restrictions to EPC pages
+in addition to the software-managed page tables.  The EPCM contains one entry
+per EPC page, and although the details are implementation specific, all
+implementations contain the following architectural information:
+
+ - The status of EPC page with respect to validity and accessibility.
+ - An SECS identifier of the enclave to which the page belongs.
+ - The type of page: regular, SECS, TCS, VA or TRIM
+ - The linear address through which the enclave is allowed to access the page.
+ - The specified read/write/execute permissions on that page.
+
+Access violations, e.g. insufficient permissions or incorrect linear address,
+detected via the EPCM result in a page fault (#PF)[1]_ exception being signaled
+by the processor.  Page faults due to EPCM violations set the PF_SGX flag
+(bit 15) in the page fault error code[2]_.
+
+The EPCM is consulted if and only if walking the software-managed page tables,
+i.e. the kernel's page tables, succeeds.  I.e. the effective permissions for an
+EPC page are a logical AND of the kernel's page tables and the corresponding
+EPCM entry.  This allows the kernel to make its page tables more restrictive
+without triggering an EPCM violation, e.g. it may mark an entry as not-present
+prior to evicting a page from the EPC.
+
+**IMPORTANT** For all intents and purposes the SGX architecture allows the
+processor to invalidate all EPCM entries at will, i.e. requires that software
+be prepared to handle an EPCM fault at any time.  Most processors are expected
+to implement the EPC{M} as a subset of system DRAM that is encrypted with an
+ephemeral key, i.e. a key that is randomly generated at processor reset.  As a
+result of using an ephemeral key, the contents of the EPC{M} are lost when the
+processor is powered down as part of an S3 transition or when a virtual machine
+is live migrated to a new physical system.
+
+
+Enclave initialization
+======================
+
+Because software cannot directly access the EPC except when executing in an
+enclave, an enclave must be built using ENCLS functions (ECREATE and EADD) as
+opposed to simply copying the enclave from the filesystem to memory.  Once an
+enclave is built, it must be initialized (via EINIT) before userspace can enter
+the enclave and begin `Enclave execution`_.
+
+During the enclave build process, two "measurements", i.e. SHA-256 hashes, are
+taken of the enclave: MRENCLAVE and MRSIGNER.  MRENCLAVE measures the enclave's
+contents,  e.g. code/data explicitly added to the measurement (via EEXTEND), as
+well as metadata from the enclave's build process, e.g. pages offsets (relative
+to the enclave's base) and page permissions of all pages added to the enclave
+(via EADD).  MRENCLAVE is initialized by ECREATE and finalized by EINIT.
+MRSIGNER is simply the SHA-256 hash of the public key used to sign the enclave.
+
+EINIT accepts two parameters in addition to the SECS of the target enclave: an
+Enclave Signature Struct (SIGSTRUCT) and an EINIT token (EINITTOKEN).
+SIGSTRUCT is a structure created and signed by the enclave's developer.  Among
+other fields, SIGSTRUCT contains the expected MRENCLAVE of the enclave and the
+MRSIGNER of the enclave.  SIGSTRUCT's MRENCLAVE is used by the processor to
+verify that the enclave was properly built (at runtime), and its SIGSTRUCT is
+copied to the SECS upon successful EINIT.  EINITTOKEN is an optional parameter
+that is consumed as part of `Launch Control`_.
+
+
+Enclave execution
+=================
+
+Enclaves execute in a bespoke sub-mode of ring 3, appropriately named Enclave
+Mode.  Enclave Mode changes behavior in key ways to support SGX's security
+guarantees and to reduce the probability of unintentional disclosure of
+sensitive data.
+
+A notable cornerstone of Enclave Mode is the Enclave Linear Range (ELRANGE).
+An enclave is associated with one, and only one, contiguous linear address
+range, its ELRANGE.  The ELRANGE is specified via the SIZE and BASEADDR fields
+in the SECS (provided to ECREATE).  The processor queries the active enclave's
+ELRANGE to differentiate enclave and non-enclave accesses, i.e. accesses that
+originate in Enclave Mode *and* whose linear address falls within ELRANGE are
+considered (direct) enclave accesses.  Note, the processor also generates
+(indirect) enclave accesses when executing ENCL* instructions, which may occur
+outside of Enclave Mode, e.g. when copying the SECS to its target EPC page
+during ECREATE.
+
+Enclave Mode changes include, but are not limited to:
+
+ - Permits direct software access to EPC pages owned by the enclave
+ - Ensures enclave accesses map to the EPC (EPCM violation, i.e. #PF w/ PF_SGX)
+ - Prevents executing code outside the enclave's ELRANGE (#GP fault)
+ - Changes the behavior of exceptions/events
+ - Causes many instructions to become illegal, i.e. generate an exception
+ - Supresses all instruction breakpoints*
+ - Suppresses data breakpoints within enclave's ELRANGE*
+
+ * For non-debug enclaves.
+
+Transitions to/from Enclave Mode have semantics that are a lovely blend of
+SYSCALL, SYSRET and VM-Exit.  In normal execution, entering and exiting Enclave
+Mode can only be done through EENTER and EEXIT respectively.  EENTER+EEXIT is
+analogous to SYSCALL+SYSRET, e.g. EENTER/SYSCALL load RCX with the next RIP and
+EEXIT/SYSRET load RIP from R{B,C}X, and EENTER can only jump to a predefined
+location controlled by the enclave/kernel.
+
+But when an exception, interrupt, VM-Exit, etc... occurs, enclave transitions
+behave more like VM-Exit and VMRESUME.  To maintain the black box nature of the
+enclave, the processor automatically switches register context when any of the
+aforementioned events occur (the SDM refers to such events as Enclave Exiting
+Events (EEE)).
+
+To handle an EEE, the processor performs an Asynchronous Enclave Exits (AEX).
+Note, although exceptions and traps are synchronous from a processor execution
+perspective, the are asynchronous from the enclave's perspective as the enclave
+is not provided an opportunity to save/fuzz state prior to exiting the enclave.
+On an AEX, the processor exits the enclave to a predefined %rip called the
+Asynchronous Exiting Pointer (AEP).  The AEP is specified at enclave entry (via
+EENTER/ERESUME) and saved into the associated TCS, similar to how a hypervisor
+specifies the VM-Exit target (via VMCS.HOST_RIP at VMLAUNCH/VMRESUME), i.e. the
+the AEP is an exit location controlled by the enclave's untrusted runtime.
+
+On an AEX, the processor fully exits the enclave prior to vectoring the event,
+i.e. from the event handler's perspective the event occurred at the AEP.  Thus,
+IRET/RSM/VMRESUME (from the event handler) returns control to the enclave's
+untrusted runtime, which can take appropriate action, e.g. immediately ERESUME
+the enclave on interrupts, forward expected exceptions to the enclave, restart
+the enclave on fatal exceptions, and so on and so forth.
+
+To preserve the enclave's state across AEX events, the processor automatically
+saves architectural into a State Save Area (SSA).  Because SGX supports nested
+AEX events, e.g. the untrusted runtime can re-EENTER the enclave after an AEX,
+which can in turn trigger an AEX, the TCS holds a pointer to a stack of SSA
+frames (as opposed to a single SSA), an index to the current SSA frame and the
+total number of available frames.  When an AEX occurs, the processor saves the
+architectural state into the TCS's current SSA frame.  The untrusted runtime
+can then pop the last SSA frame (off the TCS's stack) via ERESUME, i.e. restart
+the enclave after the AEX is handled.
+
+
+Launch Control
+==============
+
+SGX provides a set of controls, referred to as Launch Control, that governs the
+initialization of enclaves.  The processor internally stores a SHA-256 hash of
+a 3072-bit RSA public key, i.e. a MRSIGNER, often referred to as the "LE pubkey
+hash".  The LE pubkey hash is used during EINIT to prevent launching an enclave
+without proper authorization.  In order for EINIT to succeed, the enclave's
+MRSIGNER (from SIGSTRUCT) *or* the MRSIGNER of the enclave's EINITTOKEN must
+match the LE pubkey hash.
+
+An EINITTOKEN can only be created by a so called Launch Enclave (LE).  A LE is
+an enclave with SECS.ATTRIBUTES.EINITTOKEN_KEY=1, which grants it access to the
+EINITTOKEN_KEY (retrieved via EGETKEY).  EINITTOKENs provide a ready-built
+mechanism for userspace to bless enclaves without requiring additional kernel
+infrastructure.
+
+Processors that support SGX Launch Control Configuration, enumerated by the
+SGX_LC flag (bit 30 in CPUID 0x7.0x0.ECX), expose the LE pubkey hash as a set
+of four MSRs, aptly named IA32_SGXLEPUBKEYHASH[0-3].  The reset value of the
+MSRs is an internally defined (Intel) key (processors that don't support
+SGX_LC also use an internally defined key, it's just not exposed to software).
+
+While the IA32_SGXLEPUBKEYHASH MSRs are readable on any platform that supports
+SGX_LC, the MSRs are only writable if the IA32_FEATURE_CONTROL is locked with
+bit 17 ("SGX Launch Control Enable" per the SDM, or more accurately "SGX LE
+pubkey hash writable") set to '1'.  Note, the MSRs are also writable prior to
+`SGX activation`_.
+
+Note, while "Launch Control Configuration" is the official feature name used by
+the Intel SDM, other documentation may use the term "Flexible Launch Control",
+or even simply "Launch Control".  Colloquially, the vast majority of usage of
+the term "Launch Control" is synonymous with "Launch Control Configuration".
+
+
+EPC oversubscription
+====================
+
+SGX supports the concept of EPC oversubscription.  Analogous to swapping system
+DRAM to disk, enclave pages can be swapped from the EPC to memory, and later
+reloaded from memory to the EPC.  But because the kernel is untrusted, swapping
+pages in/out of the EPC has specialized requirements:
+
+  - The kernel cannot directly access EPC memory, i.e. cannot copy data to/from
+    the EPC.
+  - The kernel must "prove" to hardware that there are no valid TLB entries for
+    said page prior to eviction (a stale TLB entry would allow an attacker to
+    bypass SGX access controls).
+  - When loading a page back into the EPC, hardware must be able to verify
+    the integrity and freshness of the data.
+  - When loading an enclave page, e.g. regular and TCS pages, hardware must be
+    able to associate the page with an SECS, i.e. refcount an enclaves pages.
+
+To satisfy the above requirements, the CPU provides dedicated ENCLS functions
+to support paging data in/out of the EPC:
+
+  - EBLOCK: Mark a page as blocked in the EPC Map (EPCM).  Attempting to access
+    a blocked page that misses the TLB will fault.
+  - ETRACK: Activate TLB tracking.  Hardware verifies that all translations for
+    pages marked as "blocked" have been flushed from the TLB.
+  - EPA:    Add Version Array page to the EPC (see `EPC page types`_)
+  - EWB:    Write back a page from EPC to memory, e.g. RAM.  Software must
+    supply a VA slot, memory to hold the Paging Crypto Metadata (PCMD) of the
+    page and obviously backing for the evicted page.
+  - ELD*:   Load a page in {un}blocked state from memory to EPC.
+
+Swapped EPC pages are {de,en}crypted on their way in/out of the EPC, e.g. EWB
+encrypts and ELDU decrypts.  The version number (stored in a VA page) and PCMD
+structure associated with an evicted EPC page seal a page (prevent undetected
+modification) and ensure its freshness (prevent rollback to a stale version of
+the page) while the page resides in unprotected storage, e.g. memory or disk.
+
+
+Attestation
+===========
+
+SGX provides mechanisms that allow software to implement what Intel refers to
+as Local Attestation (used by enclaves running on a the same physical platform
+to securely identify one another) and Remote Attestation (a process by which an
+enclave attests itself to a remote entity in order to gain the trust of said
+entity).
+
+The details of Local Attestation and Remote Attestation are far beyond the
+scope of this document.  Please see Intel's Software Developer's Manual and/or
+use your search engine of choice to learn more about SGX's attestation
+capabilities.
+
+
+EPC Implemenations
+==================
+
+PRM with MEE
+--------------
+
+Initial hardware support for SGX implements the EPC by reserving a chunk of
+system DRAM, referred to as Processor Reserved Memory (PRM).   A percentage of
+PRM is consumed by the processor to implement the EPCM, with the remainder of
+PRM being exposed to software as the EPC.  PRM is configured by firmware via
+dedicated PRM Range Registers (PRMRRs).   The PRMRRs are locked  which are locked as part of SGX activation, i.e.
+resizing the PRM, and thus EPC, requires rebooting the system.
+
+An autonomous hardware unit called the Memory Encryption Engine (MEE) protects
+the confidentiality, integrity, and freshness of the PRM, e.g. {de,en}crypts
+data as it is read/written from/to DRAM to provide confidentiality.
+
+
+SGX activation
+==============
+
+Before SGX can be fully enabled, e.g. via FEATURE_CONTROL, the platform must
+undergo explicit SGX activation.  SGX activation is a mechanism by which the
+processor verifies and locks the platform configuration set by pre-boot
+firmware, e.g. to ensure it satisfies SGX's security requirements.  Before
+SGX is activated (and its configuration locked), firmware can modify the
+PRMRRs, e.g. to set the base/size of the PRM and thus EPC, and can also write
+the SGX_LEPUBKEYHASH MSRs.  Notably, the latter allows pre-boot firmware to
+lock the SGX_LEPUBKEYHASH MSRs to a non-Intel value by writing the MSRs and
+locking MSR_IA32_FEATURE_CONTROL without setting the "SGX LE pubkey hash
+writable" flag, i.e. making the SGX_LEPUBKEYHASH MSRs readonly.
+
+
+Footnotes
+=========
+
+.. [1] All processors that do not support the SGX2 ISA take an errata and
+       signal #GP(0) instead of #PF(PF_SGX) when vectoring EPCM violations and
+       faults due to enclave-accesses to non-EPC memory.
+
+.. [2] Note that despite being vectored as a #PF, a #PF with PF_SGX has nothing
+       to do with conventional paging.
+
diff --git a/Documentation/x86/sgx/index.rst b/Documentation/x86/sgx/index.rst
new file mode 100644
index 000000000000..c5dfef62e612
--- /dev/null
+++ b/Documentation/x86/sgx/index.rst
@@ -0,0 +1,16 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+=========================
+Software Guard Extensions
+=========================
+
+Intel(R) SGX is a set of architectural extensions that enables applications to
+establish secure containers, a.k.a. enclaves.  SGX enclaves provide security
+guarantees such as integrity and confidentiality, even when running on a system
+where privileged software, e.g. kernel, hypervisor, etc... is untrusted and
+potentially malicious.
+
+.. toctree::
+   :maxdepth: 1
+
+   1.Architecture
-- 
2.20.1

