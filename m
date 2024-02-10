Return-Path: <linux-doc+bounces-8925-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 477868504EB
	for <lists+linux-doc@lfdr.de>; Sat, 10 Feb 2024 16:26:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 08AFC2848C1
	for <lists+linux-doc@lfdr.de>; Sat, 10 Feb 2024 15:26:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 36BA85BAD4;
	Sat, 10 Feb 2024 15:26:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=toblux-com.20230601.gappssmtp.com header.i=@toblux-com.20230601.gappssmtp.com header.b="jwAdUhY3"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5771D5BAC9
	for <linux-doc@vger.kernel.org>; Sat, 10 Feb 2024 15:26:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707578771; cv=none; b=uHD8hXV3bAxfU0R9lwJfj7FLJejcKv9+QeZnMt0tnOI8/s/1xylBnZfMH58OFaaXXC/vZzUXw4lPfnOsC1JEBPyfdBfdPTYFsOIh2x8CZICs7Sj6w6HtCD+ncZh/1lFIVRWLv7SNOJMc/ImkWUsiUAvVktI8lYy7Tj7VqhWszfU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707578771; c=relaxed/simple;
	bh=tOFJUUP7k2JdlGYWPTNxc4kTqYeXGnoeVDQZcY/8oMc=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=gwk2lGkkN9LMkr2x/y3rLouvsOrinzSfWJYu0Ec/+2xKq+5KA9owF1R+jtoZ4ttYAJcIA7aJ3HkzofdnoibkeqSwa3+9S+aA28JJwvPiwG8fQWIGrKgq6G8yMa0p44ehkuEIqi55jI1TubJG805rvwOpN/af1YKlGPuQcOR+h8s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=toblux.com; spf=none smtp.mailfrom=toblux.com; dkim=pass (2048-bit key) header.d=toblux-com.20230601.gappssmtp.com header.i=@toblux-com.20230601.gappssmtp.com header.b=jwAdUhY3; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=toblux.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=toblux.com
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-a3864258438so338827866b.0
        for <linux-doc@vger.kernel.org>; Sat, 10 Feb 2024 07:26:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=toblux-com.20230601.gappssmtp.com; s=20230601; t=1707578767; x=1708183567; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Xc8zG3JGrmcRlzecZf+KRmHBE/zsgx/r7nzxBVCSCZY=;
        b=jwAdUhY37IzeHle90yqh5zq+//MytfLOvMZIbEMPZ18eb444luThzUKHLkIkjoXp/F
         OzGuX8ACTIjsnisDLyvuvxMIukYV1S6sao47u9HirZqFP4I0P0eWZJOiiQr7ZD1VTZRR
         Xu6sOdnlgp02xSDxnYXy2XVqhzU6dg5COYA0bBwsOBiRu+bbvz/hpfJTtLyW8js9F9gx
         iCOLHH5kYw5NI52YwxPdfdM1UvG8Y6t74M+SLVGjlU/PZyWKby1s0AjQt75IiT55nUoA
         fKZs3gIqIHrRbqNOctulZQSSXch76zaZPosnE0C9UQvhcvhcF/JJDoGkfuRNbEo/aUcX
         jIJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707578767; x=1708183567;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Xc8zG3JGrmcRlzecZf+KRmHBE/zsgx/r7nzxBVCSCZY=;
        b=RS54ur5eU4NsxDgb0dyrimszHJqeJcsqNybrMJ/cENyykq2Z5FvO/PucOjJiWflEhv
         Ifczo/u7a9bXSX0vpCragXUJ9gUeojVXV8dbadYZ8O0SWmYTgIX3T74MoVSGxZlFJvRA
         7LgiydsP33drlFFU1iuX5Lfb1k2EFItbKd2theBvuRGuBzUYJI9OpwLGh7RsY2rSbCaD
         Y4g4xPMsuERkak51QNBW7x06+B0cBT+5EyyVTNZAiwHTdfo3Y3mo1TL2JK7wmKPU/h4G
         EZvNUfxaQufbSaB6KhFDeSCOacm7OahCLfnJWKP3IELCIsPd01ukU4OETHdEnGHIUc5u
         H5sQ==
X-Forwarded-Encrypted: i=1; AJvYcCUgbofPM/XPeOBPbJkiJiPIYRefjKRToIwe5+q/9WS5qGrYnV0zz89h/+o6JBmNw2veANmf6WbvM79Gka2lKBI4bTLkCiXm1oMh
X-Gm-Message-State: AOJu0YwoVV5pFL79EweoTMtgsPY2REHOQVxihedDeVtC4TOASlcgp3lj
	nYw4SkKwO7oPB/h58lFzm89Qtz/AOEJ87SX0jlG3aS740AtJUO2YuhKIGOA7GS0=
X-Google-Smtp-Source: AGHT+IE7sLmeGOAzHsq1dSFkY247mIg0hXk0uTfwY8SVCxe4fxvZSLwGKhrW+wJimWNNxuxLj7+6xA==
X-Received: by 2002:a17:906:358f:b0:a3b:fbc0:cd16 with SMTP id o15-20020a170906358f00b00a3bfbc0cd16mr2156395ejb.24.1707578767378;
        Sat, 10 Feb 2024 07:26:07 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWhpehmZvgtBcp48iLdVF39bW+I6Wi8cjtMQVPsgjJTnRB5CdJCPbGoxlXTMZYvjiMxZ4p3dn16/NoNIeyJ6xfTeO7EGaXRbjDOnTL46kV726XrGot7mGwwkqEYupXsOI/7qF8YBlFqrEuCTLaT8Pizev+bLiqyxJnp4yZB6Yz9IRUa3yrY2fPfnhRRCNq7xkocr9TdpWrn7L4+sWMfSII/KZNFoQpRtmZ1G+OD0XVgbtOga4MIGpNfvqeW5P5PPWPSQSBpIw==
Received: from debian.fritz.box (aftr-82-135-80-180.dynamic.mnet-online.de. [82.135.80.180])
        by smtp.gmail.com with ESMTPSA id w9-20020a170906130900b00a35ed4fd4cesm1881126ejb.115.2024.02.10.07.26.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 Feb 2024 07:26:06 -0800 (PST)
From: Thorsten Blum <thorsten.blum@toblux.com>
To: Jonathan Corbet <corbet@lwn.net>
Cc: Masahiro Yamada <masahiroy@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nicolas@fjasle.eu>,
	linux-kbuild@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Thorsten Blum <thorsten.blum@toblux.com>
Subject: [PATCH] docs: kbuild: Kconfig: Fix grammar and formatting
Date: Sat, 10 Feb 2024 16:20:04 +0100
Message-Id: <20240210152003.861-1-thorsten.blum@toblux.com>
X-Mailer: git-send-email 2.39.2
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

- Remove unnecessary spaces
- Fix grammar s/to solution/solution/
- Remove newline to be consistent with other headings

Signed-off-by: Thorsten Blum <thorsten.blum@toblux.com>
---
 Documentation/kbuild/Kconfig.recursion-issue-01 | 6 +++---
 Documentation/kbuild/kconfig.rst                | 1 -
 2 files changed, 3 insertions(+), 4 deletions(-)

diff --git a/Documentation/kbuild/Kconfig.recursion-issue-01 b/Documentation/kbuild/Kconfig.recursion-issue-01
index e8877db0461f..ac49836d8ecf 100644
--- a/Documentation/kbuild/Kconfig.recursion-issue-01
+++ b/Documentation/kbuild/Kconfig.recursion-issue-01
@@ -16,13 +16,13 @@
 # that are possible for CORE. So for example if CORE_BELL_A_ADVANCED is 'y',
 # CORE must be 'y' too.
 #
-#  * What influences CORE_BELL_A_ADVANCED ?
+#  * What influences CORE_BELL_A_ADVANCED?
 #
 # As the name implies CORE_BELL_A_ADVANCED is an advanced feature of
 # CORE_BELL_A so naturally it depends on CORE_BELL_A. So if CORE_BELL_A is 'y'
 # we know CORE_BELL_A_ADVANCED can be 'y' too.
 #
-#   * What influences CORE_BELL_A ?
+#   * What influences CORE_BELL_A?
 #
 # CORE_BELL_A depends on CORE, so CORE influences CORE_BELL_A.
 #
@@ -34,7 +34,7 @@
 # the "recursive dependency detected" error.
 #
 # Reading the Documentation/kbuild/Kconfig.recursion-issue-01 file it may be
-# obvious that an easy to solution to this problem should just be the removal
+# obvious that an easy solution to this problem should just be the removal
 # of the "select CORE" from CORE_BELL_A_ADVANCED as that is implicit already
 # since CORE_BELL_A depends on CORE. Recursive dependency issues are not always
 # so trivial to resolve, we provide another example below of practical
diff --git a/Documentation/kbuild/kconfig.rst b/Documentation/kbuild/kconfig.rst
index c946eb44bd13..766f9cb518df 100644
--- a/Documentation/kbuild/kconfig.rst
+++ b/Documentation/kbuild/kconfig.rst
@@ -45,7 +45,6 @@ file name to override the default name of ".config".
 
 KCONFIG_DEFCONFIG_LIST
 ----------------------
-
 This environment variable specifies a list of config files which can be used
 as a base configuration in case the .config does not exist yet. Entries in
 the list are separated with whitespaces to each other, and the first one
-- 
2.39.2


