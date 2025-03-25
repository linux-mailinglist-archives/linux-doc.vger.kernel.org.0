Return-Path: <linux-doc+bounces-41703-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CBBEA7082E
	for <lists+linux-doc@lfdr.de>; Tue, 25 Mar 2025 18:27:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 87D5C3AE8ED
	for <lists+linux-doc@lfdr.de>; Tue, 25 Mar 2025 17:26:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DB03125DD07;
	Tue, 25 Mar 2025 17:27:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b="O4pLm4R4"
X-Original-To: linux-doc@vger.kernel.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75A1C25A351
	for <linux-doc@vger.kernel.org>; Tue, 25 Mar 2025 17:26:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.60.130.6
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742923620; cv=none; b=T6tw8Lpk4hsJ+AeATlXNB3cO0iia2cCqKiUdGoI6rc2YVvYxaBgfy4u6VknPqwWkjgBhwjVzTCokSxgCmi4bFZbq+54T/4lLKoMluqz5qwUENxQf8KJXfvP3J/Hql1qehqfltQ1FbaV8brHCkjbs8NdvPLmsCryg5G2WGBTk+3U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742923620; c=relaxed/simple;
	bh=b2aBzzLxpHt/gnVDJZnbP1SWDZz9Ly4w4qcrnI6yVpI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=L5afHlQb0d/BRL4HB3q7br2Drx5OyCGfrW9QBpDtep4zOMk5JRGvnDpBG0xg/L1m29oY25mQu9LvZFsdRTVH9uI/4qzInhjUqQFgmtqnqxmtlcIBPGfv0IluVGvneoyY4BpXrywJP2h6wrxk3Mb4BE/SrN1Cr44LK3ulTNk3fCk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com; spf=pass smtp.mailfrom=igalia.com; dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b=O4pLm4R4; arc=none smtp.client-ip=178.60.130.6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=igalia.com
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:
	In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=28ZIdDaGbYZsj/p3RS/MiDMYepWcJ8gkccNg9leDMlM=; b=O4pLm4R4sQpiR98xQA4yy9w48G
	DDx1jvCEn6yzpYE4G7izt3blj8ITgnvq50w29kb/YWFewYbUXNcSWfZe+Asak2kyiyTgSZPln7/xA
	daL1orvyA43NZdupYIDsUHybmP4ONgtw0sGnuKBcibMzxY/7qC9rTBRHHX0J/P42DWrkTtiPRzI7D
	6/8BwfIY4M/VdE2pdjrbv3UDbmAaZbLGnUxJ7HlDPvDFHp0ILj5B0XGeelXrG86jLjAfOSE/69f7n
	u/aYui8Nv2ordNGqc1FYtlgS9/x+zhPVhAX6Jg1LkzyrjvQWl910JFj2DI4tm7d19144N5AWM+uU0
	HAHjhpog==;
Received: from d162-157-58-14.abhsia.telus.net ([162.157.58.14] helo=maloca.lan)
	by fanzine2.igalia.com with esmtpsa 
	(Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
	id 1tx836-006FdA-Hu; Tue, 25 Mar 2025 18:26:49 +0100
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
Subject: [PATCH 4/6] Documentation/gpu: Add explanation about AMD Pipes and Queues
Date: Tue, 25 Mar 2025 11:18:45 -0600
Message-ID: <20250325172623.225901-5-siqueira@igalia.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250325172623.225901-1-siqueira@igalia.com>
References: <20250325172623.225901-1-siqueira@igalia.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Pipes and Queues are two common vocabulary that pervades discussions
around amdgpu core features. The definition and explanation of those
components are spread around multiple places in the code, mailing list,
and Gitlab, which sometimes leads to the wrong interpretation of these
concepts. This commit attempts to centralize the definition and
explanation of Pipe and Queue from amdgpu perspective in a kernel doc.
Most of the information in this doc was derived from:

- https://lore.kernel.org/amd-gfx/CADnq5_Pcz2x4aJzKbVrN3jsZhD6sTydtDw=6PaN4O3m4t+Grtg@mail.gmail.com/T/#m9a670b55ab20e0f7c46c80f802a0a4be255a719d
- https://gitlab.freedesktop.org/mesa/mesa/-/issues/11759

Signed-off-by: Rodrigo Siqueira <siqueira@igalia.com>
---
 Documentation/gpu/amdgpu/driver-core.rst      |   49 +
 .../gpu/amdgpu/pipe_and_queue_abstraction.svg | 1279 +++++++++++++++++
 2 files changed, 1328 insertions(+)
 create mode 100644 Documentation/gpu/amdgpu/pipe_and_queue_abstraction.svg

diff --git a/Documentation/gpu/amdgpu/driver-core.rst b/Documentation/gpu/amdgpu/driver-core.rst
index 32723a925377..746fd081876f 100644
--- a/Documentation/gpu/amdgpu/driver-core.rst
+++ b/Documentation/gpu/amdgpu/driver-core.rst
@@ -98,6 +98,55 @@ RLC (RunList Controller)
     The name is a vestige of old hardware where it was originally added
     and doesn't really have much relation to what the engine does now.
 
+
+GFX, Compute, and SDMA Overall Behavior
+=======================================
+
+.. note:: For simplicity, whenever the term block is used in this section, it
+   means GFX, Compute, and SDMA.
+
+GFX, Compute and SDMA share a similar form of operation that can be abstracted
+to facilitate understanding of the behavior of these blocks. See the figure
+below illustrating the common components of these blocks:
+
+.. kernel-figure:: pipe_and_queue_abstraction.svg
+
+In the central part of this figure, you can see two elements, one called
+**Pipe** and another named **Queues**; it is important to highlight that Queues
+must be associated with a Pipe and vice-versa. Every specific hardware may have
+a different number of Pipes and, in turn, a different number of Queues; for
+example, GFX 11 has two Pipes and two Queues per Pipe.
+
+Pipe is the hardware that processes the instructions available in the Queues;
+in other words, it is a thread executing the operations inserted in the Queue.
+One crucial characteristic of Pipes is that they can only execute one Queue at
+a time; no matter if the hardware has multiple Queues in the Pipe, it only runs
+one Queue per Pipe. When a queue is running in the Pipe, it is said that the
+Queue is **Active**.
+
+Pipes have the mechanics of swapping between queues at the hardware level.
+Nonetheless, they only make use of Queues that are considered mapped. Pipes can
+switch between queues based on any of the following inputs:
+
+1. Command Stream;
+2. Packet by Packet;
+3. Other hardware requests the change (e.g., MES).
+
+Queues within Pipes are defined by the Hardware Queue Descriptors (HQD).
+Associated with the HQD concept, we have the Memory Queue Descriptor (MQD),
+which is responsible for storing information about the state of each of the
+available Queues in the memory. The state of a Queue contains information such
+as the GPU virtual address of the queue itself, save areas, doorbell, etc. The
+MQD also stores the HQD registers, which are vital for activating or
+deactivating a given Queue.
+
+The Queue-switching process can also happen with the firmware requesting the
+preemption or unmapping of a Queue. The firmware waits for the HQD_ACTIVE bit
+to change to low before saving the state into the MQD. To make a different
+Queue become active, the firmware copies the MQD state into the HQD registers
+and loads any additional state. Finally, it sets the HQD_ACTIVE bit to high to
+indicate that the queue is active.
+
 Driver Structure
 ================
 
diff --git a/Documentation/gpu/amdgpu/pipe_and_queue_abstraction.svg b/Documentation/gpu/amdgpu/pipe_and_queue_abstraction.svg
new file mode 100644
index 000000000000..0df3c6b3000b
--- /dev/null
+++ b/Documentation/gpu/amdgpu/pipe_and_queue_abstraction.svg
@@ -0,0 +1,1279 @@
+<?xml version="1.0" encoding="UTF-8" standalone="no"?>
+<!-- Created with Inkscape (http://www.inkscape.org/) -->
+
+<svg
+   width="395.47891mm"
+   height="234.73715mm"
+   viewBox="0 0 395.47891 234.73714"
+   version="1.1"
+   id="svg1"
+   inkscape:version="1.4 (e7c3feb100, 2024-10-09)"
+   sodipodi:docname="pipe_and_queue_abstraction.svg"
+   xmlns:inkscape="http://www.inkscape.org/namespaces/inkscape"
+   xmlns:sodipodi="http://sodipodi.sourceforge.net/DTD/sodipodi-0.dtd"
+   xmlns="http://www.w3.org/2000/svg"
+   xmlns:svg="http://www.w3.org/2000/svg">
+  <sodipodi:namedview
+     id="namedview1"
+     pagecolor="#ffffff"
+     bordercolor="#000000"
+     borderopacity="0.25"
+     inkscape:showpageshadow="2"
+     inkscape:pageopacity="0.0"
+     inkscape:pagecheckerboard="0"
+     inkscape:deskcolor="#d1d1d1"
+     inkscape:document-units="mm"
+     inkscape:zoom="1.6489689"
+     inkscape:cx="713.17296"
+     inkscape:cy="466.65527"
+     inkscape:window-width="3840"
+     inkscape:window-height="2083"
+     inkscape:window-x="0"
+     inkscape:window-y="0"
+     inkscape:window-maximized="1"
+     inkscape:current-layer="layer1" />
+  <defs
+     id="defs1">
+    <marker
+       style="overflow:visible"
+       id="Dot"
+       refX="0"
+       refY="0"
+       orient="auto"
+       inkscape:stockid="Dot"
+       markerWidth="1"
+       markerHeight="1"
+       viewBox="0 0 1 1"
+       inkscape:isstock="true"
+       inkscape:collect="always"
+       preserveAspectRatio="xMidYMid">
+      <path
+         transform="scale(0.5)"
+         style="fill:context-stroke;fill-rule:evenodd;stroke:none"
+         d="M 5,0 C 5,2.76 2.76,5 0,5 -2.76,5 -5,2.76 -5,0 c 0,-2.76 2.3,-5 5,-5 2.76,0 5,2.24 5,5 z"
+         sodipodi:nodetypes="sssss"
+         id="path110" />
+    </marker>
+    <marker
+       style="overflow:visible"
+       id="marker109"
+       refX="0"
+       refY="0"
+       orient="auto-start-reverse"
+       inkscape:stockid="Stylized triangle arrow"
+       markerWidth="1"
+       markerHeight="1"
+       viewBox="0 0 1 1"
+       inkscape:isstock="true"
+       inkscape:collect="always"
+       preserveAspectRatio="xMidYMid">
+      <path
+         transform="scale(0.5)"
+         style="fill:context-stroke;fill-rule:evenodd;stroke:context-stroke;stroke-width:1pt"
+         d="m 6,0 c -3,1 -7,3 -9,5 0,0 0,-4 2,-5 -2,-1 -2,-5 -2,-5 2,2 6,4 9,5 z"
+         id="path109" />
+    </marker>
+    <marker
+       style="overflow:visible"
+       id="ArrowTriangleStylized"
+       refX="0"
+       refY="0"
+       orient="auto-start-reverse"
+       inkscape:stockid="Stylized triangle arrow"
+       markerWidth="1"
+       markerHeight="1"
+       viewBox="0 0 1 1"
+       inkscape:isstock="true"
+       inkscape:collect="always"
+       preserveAspectRatio="xMidYMid">
+      <path
+         transform="scale(0.5)"
+         style="fill:context-stroke;fill-rule:evenodd;stroke:context-stroke;stroke-width:1pt"
+         d="m 6,0 c -3,1 -7,3 -9,5 0,0 0,-4 2,-5 -2,-1 -2,-5 -2,-5 2,2 6,4 9,5 z"
+         id="path108" />
+    </marker>
+    <marker
+       style="overflow:visible"
+       id="ArrowWide"
+       refX="0"
+       refY="0"
+       orient="auto-start-reverse"
+       inkscape:stockid="Wide arrow"
+       markerWidth="1"
+       markerHeight="1"
+       viewBox="0 0 1 1"
+       inkscape:isstock="true"
+       inkscape:collect="always"
+       preserveAspectRatio="xMidYMid">
+      <path
+         style="fill:none;stroke:context-stroke;stroke-width:1;stroke-linecap:butt"
+         d="M 3,-3 0,0 3,3"
+         transform="rotate(180,0.125,0)"
+         sodipodi:nodetypes="ccc"
+         id="path1" />
+    </marker>
+    <marker
+       style="overflow:visible"
+       id="Triangle"
+       refX="0"
+       refY="0"
+       orient="auto-start-reverse"
+       inkscape:stockid="Triangle arrow"
+       markerWidth="1"
+       markerHeight="1"
+       viewBox="0 0 1 1"
+       inkscape:isstock="true"
+       inkscape:collect="always"
+       preserveAspectRatio="xMidYMid">
+      <path
+         transform="scale(0.5)"
+         style="fill:context-stroke;fill-rule:evenodd;stroke:context-stroke;stroke-width:1pt"
+         d="M 5.77,0 -2.88,5 V -5 Z"
+         id="path135" />
+    </marker>
+    <marker
+       style="overflow:visible"
+       id="ArrowWideHeavy"
+       refX="0"
+       refY="0"
+       orient="auto-start-reverse"
+       inkscape:stockid="Wide, heavy arrow"
+       markerWidth="1"
+       markerHeight="1"
+       viewBox="0 0 1 1"
+       inkscape:isstock="true"
+       inkscape:collect="always"
+       preserveAspectRatio="xMidYMid">
+      <path
+         style="fill:context-stroke;fill-rule:evenodd;stroke:none"
+         d="m 1,0 -3,3 h -2 l 3,-3 -3,-3 h 2 z"
+         id="path71" />
+    </marker>
+  </defs>
+  <g
+     inkscape:label="Layer 1"
+     inkscape:groupmode="layer"
+     id="layer1"
+     transform="translate(149.03517,55.110629)">
+    <circle
+       style="fill:#ffeeaa;fill-opacity:1;stroke:#1a1a1a;stroke-width:0.733436;stroke-dasharray:none;stroke-dashoffset:0"
+       id="path98"
+       cx="-35.757576"
+       cy="-10.495151"
+       r="44.24876" />
+    <rect
+       style="fill:none;stroke:#000000;stroke-width:0.878057;stroke-dasharray:none"
+       id="rect1"
+       width="167.79619"
+       height="24.831829"
+       x="14.21942"
+       y="57.862854" />
+    <g
+       id="g11"
+       transform="translate(24.021362,-46.545299)">
+      <rect
+         style="fill:none;stroke:#006680;stroke-width:0.459999;stroke-dasharray:none"
+         id="rect2"
+         width="131.09708"
+         height="5.8163381"
+         x="23.245802"
+         y="107.16314" />
+      <path
+         style="fill:none;stroke:#006680;stroke-width:0.499999;stroke-dasharray:none"
+         d="m 37.884707,107.26337 v 5.53565"
+         id="path2"
+         sodipodi:nodetypes="cc" />
+      <path
+         style="fill:none;stroke:#006680;stroke-width:0.499999;stroke-dasharray:none"
+         d="m 52.466233,107.26337 v 5.53565"
+         id="path3"
+         sodipodi:nodetypes="cc" />
+      <path
+         style="fill:none;stroke:#006680;stroke-width:0.499999;stroke-dasharray:none"
+         d="m 67.047758,107.26337 v 5.53565"
+         id="path4"
+         sodipodi:nodetypes="cc" />
+      <path
+         style="fill:none;stroke:#006680;stroke-width:0.499999;stroke-dasharray:none"
+         d="m 81.629283,107.26337 v 5.53565"
+         id="path5"
+         sodipodi:nodetypes="cc" />
+      <path
+         style="fill:none;stroke:#006680;stroke-width:0.499999;stroke-dasharray:none"
+         d="m 96.210809,107.26337 v 5.53565"
+         id="path6"
+         sodipodi:nodetypes="cc" />
+      <path
+         style="fill:none;stroke:#006680;stroke-width:0.499999;stroke-dasharray:none"
+         d="m 110.79233,107.26337 v 5.53565"
+         id="path7"
+         sodipodi:nodetypes="cc" />
+      <path
+         style="fill:none;stroke:#006680;stroke-width:0.499999;stroke-dasharray:none"
+         d="m 125.37386,107.26337 v 5.53565"
+         id="path8"
+         sodipodi:nodetypes="cc" />
+      <path
+         style="fill:none;stroke:#006680;stroke-width:0.499999;stroke-dasharray:none"
+         d="m 139.95538,107.26337 v 5.53565"
+         id="path9"
+         sodipodi:nodetypes="cc" />
+      <text
+         xml:space="preserve"
+         style="font-size:3.175px;text-align:start;writing-mode:lr-tb;direction:ltr;text-anchor:start;fill:none;stroke:#006680;stroke-width:0.499999;stroke-dasharray:none"
+         x="86.713425"
+         y="110.1963"
+         id="text11"><tspan
+           sodipodi:role="line"
+           id="tspan11"
+           style="stroke:#006680;stroke-width:0.5"
+           x="86.713425"
+           y="110.1963">. . .</tspan></text>
+    </g>
+    <g
+       id="g18"
+       transform="translate(24.021362,-32.25779)">
+      <rect
+         style="fill:none;stroke:#006680;stroke-width:0.459999;stroke-dasharray:none"
+         id="rect11"
+         width="131.09708"
+         height="5.8163381"
+         x="23.245802"
+         y="107.16314" />
+      <path
+         style="fill:none;stroke:#006680;stroke-width:0.499999;stroke-dasharray:none"
+         d="m 37.884707,107.26337 v 5.53565"
+         id="path11"
+         sodipodi:nodetypes="cc" />
+      <path
+         style="fill:none;stroke:#006680;stroke-width:0.499999;stroke-dasharray:none"
+         d="m 52.466233,107.26337 v 5.53565"
+         id="path12"
+         sodipodi:nodetypes="cc" />
+      <path
+         style="fill:none;stroke:#006680;stroke-width:0.499999;stroke-dasharray:none"
+         d="m 67.047758,107.26337 v 5.53565"
+         id="path13"
+         sodipodi:nodetypes="cc" />
+      <path
+         style="fill:none;stroke:#006680;stroke-width:0.499999;stroke-dasharray:none"
+         d="m 81.629283,107.26337 v 5.53565"
+         id="path14"
+         sodipodi:nodetypes="cc" />
+      <path
+         style="fill:none;stroke:#006680;stroke-width:0.499999;stroke-dasharray:none"
+         d="m 96.210809,107.26337 v 5.53565"
+         id="path15"
+         sodipodi:nodetypes="cc" />
+      <path
+         style="fill:none;stroke:#006680;stroke-width:0.499999;stroke-dasharray:none"
+         d="m 110.79233,107.26337 v 5.53565"
+         id="path16"
+         sodipodi:nodetypes="cc" />
+      <path
+         style="fill:none;stroke:#006680;stroke-width:0.499999;stroke-dasharray:none"
+         d="m 125.37386,107.26337 v 5.53565"
+         id="path17"
+         sodipodi:nodetypes="cc" />
+      <path
+         style="fill:none;stroke:#006680;stroke-width:0.499999;stroke-dasharray:none"
+         d="m 139.95538,107.26337 v 5.53565"
+         id="path18"
+         sodipodi:nodetypes="cc" />
+      <text
+         xml:space="preserve"
+         style="font-size:3.175px;text-align:start;writing-mode:lr-tb;direction:ltr;text-anchor:start;fill:none;stroke:#006680;stroke-width:0.499999;stroke-dasharray:none"
+         x="86.713425"
+         y="110.1963"
+         id="text18"><tspan
+           sodipodi:role="line"
+           id="tspan18"
+           style="stroke:#006680;stroke-width:0.5"
+           x="86.713425"
+           y="110.1963">. . .</tspan></text>
+    </g>
+    <text
+       xml:space="preserve"
+       style="font-size:3.175px;text-align:start;writing-mode:lr-tb;direction:ltr;text-anchor:start;fill:none;stroke:#006680;stroke-width:0.499999;stroke-dasharray:none"
+       x="113.37768"
+       y="68.463142"
+       id="text19"><tspan
+         sodipodi:role="line"
+         id="tspan19"
+         style="writing-mode:tb-rl;stroke-width:0.5"
+         x="113.37768"
+         y="68.463142">. . .</tspan></text>
+    <text
+       xml:space="preserve"
+       style="font-style:normal;font-weight:normal;font-size:7.05556px;line-height:1.25;font-family:sans-serif;letter-spacing:0px;word-spacing:0px;fill:#000000;fill-opacity:1;stroke:none;stroke-width:0.0690111"
+       x="25.005701"
+       y="55.308445"
+       id="text844-2-9"><tspan
+         sodipodi:role="line"
+         x="25.005701"
+         y="55.308445"
+         style="font-style:normal;font-variant:normal;font-weight:bold;font-stretch:normal;font-size:7.05556px;font-family:sans-serif;-inkscape-font-specification:'sans-serif Bold';text-align:center;text-anchor:middle;stroke-width:0.0690111"
+         id="tspan2868">Pipe[0]</tspan></text>
+    <text
+       xml:space="preserve"
+       style="font-style:normal;font-weight:normal;font-size:7.05556px;line-height:1.25;font-family:sans-serif;letter-spacing:0px;word-spacing:0px;fill:#000000;fill-opacity:1;stroke:none;stroke-width:0.0690111"
+       x="-74.441521"
+       y="63.075123"
+       id="text844-2-9-4"><tspan
+         sodipodi:role="line"
+         x="-74.441521"
+         y="63.075123"
+         style="font-style:normal;font-variant:normal;font-weight:bold;font-stretch:normal;font-size:7.05556px;font-family:sans-serif;-inkscape-font-specification:'sans-serif Bold';text-align:center;text-anchor:middle;stroke-width:0.0690111"
+         id="tspan2868-7">MQD</tspan></text>
+    <text
+       xml:space="preserve"
+       style="font-style:normal;font-weight:normal;font-size:7.05556px;line-height:1.25;font-family:sans-serif;letter-spacing:0px;word-spacing:0px;fill:#000000;fill-opacity:1;stroke:none;stroke-width:0.0690111"
+       x="30.264952"
+       y="65.490654"
+       id="text20"><tspan
+         sodipodi:role="line"
+         x="30.264952"
+         y="65.490654"
+         style="font-style:normal;font-variant:normal;font-weight:bold;font-stretch:normal;font-size:7.05556px;font-family:sans-serif;-inkscape-font-specification:'sans-serif Bold';text-align:center;text-anchor:middle;stroke-width:0.0690111"
+         id="tspan20">Queue[0]</tspan></text>
+    <text
+       xml:space="preserve"
+       style="font-style:normal;font-weight:normal;font-size:7.05556px;line-height:1.25;font-family:sans-serif;letter-spacing:0px;word-spacing:0px;fill:#000000;fill-opacity:1;stroke:none;stroke-width:0.0690111"
+       x="30.264952"
+       y="79.249001"
+       id="text21"><tspan
+         sodipodi:role="line"
+         x="30.264952"
+         y="79.249001"
+         style="font-style:normal;font-variant:normal;font-weight:bold;font-stretch:normal;font-size:7.05556px;font-family:sans-serif;-inkscape-font-specification:'sans-serif Bold';text-align:center;text-anchor:middle;stroke-width:0.0690111"
+         id="tspan21">Queue[n]</tspan></text>
+    <text
+       xml:space="preserve"
+       style="font-style:normal;font-weight:normal;font-size:7.05556px;line-height:1.25;font-family:sans-serif;letter-spacing:0px;word-spacing:0px;fill:#000000;fill-opacity:1;stroke:none;stroke-width:0.0690111"
+       x="30.264952"
+       y="71.84066"
+       id="text22"><tspan
+         sodipodi:role="line"
+         x="30.264952"
+         y="71.84066"
+         style="font-style:normal;font-variant:normal;font-weight:bold;font-stretch:normal;font-size:7.05556px;font-family:sans-serif;-inkscape-font-specification:'sans-serif Bold';text-align:center;text-anchor:middle;stroke-width:0.0690111"
+         id="tspan22">...</tspan></text>
+    <g
+       id="g71"
+       transform="translate(-23.283342)">
+      <rect
+         style="fill:#ffffff;fill-opacity:0;stroke:#000000;stroke-width:0.5;stroke-dasharray:0.5, 0.5;stroke-dashoffset:0"
+         id="rect67"
+         width="18.533583"
+         height="114.96632"
+         x="250.9435"
+         y="54.754276"
+         ry="6.0427966" />
+    </g>
+    <rect
+       style="fill:#1a1a1a;fill-opacity:0;stroke:#000000;stroke-width:0.499999;stroke-dasharray:none;stroke-dashoffset:0"
+       id="rect68"
+       width="188.21231"
+       height="139.5948"
+       x="4.0113592"
+       y="37.597778"
+       ry="0" />
+    <g
+       id="g43"
+       transform="translate(0,40.745853)">
+      <rect
+         style="fill:none;stroke:#000000;stroke-width:0.878057;stroke-dasharray:none"
+         id="rect22"
+         width="167.79619"
+         height="24.831829"
+         x="14.21942"
+         y="57.862854" />
+      <g
+         id="g30"
+         transform="translate(24.021362,-46.545299)">
+        <rect
+           style="fill:none;stroke:#006680;stroke-width:0.459999;stroke-dasharray:none"
+           id="rect23"
+           width="131.09708"
+           height="5.8163381"
+           x="23.245802"
+           y="107.16314" />
+        <path
+           style="fill:none;stroke:#006680;stroke-width:0.499999;stroke-dasharray:none"
+           d="m 37.884707,107.26337 v 5.53565"
+           id="path23"
+           sodipodi:nodetypes="cc" />
+        <path
+           style="fill:none;stroke:#006680;stroke-width:0.499999;stroke-dasharray:none"
+           d="m 52.466233,107.26337 v 5.53565"
+           id="path24"
+           sodipodi:nodetypes="cc" />
+        <path
+           style="fill:none;stroke:#006680;stroke-width:0.499999;stroke-dasharray:none"
+           d="m 67.047758,107.26337 v 5.53565"
+           id="path25"
+           sodipodi:nodetypes="cc" />
+        <path
+           style="fill:none;stroke:#006680;stroke-width:0.499999;stroke-dasharray:none"
+           d="m 81.629283,107.26337 v 5.53565"
+           id="path26"
+           sodipodi:nodetypes="cc" />
+        <path
+           style="fill:none;stroke:#006680;stroke-width:0.499999;stroke-dasharray:none"
+           d="m 96.210809,107.26337 v 5.53565"
+           id="path27"
+           sodipodi:nodetypes="cc" />
+        <path
+           style="fill:none;stroke:#006680;stroke-width:0.499999;stroke-dasharray:none"
+           d="m 110.79233,107.26337 v 5.53565"
+           id="path28"
+           sodipodi:nodetypes="cc" />
+        <path
+           style="fill:none;stroke:#006680;stroke-width:0.499999;stroke-dasharray:none"
+           d="m 125.37386,107.26337 v 5.53565"
+           id="path29"
+           sodipodi:nodetypes="cc" />
+        <path
+           style="fill:none;stroke:#006680;stroke-width:0.499999;stroke-dasharray:none"
+           d="m 139.95538,107.26337 v 5.53565"
+           id="path30"
+           sodipodi:nodetypes="cc" />
+        <text
+           xml:space="preserve"
+           style="font-size:3.175px;text-align:start;writing-mode:lr-tb;direction:ltr;text-anchor:start;fill:none;stroke:#006680;stroke-width:0.499999;stroke-dasharray:none"
+           x="86.713425"
+           y="110.1963"
+           id="text30"><tspan
+             sodipodi:role="line"
+             id="tspan30"
+             style="stroke:#006680;stroke-width:0.5"
+             x="86.713425"
+             y="110.1963">. . .</tspan></text>
+      </g>
+      <g
+         id="g38"
+         transform="translate(24.021362,-32.25779)">
+        <rect
+           style="fill:none;stroke:#006680;stroke-width:0.459999;stroke-dasharray:none"
+           id="rect30"
+           width="131.09708"
+           height="5.8163381"
+           x="23.245802"
+           y="107.16314" />
+        <path
+           style="fill:none;stroke:#006680;stroke-width:0.499999;stroke-dasharray:none"
+           d="m 37.884707,107.26337 v 5.53565"
+           id="path31"
+           sodipodi:nodetypes="cc" />
+        <path
+           style="fill:none;stroke:#006680;stroke-width:0.499999;stroke-dasharray:none"
+           d="m 52.466233,107.26337 v 5.53565"
+           id="path32"
+           sodipodi:nodetypes="cc" />
+        <path
+           style="fill:none;stroke:#006680;stroke-width:0.499999;stroke-dasharray:none"
+           d="m 67.047758,107.26337 v 5.53565"
+           id="path33"
+           sodipodi:nodetypes="cc" />
+        <path
+           style="fill:none;stroke:#006680;stroke-width:0.499999;stroke-dasharray:none"
+           d="m 81.629283,107.26337 v 5.53565"
+           id="path34"
+           sodipodi:nodetypes="cc" />
+        <path
+           style="fill:none;stroke:#006680;stroke-width:0.499999;stroke-dasharray:none"
+           d="m 96.210809,107.26337 v 5.53565"
+           id="path35"
+           sodipodi:nodetypes="cc" />
+        <path
+           style="fill:none;stroke:#006680;stroke-width:0.499999;stroke-dasharray:none"
+           d="m 110.79233,107.26337 v 5.53565"
+           id="path36"
+           sodipodi:nodetypes="cc" />
+        <path
+           style="fill:none;stroke:#006680;stroke-width:0.499999;stroke-dasharray:none"
+           d="m 125.37386,107.26337 v 5.53565"
+           id="path37"
+           sodipodi:nodetypes="cc" />
+        <path
+           style="fill:none;stroke:#006680;stroke-width:0.499999;stroke-dasharray:none"
+           d="m 139.95538,107.26337 v 5.53565"
+           id="path38"
+           sodipodi:nodetypes="cc" />
+        <text
+           xml:space="preserve"
+           style="font-size:3.175px;text-align:start;writing-mode:lr-tb;direction:ltr;text-anchor:start;fill:none;stroke:#006680;stroke-width:0.499999;stroke-dasharray:none"
+           x="86.713425"
+           y="110.1963"
+           id="text38"><tspan
+             sodipodi:role="line"
+             id="tspan38"
+             style="stroke:#006680;stroke-width:0.5"
+             x="86.713425"
+             y="110.1963">. . .</tspan></text>
+      </g>
+      <text
+         xml:space="preserve"
+         style="font-size:3.175px;text-align:start;writing-mode:lr-tb;direction:ltr;text-anchor:start;fill:none;stroke:#006680;stroke-width:0.499999;stroke-dasharray:none"
+         x="113.37768"
+         y="68.463142"
+         id="text39"><tspan
+           sodipodi:role="line"
+           id="tspan39"
+           style="writing-mode:tb-rl;stroke-width:0.5"
+           x="113.37768"
+           y="68.463142">. . .</tspan></text>
+      <text
+         xml:space="preserve"
+         style="font-style:normal;font-weight:normal;font-size:7.05556px;line-height:1.25;font-family:sans-serif;letter-spacing:0px;word-spacing:0px;fill:#000000;fill-opacity:1;stroke:none;stroke-width:0.0690111"
+         x="25.005701"
+         y="55.308445"
+         id="text40"><tspan
+           sodipodi:role="line"
+           x="25.005701"
+           y="55.308445"
+           style="font-style:normal;font-variant:normal;font-weight:bold;font-stretch:normal;font-size:7.05556px;font-family:sans-serif;-inkscape-font-specification:'sans-serif Bold';text-align:center;text-anchor:middle;stroke-width:0.0690111"
+           id="tspan40">Pipe[1]</tspan></text>
+      <text
+         xml:space="preserve"
+         style="font-style:normal;font-weight:normal;font-size:7.05556px;line-height:1.25;font-family:sans-serif;letter-spacing:0px;word-spacing:0px;fill:#000000;fill-opacity:1;stroke:none;stroke-width:0.0690111"
+         x="30.264952"
+         y="65.490654"
+         id="text41"><tspan
+           sodipodi:role="line"
+           x="30.264952"
+           y="65.490654"
+           style="font-style:normal;font-variant:normal;font-weight:bold;font-stretch:normal;font-size:7.05556px;font-family:sans-serif;-inkscape-font-specification:'sans-serif Bold';text-align:center;text-anchor:middle;stroke-width:0.0690111"
+           id="tspan41">Queue[0]</tspan></text>
+      <text
+         xml:space="preserve"
+         style="font-style:normal;font-weight:normal;font-size:7.05556px;line-height:1.25;font-family:sans-serif;letter-spacing:0px;word-spacing:0px;fill:#000000;fill-opacity:1;stroke:none;stroke-width:0.0690111"
+         x="30.264952"
+         y="79.249001"
+         id="text42"><tspan
+           sodipodi:role="line"
+           x="30.264952"
+           y="79.249001"
+           style="font-style:normal;font-variant:normal;font-weight:bold;font-stretch:normal;font-size:7.05556px;font-family:sans-serif;-inkscape-font-specification:'sans-serif Bold';text-align:center;text-anchor:middle;stroke-width:0.0690111"
+           id="tspan42">Queue[n]</tspan></text>
+      <text
+         xml:space="preserve"
+         style="font-style:normal;font-weight:normal;font-size:7.05556px;line-height:1.25;font-family:sans-serif;letter-spacing:0px;word-spacing:0px;fill:#000000;fill-opacity:1;stroke:none;stroke-width:0.0690111"
+         x="30.264952"
+         y="71.84066"
+         id="text43"><tspan
+           sodipodi:role="line"
+           x="30.264952"
+           y="71.84066"
+           style="font-style:normal;font-variant:normal;font-weight:bold;font-stretch:normal;font-size:7.05556px;font-family:sans-serif;-inkscape-font-specification:'sans-serif Bold';text-align:center;text-anchor:middle;stroke-width:0.0690111"
+           id="tspan43">...</tspan></text>
+    </g>
+    <g
+       id="g64"
+       transform="translate(0,85.195881)">
+      <rect
+         style="fill:none;stroke:#000000;stroke-width:0.878057;stroke-dasharray:none"
+         id="rect43"
+         width="167.79619"
+         height="24.831829"
+         x="14.21942"
+         y="57.862854" />
+      <g
+         id="g51"
+         transform="translate(24.021362,-46.545299)">
+        <rect
+           style="fill:none;stroke:#006680;stroke-width:0.459999;stroke-dasharray:none"
+           id="rect44"
+           width="131.09708"
+           height="5.8163381"
+           x="23.245802"
+           y="107.16314" />
+        <path
+           style="fill:none;stroke:#006680;stroke-width:0.499999;stroke-dasharray:none"
+           d="m 37.884707,107.26337 v 5.53565"
+           id="path44"
+           sodipodi:nodetypes="cc" />
+        <path
+           style="fill:none;stroke:#006680;stroke-width:0.499999;stroke-dasharray:none"
+           d="m 52.466233,107.26337 v 5.53565"
+           id="path45"
+           sodipodi:nodetypes="cc" />
+        <path
+           style="fill:none;stroke:#006680;stroke-width:0.499999;stroke-dasharray:none"
+           d="m 67.047758,107.26337 v 5.53565"
+           id="path46"
+           sodipodi:nodetypes="cc" />
+        <path
+           style="fill:none;stroke:#006680;stroke-width:0.499999;stroke-dasharray:none"
+           d="m 81.629283,107.26337 v 5.53565"
+           id="path47"
+           sodipodi:nodetypes="cc" />
+        <path
+           style="fill:none;stroke:#006680;stroke-width:0.499999;stroke-dasharray:none"
+           d="m 96.210809,107.26337 v 5.53565"
+           id="path48"
+           sodipodi:nodetypes="cc" />
+        <path
+           style="fill:none;stroke:#006680;stroke-width:0.499999;stroke-dasharray:none"
+           d="m 110.79233,107.26337 v 5.53565"
+           id="path49"
+           sodipodi:nodetypes="cc" />
+        <path
+           style="fill:none;stroke:#006680;stroke-width:0.499999;stroke-dasharray:none"
+           d="m 125.37386,107.26337 v 5.53565"
+           id="path50"
+           sodipodi:nodetypes="cc" />
+        <path
+           style="fill:none;stroke:#006680;stroke-width:0.499999;stroke-dasharray:none"
+           d="m 139.95538,107.26337 v 5.53565"
+           id="path51"
+           sodipodi:nodetypes="cc" />
+        <text
+           xml:space="preserve"
+           style="font-size:3.175px;text-align:start;writing-mode:lr-tb;direction:ltr;text-anchor:start;fill:none;stroke:#006680;stroke-width:0.499999;stroke-dasharray:none"
+           x="86.713425"
+           y="110.1963"
+           id="text51"><tspan
+             sodipodi:role="line"
+             id="tspan51"
+             style="stroke:#006680;stroke-width:0.5"
+             x="86.713425"
+             y="110.1963">. . .</tspan></text>
+      </g>
+      <g
+         id="g59"
+         transform="translate(24.021362,-32.25779)">
+        <rect
+           style="fill:none;stroke:#006680;stroke-width:0.459999;stroke-dasharray:none"
+           id="rect51"
+           width="131.09708"
+           height="5.8163381"
+           x="23.245802"
+           y="107.16314" />
+        <path
+           style="fill:none;stroke:#006680;stroke-width:0.499999;stroke-dasharray:none"
+           d="m 37.884707,107.26337 v 5.53565"
+           id="path52"
+           sodipodi:nodetypes="cc" />
+        <path
+           style="fill:none;stroke:#006680;stroke-width:0.499999;stroke-dasharray:none"
+           d="m 52.466233,107.26337 v 5.53565"
+           id="path53"
+           sodipodi:nodetypes="cc" />
+        <path
+           style="fill:none;stroke:#006680;stroke-width:0.499999;stroke-dasharray:none"
+           d="m 67.047758,107.26337 v 5.53565"
+           id="path54"
+           sodipodi:nodetypes="cc" />
+        <path
+           style="fill:none;stroke:#006680;stroke-width:0.499999;stroke-dasharray:none"
+           d="m 81.629283,107.26337 v 5.53565"
+           id="path55"
+           sodipodi:nodetypes="cc" />
+        <path
+           style="fill:none;stroke:#006680;stroke-width:0.499999;stroke-dasharray:none"
+           d="m 96.210809,107.26337 v 5.53565"
+           id="path56"
+           sodipodi:nodetypes="cc" />
+        <path
+           style="fill:none;stroke:#006680;stroke-width:0.499999;stroke-dasharray:none"
+           d="m 110.79233,107.26337 v 5.53565"
+           id="path57"
+           sodipodi:nodetypes="cc" />
+        <path
+           style="fill:none;stroke:#006680;stroke-width:0.499999;stroke-dasharray:none"
+           d="m 125.37386,107.26337 v 5.53565"
+           id="path58"
+           sodipodi:nodetypes="cc" />
+        <path
+           style="fill:none;stroke:#006680;stroke-width:0.499999;stroke-dasharray:none"
+           d="m 139.95538,107.26337 v 5.53565"
+           id="path59"
+           sodipodi:nodetypes="cc" />
+        <text
+           xml:space="preserve"
+           style="font-size:3.175px;text-align:start;writing-mode:lr-tb;direction:ltr;text-anchor:start;fill:none;stroke:#006680;stroke-width:0.499999;stroke-dasharray:none"
+           x="86.713425"
+           y="110.1963"
+           id="text59"><tspan
+             sodipodi:role="line"
+             id="tspan59"
+             style="stroke:#006680;stroke-width:0.5"
+             x="86.713425"
+             y="110.1963">. . .</tspan></text>
+      </g>
+      <text
+         xml:space="preserve"
+         style="font-size:3.175px;text-align:start;writing-mode:lr-tb;direction:ltr;text-anchor:start;fill:none;stroke:#006680;stroke-width:0.499999;stroke-dasharray:none"
+         x="113.37768"
+         y="68.463142"
+         id="text60"><tspan
+           sodipodi:role="line"
+           id="tspan60"
+           style="writing-mode:tb-rl;stroke-width:0.5"
+           x="113.37768"
+           y="68.463142">. . .</tspan></text>
+      <text
+         xml:space="preserve"
+         style="font-style:normal;font-weight:normal;font-size:7.05556px;line-height:1.25;font-family:sans-serif;letter-spacing:0px;word-spacing:0px;fill:#000000;fill-opacity:1;stroke:none;stroke-width:0.0690111"
+         x="25.005701"
+         y="55.308445"
+         id="text61"><tspan
+           sodipodi:role="line"
+           x="25.005701"
+           y="55.308445"
+           style="font-style:normal;font-variant:normal;font-weight:bold;font-stretch:normal;font-size:7.05556px;font-family:sans-serif;-inkscape-font-specification:'sans-serif Bold';text-align:center;text-anchor:middle;stroke-width:0.0690111"
+           id="tspan61">Pipe[n]</tspan></text>
+      <text
+         xml:space="preserve"
+         style="font-style:normal;font-weight:normal;font-size:7.05556px;line-height:1.25;font-family:sans-serif;letter-spacing:0px;word-spacing:0px;fill:#000000;fill-opacity:1;stroke:none;stroke-width:0.0690111"
+         x="30.264952"
+         y="65.490654"
+         id="text62"><tspan
+           sodipodi:role="line"
+           x="30.264952"
+           y="65.490654"
+           style="font-style:normal;font-variant:normal;font-weight:bold;font-stretch:normal;font-size:7.05556px;font-family:sans-serif;-inkscape-font-specification:'sans-serif Bold';text-align:center;text-anchor:middle;stroke-width:0.0690111"
+           id="tspan62">Queue[0]</tspan></text>
+      <text
+         xml:space="preserve"
+         style="font-style:normal;font-weight:normal;font-size:7.05556px;line-height:1.25;font-family:sans-serif;letter-spacing:0px;word-spacing:0px;fill:#000000;fill-opacity:1;stroke:none;stroke-width:0.0690111"
+         x="30.264952"
+         y="79.249001"
+         id="text63"><tspan
+           sodipodi:role="line"
+           x="30.264952"
+           y="79.249001"
+           style="font-style:normal;font-variant:normal;font-weight:bold;font-stretch:normal;font-size:7.05556px;font-family:sans-serif;-inkscape-font-specification:'sans-serif Bold';text-align:center;text-anchor:middle;stroke-width:0.0690111"
+           id="tspan63">Queue[n]</tspan></text>
+      <text
+         xml:space="preserve"
+         style="font-style:normal;font-weight:normal;font-size:7.05556px;line-height:1.25;font-family:sans-serif;letter-spacing:0px;word-spacing:0px;fill:#000000;fill-opacity:1;stroke:none;stroke-width:0.0690111"
+         x="30.264952"
+         y="71.84066"
+         id="text64"><tspan
+           sodipodi:role="line"
+           x="30.264952"
+           y="71.84066"
+           style="font-style:normal;font-variant:normal;font-weight:bold;font-stretch:normal;font-size:7.05556px;font-family:sans-serif;-inkscape-font-specification:'sans-serif Bold';text-align:center;text-anchor:middle;stroke-width:0.0690111"
+           id="tspan64">...</tspan></text>
+    </g>
+    <text
+       xml:space="preserve"
+       style="font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;font-size:7.76111px;font-family:Serif;-inkscape-font-specification:Serif;text-align:start;writing-mode:lr-tb;direction:ltr;text-anchor:start;fill:#000000;fill-opacity:0;stroke:#006680;stroke-width:0.499999;stroke-dasharray:none"
+       x="92.18071"
+       y="128.21965"
+       id="text65"><tspan
+         sodipodi:role="line"
+         id="tspan65"
+         style="font-size:7.76111px;writing-mode:tb-rl;fill:#1a1a1a;stroke:#000000;stroke-width:0.5"
+         x="92.18071"
+         y="128.21965">...</tspan></text>
+    <text
+       xml:space="preserve"
+       style="font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;font-size:7.7611px;font-family:Serif;-inkscape-font-specification:Serif;text-align:start;writing-mode:tb-rl;direction:ltr;text-anchor:start;fill:#1a1a1a;fill-opacity:0;stroke:#000000;stroke-width:0.499999;stroke-dasharray:none"
+       x="198.72205"
+       y="80.708267"
+       id="text66"><tspan
+         sodipodi:role="line"
+         id="tspan66"
+         style="stroke-width:0.5"
+         x="198.72205"
+         y="80.708267" /></text>
+    <text
+       xml:space="preserve"
+       style="font-style:normal;font-weight:normal;font-size:7.05556px;line-height:1.25;font-family:sans-serif;letter-spacing:0px;word-spacing:0px;fill:#000000;fill-opacity:1;stroke:none;stroke-width:0.0690111"
+       x="97.905846"
+       y="44.725101"
+       id="text68"><tspan
+         sodipodi:role="line"
+         x="97.905846"
+         y="44.725101"
+         style="font-style:normal;font-variant:normal;font-weight:bold;font-stretch:normal;font-size:7.05556px;font-family:sans-serif;-inkscape-font-specification:'sans-serif Bold';text-align:center;text-anchor:middle;stroke-width:0.0690111"
+         id="tspan68">Hardware Block</tspan></text>
+    <text
+       xml:space="preserve"
+       style="font-style:normal;font-weight:normal;font-size:7.05556px;line-height:1.25;font-family:sans-serif;letter-spacing:0px;word-spacing:0px;writing-mode:vertical-lr;text-orientation:upright;fill:#000000;fill-opacity:1;stroke:none;stroke-width:0.0690111"
+       x="236.36934"
+       y="112.10503"
+       id="text68-7"><tspan
+         sodipodi:role="line"
+         x="236.36934"
+         y="112.10503"
+         style="font-style:normal;font-variant:normal;font-weight:bold;font-stretch:normal;font-size:7.05556px;font-family:sans-serif;-inkscape-font-specification:'sans-serif Bold';text-align:center;writing-mode:vertical-lr;text-orientation:upright;text-anchor:middle;stroke-width:0.0690111"
+         id="tspan68-4">EXECUTION</tspan></text>
+    <rect
+       style="fill:#1a1a1a;fill-opacity:0;stroke:#000000;stroke-width:0.940575;stroke-dasharray:7.5246, 0.940575;stroke-dashoffset:0"
+       id="rect68-1"
+       width="68.749969"
+       height="141.2751"
+       x="-129.49162"
+       y="37.881134"
+       ry="0" />
+    <text
+       xml:space="preserve"
+       style="font-style:normal;font-weight:normal;font-size:7.05556px;line-height:1.25;font-family:sans-serif;letter-spacing:0px;word-spacing:0px;fill:#000000;fill-opacity:1;stroke:none;stroke-width:0.0690111"
+       x="-114.4223"
+       y="44.966106"
+       id="text68-2"><tspan
+         sodipodi:role="line"
+         x="-114.4223"
+         y="44.966106"
+         style="font-style:normal;font-variant:normal;font-weight:bold;font-stretch:normal;font-size:7.05556px;font-family:sans-serif;-inkscape-font-specification:'sans-serif Bold';text-align:center;text-anchor:middle;stroke-width:0.0690111"
+         id="tspan68-9">Memory</tspan></text>
+    <text
+       xml:space="preserve"
+       style="font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;font-size:12.7px;font-family:Serif;-inkscape-font-specification:Serif;text-align:start;writing-mode:tb-rl;direction:ltr;text-orientation:upright;text-anchor:start;fill:#1a1a1a;fill-opacity:0;stroke:#000000;stroke-width:0.499999;stroke-dasharray:none;stroke-dashoffset:0"
+       x="212.6013"
+       y="64.823341"
+       id="text69"><tspan
+         sodipodi:role="line"
+         id="tspan69"
+         style="font-size:12.7px;stroke-width:0.5"
+         x="212.6013"
+         y="64.823341" /></text>
+    <g
+       id="g72">
+      <path
+         style="font-weight:bold;font-size:16.9333px;line-height:1.25;-inkscape-font-specification:'sans-serif Bold';text-align:center;letter-spacing:0px;word-spacing:0px;text-anchor:middle;stroke-width:0.0690111"
+         d="m 185.24734,83.96512 h 1.28693 c 1.20226,0.01693 2.09973,-1.015998 2.0828,-2.370662 v -9.393759 c -0.0169,-0.711199 0.33866,-1.066798 1.10066,-1.066798 h 0.2032 0.0677 v -1.557864 c -1.0668,0.01693 -1.38853,-0.270933 -1.37159,-1.236131 V 58.96308 c 0.0339,-1.354664 -0.88054,-2.387595 -2.0828,-2.370662 h -1.28693 v 1.676397 h 0.62653 c 0.57573,0 0.77893,0.321733 0.762,1.100664 v 9.122827 c 0,1.219198 0.44027,1.710263 1.64253,1.862663 -1.20226,0.135466 -1.64253,0.626532 -1.64253,1.84573 v 9.122826 c 0.0169,0.660399 -0.23707,0.965198 -0.762,0.965198 h -0.62653 z"
+         id="text70"
+         aria-label="}"
+         sodipodi:nodetypes="ccccsccccccccscscscscc" />
+      <path
+         style="fill:#1a1a1a;fill-opacity:0;stroke:#000000;stroke-width:1.25;stroke-dasharray:none;stroke-dashoffset:0;marker-end:url(#ArrowWideHeavy)"
+         d="M 190.40199,70.278769 H 224.6663"
+         id="path70" />
+    </g>
+    <path
+       style="font-weight:bold;font-size:16.9333px;line-height:1.25;-inkscape-font-specification:'sans-serif Bold';text-align:center;letter-spacing:0px;word-spacing:0px;text-anchor:middle;stroke-width:0.0690111"
+       d="m -88.44114,74.337891 h 1.28693 c 1.20226,0.01693 2.09973,-1.015998 2.0828,-2.370662 V 62.57347 c -0.0169,-0.711199 0.33866,-1.066798 1.10066,-1.066798 h 0.2032 0.0677 v -1.557864 c -1.0668,0.01693 -1.38853,-0.270933 -1.37159,-1.236131 v -9.376826 c 0.0339,-1.354664 -0.88054,-2.387595 -2.0828,-2.370662 h -1.28693 v 1.676397 h 0.62653 c 0.57573,0 0.77893,0.321733 0.762,1.100664 v 9.122827 c 0,1.219198 0.44027,1.710263 1.64253,1.862663 -1.20226,0.135466 -1.64253,0.626532 -1.64253,1.84573 v 9.122826 c 0.0169,0.660399 -0.23707,0.965198 -0.762,0.965198 h -0.62653 z"
+       id="text70-1"
+       aria-label="}"
+       sodipodi:nodetypes="ccccsccccccccscscscscc" />
+    <text
+       xml:space="preserve"
+       style="font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;font-size:16.9333px;font-family:Serif;-inkscape-font-specification:Serif;text-align:start;writing-mode:tb-rl;direction:ltr;text-orientation:upright;text-anchor:start;fill:#1a1a1a;fill-opacity:0;stroke:#000000;stroke-width:1.25;stroke-dasharray:none;stroke-dashoffset:0"
+       x="200.88817"
+       y="38.990276"
+       id="text72"><tspan
+         sodipodi:role="line"
+         id="tspan72"
+         style="stroke-width:1.25"
+         x="200.88817"
+         y="38.990276" /></text>
+    <text
+       xml:space="preserve"
+       style="font-style:normal;font-weight:normal;font-size:6.35px;line-height:1.25;font-family:sans-serif;letter-spacing:0px;word-spacing:0px;fill:#000000;fill-opacity:1;stroke:none;stroke-width:0.0690111"
+       x="205.12828"
+       y="60.090775"
+       id="text73"><tspan
+         sodipodi:role="line"
+         x="205.12828"
+         y="60.090775"
+         style="font-style:normal;font-variant:normal;font-weight:bold;font-stretch:normal;font-size:6.35px;font-family:sans-serif;-inkscape-font-specification:'sans-serif Bold';text-align:center;text-anchor:middle;stroke-width:0.0690111"
+         id="tspan73">e.g.,:</tspan><tspan
+         sodipodi:role="line"
+         x="205.12828"
+         y="68.028275"
+         style="font-style:normal;font-variant:normal;font-weight:bold;font-stretch:normal;font-size:6.35px;font-family:sans-serif;-inkscape-font-specification:'sans-serif Bold';text-align:center;text-anchor:middle;stroke-width:0.0690111"
+         id="tspan74">queue[0]</tspan></text>
+    <g
+       id="g75"
+       transform="translate(0,40.745853)">
+      <path
+         style="font-weight:bold;font-size:16.9333px;line-height:1.25;-inkscape-font-specification:'sans-serif Bold';text-align:center;letter-spacing:0px;word-spacing:0px;text-anchor:middle;stroke-width:0.0690111"
+         d="m 185.24734,83.96512 h 1.28693 c 1.20226,0.01693 2.09973,-1.015998 2.0828,-2.370662 v -9.393759 c -0.0169,-0.711199 0.33866,-1.066798 1.10066,-1.066798 h 0.2032 0.0677 v -1.557864 c -1.0668,0.01693 -1.38853,-0.270933 -1.37159,-1.236131 V 58.96308 c 0.0339,-1.354664 -0.88054,-2.387595 -2.0828,-2.370662 h -1.28693 v 1.676397 h 0.62653 c 0.57573,0 0.77893,0.321733 0.762,1.100664 v 9.122827 c 0,1.219198 0.44027,1.710263 1.64253,1.862663 -1.20226,0.135466 -1.64253,0.626532 -1.64253,1.84573 v 9.122826 c 0.0169,0.660399 -0.23707,0.965198 -0.762,0.965198 h -0.62653 z"
+         id="path74"
+         aria-label="}"
+         sodipodi:nodetypes="ccccsccccccccscscscscc" />
+      <path
+         style="fill:#1a1a1a;fill-opacity:0;stroke:#000000;stroke-width:1.25;stroke-dasharray:none;stroke-dashoffset:0;marker-end:url(#ArrowWideHeavy)"
+         d="M 190.40199,70.278769 H 224.6663"
+         id="path75" />
+    </g>
+    <text
+       xml:space="preserve"
+       style="font-style:normal;font-weight:normal;font-size:6.35px;line-height:1.25;font-family:sans-serif;letter-spacing:0px;word-spacing:0px;fill:#000000;fill-opacity:1;stroke:none;stroke-width:0.0690111"
+       x="205.12828"
+       y="100.83664"
+       id="text76"><tspan
+         sodipodi:role="line"
+         x="205.12828"
+         y="100.83664"
+         style="font-style:normal;font-variant:normal;font-weight:bold;font-stretch:normal;font-size:6.35px;font-family:sans-serif;-inkscape-font-specification:'sans-serif Bold';text-align:center;text-anchor:middle;stroke-width:0.0690111"
+         id="tspan75">e.g.,:</tspan><tspan
+         sodipodi:role="line"
+         x="205.12828"
+         y="108.77414"
+         style="font-style:normal;font-variant:normal;font-weight:bold;font-stretch:normal;font-size:6.35px;font-family:sans-serif;-inkscape-font-specification:'sans-serif Bold';text-align:center;text-anchor:middle;stroke-width:0.0690111"
+         id="tspan76">queue[4]</tspan></text>
+    <g
+       id="g77"
+       transform="translate(0,85.725048)">
+      <path
+         style="font-weight:bold;font-size:16.9333px;line-height:1.25;-inkscape-font-specification:'sans-serif Bold';text-align:center;letter-spacing:0px;word-spacing:0px;text-anchor:middle;stroke-width:0.0690111"
+         d="m 185.24734,83.96512 h 1.28693 c 1.20226,0.01693 2.09973,-1.015998 2.0828,-2.370662 v -9.393759 c -0.0169,-0.711199 0.33866,-1.066798 1.10066,-1.066798 h 0.2032 0.0677 v -1.557864 c -1.0668,0.01693 -1.38853,-0.270933 -1.37159,-1.236131 V 58.96308 c 0.0339,-1.354664 -0.88054,-2.387595 -2.0828,-2.370662 h -1.28693 v 1.676397 h 0.62653 c 0.57573,0 0.77893,0.321733 0.762,1.100664 v 9.122827 c 0,1.219198 0.44027,1.710263 1.64253,1.862663 -1.20226,0.135466 -1.64253,0.626532 -1.64253,1.84573 v 9.122826 c 0.0169,0.660399 -0.23707,0.965198 -0.762,0.965198 h -0.62653 z"
+         id="path76"
+         aria-label="}"
+         sodipodi:nodetypes="ccccsccccccccscscscscc" />
+      <path
+         style="fill:#1a1a1a;fill-opacity:0;stroke:#000000;stroke-width:1.25;stroke-dasharray:none;stroke-dashoffset:0;marker-end:url(#ArrowWideHeavy)"
+         d="M 190.40199,70.278769 H 224.6663"
+         id="path77" />
+    </g>
+    <text
+       xml:space="preserve"
+       style="font-style:normal;font-weight:normal;font-size:6.35px;line-height:1.25;font-family:sans-serif;letter-spacing:0px;word-spacing:0px;fill:#000000;fill-opacity:1;stroke:none;stroke-width:0.0690111"
+       x="205.12828"
+       y="145.81558"
+       id="text78"><tspan
+         sodipodi:role="line"
+         x="205.12828"
+         y="145.81558"
+         style="font-style:normal;font-variant:normal;font-weight:bold;font-stretch:normal;font-size:6.35px;font-family:sans-serif;-inkscape-font-specification:'sans-serif Bold';text-align:center;text-anchor:middle;stroke-width:0.0690111"
+         id="tspan77">e.g.,:</tspan><tspan
+         sodipodi:role="line"
+         x="205.12828"
+         y="153.75308"
+         style="font-style:normal;font-variant:normal;font-weight:bold;font-stretch:normal;font-size:6.35px;font-family:sans-serif;-inkscape-font-specification:'sans-serif Bold';text-align:center;text-anchor:middle;stroke-width:0.0690111"
+         id="tspan78">queue[n]</tspan></text>
+    <g
+       id="g81">
+      <text
+         xml:space="preserve"
+         style="font-style:normal;font-weight:normal;font-size:7.05556px;line-height:1.25;font-family:sans-serif;letter-spacing:0px;word-spacing:0px;fill:#000000;fill-opacity:1;stroke:none;stroke-width:0.0690111"
+         x="-18.502264"
+         y="65.642387"
+         id="text79"><tspan
+           sodipodi:role="line"
+           x="-18.502264"
+           y="65.642387"
+           style="font-style:normal;font-variant:normal;font-weight:bold;font-stretch:normal;font-size:7.05556px;font-family:sans-serif;-inkscape-font-specification:'sans-serif Bold';text-align:center;text-anchor:middle;fill:#800000;stroke-width:0.0690111"
+           id="tspan79">HQD</tspan></text>
+      <ellipse
+         style="fill:#800000;fill-opacity:0;stroke:#800000;stroke-width:1;stroke-dasharray:none;stroke-dashoffset:0"
+         id="path79"
+         cx="-18.407015"
+         cy="63.2188"
+         rx="13.317666"
+         ry="4.4124799" />
+      <path
+         style="fill:#800000;fill-opacity:0;stroke:#800000;stroke-width:1;stroke-dasharray:none;stroke-dashoffset:0;marker-end:url(#Triangle)"
+         d="M -4.6361224,63.2188 H 10.606988"
+         id="path80" />
+    </g>
+    <g
+       id="g82"
+       transform="translate(0,14.287503)">
+      <text
+         xml:space="preserve"
+         style="font-style:normal;font-weight:normal;font-size:7.05556px;line-height:1.25;font-family:sans-serif;letter-spacing:0px;word-spacing:0px;fill:#000000;fill-opacity:1;stroke:none;stroke-width:0.0690111"
+         x="-18.502264"
+         y="65.642387"
+         id="text81"><tspan
+           sodipodi:role="line"
+           x="-18.502264"
+           y="65.642387"
+           style="font-style:normal;font-variant:normal;font-weight:bold;font-stretch:normal;font-size:7.05556px;font-family:sans-serif;-inkscape-font-specification:'sans-serif Bold';text-align:center;text-anchor:middle;fill:#800000;stroke-width:0.0690111"
+           id="tspan81">HQD</tspan></text>
+      <ellipse
+         style="fill:#800000;fill-opacity:0;stroke:#800000;stroke-width:1;stroke-dasharray:none;stroke-dashoffset:0"
+         id="ellipse81"
+         cx="-18.407015"
+         cy="63.2188"
+         rx="13.317666"
+         ry="4.4124799" />
+      <path
+         style="fill:#800000;fill-opacity:0;stroke:#800000;stroke-width:1;stroke-dasharray:none;stroke-dashoffset:0;marker-end:url(#Triangle)"
+         d="M -4.6361224,63.2188 H 10.606988"
+         id="path81" />
+    </g>
+    <g
+       id="g83"
+       transform="translate(0,40.745853)">
+      <text
+         xml:space="preserve"
+         style="font-style:normal;font-weight:normal;font-size:7.05556px;line-height:1.25;font-family:sans-serif;letter-spacing:0px;word-spacing:0px;fill:#000000;fill-opacity:1;stroke:none;stroke-width:0.0690111"
+         x="-18.502264"
+         y="65.642387"
+         id="text82"><tspan
+           sodipodi:role="line"
+           x="-18.502264"
+           y="65.642387"
+           style="font-style:normal;font-variant:normal;font-weight:bold;font-stretch:normal;font-size:7.05556px;font-family:sans-serif;-inkscape-font-specification:'sans-serif Bold';text-align:center;text-anchor:middle;fill:#800000;stroke-width:0.0690111"
+           id="tspan82">HQD</tspan></text>
+      <ellipse
+         style="fill:#800000;fill-opacity:0;stroke:#800000;stroke-width:1;stroke-dasharray:none;stroke-dashoffset:0"
+         id="ellipse82"
+         cx="-18.407015"
+         cy="63.2188"
+         rx="13.317666"
+         ry="4.4124799" />
+      <path
+         style="fill:#800000;fill-opacity:0;stroke:#800000;stroke-width:1;stroke-dasharray:none;stroke-dashoffset:0;marker-end:url(#Triangle)"
+         d="M -4.6361224,63.2188 H 10.606988"
+         id="path82" />
+    </g>
+    <g
+       id="g84"
+       transform="translate(0,55.033362)">
+      <text
+         xml:space="preserve"
+         style="font-style:normal;font-weight:normal;font-size:7.05556px;line-height:1.25;font-family:sans-serif;letter-spacing:0px;word-spacing:0px;fill:#000000;fill-opacity:1;stroke:none;stroke-width:0.0690111"
+         x="-18.502264"
+         y="65.642387"
+         id="text83"><tspan
+           sodipodi:role="line"
+           x="-18.502264"
+           y="65.642387"
+           style="font-style:normal;font-variant:normal;font-weight:bold;font-stretch:normal;font-size:7.05556px;font-family:sans-serif;-inkscape-font-specification:'sans-serif Bold';text-align:center;text-anchor:middle;fill:#800000;stroke-width:0.0690111"
+           id="tspan83">HQD</tspan></text>
+      <ellipse
+         style="fill:#800000;fill-opacity:0;stroke:#800000;stroke-width:1;stroke-dasharray:none;stroke-dashoffset:0"
+         id="ellipse83"
+         cx="-18.407015"
+         cy="63.2188"
+         rx="13.317666"
+         ry="4.4124799" />
+      <path
+         style="fill:#800000;fill-opacity:0;stroke:#800000;stroke-width:1;stroke-dasharray:none;stroke-dashoffset:0;marker-end:url(#Triangle)"
+         d="M -4.6361224,63.2188 H 10.606988"
+         id="path83" />
+    </g>
+    <g
+       id="g85"
+       transform="translate(0,85.195881)">
+      <text
+         xml:space="preserve"
+         style="font-style:normal;font-weight:normal;font-size:7.05556px;line-height:1.25;font-family:sans-serif;letter-spacing:0px;word-spacing:0px;fill:#000000;fill-opacity:1;stroke:none;stroke-width:0.0690111"
+         x="-18.502264"
+         y="65.642387"
+         id="text84"><tspan
+           sodipodi:role="line"
+           x="-18.502264"
+           y="65.642387"
+           style="font-style:normal;font-variant:normal;font-weight:bold;font-stretch:normal;font-size:7.05556px;font-family:sans-serif;-inkscape-font-specification:'sans-serif Bold';text-align:center;text-anchor:middle;fill:#800000;stroke-width:0.0690111"
+           id="tspan84">HQD</tspan></text>
+      <ellipse
+         style="fill:#800000;fill-opacity:0;stroke:#800000;stroke-width:1;stroke-dasharray:none;stroke-dashoffset:0"
+         id="ellipse84"
+         cx="-18.407015"
+         cy="63.2188"
+         rx="13.317666"
+         ry="4.4124799" />
+      <path
+         style="fill:#800000;fill-opacity:0;stroke:#800000;stroke-width:1;stroke-dasharray:none;stroke-dashoffset:0;marker-end:url(#Triangle)"
+         d="M -4.6361224,63.2188 H 10.606988"
+         id="path84" />
+    </g>
+    <g
+       id="g86"
+       transform="translate(0,99.48339)">
+      <text
+         xml:space="preserve"
+         style="font-style:normal;font-weight:normal;font-size:7.05556px;line-height:1.25;font-family:sans-serif;letter-spacing:0px;word-spacing:0px;fill:#000000;fill-opacity:1;stroke:none;stroke-width:0.0690111"
+         x="-18.502264"
+         y="65.642387"
+         id="text85"><tspan
+           sodipodi:role="line"
+           x="-18.502264"
+           y="65.642387"
+           style="font-style:normal;font-variant:normal;font-weight:bold;font-stretch:normal;font-size:7.05556px;font-family:sans-serif;-inkscape-font-specification:'sans-serif Bold';text-align:center;text-anchor:middle;fill:#800000;stroke-width:0.0690111"
+           id="tspan85">HQD</tspan></text>
+      <ellipse
+         style="fill:#800000;fill-opacity:0;stroke:#800000;stroke-width:1;stroke-dasharray:none;stroke-dashoffset:0"
+         id="ellipse85"
+         cx="-18.407015"
+         cy="63.2188"
+         rx="13.317666"
+         ry="4.4124799" />
+      <path
+         style="fill:#800000;fill-opacity:0;stroke:#800000;stroke-width:1;stroke-dasharray:none;stroke-dashoffset:0;marker-end:url(#Triangle)"
+         d="M -4.6361224,63.2188 H 10.606988"
+         id="path85" />
+    </g>
+    <text
+       xml:space="preserve"
+       style="font-style:normal;font-weight:normal;font-size:5.64444px;line-height:1.25;font-family:sans-serif;letter-spacing:0px;word-spacing:0px;fill:#000000;fill-opacity:1;stroke:none;stroke-width:0.0690111"
+       x="-35.2131"
+       y="54.673237"
+       id="text86"><tspan
+         sodipodi:role="line"
+         x="-35.2131"
+         y="54.673237"
+         style="font-style:normal;font-variant:normal;font-weight:bold;font-stretch:normal;font-size:5.64444px;font-family:sans-serif;-inkscape-font-specification:'sans-serif Bold';text-align:center;text-anchor:middle;stroke-width:0.0690111"
+         id="tspan86">Registers</tspan></text>
+    <path
+       style="fill:#800000;fill-opacity:0;stroke:#1a1a1a;stroke-width:1;stroke-dasharray:1, 1;stroke-dashoffset:0;marker-end:url(#ArrowWide)"
+       d="m -45.247972,57.442462 v 5.888987 h 11.344412"
+       id="path86"
+       sodipodi:nodetypes="ccc" />
+    <text
+       xml:space="preserve"
+       style="font-style:normal;font-weight:normal;font-size:7.05556px;line-height:1.25;font-family:sans-serif;letter-spacing:0px;word-spacing:0px;fill:#000000;fill-opacity:1;stroke:none;stroke-width:0.0690111"
+       x="-74.441521"
+       y="82.441582"
+       id="text87"><tspan
+         sodipodi:role="line"
+         x="-74.441521"
+         y="82.441582"
+         style="font-style:normal;font-variant:normal;font-weight:bold;font-stretch:normal;font-size:7.05556px;font-family:sans-serif;-inkscape-font-specification:'sans-serif Bold';text-align:center;text-anchor:middle;stroke-width:0.0690111"
+         id="tspan87">MQD</tspan></text>
+    <text
+       xml:space="preserve"
+       style="font-style:normal;font-weight:normal;font-size:7.05556px;line-height:1.25;font-family:sans-serif;letter-spacing:0px;word-spacing:0px;fill:#000000;fill-opacity:1;stroke:none;stroke-width:0.0690111"
+       x="-74.441521"
+       y="99.240776"
+       id="text88"><tspan
+         sodipodi:role="line"
+         x="-74.441521"
+         y="99.240776"
+         style="font-style:normal;font-variant:normal;font-weight:bold;font-stretch:normal;font-size:7.05556px;font-family:sans-serif;-inkscape-font-specification:'sans-serif Bold';text-align:center;text-anchor:middle;stroke-width:0.0690111"
+         id="tspan88">MQD</tspan></text>
+    <text
+       xml:space="preserve"
+       style="font-style:normal;font-weight:normal;font-size:7.05556px;line-height:1.25;font-family:sans-serif;letter-spacing:0px;word-spacing:0px;fill:#000000;fill-opacity:1;stroke:none;stroke-width:0.0690111"
+       x="-74.441521"
+       y="116.03998"
+       id="text89"><tspan
+         sodipodi:role="line"
+         x="-74.441521"
+         y="116.03998"
+         style="font-style:normal;font-variant:normal;font-weight:bold;font-stretch:normal;font-size:7.05556px;font-family:sans-serif;-inkscape-font-specification:'sans-serif Bold';text-align:center;text-anchor:middle;stroke-width:0.0690111"
+         id="tspan89">MQD</tspan></text>
+    <text
+       xml:space="preserve"
+       style="font-style:normal;font-weight:normal;font-size:7.05556px;line-height:1.25;font-family:sans-serif;letter-spacing:0px;word-spacing:0px;fill:#000000;fill-opacity:1;stroke:none;stroke-width:0.0690111"
+       x="-74.441521"
+       y="132.83917"
+       id="text90"><tspan
+         sodipodi:role="line"
+         x="-74.441521"
+         y="132.83917"
+         style="font-style:normal;font-variant:normal;font-weight:bold;font-stretch:normal;font-size:7.05556px;font-family:sans-serif;-inkscape-font-specification:'sans-serif Bold';text-align:center;text-anchor:middle;stroke-width:0.0690111"
+         id="tspan90">MQD</tspan></text>
+    <text
+       xml:space="preserve"
+       style="font-style:normal;font-weight:normal;font-size:7.05556px;line-height:1.25;font-family:sans-serif;letter-spacing:0px;word-spacing:0px;fill:#000000;fill-opacity:1;stroke:none;stroke-width:0.0690111"
+       x="-74.441521"
+       y="168.3002"
+       id="text91"><tspan
+         sodipodi:role="line"
+         x="-74.441521"
+         y="168.3002"
+         style="font-style:normal;font-variant:normal;font-weight:bold;font-stretch:normal;font-size:7.05556px;font-family:sans-serif;-inkscape-font-specification:'sans-serif Bold';text-align:center;text-anchor:middle;stroke-width:0.0690111"
+         id="tspan91">MQD</tspan></text>
+    <text
+       xml:space="preserve"
+       style="font-style:normal;font-weight:normal;font-size:10.5833px;line-height:1.25;font-family:sans-serif;letter-spacing:0px;word-spacing:0px;fill:#000000;fill-opacity:1;stroke:none;stroke-width:0.0690111"
+       x="-74.441521"
+       y="148.1461"
+       id="text92"><tspan
+         sodipodi:role="line"
+         x="-74.441521"
+         y="148.1461"
+         style="font-style:normal;font-variant:normal;font-weight:bold;font-stretch:normal;font-size:10.5833px;font-family:sans-serif;-inkscape-font-specification:'sans-serif Bold';text-align:center;writing-mode:tb-rl;text-anchor:middle;stroke-width:0.0690111"
+         id="tspan92">...</tspan></text>
+    <g
+       id="g97"
+       transform="translate(-5.8208336)">
+      <rect
+         style="fill:#aaffcc;fill-opacity:1;stroke:#1a1a1a;stroke-width:0.5;stroke-dasharray:none;stroke-dashoffset:0"
+         id="rect96"
+         width="58.726093"
+         height="27.598055"
+         x="-142.96434"
+         y="46.852512" />
+      <text
+         xml:space="preserve"
+         style="font-style:normal;font-weight:normal;font-size:4.23333px;line-height:1.25;font-family:sans-serif;text-align:start;letter-spacing:0px;word-spacing:0px;text-anchor:start;fill:#000000;fill-opacity:1;stroke:none;stroke-width:0.0690111"
+         x="-139.74622"
+         y="52.62756"
+         id="text93"><tspan
+           sodipodi:role="line"
+           x="-139.74622"
+           y="52.62756"
+           style="font-style:normal;font-variant:normal;font-weight:bold;font-stretch:normal;font-size:4.23333px;font-family:sans-serif;-inkscape-font-specification:'sans-serif Bold';text-align:start;text-anchor:start;stroke-width:0.0690111"
+           id="tspan93">HQD Registers</tspan><tspan
+           sodipodi:role="line"
+           x="-139.74622"
+           y="57.91922"
+           style="font-style:normal;font-variant:normal;font-weight:bold;font-stretch:normal;font-size:4.23333px;font-family:sans-serif;-inkscape-font-specification:'sans-serif Bold';text-align:start;text-anchor:start;stroke-width:0.0690111"
+           id="tspan95">Queue Address in the GPU</tspan><tspan
+           sodipodi:role="line"
+           x="-139.74622"
+           y="63.210884"
+           style="font-style:normal;font-variant:normal;font-weight:bold;font-stretch:normal;font-size:4.23333px;font-family:sans-serif;-inkscape-font-specification:'sans-serif Bold';text-align:start;text-anchor:start;stroke-width:0.0690111"
+           id="tspan96">Doorbell</tspan><tspan
+           sodipodi:role="line"
+           x="-139.74622"
+           y="68.502548"
+           style="font-style:normal;font-variant:normal;font-weight:bold;font-stretch:normal;font-size:4.23333px;font-family:sans-serif;-inkscape-font-specification:'sans-serif Bold';text-align:start;text-anchor:start;stroke-width:0.0690111"
+           id="tspan97">...</tspan><tspan
+           sodipodi:role="line"
+           x="-139.74622"
+           y="73.794212"
+           style="font-style:normal;font-variant:normal;font-weight:bold;font-stretch:normal;font-size:4.23333px;font-family:sans-serif;-inkscape-font-specification:'sans-serif Bold';text-align:start;text-anchor:start;stroke-width:0.0690111"
+           id="tspan94" /></text>
+    </g>
+    <text
+       xml:space="preserve"
+       style="font-style:normal;font-weight:normal;font-size:4.23333px;line-height:1.25;font-family:sans-serif;text-align:start;letter-spacing:0px;word-spacing:0px;text-anchor:start;fill:#000000;fill-opacity:1;stroke:none;stroke-width:0.0690111"
+       x="-61.293022"
+       y="-19.380915"
+       id="text93-1"><tspan
+         sodipodi:role="line"
+         x="-61.293022"
+         y="-19.380915"
+         style="font-style:normal;font-variant:normal;font-weight:bold;font-stretch:normal;font-size:4.23333px;font-family:sans-serif;-inkscape-font-specification:'sans-serif Bold';text-align:center;text-anchor:middle;stroke-width:0.0690111"
+         id="tspan104">SWITCH QUEUE:</tspan><tspan
+         sodipodi:role="line"
+         x="-61.293022"
+         y="-14.089252"
+         style="font-style:normal;font-variant:normal;font-weight:bold;font-stretch:normal;font-size:4.23333px;font-family:sans-serif;-inkscape-font-specification:'sans-serif Bold';text-align:start;text-anchor:start;stroke-width:0.0690111"
+         id="tspan101">WAIT FOR HQD_ACTIVE = 0</tspan><tspan
+         sodipodi:role="line"
+         x="-61.293022"
+         y="-8.7975903"
+         style="font-style:normal;font-variant:normal;font-weight:bold;font-stretch:normal;font-size:4.23333px;font-family:sans-serif;-inkscape-font-specification:'sans-serif Bold';text-align:start;text-anchor:start;stroke-width:0.0690111"
+         id="tspan105">SAVE QUEUE STATE TO THE MQD</tspan><tspan
+         sodipodi:role="line"
+         x="-61.293022"
+         y="-3.505928"
+         style="font-style:normal;font-variant:normal;font-weight:bold;font-stretch:normal;font-size:4.23333px;font-family:sans-serif;-inkscape-font-specification:'sans-serif Bold';text-align:start;text-anchor:start;stroke-width:0.0690111"
+         id="tspan102">COPY NEW MQD STATE</tspan><tspan
+         sodipodi:role="line"
+         x="-61.293022"
+         y="1.7857342"
+         style="font-style:normal;font-variant:normal;font-weight:bold;font-stretch:normal;font-size:4.23333px;font-family:sans-serif;-inkscape-font-specification:'sans-serif Bold';text-align:start;text-anchor:start;stroke-width:0.0690111"
+         id="tspan103">SET HQD_ACTIVE = 1</tspan></text>
+    <circle
+       style="fill:#ffeeaa;fill-opacity:1;stroke:#1a1a1a;stroke-width:1.88976;stroke-dasharray:none;stroke-dashoffset:0"
+       id="path97"
+       cx="0"
+       cy="0"
+       r="0"
+       transform="matrix(0.26458333,0,0,0.26458333,-149.03517,37.347779)" />
+    <text
+       xml:space="preserve"
+       style="font-style:normal;font-weight:normal;font-size:5.64444px;line-height:1.25;font-family:sans-serif;letter-spacing:0px;word-spacing:0px;fill:#000000;fill-opacity:1;stroke:none;stroke-width:0.0690111"
+       x="-36.659206"
+       y="-44.828983"
+       id="text106"><tspan
+         sodipodi:role="line"
+         x="-36.659206"
+         y="-44.828983"
+         style="font-style:normal;font-variant:normal;font-weight:bold;font-stretch:normal;font-size:5.64444px;font-family:sans-serif;-inkscape-font-specification:'sans-serif Bold';text-align:center;text-anchor:middle;stroke-width:0.0690111"
+         id="tspan106">Firmware</tspan></text>
+    <path
+       style="fill:none;fill-opacity:1;stroke:#1a1a1a;stroke-width:1;stroke-dasharray:none;stroke-dashoffset:0;marker-start:url(#marker109);marker-end:url(#ArrowTriangleStylized)"
+       d="M -84.242601,-9.1838245 H -98.041629 V 33.17598"
+       id="path106" />
+    <path
+       style="fill:none;fill-opacity:1;stroke:#1a1a1a;stroke-width:1;stroke-dasharray:none;stroke-dashoffset:0;marker-end:url(#Dot)"
+       d="M 9.9745536,-9.3442784 H 29.549918 V 37.170287"
+       id="path107"
+       sodipodi:nodetypes="ccc" />
+  </g>
+</svg>
-- 
2.49.0


