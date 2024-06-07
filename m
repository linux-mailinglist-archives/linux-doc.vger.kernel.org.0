Return-Path: <linux-doc+bounces-17934-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4439A9001F8
	for <lists+linux-doc@lfdr.de>; Fri,  7 Jun 2024 13:21:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B57C3289505
	for <lists+linux-doc@lfdr.de>; Fri,  7 Jun 2024 11:21:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4A077196D87;
	Fri,  7 Jun 2024 11:17:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="ZyAELrNV"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail.zeus03.de (www.zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23DEC19596C
	for <linux-doc@vger.kernel.org>; Fri,  7 Jun 2024 11:17:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717759062; cv=none; b=bRc1QUMg72b2mVUfqI0P19Iq7QZaPVk6chhWi8vDRTtPfZo1vf9RdimLRrpeUxjLtVhib9vg4qCs23fD8+l2bM1fEYaLErYrX53+AASh48KcoDTE7RMM3qerr7/f0utTDQuW6lWyNFHNoOOFS7UTj1jumFO3SojBjoo6zIM3QNk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717759062; c=relaxed/simple;
	bh=lbvWBWPi42NN2GkXA3mS6EUr+av6uArE9Nk3wjB6eD8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZXDAWfQpef7rI1IP+kmFMeo6pAZgSaUOFIqPlvvnn7kDaC6bwxGn+HUqaULCfldI0/WGIUqrP60dVWT6jOljEdaJNsn+ZHtJcKTDrqvwXL85MKT+rYHmArqPYjLinivw8D0xpwX29Gb8shgYlM3Q2B6xuFEHGDdi7tuVwybm/7E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=ZyAELrNV; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	 s=k1; bh=xpWAgWIklcSs44NZ3ZsCd8hwUImHcWihjPcnMES+ZJY=; b=ZyAELr
	NVfznHIgJ9+YBkCanfn8+BkD9c/ZmLezK2Ne1ATs21VksJHqHiJHb4hIbdaa/9NU
	UcM20YISFf4BLiAaAdCwKA3T1K3tUZ0Hasz7SnWqDE9aGLz/nS0OFd74X17D7VNL
	vixkMxJ7S9pZx9pufSDf3dpx8I46f2TTpoprXyNiStw78pGMZC5y4DzSt67JpOja
	vh+bqlK4Rqs0QMt3W9VUzKMxlXBGPKmKHCZPLJ6b0sMMzXI35QUH0rh/no+86Ywe
	9ooyU710zuuYO4V5l1Mfhjhcb7Lh0mSxV+GSOVF90a6Li8NdpMT1Ro8XCebrFUXs
	+DAQD7IRnFh3UyPg==
Received: (qmail 3292269 invoked from network); 7 Jun 2024 13:17:35 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 7 Jun 2024 13:17:35 +0200
X-UD-Smtp-Session: l3s3148p1@JfVN8koaIrAgAwDPXzLGAH1eNELjOc3g
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-i2c@vger.kernel.org
Cc: Easwar Hariharan <eahariha@linux.microsoft.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	linux-doc@vger.kernel.org,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH 4/5] docs: i2c: summary: document use of inclusive language
Date: Fri,  7 Jun 2024 13:17:23 +0200
Message-ID: <20240607111726.12678-5-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240607111726.12678-1-wsa+renesas@sang-engineering.com>
References: <20240607111726.12678-1-wsa+renesas@sang-engineering.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

We now have the updated I2C specs and our own Code of Conduct, so we
have all we need to switch over to the inclusive terminology. Define
them here.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 Documentation/i2c/i2c_bus.svg | 15 ++++++++-------
 Documentation/i2c/summary.rst | 23 +++++++++++++++++------
 2 files changed, 25 insertions(+), 13 deletions(-)

diff --git a/Documentation/i2c/i2c_bus.svg b/Documentation/i2c/i2c_bus.svg
index 3170de976373..45801de4af7d 100644
--- a/Documentation/i2c/i2c_bus.svg
+++ b/Documentation/i2c/i2c_bus.svg
@@ -1,5 +1,6 @@
 <?xml version="1.0" encoding="UTF-8" standalone="no"?>
 <!-- Created with Inkscape (http://www.inkscape.org/) -->
+<!-- Updated to inclusive terminology by Wolfram Sang -->
 
 <svg
    xmlns:dc="http://purl.org/dc/elements/1.1/"
@@ -1120,7 +1121,7 @@
     <rect
        style="opacity:1;fill:#ffb9b9;fill-opacity:1;stroke:#f00000;stroke-width:2.8125;stroke-linecap:round;stroke-linejoin:round;stroke-miterlimit:4;stroke-dasharray:none;stroke-opacity:1"
        id="rect4424-3-2-9-7"
-       width="112.5"
+       width="134.5"
        height="113.75008"
        x="112.5"
        y="471.11221"
@@ -1133,15 +1134,15 @@
        y="521.46259"
        id="text4349"><tspan
          sodipodi:role="line"
-         x="167.5354"
+         x="178.5354"
          y="521.46259"
          style="font-size:25px;line-height:1.25;font-family:sans-serif;text-align:center;text-anchor:middle"
          id="tspan1273">I2C</tspan><tspan
          sodipodi:role="line"
-         x="167.5354"
+         x="178.5354"
          y="552.71259"
          style="font-size:25px;line-height:1.25;font-family:sans-serif;text-align:center;text-anchor:middle"
-         id="tspan1285">Master</tspan></text>
+         id="tspan1285">Controller</tspan></text>
     <rect
        style="color:#000000;clip-rule:nonzero;display:inline;overflow:visible;visibility:visible;opacity:1;isolation:auto;mix-blend-mode:normal;color-interpolation:sRGB;color-interpolation-filters:linearRGB;solid-color:#000000;solid-opacity:1;fill:#b9ffb9;fill-opacity:1;fill-rule:nonzero;stroke:#006400;stroke-width:2.8125;stroke-linecap:round;stroke-linejoin:round;stroke-miterlimit:4;stroke-dasharray:none;stroke-dashoffset:0;stroke-opacity:1;color-rendering:auto;image-rendering:auto;shape-rendering:auto;text-rendering:auto;enable-background:accumulate"
        id="rect4424-3-2-9-7-3-3-5-3"
@@ -1171,7 +1172,7 @@
          x="318.59131"
          y="552.08752"
          style="font-size:25.00000191px;line-height:1.25;font-family:sans-serif;text-align:center;text-anchor:middle;stroke-width:1px"
-         id="tspan1287">Slave</tspan></text>
+         id="tspan1287">Target</tspan></text>
     <path
        style="fill:none;fill-rule:evenodd;stroke:#000000;stroke-width:1.99968767;stroke-linecap:butt;stroke-linejoin:miter;stroke-miterlimit:4;stroke-dasharray:none;stroke-opacity:1"
        d="m 112.49995,677.36223 c 712.50005,0 712.50005,0 712.50005,0"
@@ -1233,7 +1234,7 @@
          x="468.59131"
          y="552.08746"
          style="font-size:25.00000191px;line-height:1.25;font-family:sans-serif;text-align:center;text-anchor:middle;stroke-width:1px"
-         id="tspan1287-6">Slave</tspan></text>
+         id="tspan1287-6">Target</tspan></text>
     <rect
        style="color:#000000;clip-rule:nonzero;display:inline;overflow:visible;visibility:visible;opacity:1;isolation:auto;mix-blend-mode:normal;color-interpolation:sRGB;color-interpolation-filters:linearRGB;solid-color:#000000;solid-opacity:1;vector-effect:none;fill:#b9ffb9;fill-opacity:1;fill-rule:nonzero;stroke:#006400;stroke-width:2.8125;stroke-linecap:round;stroke-linejoin:round;stroke-miterlimit:4;stroke-dasharray:none;stroke-dashoffset:0;stroke-opacity:1;color-rendering:auto;image-rendering:auto;shape-rendering:auto;text-rendering:auto;enable-background:accumulate"
        id="rect4424-3-2-9-7-3-3-5-3-1"
@@ -1258,7 +1259,7 @@
          x="618.59131"
          y="552.08746"
          style="font-size:25.00000191px;line-height:1.25;font-family:sans-serif;text-align:center;text-anchor:middle;stroke-width:1px"
-         id="tspan1287-9">Slave</tspan></text>
+         id="tspan1287-9">Target</tspan></text>
     <path
        style="fill:none;fill-rule:evenodd;stroke:#000000;stroke-width:1.99968743;stroke-linecap:butt;stroke-linejoin:miter;stroke-miterlimit:4;stroke-dasharray:none;stroke-opacity:1;marker-end:url(#DotM)"
        d="m 150,583.61221 v 93.75"
diff --git a/Documentation/i2c/summary.rst b/Documentation/i2c/summary.rst
index a1e5c0715f8b..b10b6aaafcec 100644
--- a/Documentation/i2c/summary.rst
+++ b/Documentation/i2c/summary.rst
@@ -31,15 +31,16 @@ implement all the common SMBus protocol semantics or messages.
 Terminology
 ===========
 
-Using the terminology from the official documentation, the I2C bus connects
-one or more *master* chips and one or more *slave* chips.
+The I2C bus connects one or more *controller* chips and one or more *target*
+chips.
+
 
 .. kernel-figure::  i2c_bus.svg
-   :alt:    Simple I2C bus with one master and 3 slaves
+   :alt:    Simple I2C bus with one controller and 3 targets
 
    Simple I2C bus
 
-A **master** chip is a node that starts communications with slaves. In the
+A **controller** chip is a node that starts communications with targets. In the
 Linux kernel implementation it is called an **adapter** or bus. Adapter
 drivers are in the ``drivers/i2c/busses/`` subdirectory.
 
@@ -48,8 +49,8 @@ whole class of I2C adapters. Each specific adapter driver either depends on
 an algorithm driver in the ``drivers/i2c/algos/`` subdirectory, or includes
 its own implementation.
 
-A **slave** chip is a node that responds to communications when addressed
-by the master. In Linux it is called a **client**. Client drivers are kept
+A **target** chip is a node that responds to communications when addressed
+by the controller. In Linux it is called a **client**. Client drivers are kept
 in a directory specific to the feature they provide, for example
 ``drivers/media/gpio/`` for GPIO expanders and ``drivers/media/i2c/`` for
 video-related chips.
@@ -57,3 +58,13 @@ video-related chips.
 For the example configuration in figure, you will need a driver for your
 I2C adapter, and drivers for your I2C devices (usually one driver for each
 device).
+
+Outdated terminology
+--------------------
+
+Historically, controller was named "master" and client was named "slave". These
+terms have been obsoleted with v7 of the specification and their use is also
+discouraged by the Linux Kernel Code of Conduct. You may still find them in
+references to documentation which has not been updated. The general attitude,
+however, is to use the inclusive terms: controller and target. Work to switch
+over the Linux Kernel is on-going.
-- 
2.43.0


