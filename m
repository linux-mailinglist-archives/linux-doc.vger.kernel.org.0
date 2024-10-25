Return-Path: <linux-doc+bounces-28605-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8629F9AFB7E
	for <lists+linux-doc@lfdr.de>; Fri, 25 Oct 2024 09:51:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AA2BB1C22723
	for <lists+linux-doc@lfdr.de>; Fri, 25 Oct 2024 07:51:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EBC7C1BE871;
	Fri, 25 Oct 2024 07:51:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="nXUTwLR4"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C36F718BC34
	for <linux-doc@vger.kernel.org>; Fri, 25 Oct 2024 07:51:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729842672; cv=none; b=CXNlvuwdE6+0Sq9mFhgQI9LXInT+klf4kCJ+u63093grYJHjaAHaB1S7z3YfFrjgIrfBvcyAwOwmGSj2aLHDMWBah/RFV4llmNY2H/ZfW26djHNvEpXig0OFXHp3YtnI2OMBjdCKhcKW3OW6zCbREwfg0UVjMXFH1HrUIiYEiBg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729842672; c=relaxed/simple;
	bh=mYxcLajmIErCGZ9qZSY4anQ4rvpJr1sSddJsnYJ54Z4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=aUw6WCwsj6ogc61JNEKD3jBQDsHqTYYGbVS39XHHHm1Uzr4UbOIuXaVezQqyjGzsM0owcY8gGvoc7vksZTE8QgrtW2NwzQxedzJH52qrTDAFDz4dZ0P1t078+pY7AJTseshuFuiTn6NiVsNPI47LjCke0oxPhsIwBQxTK3f7mpM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=nXUTwLR4; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-20c767a9c50so14395475ad.1
        for <linux-doc@vger.kernel.org>; Fri, 25 Oct 2024 00:51:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1729842670; x=1730447470; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=uF1v/s68/41/rvjjEMQ1dTWdFvcwAdIfUzNDLdC1Pa0=;
        b=nXUTwLR4+LBDE3phadw3aUshLZohgokTX6MdL89Xtm56ZoRJq+RzjpUPA2egc+/cr3
         e5g7PDIJVjzRnha7UmO8oJiuZmvyk6ZhWMK4AvXnbyjyPUei+ByDPnUNQrz4tGAREExo
         GjyetrNrmjmfWgnF8ipopO7/43oSJ9xv+zbGY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729842670; x=1730447470;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uF1v/s68/41/rvjjEMQ1dTWdFvcwAdIfUzNDLdC1Pa0=;
        b=DsWra60cE2WRiBkkHz/Jrwj1pfXV92AGk2u8rbmCgMuoDIzrRv+BjJQ9TZpk1pLDXh
         5d6pitAwYJOLi9vrOQTA1pBkrwnZW1OfwOF/A/JEPy7GSd6FjhElzRTqHv229FPy8TJe
         3rLaIF5tnnJ/w9ofUPYV4THkbN5VFOW8locuTK2WyCN/BitcxzAinfm/r9Qbvxmd8DRx
         pjW63rZLnHTNwAyp/NjVRybilj3ghOyfrzP0qVhRIPTxWfozLgFgytys+A158k433dvl
         eEi43I5uIhvctekeppg35VZlQNyRWpvko3H5efTORBhjhlNOzVTRyfSzpkPqBe9+s14m
         uReg==
X-Forwarded-Encrypted: i=1; AJvYcCVxtVLaOb0HseDfwsUKOCo+gTFBipKaA8/dIPfNvd/+Z8S3HZY7CZ698ML95JOM/rbuFdP/j4slxck=@vger.kernel.org
X-Gm-Message-State: AOJu0YxpY5sXMp7P+Uo/DdZwe0uFQLcg0WJl61Bgd6Vvl7Sj8XbR81tw
	AbyZnm6vkuT5l/i3z2H/pGcviFyHzUboWFR20gDWDH9JzV1Re0m1JSmw5z959Q==
X-Google-Smtp-Source: AGHT+IHFw7FXs8Lb1i8yU36Q+6sfxkhIwRqJC7iizk5PAlH9pWgs/YMoQksBdeh0U2ErwU88jUj6Lg==
X-Received: by 2002:a17:903:3114:b0:20c:6bff:fcae with SMTP id d9443c01a7336-20fa9e46f35mr81303105ad.5.1729842670112;
        Fri, 25 Oct 2024 00:51:10 -0700 (PDT)
Received: from li-cloudtop.c.googlers.com.com (201.204.125.34.bc.googleusercontent.com. [34.125.204.201])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-210bbf6dd23sm4895285ad.92.2024.10.25.00.51.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Oct 2024 00:51:09 -0700 (PDT)
From: Li Li <dualli@chromium.org>
To: dualli@google.com,
	corbet@lwn.net,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	donald.hunter@gmail.com,
	gregkh@linuxfoundation.org,
	arve@android.com,
	tkjos@android.com,
	maco@android.com,
	joel@joelfernandes.org,
	brauner@kernel.org,
	cmllamas@google.com,
	surenb@google.com,
	arnd@arndb.de,
	masahiroy@kernel.org,
	bagasdotme@gmail.com,
	horms@kernel.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	netdev@vger.kernel.org,
	hridya@google.com,
	smoreland@google.com
Cc: kernel-team@android.com
Subject: [PATCH net-next v5 0/1] binder: report txn errors via generic netlink (genl)
Date: Fri, 25 Oct 2024 00:51:01 -0700
Message-ID: <20241025075102.1785960-1-dualli@chromium.org>
X-Mailer: git-send-email 2.47.0.163.g1226f6d8fa-goog
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Li Li <dualli@google.com>

It's a known issue that neither the frozen processes nor the system
administration process of the OS can correctly deal with failed binder
transactions. The reason is that there's no reliable way for the user
space administration process to fetch the binder errors from the kernel
binder driver.

Android is such an OS suffering from this issue. Since cgroup freezer
was used to freeze user applications to save battery, innocent frozen
apps have to be killed when they receive sync binder transactions or
when their async binder buffer is running out.

This patch introduces the Linux generic netlink messages into the binder
driver so that the Linux/Android system administration process can
listen to important events and take corresponding actions, like stopping
a broken app from attacking the OS by sending huge amount of spamming
binder transactiions.

The 1st version uses a global generic netlink for all binder contexts,
raising potential security concerns. There were a few other feedbacks
like request to kernel docs and test code. The thread can be found at
https://lore.kernel.org/lkml/20240812211844.4107494-1-dualli@chromium.org/

The 2nd version fixes those issues and has been tested on the latest
version of AOSP. See https://r.android.com/3305462 for how userspace is
going to use this feature and the test code. It can be found at
https://lore.kernel.org/lkml/20241011064427.1565287-1-dualli@chromium.org/

The 3rd version replaces the handcrafted netlink source code with the
netlink protocal specs in YAML. It also fixes the documentation issues.
https://lore.kernel.org/lkml/20241021182821.1259487-1-dualli@chromium.org/

The 4th version just containsi trivial fixes, making the subject of the
patch aligned with the subject of the cover letter.
https://lore.kernel.org/lkml/20241021191233.1334897-1-dualli@chromium.org/

The 5th version incorporates the suggested fixes to the kernel doc and
the init function. It also removes the unsupported uapi-header in YAML
that contains "/" for subdirectory.

v1: add a global binder genl socket for all contexts
v2: change to per-context binder genl for security reason
    replace the new ioctl with a netlink command
    add corresponding doc Documentation/admin-guide/binder_genl.rst
    add user space test code in AOSP
v3: use YNL spec (./tools/net/ynl/ynl-regen.sh)
    fix documentation index
v4: change the subject of the patch and remove unsed #if 0
v5: improve the kernel doc and the init function
    remove unsupported uapi-header in YAML

Li Li (1):
  binder: report txn errors via generic netlink

 Documentation/admin-guide/binder_genl.rst    |  93 ++++++
 Documentation/admin-guide/index.rst          |   1 +
 Documentation/netlink/specs/binder_genl.yaml |  59 ++++
 drivers/android/Kconfig                      |   1 +
 drivers/android/Makefile                     |   2 +-
 drivers/android/binder.c                     | 302 ++++++++++++++++++-
 drivers/android/binder_genl.c                |  38 +++
 drivers/android/binder_genl.h                |  18 ++
 drivers/android/binder_internal.h            |  22 ++
 drivers/android/binder_trace.h               |  37 +++
 drivers/android/binderfs.c                   |   4 +
 include/uapi/linux/android/binder.h          |  31 ++
 include/uapi/linux/binder_genl.h             |  42 +++
 13 files changed, 642 insertions(+), 8 deletions(-)
 create mode 100644 Documentation/admin-guide/binder_genl.rst
 create mode 100644 Documentation/netlink/specs/binder_genl.yaml
 create mode 100644 drivers/android/binder_genl.c
 create mode 100644 drivers/android/binder_genl.h
 create mode 100644 include/uapi/linux/binder_genl.h


base-commit: 81bc949f640f78b507c7523de7c750bcc87c1bb8
-- 
2.47.0.163.g1226f6d8fa-goog


