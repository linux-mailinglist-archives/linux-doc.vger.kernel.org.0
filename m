Return-Path: <linux-doc+bounces-39845-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id EE591A4CC61
	for <lists+linux-doc@lfdr.de>; Mon,  3 Mar 2025 21:02:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5E8283AB9A0
	for <lists+linux-doc@lfdr.de>; Mon,  3 Mar 2025 20:02:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5184622AE7E;
	Mon,  3 Mar 2025 20:02:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="gIQZ5G2C"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 777F71DDA3C
	for <linux-doc@vger.kernel.org>; Mon,  3 Mar 2025 20:02:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741032148; cv=none; b=E9EpyJlYojmtkbaYV50DvRxUMhcOB2XNFFwYS0FeqNbimfRBBe0nlt+lyktPsJTvyL14zGjX0rz2PjncOtYkWypH3Deuwp84CV8d59Fnc0+WiVLRvjI7XVYqxXwFH4yVT439inVCylgfFtlEiHMjx+2DNP4srTErZJJqpsG0/As=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741032148; c=relaxed/simple;
	bh=HS8qbPdZ3txQONolaHUQSyEJbMIIaTI6ycaSNatcZ8o=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=r/QDduej7WjQnK4th2ELecbNUUT3kYOlsZ5PduT2jD70zHtOIiJAfNVitIb8eSzuHiGsy7H43Sh5iUpXsdNvp66wprz6qXRIyAjm3Ux0tTtKauXXsNvT4kJm43FMU1li4GlRBofWrlgAMIE8x7KRUPgU84UTnBLIG64S3s5Yv8Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=gIQZ5G2C; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-22113560c57so92914365ad.2
        for <linux-doc@vger.kernel.org>; Mon, 03 Mar 2025 12:02:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1741032146; x=1741636946; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=l1AzSJHrYGN68SQgkcRg2RepLPfek9ChyYynDWZ7nZg=;
        b=gIQZ5G2CGDDMYhsLnode1GJV0H/KDTpRKFaP81HB/R10Lpaolg7aqJADPaU0gadRZy
         haRP7vSDFn4X9Ed747FFV6FWbSbZiXkpQr7hdBG3cV3OXsMgISpVQHSu1BxcpmR0G//t
         ZrWE/qZsUPbDHbRDejRhhfFS4fIBV03o+BkMk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741032146; x=1741636946;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=l1AzSJHrYGN68SQgkcRg2RepLPfek9ChyYynDWZ7nZg=;
        b=luENL70ViDDHzNXPn7pBQgW4J+iAAructPJ0E3yunzhykGnydjWZUtsL7S1FEP4LhN
         ZvpZieMpHjYQBFe8pVZxPQ8tMMoiZ29iStu/p1V7pXsy1d+5ysrPxDe6Gm0snWqdNi3N
         iv6e5Yrpx/Ni06ZhuH4TxY0EsPDC457JHQQn53rvrzq8qLiTTZ1RlSioU22pRvBVMD3f
         +pqzR8RZYb8RP1FoiP5KdE/a5GugLP8Y6nQRt8bVOC+BBhwHQ0CLLuFuppuvnpmvC35l
         lz+6O64pXbrimsaeKSssxHRgDIbMHm/qZBc0UUz5xf7V6gygK988GbGDkkA+6Qi1ClS5
         T3eA==
X-Forwarded-Encrypted: i=1; AJvYcCXwoPrP4qzUnKLei3aws8KgkHOQ4mH6s0ioiroEKXY0GK/FfK/5cUq3LqEhnxB6VLP6XufMsmDn1Lc=@vger.kernel.org
X-Gm-Message-State: AOJu0YwsTQFKa5kvEsXnZPtEP0aN0+JcVAxhBMvr2KLu7VRnnuRZJCVd
	+nRXTFrzDKQGLgty9z1pMU2D1Rt326tcmbtwpucpMit63Bs+dM2mFJQ4YS/7Gg==
X-Gm-Gg: ASbGncv8/SNXFCQLAgUOTz7qdXCWuh1O3vBw2J9ZtLHa16+JbtoSdsRitCuCWgNemO8
	m6Obvlaez+nVStR9Xum+V33rkEui3fmwy+BT4ugcld5lYGFme7m2nJ65y2IrMBCCffVEy7uoH2e
	QN1Ue9rXXPaeVubHM6g39PN+ibPoT+pqn54k0X+ULTApQVSLFRkk5PecQRRptEwhxf0TCdaV0By
	R0Ho/lHx8fbWnpsndd8PZlQGZDu9oQrpHS3KrAbYmQnCXDFBhi9lKqiUlOLWIqxUS6Y1pisDOMu
	AXBSDDdJ26ifTbqfZEu0UmSK1h3Kp1Y+/Hyu2erqup6iqtzVqU/7tszKg1NJKQyKGVzKctS3p4X
	Dpg1JjR2YfxsDhF9fhGPYi4dvqL09T5s=
X-Google-Smtp-Source: AGHT+IFwNA+jAUYX79VX/F+XDj+R3GLFUz//u5O9AkU12o2xY1dYtBKx03LDr+z8+FMJ/HrFInPKRA==
X-Received: by 2002:a17:903:2346:b0:223:635d:3e38 with SMTP id d9443c01a7336-22368fa24bemr229111545ad.15.1741032145613;
        Mon, 03 Mar 2025 12:02:25 -0800 (PST)
Received: from li-cloudtop.c.googlers.com.com (4.198.125.34.bc.googleusercontent.com. [34.125.198.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-223504dc4b4sm81233875ad.171.2025.03.03.12.02.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Mar 2025 12:02:24 -0800 (PST)
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
	omosnace@redhat.com,
	shuah@kernel.org,
	arnd@arndb.de,
	masahiroy@kernel.org,
	bagasdotme@gmail.com,
	horms@kernel.org,
	tweek@google.com,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	netdev@vger.kernel.org,
	selinux@vger.kernel.org,
	hridya@google.com
Cc: smoreland@google.com,
	ynaffit@google.com,
	kernel-team@android.com
Subject: [PATCH v16 0/3] binder: report txn errors via generic netlink
Date: Mon,  3 Mar 2025 12:02:09 -0800
Message-ID: <20250303200212.3294679-1-dualli@chromium.org>
X-Mailer: git-send-email 2.48.1.711.g2feabab25a-goog
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
https://lore.kernel.org/lkml/20241025075102.1785960-1-dualli@chromium.org/

The 6th version has some trivial kernel doc fixes, without modifying
any other source code.
https://lore.kernel.org/lkml/20241028101952.775731-1-dualli@chromium.org/

The 7th version breaks the binary struct netlink message into individual
attributes to better support automatic error checking. Thanks Jakub for
improving ynl-gen.
https://lore.kernel.org/all/20241031092504.840708-1-dualli@chromium.org/

The 8th version solves the multi-genl-family issue by demuxing the
messages based on a new context attribute. It also improves the YAML
spec to be consistent with netlink tradition. A Huge 'Thank You' to
Jakub who taught me a lot about the netlink protocol!
https://lore.kernel.org/all/20241113193239.2113577-1-dualli@chromium.org/

The 9th version only contains a few trivial fixes, removing a redundant
pr_err and unnecessary payload check. The ynl-gen patch to allow uapi
header in sub-dirs has been merged so it's no longer included in this
patch set.
https://lore.kernel.org/all/20241209192247.3371436-1-dualli@chromium.org/

The 10th version renames binder genl to binder netlink, improves the
readability of the kernel doc and uses more descriptive variable names.
The function binder_add_device() is moved out to a new commit per request.
It also fixes a warning about newline used in NL_SET_ERR_MSG.
Thanks Carlos for his valuable suggestions!
https://lore.kernel.org/all/20241212224114.888373-1-dualli@chromium.org/

The 11th version simplifies the yaml filename to avoid redundant words in
variable names. This also makes binder netlink yaml more aligned with
other existing netlink specs. Another trivial change is to use reverse
xmas tree for function variables.
https://lore.kernel.org/all/20241218203740.4081865-1-dualli@chromium.org/

The 12th version makes Documentation/admin-guide/binder_netlink.rst aligned
with the binder netlink yaml change introduced in the 11th revision. It
doesn't change any source code.
https://lore.kernel.org/all/20241218212935.4162907-1-dualli@chromium.org/

The 13th version removes the unnecessary dependency to binder file ops.
Now the netlink configuration is reset using sock_priv_destroy. It also
requires CAP_NET_ADMIN to send commands to the driver. One of the
patches ("binderfs: add new binder devices to binder_devices") has been
merged to linux-next. To avoid conflict, switch to linux-next master
branch and remove the merged one. Adding sock_priv into netlink spec
results in CFI failure, which is fixed by the new trampoline patches.
https://lore.kernel.org/all/20250115102950.563615-1-dualli@chromium.org/

The 14th version fix the code style issue by wrapping the sock priv
in a separate struct, as suggested by Jakub. The other 2 patches are
no longer included in this patchset as the equvilent fix has already
been merged to upstream linux master branch, as well as net & net-next.
This version has already been rebased to TOT of linux-next.
https://lore.kernel.org/all/20250118080939.2835687-1-dualli@chromium.org/

The 15th version switches from unicast to multicast per feedback and
feature requriements from binder users. With this change, multiple user
space processes can listen to the binder reports from the kernel driver
at the same time. To receive the multicast messages, those user space
processs should query the mcast group id and join the mcast group. In
the previous unicast solution, a portid is saved in the kernel driver to
prevent unauthorized process to send commands to the kernel driver. In
this multicast solution, this is replaced by a new "setup_report"
permission in the "binder" class. Meanwhile, the sock_priv_destroy
callback and CAP_NET_ADMIN restriction are no longer required in favor
of the multicast solution and the new "setup_report" permission.
https://lore.kernel.org/all/20250226192047.734627-1-dualli@chromium.org/

The 16th version fixes the build error when CONFIG_SECURITY is disabled.
There's no other changes. Thank you, kernel test robot <lkp@intel.com>!

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
v6: fix some trivial kernel doc issues
v7: break the binary struct binder_report into individual attributes
v8: use multiplex netlink message in a unified netlink family
    improve the YAML spec to be consistent with netlink tradition
v9: remove unnecessary check to netlink flags and message payloads
v10: improve the readability of kernel doc and variable names
v11: rename binder_netlinnk.yaml to binder.yaml
     use reverse xmas tree for function variables
v12: make kernel doc aligned with source code
v13: use sock_priv_destroy to cleanup netlink
     require CAP_NET_ADMIN to send netlink commands
     add trampolines in ynl-gen to fix CFI failure
v14: wrap the sock priv in a separate struct
v15: switch from unicast to multicast netlink message
     add a "setup_report" permission in the "binder" class
     add generic_netlink to binder_features
v16: fix build error with CONFIG_SECURITY disabled

Li Li (2):
  binder: report txn errors via generic netlink
  binder: generic netlink binder_features flag

Thiébaud Weksteen (1):
  lsm, selinux: Add setup_report permission to binder

 Documentation/admin-guide/binder_netlink.rst  | 108 +++++++++
 Documentation/admin-guide/index.rst           |   1 +
 Documentation/netlink/specs/binder.yaml       | 116 +++++++++
 drivers/android/Kconfig                       |   1 +
 drivers/android/Makefile                      |   2 +-
 drivers/android/binder.c                      | 229 +++++++++++++++++-
 drivers/android/binder_internal.h             |  16 ++
 drivers/android/binder_netlink.c              |  46 ++++
 drivers/android/binder_netlink.h              |  23 ++
 drivers/android/binder_trace.h                |  35 +++
 drivers/android/binderfs.c                    |   8 +
 include/linux/lsm_hook_defs.h                 |   1 +
 include/linux/security.h                      |   6 +
 include/uapi/linux/android/binder_netlink.h   |  57 +++++
 security/security.c                           |  13 +
 security/selinux/hooks.c                      |   7 +
 security/selinux/include/classmap.h           |   3 +-
 .../filesystems/binderfs/binderfs_test.c      |   1 +
 18 files changed, 668 insertions(+), 5 deletions(-)
 create mode 100644 Documentation/admin-guide/binder_netlink.rst
 create mode 100644 Documentation/netlink/specs/binder.yaml
 create mode 100644 drivers/android/binder_netlink.c
 create mode 100644 drivers/android/binder_netlink.h
 create mode 100644 include/uapi/linux/android/binder_netlink.h


base-commit: cd3215bbcb9d4321def93fea6cfad4d5b42b9d1d
-- 
2.48.1.711.g2feabab25a-goog


