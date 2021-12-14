Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0BF9547388C
	for <lists+linux-doc@lfdr.de>; Tue, 14 Dec 2021 00:30:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242128AbhLMXai (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Mon, 13 Dec 2021 18:30:38 -0500
Received: from smtp5-g21.free.fr ([212.27.42.5]:16900 "EHLO smtp5-g21.free.fr"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S242230AbhLMXah (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Mon, 13 Dec 2021 18:30:37 -0500
Received: from localhost.localdomain (unknown [88.120.44.86])
        by smtp5-g21.free.fr (Postfix) with ESMTP id 93F425FF6C;
        Tue, 14 Dec 2021 00:30:36 +0100 (CET)
From:   Yann Dirson <ydirson@free.fr>
To:     amd-gfx@lists.freedesktop.org
Cc:     Alex Deucher <alexander.deucher@amd.com>,
        Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
        linux-doc@vger.kernel.org, Yann Dirson <ydirson@free.fr>,
        Harry Wentland <harry.wentland@amd.com>
Subject: [PATCH v3 1/4] Documentation/gpu: include description of AMDGPU hardware structure
Date:   Tue, 14 Dec 2021 00:30:27 +0100
Message-Id: <20211213233030.6719-2-ydirson@free.fr>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211213233030.6719-1-ydirson@free.fr>
References: <20211213233030.6719-1-ydirson@free.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

This describes in broad lines the how an AMD GPU is organized, in
terms of hardware blocks.

This is Alex' description from the "gpu block diagram" thread, edited to
fit as ReST.

Original text: https://www.spinics.net/lists/amd-gfx/msg71543.html

Originally-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Yann Dirson <ydirson@free.fr>
Acked-by: Harry Wentland <harry.wentland@amd.com>
Reviewed-by: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
---
 Documentation/gpu/amdgpu/display/index.rst |  2 +
 Documentation/gpu/amdgpu/driver-core.rst   | 82 ++++++++++++++++++++++
 2 files changed, 84 insertions(+)

diff --git a/Documentation/gpu/amdgpu/display/index.rst b/Documentation/gpu/amdgpu/display/index.rst
index e23c752ee5f5..c1fb2fb3c710 100644
--- a/Documentation/gpu/amdgpu/display/index.rst
+++ b/Documentation/gpu/amdgpu/display/index.rst
@@ -1,3 +1,5 @@
+.. _amdgpu-display-core:
+
 ===================================
 drm/amd/display - Display Core (DC)
 ===================================
diff --git a/Documentation/gpu/amdgpu/driver-core.rst b/Documentation/gpu/amdgpu/driver-core.rst
index 97f9a9b68924..a4aaf7088220 100644
--- a/Documentation/gpu/amdgpu/driver-core.rst
+++ b/Documentation/gpu/amdgpu/driver-core.rst
@@ -2,6 +2,88 @@
  Core Driver Infrastructure
 ============================
 
+GPU Hardware Structure
+======================
+
+Each ASIC is a collection of hardware blocks.  We refer to them as
+"IPs" (Intellectual Property blocks).  Each IP encapsulates certain
+functionality. IPs are versioned and can also be mixed and matched.
+E.g., you might have two different ASICs that both have System DMA (SDMA) 5.x IPs.
+The driver is arranged by IPs.  There are driver components to handle
+the initialization and operation of each IP.  There are also a bunch
+of smaller IPs that don't really need much if any driver interaction.
+Those end up getting lumped into the common stuff in the soc files.
+The soc files (e.g., vi.c, soc15.c nv.c) contain code for aspects of
+the SoC itself rather than specific IPs.  E.g., things like GPU resets
+and register access functions are SoC dependent.
+
+An APU contains more than just CPU and GPU, it also contains all of
+the platform stuff (audio, usb, gpio, etc.).  Also, a lot of
+components are shared between the CPU, platform, and the GPU (e.g.,
+SMU, PSP, etc.).  Specific components (CPU, GPU, etc.) usually have
+their interface to interact with those common components.  For things
+like S0i3 there is a ton of coordination required across all the
+components, but that is probably a bit beyond the scope of this
+section.
+
+With respect to the GPU, we have the following major IPs:
+
+GMC (Graphics Memory Controller)
+    This was a dedicated IP on older pre-vega chips, but has since
+    become somewhat decentralized on vega and newer chips.  They now
+    have dedicated memory hubs for specific IPs or groups of IPs.  We
+    still treat it as a single component in the driver however since
+    the programming model is still pretty similar.  This is how the
+    different IPs on the GPU get the memory (VRAM or system memory).
+    It also provides the support for per process GPU virtual address
+    spaces.
+
+IH (Interrupt Handler)
+    This is the interrupt controller on the GPU.  All of the IPs feed
+    their interrupts into this IP and it aggregates them into a set of
+    ring buffers that the driver can parse to handle interrupts from
+    different IPs.
+
+PSP (Platform Security Processor)
+    This handles security policy for the SoC and executes trusted
+    applications, and validates and loads firmwares for other blocks.
+
+SMU (System Management Unit)
+    This is the power management microcontroller.  It manages the entire
+    SoC.  The driver interacts with it to control power management
+    features like clocks, voltages, power rails, etc.
+
+DCN (Display Controller Next)
+    This is the display controller.  It handles the display hardware.
+    It is described in more details in :ref:`Display Core <amdgpu-display-core>`.
+
+SDMA (System DMA)
+    This is a multi-purpose DMA engine.  The kernel driver uses it for
+    various things including paging and GPU page table updates.  It's also
+    exposed to userspace for use by user mode drivers (OpenGL, Vulkan,
+    etc.)
+
+GC (Graphics and Compute)
+    This is the graphics and compute engine, i.e., the block that
+    encompasses the 3D pipeline and and shader blocks.  This is by far the
+    largest block on the GPU.  The 3D pipeline has tons of sub-blocks.  In
+    addition to that, it also contains the CP microcontrollers (ME, PFP,
+    CE, MEC) and the RLC microcontroller.  It's exposed to userspace for
+    user mode drivers (OpenGL, Vulkan, OpenCL, etc.)
+
+VCN (Video Core Next)
+    This is the multi-media engine.  It handles video and image encode and
+    decode.  It's exposed to userspace for user mode drivers (VA-API,
+    OpenMAX, etc.)
+
+Driver Structure
+================
+
+In general, the driver has a list of all of the IPs on a particular
+SoC and for things like init/fini/suspend/resume, more or less just
+walks the list and handles each IP.
+
+
 .. _amdgpu_memory_domains:
 
 Memory Domains
-- 
2.31.1

