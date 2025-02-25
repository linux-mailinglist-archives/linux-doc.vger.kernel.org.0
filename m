Return-Path: <linux-doc+bounces-39552-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CCF9A468AE
	for <lists+linux-doc@lfdr.de>; Wed, 26 Feb 2025 18:57:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 51461173480
	for <lists+linux-doc@lfdr.de>; Wed, 26 Feb 2025 17:57:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BDE5A22C339;
	Wed, 26 Feb 2025 17:56:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BTo59aEK"
X-Original-To: linux-doc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 911F922B5BC;
	Wed, 26 Feb 2025 17:56:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740592602; cv=none; b=WAl2lc/2sqnOKBA7zIW3l2Z+jGNF9lxPefXO7qMby8SL3nVPE907FIqbKBE5v0q13qUhwyiwzQv0jWpXByMgEfMmuqjMV/TdD5aBmzEj2vU2KuPj1AVdMmmJaxEO/X+xD5+LDCrsHRXekspKAaQpG1do8DJoVpR6mMKefSCtxzM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740592602; c=relaxed/simple;
	bh=r21KX6IoVsqpRzbGx+/2lKf1vdGqvRlJ/pUOBg2BR9U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cNgZ6oXxm9NaAtN1vW0bTHnMtwKcgOf7nBYezJ33eOHUfLwcI8Z1vHMxiHlvlbBEZI4uT0C6ONlvf7E/iloDAMyx2DqMb5YzWBmjoN2eqDaG4XsSaTEgNz51k+evtpE55FtFicsIqxnBHAEs5KIP4knlTj7d7u9seyzRaJGokgg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BTo59aEK; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A6AA1C4CEE9;
	Wed, 26 Feb 2025 17:56:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740592602;
	bh=r21KX6IoVsqpRzbGx+/2lKf1vdGqvRlJ/pUOBg2BR9U=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=BTo59aEKbZ6s8ID/u0SHTa1EVqdR76cGTEKIwUkveO1UcnJo+QtS99AmKk94Rxzi/
	 YlWJjSk/7SOMNTNUDAfeE2ZDTUAQID2TO2i2H8DxIPvtVrYzapD9TtYNdC5rMoc7bS
	 u5xovCo2CqqpVkkCLtI4D+yIewwC8V+vxfsUWs6jsrVAKyQ0htGBGQnVEj/P1hpTKs
	 X5McBgWq2T9koOoHDa0qNI2nBWzPIIMaXSFLmijLMfC7b9R9Xf/89F9gmDH6nolX4c
	 oqVrQtIiUAJhV2XQxe5J1RobX0g+l8RfGvItrPt6hkz6rvxMHuVGQspkPtjcm7SjUS
	 4JNYKW+BJp9UQ==
From: Danilo Krummrich <dakr@kernel.org>
To: airlied@gmail.com,
	simona@ffwll.ch,
	corbet@lwn.net,
	maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	tzimmermann@suse.de,
	ajanulgu@redhat.com,
	lyude@redhat.com,
	pstanner@redhat.com,
	zhiw@nvidia.com,
	cjia@nvidia.com,
	jhubbard@nvidia.com,
	bskeggs@nvidia.com,
	acurrid@nvidia.com
Cc: ojeda@kernel.org,
	alex.gaynor@gmail.com,
	boqun.feng@gmail.com,
	gary@garyguo.net,
	bjorn3_gh@protonmail.com,
	benno.lossin@proton.me,
	a.hindborg@kernel.org,
	aliceryhl@google.com,
	tmgross@umich.edu,
	mcgrof@kernel.org,
	russ.weight@linux.dev,
	dri-devel@lists.freedesktop.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	nouveau@lists.freedesktop.org,
	rust-for-linux@vger.kernel.org,
	Danilo Krummrich <dakr@kernel.org>
Subject: [PATCH v4 6/6] gpu: nova-core: add initial documentation
Date: Wed, 26 Feb 2025 18:55:48 +0100
Message-ID: <20250226175552.29381-7-dakr@kernel.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250226175552.29381-1-dakr@kernel.org>
References: <20250226175552.29381-1-dakr@kernel.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add the initial documentation of the Nova project.

The initial project documentation consists out of a brief introduction
of the project, as well as project guidelines both general and nova-core
specific and a task list for nova-core specifically.

The task list is divided into tasks for general Rust infrastructure
required by the project, tasks regarding GSP enablement and firmware
abstraction, general GPU driver tasks as well as tasks related to
external API design and test infrastructure.

Signed-off-by: Danilo Krummrich <dakr@kernel.org>
---
 Documentation/gpu/drivers.rst              |   1 +
 Documentation/gpu/nova/core/guidelines.rst |  24 ++
 Documentation/gpu/nova/core/todo.rst       | 446 +++++++++++++++++++++
 Documentation/gpu/nova/guidelines.rst      |  69 ++++
 Documentation/gpu/nova/index.rst           |  30 ++
 MAINTAINERS                                |   1 +
 6 files changed, 571 insertions(+)
 create mode 100644 Documentation/gpu/nova/core/guidelines.rst
 create mode 100644 Documentation/gpu/nova/core/todo.rst
 create mode 100644 Documentation/gpu/nova/guidelines.rst
 create mode 100644 Documentation/gpu/nova/index.rst

diff --git a/Documentation/gpu/drivers.rst b/Documentation/gpu/drivers.rst
index 1f17ad0790d7..7c2c5dcb5fd4 100644
--- a/Documentation/gpu/drivers.rst
+++ b/Documentation/gpu/drivers.rst
@@ -24,6 +24,7 @@ GPU Driver Documentation
    panfrost
    panthor
    zynqmp
+   nova/index
 
 .. only::  subproject and html
 
diff --git a/Documentation/gpu/nova/core/guidelines.rst b/Documentation/gpu/nova/core/guidelines.rst
new file mode 100644
index 000000000000..a389d65d7982
--- /dev/null
+++ b/Documentation/gpu/nova/core/guidelines.rst
@@ -0,0 +1,24 @@
+.. SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+
+==========
+Guidelines
+==========
+
+This documents contains the guidelines for nova-core. Additionally, all common
+guidelines of the Nova project do apply.
+
+Driver API
+==========
+
+One main purpose of nova-core is to implement the abstraction around the
+firmware interface of GSP and provide a firmware (version) independent API for
+2nd level drivers, such as nova-drm or the vGPU manager VFIO driver.
+
+Therefore, it is not permitted to leak firmware (version) specifics, through the
+driver API, to 2nd level drivers.
+
+Acceptance Criteria
+===================
+
+- To the extend possible, patches submitted to nova-core must be tested for
+  regressions with all 2nd level drivers.
diff --git a/Documentation/gpu/nova/core/todo.rst b/Documentation/gpu/nova/core/todo.rst
new file mode 100644
index 000000000000..3e8d2125da9d
--- /dev/null
+++ b/Documentation/gpu/nova/core/todo.rst
@@ -0,0 +1,446 @@
+.. SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+
+=========
+Task List
+=========
+
+Tasks may have the following fields:
+
+- ``Complexity``: Describes the required familiarity with Rust and / or the
+  corresponding kernel APIs or subsystems. There are four different complexities,
+  ``Beginner``, ``Intermediate``, ``Advanced`` and ``Expert``.
+- ``Reference``: References to other tasks.
+- ``Link``: Links to external resources.
+- ``Contact``: The person that can be contacted for further information about
+  the task.
+
+Enablement (Rust)
+=================
+
+Tasks that are not directly related to nova-core, but are preconditions in terms
+of required APIs.
+
+FromPrimitive API
+-----------------
+
+Sometimes the need arises to convert a number to a value of an enum or a
+structure.
+
+A good example from nova-core would be the ``Chipset`` enum type, which defines
+the value ``AD102``. When probing the GPU the value ``0x192`` can be read from a
+certain register indication the chipset AD102. Hence, the enum value ``AD102``
+should be derived from the number ``0x192``. Currently, nova-core uses a custom
+implementation (``Chipset::from_u32`` for this.
+
+Instead, it would be desirable to have something like the ``FromPrimitive``
+trait [1] from the num crate.
+
+Having this generalization also helps with implementing a generic macro that
+automatically generates the corresponding mappings between a value and a number.
+
+| Complexity: Beginner
+| Link: https://docs.rs/num/latest/num/trait.FromPrimitive.html
+
+Generic register abstraction
+----------------------------
+
+Work out how register constants and structures can be automatically generated
+through generalized macros.
+
+Example:
+
+.. code-block:: rust
+
+	register!(BOOT0, 0x0, u32, pci::Bar<SIZE>, Fields [
+	   MINOR_REVISION(3:0, RO),
+	   MAJOR_REVISION(7:4, RO),
+	   REVISION(7:0, RO), // Virtual register combining major and minor rev.
+	])
+
+This could expand to something like:
+
+.. code-block:: rust
+
+	const BOOT0_OFFSET: usize = 0x00000000;
+	const BOOT0_MINOR_REVISION_SHIFT: u8 = 0;
+	const BOOT0_MINOR_REVISION_MASK: u32 = 0x0000000f;
+	const BOOT0_MAJOR_REVISION_SHIFT: u8 = 4;
+	const BOOT0_MAJOR_REVISION_MASK: u32 = 0x000000f0;
+	const BOOT0_REVISION_SHIFT: u8 = BOOT0_MINOR_REVISION_SHIFT;
+	const BOOT0_REVISION_MASK: u32 = BOOT0_MINOR_REVISION_MASK | BOOT0_MAJOR_REVISION_MASK;
+
+	struct Boot0(u32);
+
+	impl Boot0 {
+	   #[inline]
+	   fn read(bar: &RevocableGuard<'_, pci::Bar<SIZE>>) -> Self {
+	      Self(bar.readl(BOOT0_OFFSET))
+	   }
+
+	   #[inline]
+	   fn minor_revision(&self) -> u32 {
+	      (self.0 & BOOT0_MINOR_REVISION_MASK) >> BOOT0_MINOR_REVISION_SHIFT
+	   }
+
+	   #[inline]
+	   fn major_revision(&self) -> u32 {
+	      (self.0 & BOOT0_MAJOR_REVISION_MASK) >> BOOT0_MAJOR_REVISION_SHIFT
+	   }
+
+	   #[inline]
+	   fn revision(&self) -> u32 {
+	      (self.0 & BOOT0_REVISION_MASK) >> BOOT0_REVISION_SHIFT
+	   }
+	}
+
+Usage:
+
+.. code-block:: rust
+
+	let bar = bar.try_access().ok_or(ENXIO)?;
+
+	let boot0 = Boot0::read(&bar);
+	pr_info!("Revision: {}\n", boot0.revision());
+
+| Complexity: Advanced
+
+Delay / Sleep abstractions
+--------------------------
+
+Rust abstractions for the kernel's delay() and sleep() functions.
+
+There is some ongoing work from FUJITA Tomonori [1], which has not seen any updates
+since Oct. 24.
+
+| Complexity: Beginner
+| Link: https://lore.kernel.org/netdev/20241001112512.4861-2-fujita.tomonori@gmail.com/ [1]
+
+IRQ abstractions
+----------------
+
+Rust abstractions for IRQ handling.
+
+There is active ongoing work from Daniel Almeida [1] for the "core" abstractions
+to request IRQs.
+
+Besides optional review and testing work, the required ``pci::Device`` code
+around those core abstractions needs to be worked out.
+
+| Complexity: Intermediate
+| Link: https://lore.kernel.org/lkml/20250122163932.46697-1-daniel.almeida@collabora.com/ [1]
+| Contact: Daniel Almeida
+
+Page abstraction for foreign pages
+----------------------------------
+
+Rust abstractions for pages not created by the Rust page abstraction without
+direct ownership.
+
+There is active onging work from Abdiel Janulgue [1] and Lina [2].
+
+| Complexity: Advanced
+| Link: https://lore.kernel.org/linux-mm/20241119112408.779243-1-abdiel.janulgue@gmail.com/ [1]
+| Link: https://lore.kernel.org/rust-for-linux/20250202-rust-page-v1-0-e3170d7fe55e@asahilina.net/ [2]
+
+Scatterlist / sg_table abstractions
+-----------------------------------
+
+Rust abstractions for scatterlist / sg_table.
+
+There is preceding work from Abdiel Janulgue, which hasn't made it to the
+mailing list yet.
+
+| Complexity: Intermediate
+| Contact: Abdiel Janulgue
+
+ELF utils
+---------
+
+Rust implementation of ELF header representation to retrieve section header
+tables, names, and data from an ELF-formatted images.
+
+There is preceding work from Abdiel Janulgue, which hasn't made it to the
+mailing list yet.
+
+| Complexity: Beginner
+| Contact: Abdiel Janulgue
+
+PCI MISC APIs
+-------------
+
+Extend the existing PCI device / driver abstractions by SR-IOV, config space,
+capability, MSI API abstractions.
+
+| Complexity: Beginner
+
+Auxiliary bus abstractions
+--------------------------
+
+Rust abstraction for the auxiliary bus APIs.
+
+This is needed to connect nova-core to the nova-drm driver.
+
+| Complexity: Intermediate
+
+Debugfs abstractions
+--------------------
+
+Rust abstraction for debugfs APIs.
+
+| Reference: Export GSP log buffers
+| Complexity: Intermediate
+
+Vec extensions
+--------------
+
+Implement ``Vec::truncate`` and ``Vec::resize``.
+
+Currently this is used for some experimental code to parse the vBIOS.
+
+| Reference vBIOS support
+| Complexity: Beginner
+
+GPU (general)
+=============
+
+Parse firmware headers
+----------------------
+
+Parse ELF headers from the firmware files loaded from the filesystem.
+
+| Reference: ELF utils
+| Complexity: Beginner
+| Contact: Abdiel Janulgue
+
+Build radix3 page table
+-----------------------
+
+Build the radix3 page table to map the firmware.
+
+| Complexity: Intermediate
+| Contact: Abdiel Janulgue
+
+vBIOS support
+-------------
+
+Parse the vBIOS and probe the structures required for driver initialization.
+
+| Contact: Dave Airlie
+| Reference: Vec extensions
+| Complexity: Intermediate
+
+Initial Devinit support
+-----------------------
+
+Implement BIOS Device Initialization, i.e. memory sizing, waiting, PLL
+configuration.
+
+| Contact: Dave Airlie
+| Complexity: Beginner
+
+Boot Falcon controller
+----------------------
+
+Infrastructure to load and execute falcon (sec2) firmware images; handle the
+GSP falcon processor and fwsec loading.
+
+| Complexity: Advanced
+| Contact: Dave Airlie
+
+GPU Timer support
+-----------------
+
+Support for the GPU's internal timer peripheral.
+
+| Complexity: Beginner
+| Contact: Dave Airlie
+
+MMU / PT management
+-------------------
+
+Work out the architecture for MMU / page table management.
+
+We need to consider that nova-drm will need rather fine-grained control,
+especially in terms of locking, in order to be able to implement asynchronous
+Vulkan queues.
+
+While generally sharing the corresponding code is desirable, it needs to be
+evaluated how (and if at all) sharing the corresponding code is expedient.
+
+| Complexity: Expert
+
+VRAM memory allocator
+---------------------
+
+Investigate options for a VRAM memory allocator.
+
+Some possible options:
+  - Rust abstractions for
+    - RB tree (interval tree) / drm_mm
+    - maple_tree
+  - native Rust collections
+
+| Complexity: Advanced
+
+Instance Memory
+---------------
+
+Implement support for instmem (bar2) used to store page tables.
+
+| Complexity: Intermediate
+| Contact: Dave Airlie
+
+GPU System Processor (GSP)
+==========================
+
+Export GSP log buffers
+----------------------
+
+Recent patches from Timur Tabi [1] added support to expose GSP-RM log buffers
+(even after failure to probe the driver) through debugfs.
+
+This is also an interesting feature for nova-core, especially in the early days.
+
+| Link: https://lore.kernel.org/nouveau/20241030202952.694055-2-ttabi@nvidia.com/ [1]
+| Reference: Debugfs abstractions
+| Complexity: Intermediate
+
+GSP firmware abstraction
+------------------------
+
+The GSP-RM firmware API is unstable and may incompatibly change from version to
+version, in terms of data structures and semantics.
+
+This problem is one of the big motivations for using Rust for nova-core, since
+it turns out that Rust's procedural macro feature provides a rather elegant way
+to address this issue:
+
+1. generate Rust structures from the C headers in a separate namespace per version
+2. build abstraction structures (within a generic namespace) that implement the
+   firmware interfaces; annotate the differences in implementation with version
+   identifiers
+3. use a procedural macro to generate the actual per version implementation out
+   of this abstraction
+4. instantiate the correct version type one on runtime (can be sure that all
+   have the same interface because it's defined by a common trait)
+
+There is a PoC implementation of this pattern, in the context of the nova-core
+PoC driver.
+
+This task aims at refining the feature and ideally generalize it, to be usable
+by other drivers as well.
+
+| Complexity: Expert
+
+GSP message queue
+-----------------
+
+Implement low level GSP message queue (command, status) for communication
+between the kernel driver and GSP.
+
+| Complexity: Advanced
+| Contact: Dave Airlie
+
+Bootstrap GSP
+-------------
+
+Call the boot firmware to boot the GSP processor; execute initial control
+messages.
+
+| Complexity: Intermediate
+| Contact: Dave Airlie
+
+Client / Device APIs
+--------------------
+
+Implement the GSP message interface for client / device allocation and the
+corresponding client and device allocation APIs.
+
+| Complexity: Intermediate
+| Contact: Dave Airlie
+
+Bar PDE handling
+----------------
+
+Synchronize page table handling for BARs between the kernel driver and GSP.
+
+| Complexity: Beginner
+| Contact: Dave Airlie
+
+FIFO engine
+-----------
+
+Implement support for the FIFO engine, i.e. the corresponding GSP message
+interface and provide an API for chid allocation and channel handling.
+
+| Complexity: Advanced
+| Contact: Dave Airlie
+
+GR engine
+---------
+
+Implement support for the graphics engine, i.e. the corresponding GSP message
+interface and provide an API for (golden) context creation and promotion.
+
+| Complexity: Advanced
+| Contact: Dave Airlie
+
+CE engine
+---------
+
+Implement support for the copy engine, i.e. the corresponding GSP message
+interface.
+
+| Complexity: Intermediate
+| Contact: Dave Airlie
+
+VFN IRQ controller
+------------------
+
+Support for the VFN interrupt controller.
+
+| Complexity: Intermediate
+| Contact: Dave Airlie
+
+External APIs
+=============
+
+nova-core base API
+------------------
+
+Work out the common pieces of the API to connect 2nd level drivers, i.e. vGPU
+manager and nova-drm.
+
+| Complexity: Advanced
+
+vGPU manager API
+----------------
+
+Work out the API parts required by the vGPU manager, which are not covered by
+the base API.
+
+| Complexity: Advanced
+
+nova-core C API
+---------------
+
+Implement a C wrapper for the APIs required by the vGPU manager driver.
+
+| Complexity: Intermediate
+
+Testing
+=======
+
+CI pipeline
+-----------
+
+Investigate option for continuous integration testing.
+
+This can go from as simple as running KUnit tests over running (graphics) CTS to
+booting up (multiple) guest VMs to test VFIO use-cases.
+
+It might also be worth to consider the introduction of a new test suite directly
+sitting on top of the uAPI for more targeted testing and debugging. There may be
+options for collaboration / shared code with the Mesa project.
+
+| Complexity: Advanced
diff --git a/Documentation/gpu/nova/guidelines.rst b/Documentation/gpu/nova/guidelines.rst
new file mode 100644
index 000000000000..13ab13984a18
--- /dev/null
+++ b/Documentation/gpu/nova/guidelines.rst
@@ -0,0 +1,69 @@
+.. SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+
+==========
+Guidelines
+==========
+
+This document describes the general project guidelines that apply to nova-core
+and nova-drm.
+
+Language
+========
+
+The Nova project uses the Rust programming language. In this context, all rules
+of the Rust for Linux project as documented in
+:doc:`../../rust/general-information` apply. Additionally, the following rules
+apply.
+
+- Unless technically necessary otherwise (e.g. uAPI), any driver code is written
+  in Rust.
+
+- Unless technically necessary, unsafe Rust code must be avoided. In case of
+  technical necessity, unsafe code should be isolated in a separate component
+  providing a safe API for other driver code to use.
+
+Style
+-----
+
+All rules of the Rust for Linux project as documented in
+:doc:`../../rust/coding-guidelines` apply.
+
+For a submit checklist, please also see the `Rust for Linux Submit checklist
+addendum <https://rust-for-linux.com/contributing#submit-checklist-addendum>`_.
+
+Documentation
+=============
+
+The availability of proper documentation is essential in terms of scalability,
+accessibility for new contributors and maintainability of a project in general,
+but especially for a driver running as complex hardware as Nova is targeting.
+
+Hence, adding documentation of any kind is very much encouraged by the project.
+
+Besides that, there are some minimum requirements.
+
+- Every non-private structure needs at least a brief doc comment explaining the
+  semantical sense of the structure, as well as potential locking and lifetime
+  requirements. It is encouraged to have the same minimum documentation for
+  non-trivial private structures.
+
+- uAPIs must be fully documented with kernel-doc comments; additionally, the
+  semantical behavior must be explained including potential special or corner
+  cases.
+
+- The APIs connecting the 1st level driver (nova-core) with 2nd level drivers
+  must be fully documented. This includes doc comments, potential locking and
+  lifetime requirements, as well as example code if applicable.
+
+- Abbreviations must be explained when introduced; terminology must be uniquely
+  defined.
+
+- Register addresses, layouts, shift values and masks must be defined properly;
+  unless obvious, the semantical sense must be documented. This only applies if
+  the author is able to obtain the corresponding information.
+
+Acceptance Criteria
+===================
+
+- Patches must only be applied if reviewed by at least one other person on the
+  mailing list; this also applies for maintainers.
diff --git a/Documentation/gpu/nova/index.rst b/Documentation/gpu/nova/index.rst
new file mode 100644
index 000000000000..2701b3f4af35
--- /dev/null
+++ b/Documentation/gpu/nova/index.rst
@@ -0,0 +1,30 @@
+.. SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+
+=======================
+nova NVIDIA GPU drivers
+=======================
+
+The nova driver project consists out of two separate drivers nova-core and
+nova-drm and intends to supersede the nouveau driver for NVIDIA GPUs based on
+the GPU System Processor (GSP).
+
+The following documents apply to both nova-core and nova-drm.
+
+.. toctree::
+   :titlesonly:
+
+   guidelines
+
+nova-core
+=========
+
+The nova-core driver is the core driver for NVIDIA GPUs based on GSP. nova-core,
+as the 1st level driver, provides an abstraction around the GPUs hard- and
+firmware interfaces providing a common base for 2nd level drivers, such as the
+vGPU manager VFIO driver and the nova-drm driver.
+
+.. toctree::
+   :titlesonly:
+
+   core/guidelines
+   core/todo
diff --git a/MAINTAINERS b/MAINTAINERS
index 3c8a3b61af38..32300118b9a3 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -7446,6 +7446,7 @@ Q:	https://patchwork.freedesktop.org/project/nouveau/
 B:	https://gitlab.freedesktop.org/drm/nova/-/issues
 C:	irc://irc.oftc.net/nouveau
 T:	git https://gitlab.freedesktop.org/drm/nova.git nova-next
+F:	Documentation/gpu/nova/
 F:	drivers/gpu/nova-core/
 
 DRM DRIVER FOR OLIMEX LCD-OLINUXINO PANELS
-- 
2.48.1


