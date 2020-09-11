Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3FB4826670F
	for <lists+linux-doc@lfdr.de>; Fri, 11 Sep 2020 19:37:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726032AbgIKRhG (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Fri, 11 Sep 2020 13:37:06 -0400
Received: from mga02.intel.com ([134.134.136.20]:61324 "EHLO mga02.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726023AbgIKMvF (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Fri, 11 Sep 2020 08:51:05 -0400
IronPort-SDR: fNyy9Uc+hEFbXec3w/quoxKYXSFWHVihjVbHsE6wWJ+WwzOO+Ez/O8+zf8rMwfOWVdmxtLgBlJ
 THf2S6fBRZVA==
X-IronPort-AV: E=McAfee;i="6000,8403,9740"; a="146436815"
X-IronPort-AV: E=Sophos;i="5.76,415,1592895600"; 
   d="scan'208";a="146436815"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Sep 2020 05:46:36 -0700
IronPort-SDR: V3k2Oc2DBFQIEthJgvUh7ZVRkO0hUvMg/DukJICCl+s8GVp7pmStNcXe7D7y/SL7w5wMI2oBB2
 NpJazU59/i4g==
X-IronPort-AV: E=Sophos;i="5.76,415,1592895600"; 
   d="scan'208";a="344625381"
Received: from amaksymi-mobl.ger.corp.intel.com (HELO localhost) ([10.252.60.247])
  by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Sep 2020 05:46:27 -0700
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
        josh@joshtriplett.org, kai.huang@intel.com, kai.svahn@intel.com,
        kmoy@google.com, ludloff@google.com, luto@kernel.org,
        nhorman@redhat.com, npmccallum@redhat.com, puiterwijk@redhat.com,
        rientjes@google.com, tglx@linutronix.de, yaozhangx@google.com
Subject: [PATCH v37 23/24] docs: x86/sgx: Document SGX micro architecture and kernel internals
Date:   Fri, 11 Sep 2020 15:40:18 +0300
Message-Id: <20200911124019.42178-24-jarkko.sakkinen@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200911124019.42178-1-jarkko.sakkinen@linux.intel.com>
References: <20200911124019.42178-1-jarkko.sakkinen@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=y
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Document the Intel SGX kernel architecture. The fine-grained micro
architecture details can be looked up from Intel SDM Volume 3D.

Cc: linux-doc@vger.kernel.org
Acked-by: Randy Dunlap <rdunlap@infradead.org>
Co-developed-by: Sean Christopherson <sean.j.christopherson@intel.com>
Signed-off-by: Sean Christopherson <sean.j.christopherson@intel.com>
Signed-off-by: Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>
---
 Documentation/x86/index.rst |   1 +
 Documentation/x86/sgx.rst   | 200 ++++++++++++++++++++++++++++++++++++
 2 files changed, 201 insertions(+)
 create mode 100644 Documentation/x86/sgx.rst

diff --git a/Documentation/x86/index.rst b/Documentation/x86/index.rst
index 265d9e9a093b..807290bf357c 100644
--- a/Documentation/x86/index.rst
+++ b/Documentation/x86/index.rst
@@ -30,3 +30,4 @@ x86-specific Documentation
    usb-legacy-support
    i386/index
    x86_64/index
+   sgx
diff --git a/Documentation/x86/sgx.rst b/Documentation/x86/sgx.rst
new file mode 100644
index 000000000000..706a846ae353
--- /dev/null
+++ b/Documentation/x86/sgx.rst
@@ -0,0 +1,200 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+============
+Architecture
+============
+
+*Software Guard eXtensions (SGX)* is a set of instructions that enable ring-3
+applications to set aside private regions of code and data. These regions are
+called enclaves. An enclave can be entered to a fixed set of entry points. Only
+a CPU running inside the enclave can access its code and data.
+
+The support can be determined by
+
+	``grep sgx /proc/cpuinfo``
+
+Enclave Page Cache
+==================
+
+SGX utilizes an *Enclave Page Cache (EPC)* to store pages that are associated
+with an enclave. It is contained in a BIOS reserved region of physical memory.
+Unlike pages used for regular memory, pages can only be accessed outside the
+enclave for different purposes with the instructions **ENCLS**, **ENCLV** and
+**ENCLU**.
+
+Direct memory accesses to an enclave can be only done by a CPU executing inside
+the enclave. An enclave can be entered with **ENCLU[EENTER]** to a fixed set of
+entry points. However, a CPU executing inside the enclave can do outside memory
+accesses.
+
+Page Types
+----------
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
+The processor tracks EPC pages via the *Enclave Page Cache Map (EPCM)*.  EPCM
+contains an entry for each EPC page, which describes the owning enclave, access
+rights and page type among the other things.
+
+The permissions from EPCM is consulted if and only if walking the kernel page
+tables succeeds. The total permissions are thus a conjunction between page table
+and EPCM permissions.
+
+For all intents and purposes the SGX architecture allows the processor to
+invalidate all EPCM entries at will, i.e. requires that software be prepared to
+handle an EPCM fault at any time. The contents of EPC are encrypted with an
+ephemeral key, which is lost on power transitions.
+
+EPC management
+==============
+
+EPC pages do not have ``struct page`` instances. They are IO memory from kernel
+perspective. The consequence is that they are always mapped as shared memory.
+Kernel defines ``/dev/sgx/enclave`` that can be mapped as ``MAP_SHARED`` to
+define the address range for an enclave.
+
+EPC Over-subscription
+=====================
+
+When the amount of free EPC pages goes below a low watermark the swapping thread
+starts reclaiming pages. The pages that do not have the **A** bit set are
+selected as victim pages.
+
+Launch Control
+==============
+
+SGX provides a launch control mechanism. After all enclave pages have been
+copied, kernel executes **ENCLS[EINIT]**, which initializes the enclave. Only
+after this the CPU can execute inside the enclave.
+
+This leaf function takes an RSA-3072 signature of the enclave measurement and an
+optional cryptographic token. Linux does not take advantage of launch tokens.
+The instruction checks that the signature is signed with the key defined in
+**IA32_SGXLEPUBKEYHASH?** MSRs and the measurement is correct. If so, the
+enclave is allowed to be executed.
+
+MSRs can be configured by the BIOS to be either readable or writable. Linux
+supports only writable configuration in order to give full control to the kernel
+on launch control policy. Readable configuration requires the use of previously
+mentioned launch tokens.
+
+The current kernel implementation supports only writable MSRs. The launch is
+performed by setting the MSRs to the hash of the enclave signer's public key.
+The alternative would be to have *a launch enclave* that would be signed with
+the key set into MSRs, which would then generate launch tokens for other
+enclaves. This would only make sense with read-only MSRs, and thus the option
+has been discarded.
+
+Attestation
+===========
+
+Local Attestation
+-----------------
+
+In local attestation an enclave creates a **REPORT** data structure with
+**ENCLS[EREPORT]**, which describes the origin of an enclave. In particular, it
+contains a AES-CMAC of the enclave contents signed with a report key unique to
+each processor. All enclaves have access to this key.
+
+This mechanism can also be used in addition as a communication channel as the
+**REPORT** data structure includes a 64-byte field for variable information.
+
+Remote Attestation
+------------------
+
+Provisioning Certification Enclave (PCE), the root of trust for other enclaves,
+generates a signing key from a fused key called Provisioning Certification Key.
+PCE can then use this key to certify an attestation key of a Quoting Enclave
+(QE), e.g. we get the chain of trust down to the hardware if the Intel signed
+PCE is used.
+
+To use the needed keys, ATTRIBUTE.PROVISIONKEY is required but should be only
+allowed for those who actually need it so that only the trusted parties can
+certify QE's.
+
+A device file called /dev/sgx/provision exists to provide file descriptors that
+act as privilege tokens for building provisioning enclaves. These can be
+associated with enclaves with the ioctl SGX_IOC_ENCLAVE_SET_ATTRIBUTE.
+
+Encryption engines
+==================
+
+In order to conceal the enclave data while it is out of the CPU package,
+memory controller has to be extended with an encryption engine. MC can then
+route incoming requests coming from CPU cores running in enclave mode to the
+encryption engine.
+
+In CPUs prior to Icelake, Memory Encryption Engine (MEE) is used to
+encrypt pages leaving the CPU caches. MEE uses a n-ary Merkle tree with root in
+SRAM to maintain integrity of the encrypted data. This provides integrity and
+anti-replay protection but does not scale to large memory sizes because the time
+required to update the Merkle tree grows logarithmically in relation to the
+memory size.
+
+CPUs starting from Icelake use Total Memory Encryption (TME) in the place of
+MEE. SGX using TME does not have an integrity Merkle tree, which means losing HW
+protections from integrity and replay-attacks, but includes additional changes
+to prevent cipher text from being return and SW memory aliases from being
+created. DMA remains blocked by the PRMRR to the EPC memory even systems that
+use TME (SDM section 41.10).
+
+Backing storage
+===============
+
+Backing storage is shared and not accounted. It is implemented as a private
+shmem file. Providing a backing storage in some form from user space is not
+possible - accounting would go to invalid state as reclaimed pages would get
+accounted to the processes of which behalf the kernel happened to be acting on.
+
+Access control
+==============
+
+`mmap()` permissions are capped by the enclave permissions. A direct
+consequence of this is that all the pages for an address range must be added
+before `mmap()` can be applied. Effectively an enclave page with minimum
+permissions in the address range sets the permission cap for the mapping
+operation.
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
+
+References
+==========
+
+"Supporting Third Party Attestation for Intel® SGX with Intel® Data Center
+Attestation Primitives"
+   https://software.intel.com/sites/default/files/managed/f1/b8/intel-sgx-support-for-third-party-attestation.pdf
-- 
2.25.1

