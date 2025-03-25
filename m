Return-Path: <linux-doc+bounces-41702-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BDFCA7082D
	for <lists+linux-doc@lfdr.de>; Tue, 25 Mar 2025 18:27:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 60F7D3AE865
	for <lists+linux-doc@lfdr.de>; Tue, 25 Mar 2025 17:26:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 892CF19D090;
	Tue, 25 Mar 2025 17:26:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b="CBYhj6s7"
X-Original-To: linux-doc@vger.kernel.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 759B71F463F
	for <linux-doc@vger.kernel.org>; Tue, 25 Mar 2025 17:26:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.60.130.6
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742923618; cv=none; b=GqitgnRhkZD0016kNlNlHdvoQg5uOffv+GWb9riA9nlPwBSTETYQ7GzmCeeXELGKz0U4veBLQC2EggX96epyU4Eunp4WCBJo6/RgHxgFMnwGi3UO7wVCuoNKLA0ekMgf+dn8D5H4nVVm8saaYHxsL201Qzm/CjtkdkAAAocSjJU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742923618; c=relaxed/simple;
	bh=jwBi2Ybj2Acfpz6w5Tkui/w9V8n/b21g7xdSL2LmdXM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gXBtQ3u5tOiRGSSUr1p/dzI1Kqipa7t22rUFrjm4CzrSYDi1kavAuw0TwWvwQhxDxWLsXwwcdyN2qqvZa3gXmT0sRbH4ruBBreytkpEyN8Mq58vaNfeeZFQ3QCqg4d5OAMfkQOMfY9RTcNK/5Q8wn84AlGt5b69umCCISXEnI9k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com; spf=pass smtp.mailfrom=igalia.com; dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b=CBYhj6s7; arc=none smtp.client-ip=178.60.130.6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=igalia.com
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=VnOkLsAiUMEoLg7vsBD+0HH1xVAY4mwIwSb5iiZN4hU=; b=CBYhj6s7XAGpZi5d5K3DpLZxX+
	OYNhvs+PuEYFllUpleg8E6gk4qeaoD+vIeoMCkilcN7ysqoaYkKPyGie7byJQG07c8z5SaJwT6lm3
	Ee+dFdpcSSq3Q1o5k1hmtswSKnpQjg1PFRMbVnqoaRW/j/N36lgRC15cEE4KnpLEuqFZoYIvCVnsF
	a3ZXP5uSNouLwi5fe6Hm0botBquW9jPeIdEcRjcwLXymqpA35tvecHTQU7I1VkEu3Lz9qN1c8hNhw
	UCApOTHfciERqKPXrUJb1BxovDbCwx5n4FFK/XxVgcmyvLy9DF+lV2Wa2l13lOMGSN4XG/WqjMQKu
	I+jLPElw==;
Received: from d162-157-58-14.abhsia.telus.net ([162.157.58.14] helo=maloca.lan)
	by fanzine2.igalia.com with esmtpsa 
	(Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
	id 1tx839-006FdA-6I; Tue, 25 Mar 2025 18:26:51 +0100
From: Rodrigo Siqueira <siqueira@igalia.com>
To: Alex Deucher <alexander.deucher@amd.com>,
	=?UTF-8?q?=27Christian=20K=C3=B6nig=27?= <christian.koenig@amd.com>,
	Mario Limonciello <mario.limonciello@amd.com>,
	Melissa Wen <mwen@igalia.com>,
	=?UTF-8?q?=27Andr=C3=A9=20Almeida=27?= <andrealmeid@igalia.com>,
	=?UTF-8?q?=27Timur=20Krist=C3=B3f=27?= <timur.kristof@gmail.com>
Cc: amd-gfx@lists.freedesktop.org,
	linux-doc@vger.kernel.org,
	kernel-dev@igalia.com,
	Rodrigo Siqueira <siqueira@igalia.com>
Subject: [PATCH 5/6] Documentation/gpu: Create a GC entry in the amdgpu documentation
Date: Tue, 25 Mar 2025 11:18:46 -0600
Message-ID: <20250325172623.225901-6-siqueira@igalia.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250325172623.225901-1-siqueira@igalia.com>
References: <20250325172623.225901-1-siqueira@igalia.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

GC is a large block that plays a vital role for amdgpu; for this reason,
this commit creates one specific page for GC and adds extra information
about the CP component.

Signed-off-by: Rodrigo Siqueira <siqueira@igalia.com>
---
 Documentation/gpu/amdgpu/driver-core.rst | 30 ++-------------
 Documentation/gpu/amdgpu/gc/index.rst    | 48 ++++++++++++++++++++++++
 Documentation/gpu/amdgpu/index.rst       |  1 +
 3 files changed, 53 insertions(+), 26 deletions(-)
 create mode 100644 Documentation/gpu/amdgpu/gc/index.rst

diff --git a/Documentation/gpu/amdgpu/driver-core.rst b/Documentation/gpu/amdgpu/driver-core.rst
index 746fd081876f..2af1e919d76a 100644
--- a/Documentation/gpu/amdgpu/driver-core.rst
+++ b/Documentation/gpu/amdgpu/driver-core.rst
@@ -67,38 +67,16 @@ GC (Graphics and Compute)
     This is the graphics and compute engine, i.e., the block that
     encompasses the 3D pipeline and and shader blocks.  This is by far the
     largest block on the GPU.  The 3D pipeline has tons of sub-blocks.  In
-    addition to that, it also contains the CP microcontrollers (ME, PFP,
-    CE, MEC) and the RLC microcontroller.  It's exposed to userspace for
-    user mode drivers (OpenGL, Vulkan, OpenCL, etc.)
+    addition to that, it also contains the CP microcontrollers (ME, PFP, CE,
+    MEC) and the RLC microcontroller.  It's exposed to userspace for user mode
+    drivers (OpenGL, Vulkan, OpenCL, etc.). More details in :ref:`Graphics (GFX)
+    and Compute <amdgpu-gc>`.
 
 VCN (Video Core Next)
     This is the multi-media engine.  It handles video and image encode and
     decode.  It's exposed to userspace for user mode drivers (VA-API,
     OpenMAX, etc.)
 
-Graphics and Compute Microcontrollers
--------------------------------------
-
-CP (Command Processor)
-    The name for the hardware block that encompasses the front end of the
-    GFX/Compute pipeline.  Consists mainly of a bunch of microcontrollers
-    (PFP, ME, CE, MEC).  The firmware that runs on these microcontrollers
-    provides the driver interface to interact with the GFX/Compute engine.
-
-    MEC (MicroEngine Compute)
-        This is the microcontroller that controls the compute queues on the
-        GFX/compute engine.
-
-    MES (MicroEngine Scheduler)
-        This is a new engine for managing queues.  This is currently unused.
-
-RLC (RunList Controller)
-    This is another microcontroller in the GFX/Compute engine.  It handles
-    power management related functionality within the GFX/Compute engine.
-    The name is a vestige of old hardware where it was originally added
-    and doesn't really have much relation to what the engine does now.
-
-
 GFX, Compute, and SDMA Overall Behavior
 =======================================
 
diff --git a/Documentation/gpu/amdgpu/gc/index.rst b/Documentation/gpu/amdgpu/gc/index.rst
new file mode 100644
index 000000000000..f8128cca7028
--- /dev/null
+++ b/Documentation/gpu/amdgpu/gc/index.rst
@@ -0,0 +1,48 @@
+.. _amdgpu-gc:
+
+========================================
+ drm/amdgpu - Graphics and Compute (GC)
+========================================
+
+The relationship between the CPU and GPU can be described as the
+producer-consumer problem, where the CPU fills out a buffer with operations
+(producer) to be executed by the GPU (consumer). The requested operations in
+the buffer are called Command Packets, which can be summarized as a compressed
+way of transmitting command information to the graphics controller.
+
+The component that acts as the front end between the CPU and the GPU is called
+the Command Processor (CP). This component is responsible for providing greater
+flexibility to the GC since CP makes it possible to program various aspects of
+the GPU pipeline. CP also coordinates the communication between the CPU and GPU
+via a mechanism named **Ring Buffers**, where the CPU appends information to
+the buffer while the GPU removes operations. It is relevant to highlight that a
+CPU can add a pointer to the Ring Buffer that points to another region of
+memory outside the Ring Buffer, and CP can handle it; this mechanism is called
+**Indirect Buffer (IB)**. CP receives and parses the Command Streams (CS), and
+according to the parser result, the CP writes the request for operations in the
+correct block.
+
+Graphics (GFX) and Compute Microcontrollers
+-------------------------------------------
+
+GC is a large block, and as a result, it has multiple firmware associated with
+it. Some of them are:
+
+CP (Command Processor)
+    The name for the hardware block that encompasses the front end of the
+    GFX/Compute pipeline. Consists mainly of a bunch of microcontrollers
+    (PFP, ME, CE, MEC). The firmware that runs on these microcontrollers
+    provides the driver interface to interact with the GFX/Compute engine.
+
+    MEC (MicroEngine Compute)
+        This is the microcontroller that controls the compute queues on the
+        GFX/compute engine.
+
+    MES (MicroEngine Scheduler)
+        This is the engine for managing queues.
+
+RLC (RunList Controller)
+    This is another microcontroller in the GFX/Compute engine. It handles
+    power management related functionality within the GFX/Compute engine.
+    The name is a vestige of old hardware where it was originally added
+    and doesn't really have much relation to what the engine does now.
diff --git a/Documentation/gpu/amdgpu/index.rst b/Documentation/gpu/amdgpu/index.rst
index 7e9d60754287..1624f4b588c5 100644
--- a/Documentation/gpu/amdgpu/index.rst
+++ b/Documentation/gpu/amdgpu/index.rst
@@ -10,6 +10,7 @@ Next (GCN), Radeon DNA (RDNA), and Compute DNA (CDNA) architectures.
    driver-core
    amd-hardware-list-info
    module-parameters
+   gc/index
    display/index
    flashing
    xgmi
-- 
2.49.0


