Return-Path: <linux-doc+bounces-18815-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DC0DC90CC5C
	for <lists+linux-doc@lfdr.de>; Tue, 18 Jun 2024 14:48:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E7C631C222B3
	for <lists+linux-doc@lfdr.de>; Tue, 18 Jun 2024 12:48:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F398C14B092;
	Tue, 18 Jun 2024 12:38:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="N/jCSqrD"
X-Original-To: linux-doc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1EBE14A60E;
	Tue, 18 Jun 2024 12:38:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718714316; cv=none; b=TSLAcogkcHKrt+PwPrOLENwC2HJ/d+M2hHJv/QKS7Lh2TrYQigdTYKD+Si4x3wf+BIaTFdmkU1Izm+Yqq4cIgaqCTHdA7s0ODs5/MSB2aA2NtQz+kgHeLsN8jbn7m2y5+GtS1nxwir6lV3lB0BhpzgAcXuAk+XnRs7QqMt/Iwx0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718714316; c=relaxed/simple;
	bh=ooe+NfCkDLbyZzNacuckmn0L8ElUEGAsDuJ8Pl8gFyk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=RnbBHB9BQuKfIQKFFeaN8zhW25Li/XDj0nEQB+zVbu3C+1gzqeSKMI2ZkQJQIqHpZxkvY4ZbiHGZc8lZLWMcx0Ccnb9LfyTPbLNnqR+xvpwtN40UazQ+8+QSnx2MPEdNsk7fWNf9lfGfP5qWV3sksaoBIQ7ldeQcmeJiZZPF6So=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=N/jCSqrD; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2C069C4AF1D;
	Tue, 18 Jun 2024 12:38:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718714316;
	bh=ooe+NfCkDLbyZzNacuckmn0L8ElUEGAsDuJ8Pl8gFyk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=N/jCSqrDQSTCKF2s00fBrzpoKSRgbaAxN9cWhxRtCDUQXgEMDKs2GjbNt7Eq2b4KQ
	 4JW6qIoiHKHqO7Ro4dE+fwCpu4oNXfVBw9N9C2htWl2d62OT7VoNZIlzTRhcd172hK
	 NO9yyUV/EoAebilHXcsP5tXzz2AEw+Yjn+v2ItaIHnbS8HeLdt0U5Y/6d7H6Vf3pU4
	 kKIlngifaj22EDgzpHFQBHOW9kN5VQHATvLz3psqt2bcxpFfRY23xm2F2APKdME6DW
	 mcN35Ri1YgMbagUQApyxxEKOXLLJNma7mWOv+G9S27NdqTEvLjasUNSokqIg+ObDK3
	 qYuSRx14wGSjg==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Justin Stitt <justinstitt@google.com>,
	linux-hardening@vger.kernel.org,
	Kees Cook <keescook@chromium.org>,
	"Martin K . Petersen" <martin.petersen@oracle.com>,
	Sasha Levin <sashal@kernel.org>,
	phil@philpotter.co.uk,
	corbet@lwn.net,
	James.Bottomley@HansenPartnership.com,
	nathan@kernel.org,
	linux-doc@vger.kernel.org,
	linux-scsi@vger.kernel.org,
	llvm@lists.linux.dev
Subject: [PATCH AUTOSEL 6.6 02/35] scsi: sr: Fix unintentional arithmetic wraparound
Date: Tue, 18 Jun 2024 08:37:22 -0400
Message-ID: <20240618123831.3302346-2-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240618123831.3302346-1-sashal@kernel.org>
References: <20240618123831.3302346-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.6.34
Content-Transfer-Encoding: 8bit

From: Justin Stitt <justinstitt@google.com>

[ Upstream commit 9fad9d560af5c654bb38e0b07ee54a4e9acdc5cd ]

Running syzkaller with the newly reintroduced signed integer overflow
sanitizer produces this report:

[   65.194362] ------------[ cut here ]------------
[   65.197752] UBSAN: signed-integer-overflow in ../drivers/scsi/sr_ioctl.c:436:9
[   65.203607] -2147483648 * 177 cannot be represented in type 'int'
[   65.207911] CPU: 2 PID: 10416 Comm: syz-executor.1 Not tainted 6.8.0-rc2-00035-gb3ef86b5a957 #1
[   65.213585] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS 1.16.3-debian-1.16.3-2 04/01/2014
[   65.219923] Call Trace:
[   65.221556]  <TASK>
[   65.223029]  dump_stack_lvl+0x93/0xd0
[   65.225573]  handle_overflow+0x171/0x1b0
[   65.228219]  sr_select_speed+0xeb/0xf0
[   65.230786]  ? __pm_runtime_resume+0xe6/0x130
[   65.233606]  sr_block_ioctl+0x15d/0x1d0
...

Historically, the signed integer overflow sanitizer did not work in the
kernel due to its interaction with `-fwrapv` but this has since been
changed [1] in the newest version of Clang. It was re-enabled in the kernel
with Commit 557f8c582a9b ("ubsan: Reintroduce signed overflow sanitizer").

Firstly, let's change the type of "speed" to unsigned long as
sr_select_speed()'s only caller passes in an unsigned long anyways.

$ git grep '\.select_speed'
|	drivers/scsi/sr.c:      .select_speed           = sr_select_speed,
...
|	static int cdrom_ioctl_select_speed(struct cdrom_device_info *cdi,
|	                unsigned long arg)
|	{
|	        ...
|	        return cdi->ops->select_speed(cdi, arg);
|	}

Next, let's add an extra check to make sure we don't exceed 0xffff/177
(350) since 0xffff is the max speed. This has two benefits: 1) we deal
with integer overflow before it happens and 2) we properly respect the
max speed of 0xffff. There are some "magic" numbers here but I did not
want to change more than what was necessary.

Link: https://github.com/llvm/llvm-project/pull/82432 [1]
Closes: https://github.com/KSPP/linux/issues/357
Cc: linux-hardening@vger.kernel.org
Signed-off-by: Justin Stitt <justinstitt@google.com>
Link: https://lore.kernel.org/r/20240508-b4-b4-sio-sr_select_speed-v2-1-00b68f724290@google.com
Reviewed-by: Kees Cook <keescook@chromium.org>
Signed-off-by: Martin K. Petersen <martin.petersen@oracle.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 Documentation/cdrom/cdrom-standard.rst | 4 ++--
 drivers/scsi/sr.h                      | 2 +-
 drivers/scsi/sr_ioctl.c                | 5 ++++-
 include/linux/cdrom.h                  | 2 +-
 4 files changed, 8 insertions(+), 5 deletions(-)

diff --git a/Documentation/cdrom/cdrom-standard.rst b/Documentation/cdrom/cdrom-standard.rst
index 7964fe134277b..6c1303cff159e 100644
--- a/Documentation/cdrom/cdrom-standard.rst
+++ b/Documentation/cdrom/cdrom-standard.rst
@@ -217,7 +217,7 @@ current *struct* is::
 		int (*media_changed)(struct cdrom_device_info *, int);
 		int (*tray_move)(struct cdrom_device_info *, int);
 		int (*lock_door)(struct cdrom_device_info *, int);
-		int (*select_speed)(struct cdrom_device_info *, int);
+		int (*select_speed)(struct cdrom_device_info *, unsigned long);
 		int (*get_last_session) (struct cdrom_device_info *,
 					 struct cdrom_multisession *);
 		int (*get_mcn)(struct cdrom_device_info *, struct cdrom_mcn *);
@@ -396,7 +396,7 @@ action need be taken, and the return value should be 0.
 
 ::
 
-	int select_speed(struct cdrom_device_info *cdi, int speed)
+	int select_speed(struct cdrom_device_info *cdi, unsigned long speed)
 
 Some CD-ROM drives are capable of changing their head-speed. There
 are several reasons for changing the speed of a CD-ROM drive. Badly
diff --git a/drivers/scsi/sr.h b/drivers/scsi/sr.h
index 1175f2e213b56..dc899277b3a44 100644
--- a/drivers/scsi/sr.h
+++ b/drivers/scsi/sr.h
@@ -65,7 +65,7 @@ int sr_disk_status(struct cdrom_device_info *);
 int sr_get_last_session(struct cdrom_device_info *, struct cdrom_multisession *);
 int sr_get_mcn(struct cdrom_device_info *, struct cdrom_mcn *);
 int sr_reset(struct cdrom_device_info *);
-int sr_select_speed(struct cdrom_device_info *cdi, int speed);
+int sr_select_speed(struct cdrom_device_info *cdi, unsigned long speed);
 int sr_audio_ioctl(struct cdrom_device_info *, unsigned int, void *);
 
 int sr_is_xa(Scsi_CD *);
diff --git a/drivers/scsi/sr_ioctl.c b/drivers/scsi/sr_ioctl.c
index 5b0b35e60e61f..a0d2556a27bba 100644
--- a/drivers/scsi/sr_ioctl.c
+++ b/drivers/scsi/sr_ioctl.c
@@ -425,11 +425,14 @@ int sr_reset(struct cdrom_device_info *cdi)
 	return 0;
 }
 
-int sr_select_speed(struct cdrom_device_info *cdi, int speed)
+int sr_select_speed(struct cdrom_device_info *cdi, unsigned long speed)
 {
 	Scsi_CD *cd = cdi->handle;
 	struct packet_command cgc;
 
+	/* avoid exceeding the max speed or overflowing integer bounds */
+	speed = clamp(0, speed, 0xffff / 177);
+
 	if (speed == 0)
 		speed = 0xffff;	/* set to max */
 	else
diff --git a/include/linux/cdrom.h b/include/linux/cdrom.h
index 98c6fd0b39b63..fdfb61ccf55ae 100644
--- a/include/linux/cdrom.h
+++ b/include/linux/cdrom.h
@@ -77,7 +77,7 @@ struct cdrom_device_ops {
 				      unsigned int clearing, int slot);
 	int (*tray_move) (struct cdrom_device_info *, int);
 	int (*lock_door) (struct cdrom_device_info *, int);
-	int (*select_speed) (struct cdrom_device_info *, int);
+	int (*select_speed) (struct cdrom_device_info *, unsigned long);
 	int (*get_last_session) (struct cdrom_device_info *,
 				 struct cdrom_multisession *);
 	int (*get_mcn) (struct cdrom_device_info *,
-- 
2.43.0


