Return-Path: <linux-doc+bounces-9473-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D86D18557B5
	for <lists+linux-doc@lfdr.de>; Thu, 15 Feb 2024 00:55:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9279328D0D1
	for <lists+linux-doc@lfdr.de>; Wed, 14 Feb 2024 23:55:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9912E1482F6;
	Wed, 14 Feb 2024 23:53:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=codeweavers.com header.i=@codeweavers.com header.b="R/VHQ4jF"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail.codeweavers.com (mail.codeweavers.com [4.36.192.163])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 017661474C6;
	Wed, 14 Feb 2024 23:53:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=4.36.192.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707954815; cv=none; b=jhnO82tGkeYjYN3nRCdEy4xSLmtkrnPbWB+frsjQYFk4JxsUO2TUxFEVo71ajqkquubFbh4vbJC0d452e7yS7aYK2MBuqPaCUoaW+iOT01SIHRmXrRTRETpoXdJLc7QlAXbh2DpgRm7Du26Sh71r4J6QtaCIDSO7xPKTIbWXkTo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707954815; c=relaxed/simple;
	bh=MyMUfnSpsCJiRaJ8cEmQDM/KYjA/E0/cZRMs+5Iwf7A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SbxKrlUDfAVJLy+OInkdYFb/uTJImafUtAhlH+J1aiO7PbURG7BDxSJCKAyGBwUHmU8MHStskK4B0dzF1RRFG/muFfUjUqFm5M6y17u9yVkM20+fxSGYmKD8S4yTgucD2ceG4XiwmEwQHBSmYL/SIfnYrReFPt1k0Fcnpw7C5k4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=codeweavers.com; spf=pass smtp.mailfrom=codeweavers.com; dkim=pass (2048-bit key) header.d=codeweavers.com header.i=@codeweavers.com header.b=R/VHQ4jF; arc=none smtp.client-ip=4.36.192.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=codeweavers.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=codeweavers.com
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=codeweavers.com; s=s1; h=Message-ID:Date:Subject:Cc:To:From:Sender;
	bh=uQl4WA7220ZuCfcaIH4Qlmtix4tUAUiNvK0NQ8JN3Nw=; b=R/VHQ4jF4E8d+MHXaWp0P/PnCG
	K1nI1M9RvNHUb8GjmAzs9skt5NhDl6hybj0z5PHcLD+/inC7BmcSa9BFItgPP7bHuaxt51WNFCLcx
	z+gRp4aB4koQm3blnawOjOcGVGmSAq75UScID4Gpr8P0VRsWazgemkXLYJkIAB38AfgQwYiI2guUO
	frSxOMqoUiNLEr6oxN/GGurFtuxGdPHpn0C4tRUJx/QhdOTuSTVgooNTqLVOo8hNeoaB8vj7WCOtw
	90EVCWnRtQKYZWhn67aUGzroZ8Y2F2EbMLXocTHfA7q86Nl3T+c2QODAj7mmDyJi7lSVnr67wuF4P
	iAysJ2Pw==;
Received: from cw137ip160.mn.codeweavers.com ([10.69.137.160] helo=camazotz.mn.codeweavers.com)
	by mail.codeweavers.com with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <zfigura@codeweavers.com>)
	id 1raP4D-00GcSK-1F;
	Wed, 14 Feb 2024 17:53:29 -0600
From: Elizabeth Figura <zfigura@codeweavers.com>
To: Arnd Bergmann <arnd@arndb.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <shuah@kernel.org>
Cc: linux-kernel@vger.kernel.org,
	linux-api@vger.kernel.org,
	wine-devel@winehq.org,
	=?UTF-8?q?Andr=C3=A9=20Almeida?= <andrealmeid@igalia.com>,
	Wolfram Sang <wsa@kernel.org>,
	Arkadiusz Hiler <ahiler@codeweavers.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Andy Lutomirski <luto@kernel.org>,
	linux-doc@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	Elizabeth Figura <zfigura@codeweavers.com>
Subject: [PATCH 14/31] ntsync: Introduce NTSYNC_IOC_MUTEX_READ.
Date: Wed, 14 Feb 2024 17:52:49 -0600
Message-ID: <20240214235307.10494-5-zfigura@codeweavers.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240214235307.10494-1-zfigura@codeweavers.com>
References: <20240214233645.9273-1-zfigura@codeweavers.com>
 <20240214235307.10494-1-zfigura@codeweavers.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This corresponds to the NT syscall NtQueryMutant().

This returns the recursion count, owner, and abandoned state of the mutex.

Signed-off-by: Elizabeth Figura <zfigura@codeweavers.com>
---
 drivers/misc/ntsync.c       | 23 +++++++++++++++++++++++
 include/uapi/linux/ntsync.h |  1 +
 2 files changed, 24 insertions(+)

diff --git a/drivers/misc/ntsync.c b/drivers/misc/ntsync.c
index e42dbd5d6d14..73f40ea1c8f8 100644
--- a/drivers/misc/ntsync.c
+++ b/drivers/misc/ntsync.c
@@ -534,6 +534,27 @@ static int ntsync_sem_read(struct ntsync_obj *sem, void __user *argp)
 	return 0;
 }
 
+static int ntsync_mutex_read(struct ntsync_obj *mutex, void __user *argp)
+{
+	struct ntsync_mutex_args __user *user_args = argp;
+	struct ntsync_mutex_args args;
+	int ret;
+
+	if (mutex->type != NTSYNC_TYPE_MUTEX)
+		return -EINVAL;
+
+	args.mutex = 0;
+	spin_lock(&mutex->lock);
+	args.count = mutex->u.mutex.count;
+	args.owner = mutex->u.mutex.owner;
+	ret = mutex->u.mutex.ownerdead ? -EOWNERDEAD : 0;
+	spin_unlock(&mutex->lock);
+
+	if (copy_to_user(user_args, &args, sizeof(args)))
+		return -EFAULT;
+	return ret;
+}
+
 static int ntsync_obj_release(struct inode *inode, struct file *file)
 {
 	struct ntsync_obj *obj = file->private_data;
@@ -559,6 +580,8 @@ static long ntsync_obj_ioctl(struct file *file, unsigned int cmd,
 		return ntsync_mutex_unlock(obj, argp);
 	case NTSYNC_IOC_MUTEX_KILL:
 		return ntsync_mutex_kill(obj, argp);
+	case NTSYNC_IOC_MUTEX_READ:
+		return ntsync_mutex_read(obj, argp);
 	case NTSYNC_IOC_EVENT_SET:
 		return ntsync_event_set(obj, argp, false);
 	case NTSYNC_IOC_EVENT_RESET:
diff --git a/include/uapi/linux/ntsync.h b/include/uapi/linux/ntsync.h
index 6017f621687e..a1d0ef581212 100644
--- a/include/uapi/linux/ntsync.h
+++ b/include/uapi/linux/ntsync.h
@@ -52,5 +52,6 @@ struct ntsync_wait_args {
 #define NTSYNC_IOC_EVENT_RESET		_IOR ('N', 0x89, __u32)
 #define NTSYNC_IOC_EVENT_PULSE		_IOR ('N', 0x8a, __u32)
 #define NTSYNC_IOC_SEM_READ		_IOR ('N', 0x8b, struct ntsync_sem_args)
+#define NTSYNC_IOC_MUTEX_READ		_IOR ('N', 0x8c, struct ntsync_mutex_args)
 
 #endif
-- 
2.43.0


