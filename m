Return-Path: <linux-doc+bounces-7023-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BBA183142C
	for <lists+linux-doc@lfdr.de>; Thu, 18 Jan 2024 09:09:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CD7851C217E4
	for <lists+linux-doc@lfdr.de>; Thu, 18 Jan 2024 08:09:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 73754358A2;
	Thu, 18 Jan 2024 07:59:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DanHzPYn"
X-Original-To: linux-doc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C77C358A0;
	Thu, 18 Jan 2024 07:59:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705564780; cv=none; b=VMeZGwhTA8u+22x1HntJ28wIU00a2/eKjdbu4++ZouvWrsfg0Cg3dYbaAwB924cWrCYJLskFsHtGjLiz9oBHD31qeLz12UKsPiDl12c2xUNtJDgqyPS1LxBb9IYzkWhztJ5GWjZu5KGCDq1+gzzoPnnlrIadE3l4SG5geAb1YFY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705564780; c=relaxed/simple;
	bh=PNbtJZXcgSDfB9xk9l5CL+n1+oj48eBhvhkVHBH+k0w=;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding; b=D3fEU6V5v2RPWytUGQTCm16VjfKWmuQzk0tvSq+9OJtP7o1FD2T3AnqTrErscmt0ylwwFkZXT7+VkJRhRnM228sg5/rtwhlDayOQShRyc8DcfnwE9y8ZeLgHksIniZac22+td8uAZ6w4VCTOhQBjwDeuCz7TUCA/3TXLRUe1Bks=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DanHzPYn; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 871CEC433C7;
	Thu, 18 Jan 2024 07:59:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1705564780;
	bh=PNbtJZXcgSDfB9xk9l5CL+n1+oj48eBhvhkVHBH+k0w=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=DanHzPYnIPIyQKEaHce5925mI7xmyI4w5GjY06iMLwUrzL+BCQhU7THrVf2eljd2i
	 6s6YB+0EFr0/2fOVyv/haEaEyF+40kDkIKwVi6EKjUu25qvqSj0Bs7eHSF3olOpAKo
	 OYc/eI1UJql7ge2e2KgXK+hYrPMG4c+AT3Lugkb3LR25e7C0Qtj7Okvm1I9wuuHzK6
	 RgFfZbWKgC3ZtvBzSi+MsrWru+4XRfieILTvqA2ihYl6OUDwd4tzuJEdZF8JmT9NfA
	 SlCRr9af/BbyZPBfweNnMFZlbU651rLGAsj/0Do0H7GyNAFFfbyh1ny2MFkxXglt9H
	 9KosFpDlE0aig==
From: "Jiri Slaby (SUSE)" <jirislaby@kernel.org>
To: gregkh@linuxfoundation.org
Cc: linux-serial@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	"Jiri Slaby (SUSE)" <jirislaby@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	linux-doc@vger.kernel.org
Subject: [PATCH 45/45] Documentation: add console.rst
Date: Thu, 18 Jan 2024 08:57:56 +0100
Message-ID: <20240118075756.10541-46-jirislaby@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240118075756.10541-1-jirislaby@kernel.org>
References: <20240118075756.10541-1-jirislaby@kernel.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Now, that the console kernel-doc is in better shape, include it in the
tty/ docs.

It's not supernice, but it is what it is. At least for the beginning.

Signed-off-by: Jiri Slaby (SUSE) <jirislaby@kernel.org>
Cc: Jonathan Corbet <corbet@lwn.net>
Cc: linux-doc@vger.kernel.org
---
 Documentation/driver-api/tty/console.rst | 45 ++++++++++++++++++++++++
 Documentation/driver-api/tty/index.rst   |  1 +
 2 files changed, 46 insertions(+)
 create mode 100644 Documentation/driver-api/tty/console.rst

diff --git a/Documentation/driver-api/tty/console.rst b/Documentation/driver-api/tty/console.rst
new file mode 100644
index 000000000000..4348e36cd33b
--- /dev/null
+++ b/Documentation/driver-api/tty/console.rst
@@ -0,0 +1,45 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+=======
+Console
+=======
+
+.. contents:: :local:
+
+Struct Console
+==============
+
+.. kernel-doc:: include/linux/console.h
+   :identifiers: console cons_flags
+
+Internals
+---------
+
+.. kernel-doc:: include/linux/console.h
+   :identifiers: nbcon_state nbcon_prio nbcon_context nbcon_write_context
+
+Struct Consw
+============
+
+.. kernel-doc:: include/linux/console.h
+   :identifiers: consw
+
+Console functions
+=================
+
+.. kernel-doc:: include/linux/console.h
+   :identifiers: console_srcu_read_flags console_srcu_write_flags
+        console_is_registered for_each_console_srcu for_each_console
+
+.. kernel-doc:: drivers/tty/vt/selection.c
+   :export:
+.. kernel-doc:: drivers/tty/vt/vt.c
+   :export:
+
+Internals
+---------
+
+.. kernel-doc:: drivers/tty/vt/selection.c
+   :internal:
+.. kernel-doc:: drivers/tty/vt/vt.c
+   :internal:
diff --git a/Documentation/driver-api/tty/index.rst b/Documentation/driver-api/tty/index.rst
index b490da11f257..c1ffe3d1ec46 100644
--- a/Documentation/driver-api/tty/index.rst
+++ b/Documentation/driver-api/tty/index.rst
@@ -38,6 +38,7 @@ In-detail description of the named TTY structures is in separate documents:
    tty_buffer
    tty_ioctl
    tty_internals
+   console
 
 Writing TTY Driver
 ==================
-- 
2.43.0


