Return-Path: <linux-doc+bounces-25610-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D467984675
	for <lists+linux-doc@lfdr.de>; Tue, 24 Sep 2024 15:09:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 10666B22DF5
	for <lists+linux-doc@lfdr.de>; Tue, 24 Sep 2024 13:09:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AE58B15CD52;
	Tue, 24 Sep 2024 13:08:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Wu/BQr0R"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF2AF1DFE3
	for <linux-doc@vger.kernel.org>; Tue, 24 Sep 2024 13:08:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727183337; cv=none; b=OjlH3MSN6Ph6hXhzXPPNn0/CjwveeXYubl+sDKcAr3HYKy6hywwUb9UiMKj3GVj4drz8qBQckNnC2U6EV3Z5kAv6aYQYDdMp6YVsV9h+YkEtDtmJx7U/vzhMJUhAeljyv8T2QDOGIdaoYNlVgSuEJ05ETX49iu/W9GxHcf3gF/E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727183337; c=relaxed/simple;
	bh=20VESlFAgLL/DdDPQj1cUy8T9pMhfk2LyD0wWgYxzK8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=aprDY1HHA+DiYaJmUk+AMF7KqeN/1Q2NrEy0XdMEMLgfFRN6x/UTpTKXBxJ2d86VeqjuIB6fZVlxboqVGDFOHyevyrF+gvpZ2QMkO46MjbpwbLj7sVNUtjBb2jCFp9ukh2aJztUdqIFsfqg293piIeOmxKM7rN52vnhSlPJkE1U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Wu/BQr0R; arc=none smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-5c3df1a3cb6so1043708a12.2
        for <linux-doc@vger.kernel.org>; Tue, 24 Sep 2024 06:08:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1727183334; x=1727788134; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=bBqAdCr/Tagnq8w6gUFIkMYJLmwI/sDayqKEKgevhjY=;
        b=Wu/BQr0RfeIYKgOXvOStMxolcZCPwKfFVaXknUs5/qUfucm8PwanGI9X2Vzus6PxV7
         Qe/vIZMT4nYMaEez9ToG6NDA3ShmGfOXyaJGadc8vNAMgTvECmwAgFUljVllhgYDhGWW
         ZFxAiM2lhZ3aX9ldR9Rr6Sjdck/kCRHSkBvUo2C6eHXfljFJRh9k1tJ4txaExK9zM3HL
         GJqzu6p1gkkF+bXQKG+H12oo4DuY1Ga8TPxqpqLvJPA1TOdZV3EPo/TT0U63MPpyrN52
         nTDluP5Q9G+zFtbGmhXE4m34tVjqBvqGMMdkq0qt4yj+y31ZAJ63qQI3tNGIeJ4UO2t4
         8/5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727183334; x=1727788134;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bBqAdCr/Tagnq8w6gUFIkMYJLmwI/sDayqKEKgevhjY=;
        b=DhEml6yt9obH9LnHBRJsHxHfb7/WODIH0ch6mNMpRf+QFSiDBR0834yJ/docd5oX+v
         MvyGT957wX6udjXmqXeCrCiIFTXUaHKbWO7b6PBoCm3o6thhiZV33MwFkCg9/oCDR3aM
         hSTXKiKwBO9tFha/lh9lSUMxgVmv8Fnh9R802bCKWQLdLA4s6YxTKtQvDFKJ+DKiLj+I
         oWGfclXrdVRn6YgxO+eL9xGXuQhb7pxZ3+K16eb30rZf99zuQR4CE9+bRSpQzO4l9rkD
         wHr79EEeRlO485aX9ugccF4oR5+B1QZBS2jQqdQ/xXCzvs/vt6oq2SNntSOIrt9br4dc
         jXNA==
X-Forwarded-Encrypted: i=1; AJvYcCUvVzMDySud8+A22oiuYQSuueHUi7P1qEgJXsEtV/1oFXG8mNZmulcuLCf3thjQZAxBxI+lW7m0BUM=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyg4q0PuHhUN+5xUzIR8R6c8ORirgzmYJqis++OdtPPN82PMoh6
	hqOePPttltLBaVTkcrnLyrevM2kc+vmgQHGPpsbxgSh+WU8eP1s+mC2dT0RvU8E=
X-Google-Smtp-Source: AGHT+IG141L2UlovN7HIS3we1HyzW+NcX2RskLqTWDHr34a9VPY4jl2ref868d0s1ndXxBhKwv/sJA==
X-Received: by 2002:a17:906:dc8f:b0:a8d:2de6:cb59 with SMTP id a640c23a62f3a-a90d4fc3661mr716363766b.3.1727183333891;
        Tue, 24 Sep 2024 06:08:53 -0700 (PDT)
Received: from krzk-bin.. ([178.197.211.167])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a93930f8440sm82236666b.182.2024.09.24.06.08.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Sep 2024 06:08:53 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Arnd Bergmann <arnd@arndb.de>,
	Olof Johansson <olof@lixom.net>,
	soc@kernel.org,
	Jonathan Corbet <corbet@lwn.net>,
	linux-arm-kernel@lists.infradead.org,
	workflows@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Will Deacon <will@kernel.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Conor Dooley <conor@kernel.org>,
	=?UTF-8?q?Heiko=20St=C3=BCbner?= <heiko@sntech.de>
Subject: [PATCH] Documentation/process: maintainer-soc: clarify submitting patches
Date: Tue, 24 Sep 2024 15:08:31 +0200
Message-ID: <20240924130831.38861-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Patches for SoCs are expected to be picked up by SoC submaintainers.
The main SoC maintainers should be addressed only in few cases.

Rewrite the section about maintainer handling to document above
expectation.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Linus Walleij <linus.walleij@linaro.org>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Will Deacon <will@kernel.org>
Cc: Kevin Hilman <khilman@baylibre.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Conor Dooley <conor@kernel.org>
Cc: Heiko Stübner <heiko@sntech.de>

---

During our LPC ad-hoc BoF, we discussed improving Maintainer SoC docs
and I think I volunteered to write something.  The trouble is that
whatever I won't write in my notes, escapes my memory.

I believe this is what we discussed.  Was there anything more to
write/document?
---
 Documentation/process/maintainer-soc.rst | 42 +++++++++++++++++++++---
 1 file changed, 37 insertions(+), 5 deletions(-)

diff --git a/Documentation/process/maintainer-soc.rst b/Documentation/process/maintainer-soc.rst
index 12637530d68f..dc0136e8d852 100644
--- a/Documentation/process/maintainer-soc.rst
+++ b/Documentation/process/maintainer-soc.rst
@@ -30,10 +30,13 @@ tree as a dedicated branch covering multiple subsystems.
 The main SoC tree is housed on git.kernel.org:
   https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git/
 
+Maintainers
+-----------
+
 Clearly this is quite a wide range of topics, which no one person, or even
 small group of people are capable of maintaining.  Instead, the SoC subsystem
-is comprised of many submaintainers, each taking care of individual platforms
-and driver subdirectories.
+is comprised of many submaintainers (platform maintainers), each taking care of
+individual platforms and driver subdirectories.
 In this regard, "platform" usually refers to a series of SoCs from a given
 vendor, for example, Nvidia's series of Tegra SoCs.  Many submaintainers operate
 on a vendor level, responsible for multiple product lines.  For several reasons,
@@ -43,14 +46,43 @@ MAINTAINERS file.
 
 Most of these submaintainers have their own trees where they stage patches,
 sending pull requests to the main SoC tree.  These trees are usually, but not
-always, listed in MAINTAINERS.  The main SoC maintainers can be reached via the
-alias soc@kernel.org if there is no platform-specific maintainer, or if they
-are unresponsive.
+always, listed in MAINTAINERS.
 
 What the SoC tree is not, however, is a location for architecture-specific code
 changes.  Each architecture has its own maintainers that are responsible for
 architectural details, CPU errata and the like.
 
+Submitting Patches for Given SoC
+~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+
+All usual platform related patches should be sent via SoC submaintainers
+(platform-specific maintainers.  This includes also changes to per-platform or
+shared defconfigs (scripts/get_maintainer.pl might not provide correct
+addresses in such case).
+
+Submitting Patches to the Main SoC Maintainers
+~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+
+The main SoC maintainers can be reached via the alias soc@kernel.org only in
+following cases:
+
+1. There are no platform-specific maintainers.
+
+2. Platform-specific maintainers are unresponsive.
+
+3. Introducing a completely new SoC platform after community review.  Such new
+   SoC work should be sent first to common mailing lists, pointed out by
+   scripts/get_maintainer.pl, for community review.  After positive community
+   review, work should be sent in one patchset containing new arch/foo/Kconfig
+   entry, DTS files, MAINTAINERS file entry and optionally initial drivers with
+   their Devicetree bindings.  The MAINTAINERS file entry should list new
+   platform-specific maintainers, who are going to be responsible for handling
+   patches for the platform from now on.
+
+Note that the soc@kernel.org is not a place to discuss the patches, thus work
+sent to this address should be already considered as acceptable by the
+community.
+
 Information for (new) Submaintainers
 ------------------------------------
 
-- 
2.43.0


