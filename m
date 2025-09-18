Return-Path: <linux-doc+bounces-59982-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id C825FB53744
	for <lists+linux-doc@lfdr.de>; Thu, 11 Sep 2025 17:16:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id A6C004E2CEA
	for <lists+linux-doc@lfdr.de>; Thu, 11 Sep 2025 15:16:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 512C734F49E;
	Thu, 11 Sep 2025 15:14:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="sBZlDMUR"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-io1-f45.google.com (mail-io1-f45.google.com [209.85.166.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1B3134A31E
	for <linux-doc@vger.kernel.org>; Thu, 11 Sep 2025 15:14:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757603690; cv=none; b=EdRsTCSZzXblmdhS4LyLJsRhcaHReHaXdTeG9HQ1pGnK498eD/7EQY9UNhQvBJbR0lpYembfKTFcTy30yjRZfln7923SbOrS5j0hny6HcLV0rFC9o/TYNV5SbqWwRTfFab8CAg1b8xYbfhAF6Flv0Kzwo/CrWhR+cl2zMLvYTdI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757603690; c=relaxed/simple;
	bh=gFPP5AJxajK95ebcT+ygBcwnznDTFSpDjpt5bFKHJco=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=CL1NsPl+YZqD6Ed8631HOjvaewWCMBa7m9T8aIWP2Q9+m/TiF1JGKXRMXdfUc5sHMJcfDEnpBtbUFqIP4EeVMug3F1EE4fNx4u0NocOXSQzVSd18n+yPpTewjKOTuz1cCqjX05dOWP7u/Fywz1j1eaonPXeMYxkzlXraerzxBbE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=sBZlDMUR; arc=none smtp.client-ip=209.85.166.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-io1-f45.google.com with SMTP id ca18e2360f4ac-8876462a34aso27143239f.2
        for <linux-doc@vger.kernel.org>; Thu, 11 Sep 2025 08:14:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1757603686; x=1758208486; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=TL8sBN7m+ljpvNUUKvtA2Gj21T9prXayXIxSz2NFiTU=;
        b=sBZlDMURowbtqyFhuvFBFXvaAZqP9GHX+AiR6MM5AmoPOhu/VkL8lPn6JlOwrOJjkx
         Vlqh6AjuCmydboDwDpi5l9aaIIxopf65+aJ6kwz+8mQqEw30aDHfAgGcHDzXovMrHpSg
         YBNUWD1Qi337fAuTI3PIoV1gJnIZPFGfRFW5FbcV+8/Jra3cNmbSK8N2I5u8rAndjDny
         sbpjC5TA54XNEp3UAAEPsIXhcoTx4VHRcy5qVvQLv+X7yVU7RmLsw1YXvZrReVDvZ3E7
         JsU5X/kB8qd4T7TJLl2a/tDnbo3FiBuxz6TbwONGqfQMwalkRoLWNxiheK1ZSFPMtNKB
         GXGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757603686; x=1758208486;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TL8sBN7m+ljpvNUUKvtA2Gj21T9prXayXIxSz2NFiTU=;
        b=n0HQPQu/vIqf5sQbbW18vxMZiEm5l8Qmqtyh/Ygufw8V/UEyNVGF5Gmi9XxNot72IP
         sID+mX8i62vbF2rBktbBfZoC5oi0j/IkWHt/V/jLmh9YENfCRQvtpsmk4IdEWSEMm/jb
         wNw14wYcgP580MVVv/sbBp3Q2Znu4PJtssJxn6tU+7AXghZOWeJrMM4fPmKlSLMT+U1f
         xN9zcOF1M/6yFwvIQebCqqun4dokA1cyqk3ZxVFyfLmKgrgIG3ZMy2pT0sqoaQa74eb/
         Abwog/IliK+TEmLahZSpkwqi6qIah4SQa0qkf2nZOzhkiyGbwm3JQjyqFvdkMd+qupTs
         Z3Fg==
X-Gm-Message-State: AOJu0YyIzi22Pt9GTe20sjnnnGAW5NXfbOWZkDJkBjkrwYjgqAsy0T/k
	RjHFhAVB4MWdwMB/U7MugIsxDObHCycgIHOvI2AniDT7fKPhBSR0RvRR3XqUJwwcDM0oUZM07ei
	Shbg4
X-Gm-Gg: ASbGncuBudZRp7SZcFEPQ93YFDvheHMtQUwMj6p5TNcEEgf8KwCiBZ7glG715Neuo80
	nWhrQai9FT7HIE8zRIc/HhucFipG0CBvyxapsbT3QhGXBk7bJj4ttMnBxlMUm2iBSykbewstzpn
	/IEjlGfkO9qHm6oOvGFjGKeenl6KpztcVjey7Hfoc9tlp4IW/OACWgIi7g2FbCUIYl+OdJaYbN2
	UWa8X4HgJMG2XgiBVNsdAYsnnkH1nvht+G9WWu9YrRHnSakXUR1aXY2JlhwwvoWw0SnPKi24Tw+
	eXx1ATNSkWiIFsRSWYcQfRQGpG8OgZLbmWWJQk3CI++sXLjvmzlEgAmPKNynysEPVngeCk4d79m
	lgv3A1TsFVsvbGgs6W8BzhFyCwh4KaTzgfHACVAYkfzX04MPgSioHmIHHSJkhHoElBUI8OXbsyQ
	2F+8xcpwI4pA==
X-Google-Smtp-Source: AGHT+IE6DbCHQGT3GL1n9OFvLlun1jX9ds1zSORNzE+G+6Ju2SnMa2q2FJWS74CsRl89wRYBcZzTXg==
X-Received: by 2002:a05:6602:2c06:b0:88d:4fd3:8131 with SMTP id ca18e2360f4ac-88d4fd38225mr1277407039f.19.1757603686287;
        Thu, 11 Sep 2025 08:14:46 -0700 (PDT)
Received: from ubuntu.localdomain (209-227-169-220.cpe.distributel.net. [209.227.169.220])
        by smtp.gmail.com with ESMTPSA id ca18e2360f4ac-88f2fabab2bsm68042039f.24.2025.09.11.08.14.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Sep 2025 08:14:45 -0700 (PDT)
From: Raymond Mao <raymond.mao@linaro.org>
To: linux-doc@vger.kernel.org,
	devicetree-spec@vger.kernel.org,
	devicetree@vger.kernel.org
Cc: ilias.apalodimas@linaro.org,
	Raymond Mao <raymond.mao@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3] docs: devicetree: overlay-notes: recommend top-level compatible in DTSO
Date: Thu, 11 Sep 2025 08:14:36 -0700
Message-Id: <20250911151436.2467758-1-raymond.mao@linaro.org>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When managing multiple base device trees and overlays in a structured
way (e.g. bundled in firmware or tools), it is helpful to identify the
intended target base DT for each overlay, which can be done via a
top-level compatible string in the overlay.

This provides a way to identify which overlays should be applied once the
DT is selected for the case when a device have a common firmware binary
which only differs on the DT and overlays.

This patch updates the document with a note and example for this
practice.
For more information on this firmware requirement, please see [1].

[1] https://github.com/FirmwareHandoff/firmware_handoff/pull/74

Suggested-by: Ilias Apalodimas <ilias.apalodimas@linaro.org>
Signed-off-by: Raymond Mao <raymond.mao@linaro.org>
---
Changes in v2:
- Updated commit message.
Changes in v3
- Rename to 'overlay-compatible' and rephrase the description accordingly.

 Documentation/devicetree/overlay-notes.rst | 32 ++++++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/Documentation/devicetree/overlay-notes.rst b/Documentation/devicetree/overlay-notes.rst
index 35e79242af9a..77284afba9a4 100644
--- a/Documentation/devicetree/overlay-notes.rst
+++ b/Documentation/devicetree/overlay-notes.rst
@@ -103,6 +103,38 @@ The above bar.dtso example modified to use target path syntax is::
     ---- bar.dtso --------------------------------------------------------------
 
 
+Overlay identification
+----------------------
+
+When managing device tree overlays dynamically - such as bundling multiple base
+device trees and overlays within firmware, initramfs, or user-space tools - it
+is important to associate each overlay with its corresponding base device tree.
+
+To support this association, each overlay should define a top-level compatible
+string (referred to as the 'overlay-compatible' string). This string is
+intended to match the top-level compatible property of the target base device
+tree.
+
+By including this identifier, higher-level software or firmware can determine
+which base device tree an overlay is compatible with, and apply it accordingly.
+
+Example usage::
+
+    ---- bar.dtso - overlay with top-level compatible string -------------------
+	/dts-v1/;
+	/plugin/;
+	/ {
+		overlay-compatible = "corp,foo";
+
+		...
+	};
+    ---- bar.dtso --------------------------------------------------------------
+
+This top-level compatible string is not required by the kernel overlay
+mechanism itself, but it is strongly recommended for managing overlays in
+scalable systems.
+
+
 Overlay in-kernel API
 --------------------------------
 
-- 
2.25.1


