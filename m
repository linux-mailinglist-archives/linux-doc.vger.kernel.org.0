Return-Path: <linux-doc+bounces-43496-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A4FFDA92467
	for <lists+linux-doc@lfdr.de>; Thu, 17 Apr 2025 19:53:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8CA1F3B8C1F
	for <lists+linux-doc@lfdr.de>; Thu, 17 Apr 2025 17:53:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E748F2566FB;
	Thu, 17 Apr 2025 17:53:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=antheas.dev header.i=@antheas.dev header.b="s6qexdTj"
X-Original-To: linux-doc@vger.kernel.org
Received: from linux1587.grserver.gr (linux1587.grserver.gr [185.138.42.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 501072566C4;
	Thu, 17 Apr 2025 17:53:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.138.42.100
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744912410; cv=none; b=dUx9xcstTSRo2w2f8Sj1iRY3NMQ3vmUcm2Ouv3c2cZBQuE+4p8U8vDHnBSgI/IWJB1fMuxMJucVcOlXr8B8dKQLC+glBYcgnQJZhu4xCB1G3KSqCy/KB0WGvV3mTrF3MJ62nq4Y/fRV8S+FhzqDDEvKGTsZh/OUvkmma2I9a4OE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744912410; c=relaxed/simple;
	bh=32EjIPtZXp/rf4ttCzgCwCUDL15K7aMZ0/DvvRvlLKg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=opZefkMZOoAtw8d9x3gu5j0QK9IpK8iQcKlatrphiay1eRcsaijsyOuibK6iWVtt6mz3IZk4o08G9pS7wLVukoc3IVpX5BzRbPboG+IelCna0lj51asAguFq5bB6L+jIEG0w3oYDWD3CHEW88b0jOyWClYRCkTIxVeEwPprLMLY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=antheas.dev; spf=pass smtp.mailfrom=antheas.dev; dkim=pass (1024-bit key) header.d=antheas.dev header.i=@antheas.dev header.b=s6qexdTj; arc=none smtp.client-ip=185.138.42.100
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=antheas.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=antheas.dev
Received: from localhost.localdomain (unknown [IPv6:2a05:f6c2:511b:0:cbc0:999f:73ad:33bd])
	by linux1587.grserver.gr (Postfix) with ESMTPSA id 162552E08699;
	Thu, 17 Apr 2025 20:53:25 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=antheas.dev;
	s=default; t=1744912406;
	bh=qE5ChC30UpmwauKSNSAaNybCBbXeDCOAvfXA41bKRPY=; h=From:To:Subject;
	b=s6qexdTjhCKatgbEpPNcZt+QKfvuGAIjJ6e6HmWLMoEtwwSLDwG367iqWqxcSxhOh
	 8sHW/svc3ouS8x0aQPztmJE69KtXz4fSZLsci/01vBzrvWLqFSuzWh5pirwuJz5zUW
	 f4ey/CwU/qg71zUe3bC44T1jwfkAp73qtoSgg8lI=
Authentication-Results: linux1587.grserver.gr;
	spf=pass (sender IP is 2a05:f6c2:511b:0:cbc0:999f:73ad:33bd) smtp.mailfrom=lkml@antheas.dev smtp.helo=localhost.localdomain
Received-SPF: pass (linux1587.grserver.gr: connection is authenticated)
From: Antheas Kapenekakis <lkml@antheas.dev>
To: platform-driver-x86@vger.kernel.org
Cc: linux-hwmon@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-pm@vger.kernel.org,
	Guenter Roeck <linux@roeck-us.net>,
	Jean Delvare <jdelvare@suse.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Joaquin Ignacio Aramendia <samsagax@gmail.com>,
	Derek J Clark <derekjohn.clark@gmail.com>,
	Kevin Greenberg <kdgreenberg234@protonmail.com>,
	Joshua Tam <csinaction@pm.me>,
	Parth Menon <parthasarathymenon@gmail.com>,
	Eileen <eileen@one-netbook.com>,
	linux-kernel@vger.kernel.org,
	sre@kernel.org,
	linux@weissschuh.net,
	ilpo.jarvinen@linux.intel.com,
	hdegoede@redhat.com,
	mario.limonciello@amd.com,
	Antheas Kapenekakis <lkml@antheas.dev>
Subject: [PATCH v9 04/15] ABI: testing: sysfs-class-oxp: add missing
 documentation
Date: Thu, 17 Apr 2025 19:52:59 +0200
Message-ID: <20250417175310.3552671-5-lkml@antheas.dev>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250417175310.3552671-1-lkml@antheas.dev>
References: <20250417175310.3552671-1-lkml@antheas.dev>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-PPP-Message-ID: 
 <174491240664.24883.8188525224180457173@linux1587.grserver.gr>
X-PPP-Vhost: antheas.dev
X-Virus-Scanned: clamav-milter 0.103.11 at linux1587.grserver.gr
X-Virus-Status: Clean

Add missing documentation about the tt_toggle attribute that was
added in kernel 6.5.

Fixes: be144ee491272 ("hwmon: (oxp-sensors) Add tt_toggle attribute on supported boards")
Reviewed-by: Thomas Weißschuh <linux@weissschuh.net>
Reviewed-by: Derek J. Clark <derekjohn.clark@gmail.com>
Signed-off-by: Antheas Kapenekakis <lkml@antheas.dev>
---
 Documentation/ABI/testing/sysfs-platform-oxp | 13 +++++++++++++
 1 file changed, 13 insertions(+)
 create mode 100644 Documentation/ABI/testing/sysfs-platform-oxp

diff --git a/Documentation/ABI/testing/sysfs-platform-oxp b/Documentation/ABI/testing/sysfs-platform-oxp
new file mode 100644
index 0000000000000..091269ab2c8c4
--- /dev/null
+++ b/Documentation/ABI/testing/sysfs-platform-oxp
@@ -0,0 +1,13 @@
+What:		/sys/devices/platform/<platform>/tt_toggle
+Date:		Jun 2023
+KernelVersion:	6.5
+Contact:	"Antheas Kapenekakis" <lkml@antheas.dev>
+Description:
+		Takeover TDP controls from the device. OneXPlayer devices have a
+		turbo button that can be used to switch between two TDP modes
+		(usually 15W and 25W). By setting this attribute to 1, this
+		functionality is disabled, handing TDP control over to (Windows)
+		userspace software and the Turbo button turns into a keyboard
+		shortcut over the AT keyboard of the device. In addition,
+		using this setting is a prerequisite for PWM control for most
+		newer models (otherwise it NOOPs).
-- 
2.49.0


