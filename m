Return-Path: <linux-doc+bounces-8344-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 457AA848913
	for <lists+linux-doc@lfdr.de>; Sat,  3 Feb 2024 22:57:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 2B817B234D6
	for <lists+linux-doc@lfdr.de>; Sat,  3 Feb 2024 21:57:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 97333134D2;
	Sat,  3 Feb 2024 21:57:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=toblux-com.20230601.gappssmtp.com header.i=@toblux-com.20230601.gappssmtp.com header.b="Mm7nqW1/"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9999E134B6
	for <linux-doc@vger.kernel.org>; Sat,  3 Feb 2024 21:57:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706997468; cv=none; b=XKtErV27hbJN3Y0chwhuaLxg1w56kRjsXGiCmM6ofsyQjvt10X1EgkgmMg/3RPeoiD01tIBtNHwLTqXEzRq8KTgCc+iqCsoZJWJNlZTAZOL5LXomb4SjuXegsYtgTPUY7V5ZbWlrhDuCxF7eBIojQdFIank9NM2zR0bpPTC1hF8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706997468; c=relaxed/simple;
	bh=SRerrLKzpZQDtjHackhk1mDgOzORiSIkR/k68ytsI6o=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=iiTwovXvziokYNYeLQ8UxowLxlfD53xwxT+U8xti/HASPfKg0a+Eq9fhuzw2Sttzip58Ckj+AXq43/v4Y5JGkyZzhaMJH5EGeuY+CMEFPlu1ZsLSWhBACiwnX1wjTpaobJFw5/vH/x5B0PV1ITN1+hXVmhPtlc8q7xpoOEFV/xM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=toblux.com; spf=none smtp.mailfrom=toblux.com; dkim=pass (2048-bit key) header.d=toblux-com.20230601.gappssmtp.com header.i=@toblux-com.20230601.gappssmtp.com header.b=Mm7nqW1/; arc=none smtp.client-ip=209.85.208.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=toblux.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=toblux.com
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-2d09b21a8bbso6800181fa.3
        for <linux-doc@vger.kernel.org>; Sat, 03 Feb 2024 13:57:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=toblux-com.20230601.gappssmtp.com; s=20230601; t=1706997464; x=1707602264; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=QSh3+bsIgvBbpY5uR/zlE9QAypvU9WM+2nXDWZ8TyzQ=;
        b=Mm7nqW1/gXemg3gVWgYWHojApGf5oR9A59pVhZ2YcocQsqpQo6rsP9reVLD5kRQNAg
         G8GoQTQqPyuuHnzS9kTnc/IBBG9KPIJPHc/IrYYNN4Xlwp1xJ72m6nntPhYSJBPVrvPe
         meWnJr8/2cLGWP83gDGdVUw+LuaEdFCE/1nTxeGm3xQ+xyMnXTqw476u1YdlUO+Z8/M8
         b0GHJp0oNWRFRxq3tNObWDsjkq8XauKaG0tGPM3x+xGubVRztqz0X5MzkJ+G8F/yFJWJ
         SNpYKvNdYCQWhSAdQvpUmx4rpa61Ncvntt/piYCnqqP6tXCHtcaqo42qQXFO//YwMTHO
         cReA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706997464; x=1707602264;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QSh3+bsIgvBbpY5uR/zlE9QAypvU9WM+2nXDWZ8TyzQ=;
        b=P2P+dFjFBudYRD9bPfYOmFOAhj5WHXo+J/wN0VukykiSeRo7A/Ns0Eg3nQbQxGJGbj
         EGpdAd1YMyPKezCkAVo36YS7rgW227JmL2FIfByPcU3QIbmrU/PJ5ZvRhlWjghLwqWz4
         YKZIGxMTMIX5+7GwM5vgstOgP2Il1beu0Xep8usdTqwWTCxbuBTSh8TT7b73htEd/Swo
         opxpbDsSDUsiaBWhGwhi9kRmukxMvrzHvMz+QJ+sLl484syI5UcryBapx/1+YMKWWeqh
         32KSY4cZHNYPm7po3DBnK/OJmfhAW8jzuMdww3btvA8XEe3pe/OObuosCep87/PkEjIH
         taIg==
X-Gm-Message-State: AOJu0Yy277Qk6hZg1GSn0ImHrW+iiFKHmLztx8hQw9E7RJcY+cY+voAT
	KTBHWLURgSYMPxC3LmKK1CQ+oT8mdS7K+mAB+ZlTD/6IFE7ycUPuYe5591hb2FJlFRRmaxv98fU
	Ihlk=
X-Google-Smtp-Source: AGHT+IFeRHQIx44rRfhxF9NVxLHLBD6CaOc0wLFRwI1YmXdgVIhnXZXIwgiL9WTMlhFhEm5QNnvBXA==
X-Received: by 2002:a2e:7e07:0:b0:2cf:2491:b49f with SMTP id z7-20020a2e7e07000000b002cf2491b49fmr7795002ljc.40.1706997464450;
        Sat, 03 Feb 2024 13:57:44 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCWbkyPvLdHrWqFoyV5EtfnvFoiGmTXpyKcYEQ3DwU9iOV7UO1is0d9lZBYLJ/BpNmj4pmhjNoAl6Wuu0+/HKIZEZ74TumK1n/3ULmgDJXizfHA25SpsKlG6cGHMZy0ksdj4foJ8SqIzgzM7usBNlbV2HQuf+sTuLId6Inu9jjc6yYc=
Received: from debian.fritz.box (aftr-82-135-80-223.dynamic.mnet-online.de. [82.135.80.223])
        by smtp.gmail.com with ESMTPSA id p4-20020aa7c884000000b0055f02661ae2sm2063328eds.78.2024.02.03.13.57.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 03 Feb 2024 13:57:44 -0800 (PST)
From: Thorsten Blum <thorsten.blum@toblux.com>
To: Jonathan Corbet <corbet@lwn.net>
Cc: workflows@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Thorsten Blum <thorsten.blum@toblux.com>
Subject: [PATCH] Documentation: multiple .rst files: Fix grammar and more consistent formatting
Date: Sat,  3 Feb 2024 22:53:45 +0100
Message-Id: <20240203215345.4396-1-thorsten.blum@toblux.com>
X-Mailer: git-send-email 2.39.2
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

sphinx.rst:
- remove unnecessary newline
- fix grammar s/check/checks
- capitalize heading "The C domain"

changes.rst:
- remove colon after "pahole" to be consistent with other entries

howto.rst:
- fix grammar s/you will/will you
- hyphenate "real-world problems"

Signed-off-by: Thorsten Blum <thorsten.blum@toblux.com>
---
 Documentation/doc-guide/sphinx.rst | 7 +++----
 Documentation/process/changes.rst  | 4 ++--
 Documentation/process/howto.rst    | 4 ++--
 3 files changed, 7 insertions(+), 8 deletions(-)

diff --git a/Documentation/doc-guide/sphinx.rst b/Documentation/doc-guide/sphinx.rst
index 3d125fb4139d..2526811489bf 100644
--- a/Documentation/doc-guide/sphinx.rst
+++ b/Documentation/doc-guide/sphinx.rst
@@ -63,8 +63,7 @@ Image output
 ------------
 
 The kernel documentation build system contains an extension that
-handles images on both GraphViz and SVG formats (see
-:ref:`sphinx_kfigure`).
+handles images on both GraphViz and SVG formats (see :ref:`sphinx_kfigure`).
 
 For it to work, you need to install both GraphViz and ImageMagick
 packages. If those packages are not installed, the build system will
@@ -108,7 +107,7 @@ further info.
 Checking for Sphinx dependencies
 --------------------------------
 
-There's a script that automatically check for Sphinx dependencies. If it can
+There's a script that automatically checks for Sphinx dependencies. If it can
 recognize your distribution, it will also give a hint about the install
 command line options for your distro::
 
@@ -283,7 +282,7 @@ Here are some specific guidelines for the kernel documentation:
   from highlighting. For a short snippet of code embedded in the text, use \`\`.
 
 
-the C domain
+The C domain
 ------------
 
 The **Sphinx C Domain** (name c) is suited for documentation of C API. E.g. a
diff --git a/Documentation/process/changes.rst b/Documentation/process/changes.rst
index 50b3d1cb1115..4c1552160321 100644
--- a/Documentation/process/changes.rst
+++ b/Documentation/process/changes.rst
@@ -144,8 +144,8 @@ Bison
 Since Linux 4.16, the build system generates parsers
 during build.  This requires bison 2.0 or later.
 
-pahole:
--------
+pahole
+------
 
 Since Linux 5.2, if CONFIG_DEBUG_INFO_BTF is selected, the build system
 generates BTF (BPF Type Format) from DWARF in vmlinux, a bit later from kernel
diff --git a/Documentation/process/howto.rst b/Documentation/process/howto.rst
index 6c73889c98fc..eebda4910a88 100644
--- a/Documentation/process/howto.rst
+++ b/Documentation/process/howto.rst
@@ -351,8 +351,8 @@ Managing bug reports
 --------------------
 
 One of the best ways to put into practice your hacking skills is by fixing
-bugs reported by other people. Not only you will help to make the kernel
-more stable, but you'll also learn to fix real world problems and you will
+bugs reported by other people. Not only will you help to make the kernel
+more stable, but you'll also learn to fix real-world problems and you will
 improve your skills, and other developers will be aware of your presence.
 Fixing bugs is one of the best ways to get merits among other developers,
 because not many people like wasting time fixing other people's bugs.
-- 
2.39.2


